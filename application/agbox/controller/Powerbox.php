<?php


namespace app\agbox\controller;

use app\agbox\model\PowerBoxput;
use app\agbox\model\PowerBoxreport;
use app\agbox\model\PowerBoxstatus;
use app\agbox\model\PowerBoxSystem;
use think\Db;
use app\agbox\model\PowerBox as PowerBoxs;
use think\Exception;

class Powerbox
{

    //获取所有电源箱设备
    public function powerBox(){
        $post = request()->param();
        $power = Db::table('powerBox')->select();
        if(isset($post['PowerBoxId'])){
            $power = Db::table('powerBox')->where('PowerBoxId|address','like','%'.$post['PowerBoxId'].'%')->select();
        }
        $notline_num = 0;
        if($power){
            foreach ($power as $key=>$value){
                $powerStatus = PowerBoxstatus::where('PowerBoxId',$value['PowerBoxId'])->find();
                if($powerStatus->V12_status >0 || $powerStatus->V24_status >0 ||$powerStatus->V220_status >0||$powerStatus->LightingV12_status >0||$powerStatus->LightingV24_status >0||$powerStatus->LightingV220_status >0||$powerStatus->ElectricalFirst_status >0 ||$powerStatus->ElectricalSecond_status >0||$powerStatus->ElectricalThird_status >0||$powerStatus->ElectricalFourth_status >0){
                    $power[$key]['status']=1;
                }else{
                    $power[$key]['status']=0;
                }
                $power[$key]['online'] = $value['online']==1?'在线':'不在线';
                $notline_num = $value['online']==1 ?$notline_num:$notline_num+1;
            }
        }
        $total = $power?count($power):0;
        $result['power'] = $power;
        $result['total'] = $total;
        $result['notline_num'] = $notline_num;
        return json($result);
    }

    //获取单个电源箱设备详情
    public function powerBoxOne(){
        $post = request()->param();
        $power_one = Db::table('powerBox')->where('PowerBoxId',$post['PowerBoxId'])->find();
        $powerStatus = Db::table('powerBoxstatus')->where('PowerBoxId',$post['PowerBoxId'])->find();
        $putstatus = PowerBoxput::OutputAndInputset();
        if($power_one){
            if(trim($power_one['V_12'],'v')>7 && $power_one['V_12']!=0){
                $power_one['V_12'] = trim($power_one['V_12'],'v').'v';
                $power_one['V12_handle'] = '断开';
            }else{
                $power_one['V_12'] = control_name(1);
                $power_one['V12_handle'] = '接通';
            }
            if(trim($power_one['V_24'],'v')>15 && $power_one['V_24']!=0){
                $power_one['V_24'] = trim($power_one['V_24'],'v').'v';
                $power_one['V24_handle'] = '断开';
            }else{
                $power_one['V_24'] = control_name(3);
                $power_one['V24_handle'] = '接通';
            }
            if(trim($power_one['V_220'],'v')>170 && $power_one['V_220']!=0){
                $power_one['V_220'] = trim($power_one['V_220'],'v').'v';
                $power_one['V220_handle'] = '断开';
            }else{
                $power_one['V_220'] = control_name(5);
                $power_one['V220_handle'] = '接通';
            }

            if($power_one['Output_First']!=0){
                $power_one['Output_First'] = '高';
                $power_one['OFirst_handle'] = '断开';
            }else{
                $power_one['Output_First'] = '低';
                $power_one['OFirst_handle'] = '接通';
            }

            if($power_one['Output_Second']!=0){
                $power_one['Output_Second'] = '高';
                $power_one['OSecond_handle'] = '断开';
            }else{
                $power_one['Output_Second'] = '低';
                $power_one['OSecond_handle'] = '接通';
            }

            if($power_one['Output_Third']!=0){
                $power_one['Output_Third'] = '高';
                $power_one['OThird_handle'] = '断开';
            }else{
                $power_one['Output_Third'] = '低';
                $power_one['OThird_handle'] = '接通';
            }

            if($power_one['Output_Fourth']!=0){
                $power_one['Output_Fourth'] = '高';
                $power_one['OFourth_handle'] = '断开';
            }else{
                $power_one['Output_Fourth'] = '低';
                $power_one['OFourth_handle'] = '接通';
            }
            $power_one['status'] = $powerStatus;

            $power_one['powerBoxput'] = $putstatus;
        }
        return json($power_one);
    }

