<?php
/**
 * 电源箱tcp接收
 */
/**
 * Created by PhpStorm.
 * User: anna
 * Date: 2018/7/10
 * Time: 上午12:21
 */

namespace app\event\controller;

use app\event\model\FaceIdentificationEvent;
use app\event\model\HearbeatPowerbox;
use app\event\model\HeartbeatFace;
use app\event\model\PowerBox;
use app\event\model\PowerboxEvent;
use app\event\model\PowerBoxstatus;
use app\event\model\UserClient;
use think\Db;
use think\Exception;
use think\worker\Server;
use think\facade\Config;
use GatewayClient\Gateway;
use Workerman\Lib\Timer;
class PowerBoxtcp extends Server
{

    public function __construct()
    {
        $this->protocol = 'tcp';
        $this->host = '0.0.0.0';
        $this->port = '1000';
        parent::__construct();
    }

    /**
     * 收到信息
     * @param $connection
     * @param $data
     */
    public function onMessage($connection, $data)
    {
        // 给connection临时设置一个lastMessageTime属性，用来记录上次收到消息的时间
        $connection->lastMessageTime = time();
        $worker = $this->worker;
        try {
            //转十六进制，截取前四个和后四个字符判断起始帧和结束帧，
            //第五至八个字符是判断json数据的长度（注意数据长度要*2），
            //最后六个字符中前两个是前面所有的字节总和
            $data = bin2hex($data);
            $first = substr($data,0,4);
            $end = substr($data,-4);
            if($first=='5aa5' && $end=='a00a'){
                $json = substr($data,4,4);
                //十六进制中截取json数据，一个字节相当于16进制中两个字符要乘2
                $data_json = hex2bin(substr(trim($data),8,hexdec($json)*2));
            }else{
                return;
            }
            //上报给第三方心跳，确认保活
//            PowerBox::powerBox_heart();
            
            //先转换一下字符编码
            try{
                $data_json = decode($data_json);
//            $data_json = mb_convert_encoding($data_json, 'UTF-8', 'UTF-8');
                $arr = json_decode($data_json,true);
            }catch (Exception $exception){
                echo $exception;
            }

            $system = Db::table('powerBoxSystem')->find();
            if($arr) {
                $params = isset($arr['params']) ? $arr['params'] : '';
                //处理控制电源箱返回结果
                if(array_key_exists('result', $arr)){
                   PowerBox::powerBoxStatus($arr);
                }
                if(isset($params['uid'])){
                    //主动发送指令给客户端
                    if(isset($worker->uidConnections[$params['uid']]))
                    {
                        $connection = $worker->uidConnections[$params['uid']];
                        $result['method']='ControlPowerBox';
                        $result['params']['code']=$params['code'];
                        $data_hex = $this->decTohex($result);
                        $connection->send($data_hex);
                        return true;
                    }
                    return false;
                }
                $method = $arr['method'] ? strtolower($arr['method']) : '';
//                var_dump($arr);
                if($params['PowerboxID']){
                    $params['PowerBoxId']=$params['PowerboxID'];
                    unset($params['PowerboxID']);
                }
                $id = !empty($arr['id']) ? $arr['id']:0;
                if($id==0){
                    $id = isset($params['PowerBoxId']) ? $params['PowerBoxId']:0;
                }
                // 判断当前客户端是否已经验证,即是否设置了uid
                if(!isset($connection->uid))
                {
                    if(isset($id)){
                        // 没验证的话把第一个包当做uid
                        $connection->uid = $id;
                        /* 保存uid到connection的映射，这样可以方便的通过uid查找connection，
                         * 实现针对特定uid推送数据
                         */
                        $worker->uidConnections[$connection->uid] = $connection;
                    }
                }
                
                if($params){
                    if(isset($params['PowerBoxId']) && !is_array($params['PowerBoxId'])){
                        $powerBox_result = PowerBox::where('PowerBoxId',$params['PowerBoxId'])->find();
                        //把记录的uid保存在数据库，方便后期主动发送信息使用
                        if($powerBox_result){
                            $powerBox_result->client_ip = $connection->getRemoteIp().':'.$connection->getRemotePort();
                            $powerBox_result->online = 1;
                            $powerBox_result->updateTime = date('Y-m-d H:i:s',time());
                            if(!$powerBox_result->uid){
                                $powerBox_result->uid = $id;
//                                PowerBox::powerBox_online($powerBox_result->PowerBoxId);
                            }
                            $powerBox_result->save();

                        }else{
                            $result = error_json(-20014,'设备未注册',$id);
                            $data_hex = $this->decTohex($result);
                            $connection->send($data_hex);
                        }
                    }
                }
                //检查所有设备是否在线
                PowerBox::powerBoxIsOnline();
                //自动判断设备报警状态是否已消除            
                PowerBoxstatus::clearAlarm($params['PowerBoxId']);
                if($method=='update'){
                    //添加事件
                    if(empty($params)){
                        //无效的参数
                        $connection->send(error_json(-32603,'Invalid params 无效的参数',$id));
                    }
                    $post_data = $params;
                    $params_arr['PowerBoxCode'] = $powerBox_result->PowerBoxCode;
                    $params_arr['address'] = $powerBox_result->address;
                    $params_arr['createTime'] = date('Y-m-d H:i:s');
                    $params_arr['triggerTime'] = date('Y-m-d H:i:s');
                    $params_arr['alert']=1;//是否已报警 1是否 2是
                    $params_arr['PowerBoxId'] = $params['PowerBoxId'];
                    foreach ($params['warning'] as $k=>$val){
                        $params_arr['note'] = eventType_name($val['eventCode']);
                        $params_arr['eventCode'] = $val['eventCode'];
                        //去除指定设备防雷器的报警事件
                        $arr=array(7,8,9,10,11,12);
                        if(in_array($val['eventCode'],$arr)){
                            $re = CancelLighting($params['PowerBoxId']);
                            if($re){
                                continue;
                            }
                        }

                        $event = PowerboxEvent::create($params_arr);
                        PowerBoxstatus::PowerStatus($params['PowerBoxId'],$val['eventCode']);
                        //事件上报
//                        $url = '';
//                        $port = '';
//                        $post_data['triggerTime'] = $params_arr['triggerTime'];
//                        $post_data['Server_id'] = $system ? $system['Server_id']:'';
//                        $post_data['address'] = $system ? $system['address']:'';
//                        $post_data['eventCode'] = $val['eventCode'];
//                        $post_data['note'] = $params_arr['note'];
//                        send_post($url,$port,$post_data,'',true,false);
                    }
                    $result['result'] = 'success';
                    $data_hex = $this->decTohex($result);
                    $connection->send($data_hex);

                }elseif ($method=='getinfo'){
                    //获取电源箱信息
                    if(empty($params)){
                        //无效的参数
                        $connection->send(error_json(-32603,'Invalid params 无效的参数',$id));
                    }
                    $result['PowerBoxId'] = $powerBox_result->PowerBoxId;
                    $result['temperature'] = $powerBox_result->temperature;
                    $result['humidity'] = $powerBox_result->humidity;
                    $result['Lighting']['V_12'] = $powerBox_result->Lighting_V12==1?true:false;
                    $result['Lighting']['V_24'] = $powerBox_result->Lighting_V24==1?true:false;
                    $result['Lighting']['V_220'] = $powerBox_result->Lighting_V220==1?true:false;

                    $result['ElectricalFrequency']['First'] = $powerBox_result->Electrical_First==1?true:false;
                    $result['ElectricalFrequency']['Second'] = $powerBox_result->Electrical_Second==1?true:false;
                    $result['ElectricalFrequency']['Third'] = $powerBox_result->Electrical_Third==1?true:false;
                    $result['ElectricalFrequency']['Fourth'] = $powerBox_result->Electrical_Fourth==1?true:false;

                    $result['Voltage']['V_12'] = $powerBox_result->V_12=='12v' ?$powerBox_result->V_12:'';
                    $result['Voltage']['V_24'] = $powerBox_result->V_24=='24v' ? $powerBox_result->V_24:'';
                    $result['Voltage']['V_220'] = $powerBox_result->V_220=='220v' ? $powerBox_result->V_220:'';

                    $result['result'] = 'success';
                    $data_hex = $this->decTohex($result);
                    $connection->send($data_hex);

                }elseif ($method=='controlpowerboxcode'){
                    //获取控制类型编码
                    $result['PowerboxControlType'] = controlPowerBoxType();
                    $result['result'] = 'success';
                    $data_hex = $this->decTohex($result);
                    $connection->send($data_hex);

                }elseif ($method=='getpowerboxtypecode'){
                    //获取电源箱类型编码
                    $result['PowerboxType'] = powerBoxTypeCode();
                    $result['result'] = 'success';
                    $data_hex = $this->decTohex($result);
                    $connection->send($data_hex);

                }elseif ($method=='controlpowerbox'){
                    //控制电源箱
                    if(empty($params)){
                        //无效的参数
                        $result = error_json(-32603,'Invalid params 无效的参数',$id);
                        $data_hex = $this->decTohex($result);
                        $connection->send($data_hex);
                    }

                }elseif ($method=='geteventcode'){
                    //获取电源箱事件类型编码
                    $result['event'] = eventType();
                    $result['result'] = 'success';
                    $data_hex = $this->decTohex($result);
                    $connection->send($data_hex);

                }elseif ($method=='updateheart'){
                    $appear_params = $params;
                    //更新心跳信息
                    $params['PowerBoxCode'] = $powerBox_result->PowerBoxCode;
                    $params['heartTime'] = date('Y-m-d H:i:s');
                    $params['online'] = 1;
                    $powerBox_result->online=1;
                    //防雷器
                    $powerBox_result->Lighting_V12 = $params['Lighting_V12'] = $params['Lightning '][0]['V_12']? 1:0;
                    $powerBox_result->Lighting_V24 = $params['Lighting_V24'] =$params['Lightning '][0]['V_24']? 1:0;
                    $powerBox_result->Lighting_V220 = $params['Lighting_V220'] =$params['Lightning '][0]['V_220']? 1:0;
                    //保存外部接入高低电频(true-高，false-低)
                    $powerBox_result->Electrical_First = $params['Electrical_First'] = $params['ElectricalFrequency'][0]['First']? 1:0;
                    $powerBox_result->Electrical_Second = $params['Electrical_Second'] =$params['ElectricalFrequency'][0]['Second']? 1:0;
                    $powerBox_result->Electrical_Third = $params['Electrical_Third'] =$params['ElectricalFrequency'][0]['Third']? 1:0;
                    $powerBox_result->Electrical_Fourth = $params['Electrical_Fourth'] =$params['ElectricalFrequency'][0]['Fourth']? 1:0;
                    $powerBox_result->V_12 = $params['V_12'] = $params['Voltage'][0]['V_12'];
                    $powerBox_result->V_24 = $params['V_24'] = $params['Voltage'][0]['V_24'];
                    $powerBox_result->V_220 = $params['V_220'] = $params['Voltage'][0]['V_220'];
                    $powerBox_result->temperature = $params['Temperature'];
                    $powerBox_result->humidity = $params['Humidity'];
                    $params['temperature'] = $params['Temperature'];
                    $params['humidity'] = $params['Humidity'];

                    unset($params['Temperature']);
                    unset($params['Humidity']);
                    unset($params['Lightning ']);
                    unset($params['ElectricalFrequency']);
                    unset($params['Voltage']);
                    //上报心跳信息,数据已有缺少上报接口路径
//                    $appear_params['Lightning'] = $appear_params['Lightning '];
//                    $appear_params['heartTime'] = $params['heartTime'];
//                    $appear_params['Server_id'] = $system ? $system['Server_id']:'';
//                    $appear_params['address'] = $system ? $system['address']:'';
//                    unset($appear_params['Lightning ']);

                    //判断电压、温湿度过低报警
                    PowerboxEvent::reportEvent($params);

                    //更新设备最新信息
                    $powerBox_result->save();
                    //创建心跳信息
                    HearbeatPowerbox::create($params);
                    $result['id'] = $id;
                    $result['result'] = 'success';
                    $data_hex = $this->decTohex($result);
                    $connection->send($data_hex);

                }else{
                    //没有此方法返回信息
                    $result = error_json(-32601,'Method not found 没有该方法',$id);
                    $data_hex = $this->decTohex($result);
                    $connection->send($data_hex);
                }
            }else{
                $result = error_json(-32700,'Parse error 解析错误');
                $data_hex = $this->decTohex($result);
                $connection->send($data_hex);
            }


        }catch (Exception $exception){
            $result = error_json(-32603,'Internal error 内部错误');
            $data_hex = $this->decTohex($result);
            $connection->send($data_hex);
        }
    }