    //获取事件
    public function getEvent(){
        $post = request()->param();
        $putstatus = PowerBoxput::OutputAndInputset();
        $limit =30;
        $offset = ($post['page']-1) * $limit;
        $where  = [];
        if(!empty($post['eventCode'])){
            $where['eventCode']=['eventCode','=',$post['eventCode']];
        }
        if(empty($post['PowerBoxId'])){
            $post['PowerBoxId']='';
        }
        if(!empty($post['date_begin']) && !empty($post['date_end'])){
            $date_begin = str_replace('+',' ',$post['date_begin']);
            $date_end = str_replace('+',' ',$post['date_end']);
        }

        if(!empty($post['date_begin']) && !empty($post['date_end'])){
            $eventList = Db::table('powerboxEvent')->where($where)->where('PowerBoxId|address','like','%'.$post['PowerBoxId'].'%')->whereBetweenTime('triggerTime',$date_begin,$date_end)->order('id','desc')->limit($offset,$limit)->select();
            $total = Db::table('powerboxEvent')->where($where)->whereBetweenTime('triggerTime',$date_begin,$date_end)->count();
        }else{
            $eventList = Db::table('powerboxEvent')->where($where)->where('PowerBoxId|address','like','%'.$post['PowerBoxId'].'%')->order('id','desc')->limit($offset,$limit)->select();
            $total = Db::table('powerboxEvent')->where($where)->count();
        }


        if(!empty($post['id'])){
            foreach ($eventList as $key=>$val){
                if($val['id']==$post['id']){
                    unset($eventList[$key]);
                    Db::table('powerboxEvent')->where('id',$val['id'])->update(['is_read'=>1]);
                    $val['is_read']=2;
                    array_unshift($eventList,$val);
                }
            }
        }
        if($eventList){
            foreach ($eventList as $k=>$v){
                $eventList[$k]['note'] = str_replace(array('电源箱外接输入口1','电源箱外接输入口2','电源箱外接输入口3','电源箱外接输入口4'),array($putstatus['input1'],$putstatus['input2'],$putstatus['input3'],$putstatus['input4']),$v['note']);
            }
        }
        //获取事件类型编码
        $result['list'] = $eventList;
        $result['page'] = $post['page'];
        $result['total'] = $total;
        $result['totalPages'] = ceil($total/$limit);
        return json($result);
    }

    //获取事件编码
    public function getEventCode()
    {
        $post = request()->param();
        $eventCode = eventType();
        return json($eventCode);
    }

    //获取心跳信息
    public function getHeartbeat(){
        $post = request()->param();
        $where  = [];
        if(!empty($post['online'])){
            $where['online']=$post['online'];
        }

        if(!empty($post['time_begin']) && !empty($post['time_end'])){
            $time_begin = str_replace('+',' ',$post['time_begin']);
            $time_end = str_replace('+',' ',$post['time_end']);
        }
        if(!empty($post['time_begin']) && !empty($post['time_end'])){
            $heartList = Db::table('heartbeat_powerbox')->where($where)->whereBetweenTime('heartTime',$time_begin,$time_end)->order('id','desc')->limit(1000)->select();
        }else{
            $heartList = Db::table('heartbeat_powerbox')->where($where)->order('id','desc')->limit(1000)->select();
        }
        return json($heartList);
    }

    //添加或编辑设备
    public function addPowerBox(){
        $post = request()->param();
        $power = PowerBoxs::where('PowerBoxId',$post['PowerBoxId'])->find();
        $powerstatus['PowerBoxId'] =$post['PowerBoxId'];
        $powerstatus['createTime'] = date('Y-m-d H:i:s',time());
        if($power && $post['method']=='add'){
            return json([
                'code'=>-20009,
                'message'=>'设备已经存在'
            ]);
        }else{
            if($post['method']=='add'){
                $post['PowerBoxType']=1;
                if(preg_match("/[\'.,:;*?~`!@#$%^&+=)(<>{}]|\]|\[|\/|\\\|\"|\|/",$post['PowerBoxId'])){
                    //不允许特殊字符
                    return json([
                        'code'=>-20001,
                        'message'=>'设备ID不能含有特殊字符'
                    ]);
                }
                unset($post['method']);
                $post['online']=2;
                $post['createTime']=date('Y-m-d H:i:s',time());
                $post['Output_First']=1;
                $post['Output_Second']=1;
                $post['Output_Third']=1;
                $post['Output_Fourth']=1;
                PowerBoxs::create($post);
                PowerBoxstatus::create($powerstatus);
            }else{
                $powerBoxstatus = PowerBoxstatus::where('PowerBoxId',$post['PowerBoxId'])->find();
                if(!$powerBoxstatus){
                    PowerBoxstatus::create($powerstatus);
                }
                $power->PowerBoxCode = $post['PowerBoxCode'];
                $power->address = $post['address'];
                $power->lon = $post['lon'];
                $power->lat = $post['lat'];
                $power->alt = $post['alt'];
                $power->floor = $post['floor'];
                $power->note = $post['note'];
                $power->save();
            }
            return json([
                'code'=>200,
                'message'=>'保存成功'
            ]);
        }
    }

    //删除设备
    public function delPowerBox(){
        $post = request()->param();
        $power = PowerBoxs::where('PowerBoxId',$post['PowerBoxId'])->find();
        if($power){
            //删除设备和相关的表信息
            PowerBoxs::where('PowerBoxId',$post['PowerBoxId'])->delete();
            Db::table('powerboxEvent')->where('PowerBoxId',$post['PowerBoxId'])->delete();
            Db::table('heartbeat_powerbox')->where('PowerBoxId',$post['PowerBoxId'])->delete();
            Db::table('powerBoxstatus')->where('PowerBoxId',$post['PowerBoxId'])->delete();
            return json([
                'code'=>200,
                'message'=>'删除成功'
            ]);
        }else{
            return json([
                'code'=>-20014,
                'message'=>'设备未注册'
            ]);
        }
    }

    //实时查询事件是否读取，并统计
    public function powerBoxEvent(){
        $post = request()->param();
        $total = Db::table('powerboxEvent')->where('is_read',0)->count();
        $begin_time = date('Y-m-d H:i:s',time()-25);
        $new_total = Db::table('powerboxEvent')->whereBetweenTime('triggerTime',$begin_time,date('Y-m-d H:i:s',time()))->count();
        $result['total'] = $total;
        $result['isnews'] = $new_total ? 1:0;
        return json($result);
    }

    public function powerNewsEvent(){
        $post = request()->param();
        if($post['is_read']==1){
            Db::table('powerboxEvent')->where('is_read',0)->update(['is_read'=>1]);
        }
        $newslist = Db::table('powerboxEvent')->where('is_read',0)->field('id,PowerBoxId,eventCode,triggerTime')->order('id','desc')->select();
        $event_type = eventType();
        if($newslist){
            foreach ($newslist as $key=>$val){
                foreach ($event_type as $k=>$v){
                    if($val['eventCode']==$v['code']){
                        $newslist[$key]['eventCode'] = $v['name'];
                    }
                }
            }
        }
        return json($newslist);
    }

    //获取输入输出口的定义内容
    public function powerBoxput(){
        $post = request()->param();
        $putinfo = Db::table('powerBoxput')->find();
        if($post['type']==1){
            if(!$putinfo){
                $putinfo = '';
            }
            $result['putinfo'] = $putinfo;

        }else{
            if(!$putinfo){
                unset($post['type']);
                PowerBoxput::create($post);
            }else{
                unset($post['type']);
                $put_arr=[
                    'input1'=>$post['input1'],
                    'input2'=>$post['input2'],
                    'input3'=>$post['input3'],
                    'input4'=>$post['input4'],
                    'output1'=>$post['output1'],
                    'output2'=>$post['output2'],
                    'output3'=>$post['output3'],
                    'output4'=>$post['output4']
                ];
                Db::table('powerBoxput')->where('id',$putinfo['id'])->update($put_arr);
            }
            $result['status']='success';
        }
        return json($result);
    }