    /**
     * 当连接建立时触发的回调函数
     * @param $connection
     */
    public function onConnect($connection)
    {
        $client_id = $connection->worker->id .'_'.$connection->id;
        $userClient = UserClient::where('client_id',$client_id)->where('username',$connection->getRemoteIp().':'.$connection->getRemotePort())->find();
        $powerbox = PowerBox::where('client_ip',$connection->getRemoteIp().':'.$connection->getRemotePort())->find();
        if(!$userClient){
            $params = array('username'=>$connection->getRemoteIp().':'.$connection->getRemotePort(),'client_id'=>$client_id);
            $params['createTime'] = date('Y-m-d H:i:s');
            $params['updateTime'] = date('Y-m-d H:i:s');
            UserClient::create($params);
        }
        if($powerbox){
            $powerbox->online = 1;
            $powerbox->save();
//            PowerBox::powerBox_online($powerbox->PowerBoxId);
        }
//        var_dump($connection);
        echo 'success';
        $result['result'] = 'success';
        $data_hex = $this->decTohex($result);
        $connection->send($data_hex);
    }

    /**
     * 当连接断开时触发的回调函数
     * @param $connection
     */
    public function onClose($connection)
    {
        $worker = $this->worker;
        if(isset($connection->uid))
        {
            // 连接断开时删除映射
            unset($worker->uidConnections[$connection->uid]);
            //修改数据库中保存的设备UID
            $powerBox_result = PowerBox::where('uid',$connection->uid)->find();

        }else{
            $powerBox_result = PowerBox::where('client_ip',$connection->getRemoteIp())->find();
        }
        if($powerBox_result){
            PowerBox::powerBoxIsOnline($powerBox_result->PowerBoxId);
        }
        //检查所有设备心跳包信息是否已经不在线
        echo '连接断了';
    }