    //获取自定义报警值
    public function powerBoxreport(){
        $post = request()->param();
        $reportinfo = Db::table('powerBoxreport')->find();
        if($post['type']==1){
            if(!$reportinfo){
                $reportinfo = '';
            }
            $result['reportinfo'] = $reportinfo;
        }else{
            if(!$reportinfo){
                unset($post['type']);
                PowerBoxreport::create($post);
            }else{
                unset($post['type']);
                $report_arr=[
                    'V12_report'=>$post['V12_report'],
                    'V24_report'=>$post['V24_report'],
                    'V220_report'=>$post['V220_report'],
                    'V12_scope'=>$post['V12_scope'],
                    'V24_scope'=>$post['V24_scope'],
                    'V220_scope'=>$post['V220_scope'],
                    'temperature_report'=>$post['temperature_report'],
                    'humidity_report'=>$post['humidity_report'],
                    'temperature_scope'=>$post['temperature_scope'],
                    'humidity_scope'=>$post['humidity_scope']
                ];
                Db::table('powerBoxreport')->where('id',$reportinfo['id'])->update($report_arr);
            }
            $result['status']='success';
        }
        return json($result);
    }

    //保存平台配置
    public function powerBoxSystem(){
        $post = request()->param();
        $systeminfo = Db::table('powerBoxSystem')->find();
        if($post['type']==1){
            if(!$systeminfo){
                $systeminfo = '';
            }
            $result['systeminfo'] = $systeminfo;
        }else{
            if(!$systeminfo){
                unset($post['type']);
                $post['createTime'] = date('Y-m-d H:i:s',time());
                PowerBoxSystem::create($post);
            }else{
                unset($post['type']);
                $system_arr=[
                    'Server_id'=>$post['Server_id'],
                    'address'=>$post['address'],
                    'updateTime'=>date('Y-m-d H:i:s',time())
                ];
                Db::table('powerBoxSystem')->where('id',$systeminfo['id'])->update($system_arr);
            }
            $result['status']='success';
        }
        return json($result);
    }

    //控制电源箱
    public function control(){
        $post = request()->param();
        $url = 'tcp://'.$_SERVER['SERVER_ADDR'].':1000';
        $powerbox = Db::table('powerBox')->where('PowerBoxId',$post['PowerBoxId'])->find();
        if(empty($powerbox['uid'])){
            return json([
                'code'=>-20018,
                'message'=>'设备不在线'
            ]);
        }
        if($post['name']=='V_12'){
            $code = $powerbox[$post['name']]>10 ? 1:2;
            $powerbox[$post['name']] = $code==1 ? 0:'12';
        }elseif ($post['name']=='V_24'){
            $code = $powerbox[$post['name']]>20 ? 3:4;
            $powerbox[$post['name']] = $code==3 ? 0:'24';
        }elseif ($post['name']=='V_220'){
            $code = $powerbox[$post['name']]>190 ? 5:6;
            $powerbox[$post['name']] = $code==5 ? 0:'220';
        }elseif ($post['name']=='Output_First'){
            $code = $powerbox[$post['name']]>0 ? 7:8;
            $powerbox[$post['name']] = $code==7 ? 0:1;
        }elseif ($post['name']=='Output_Second'){
            $code = $powerbox[$post['name']]>0 ? 9:10;
            $powerbox[$post['name']] = $code==9 ? 0:1;
        }elseif ($post['name']=='Output_Third'){
            $code = $powerbox[$post['name']]>0 ? 11:12;
            $powerbox[$post['name']] = $code==11 ? 0:1;
        }elseif ($post['name']=='Output_Fourth'){
            $code = $powerbox[$post['name']]>0 ? 13:14;
            $powerbox[$post['name']] = $code==13 ? 0:1;
        }else{
            $code = 15;
        }
        try{
            // 建立socket连接到内部推送端口
            $client = stream_socket_client($url, $errno, $errmsg, 1);
            // 推送的数据，包含uid字段，表示是给这个uid推送
            $data['params'] = array('uid'=>$powerbox['uid'],'code'=>$code);
            // 发送数据，注意5678端口是Text协议的端口，Text协议需要在数据末尾加上换行符
            $json = json_encode($data);
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
            $data_hex = hex2bin('5aa5').hex2bin($length_dec).$json.hex2bin($total_dec).hex2bin('a00a');
            fwrite($client, $data_hex);
            // 读取推送结果
            $result = fread($client, 8192);
            if(strstr($result,'success')){
                if(!empty($post['name'])){
                    Db::table('powerBox')->where('PowerBoxId',$powerbox['PowerBoxId'])->update([trim($post['name'])=>$powerbox[$post['name']]]);
                    return json([
                        'code'=>200,
                        'message'=>'操作成功'
                    ]);
                }
            }else{
                return json([
                    'code'=>-10001,
                    'message'=>'操作失败'
                ]);
            }
        }catch (Exception $exception){
            return json([
                'code'=>-10001,
                'message'=>'操作失败,监听已断开'
            ]);
        }

    }

    //查询平台所有设备并返回设备在线状态
    public function powerBoxMessage(){
        $post = request()->param();
        $offLinelist = PowerBoxs::where('online',2)->field(['PowerBoxId,address'])->select();
        $onLinelist = PowerBoxs::where('online',1)->field(['PowerBoxId,address'])->select();
        $system = Db::table('powerBoxSystem')->find();
        $result['Server_id'] = $system ? $system['Server_id']:'';
        $result['address'] = $system ? $system['address']:'';
        $result['frmeTime'] = date('Y-m-d H:i:s');
        $result['offLineList'] = $offLinelist;
        $result['onLineList'] = $onLinelist;
        return json($result);
    }

    //统计设备在线比例和报警事件比例
    public function powerBoxCensus(){
        $post = request()->param();
        $offLinelist = PowerBoxs::where('online',2)->field(['PowerBoxId'])->count();
        $onLinelist = PowerBoxs::where('online',1)->field(['PowerBoxId'])->count();
        $total = $offLinelist+$onLinelist;
        $off_percen =floatval(sprintf('%.1f',$offLinelist/$total*100));
        $on_percen = floatval(sprintf('%.1f',$onLinelist/$total*100));
        $result['line_total'] = $total;
        $result['offLinelist'] = $offLinelist;
        $result['onLinelist'] = $onLinelist;
        $result['off_percen'] = $off_percen;
        $result['on_percen'] = $on_percen;
        return json($result);
    }

    //外部接口获取单个电源箱设备详情
    public function powerBoxInfo(){
        $post = request()->param();
        $power_one = Db::table('powerBox')->where('PowerBoxId',$post['PowerBoxId'])->find();
        if($power_one){
            if(trim($power_one['V_12'],'v')>7 && $power_one['V_12']!=0){
                $power_one['V_12'] = trim($power_one['V_12'],'v').'v';
            }else{
                $power_one['V_12'] = control_name(1);
            }
            if(trim($power_one['V_24'],'v')>15 && $power_one['V_24']!=0){
                $power_one['V_24'] = trim($power_one['V_24'],'v').'v';
            }else{
                $power_one['V_24'] = control_name(3);
            }
            if(trim($power_one['V_220'],'v')>170 && $power_one['V_220']!=0){
                $power_one['V_220'] = trim($power_one['V_220'],'v').'v';
            }else{
                $power_one['V_220'] = control_name(5);
            }
        }
        unset($power_one['id']);
        unset($power_one['state']);
        unset($power_one['client_ip']);
        unset($power_one['uid']);
        unset($power_one['createTime']);
        unset($power_one['PowerBoxCode']);
        unset($power_one['PowerBoxType']);
        return json($power_one);
    }
}