    /**
     * 当客户端的连接上发生错误时触发
     * @param $connection
     * @param $code
     * @param $msg
     */
    public function onError($connection, $code, $msg)
    {
        echo "error $code $msg\n";
    }

    /**
     * 每个进程启动
     * @param $worker
     */
    public function onWorkerStart($worker)
    {
        Timer::add(1, function()use($worker){
            $time_now = time();
            foreach($worker->connections as $connection) {
                // 有可能该connection还没收到过消息，则lastMessageTime设置为当前时间
                if (empty($connection->lastMessageTime)) {
                    $connection->lastMessageTime = $time_now;
                    continue;
                }
                // 上次通讯时间间隔大于心跳间隔，则认为客户端已经下线，关闭连接;// 心跳间隔55秒
                if ($time_now - $connection->lastMessageTime > 60) {
                    echo '我走了';
                    $connection->close();
                }
            }
        });
    }

    public function decTohex($result){
        $json = json_encode($result);
        $length = strlen($json);
        $total = 2+2+$length;
        if(strlen(dechex($length))==3){
            $length_dec = '0'.dechex($length);
        }elseif(strlen(dechex($length))==2){
            $length_dec = '00'.dechex($length);
        }elseif(strlen(dechex($length))==1){
            $length_dec = '000'.dechex($length);
        }else{
            $length_dec = dechex($length);
        }

        if(strlen(dechex($total))==1){
            $total_dec = '0'.dechex($total);
        }else{
            $total_dec = dechex($total);
        }
        return $data_hex = hex2bin('5aa5').hex2bin($length_dec).$json.hex2bin($total_dec).hex2bin('a00a');
    }

}