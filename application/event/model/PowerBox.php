<?php


namespace app\event\model;


use think\Db;
use think\Model;

class PowerBox extends Model
{
    protected $table = 'powerBox';
    public static function powerBoxIsOnline($powerBoxId=''){
        $power_list = PowerBox::column('PowerBoxId');
        $system = Db::table('powerBoxSystem')->find();
        if($powerBoxId){
            $powerHeart = Db::table('heartbeat_powerbox')->where('PowerBoxId',$powerBoxId)->order('id','desc')->find();
            Db::table('powerBox')->where('PowerBoxId',$powerHeart['PowerBoxId'])->update(['online'=>2,'uid'=>'']);
            Db::table('heartbeat_powerbox')->where('id',$powerHeart['id'])->update(['online'=>2]);
            //离线设备上报
//            $send['Server_id'] = $system ? $system['Server_id']:'';
//            $send['address'] = $system ? $system['address']:'';
//            $send['PowerBoxId'] = $powerBoxId;
//            $send['offLineTime'] = date('Y-m-d H:i:s');
        }else{
            if($power_list){
                foreach ($power_list as $key=>$value){
                    $powerHeart = Db::table('heartbeat_powerbox')->where('PowerBoxId',$value)->order('id','desc')->find();
                    if($powerHeart){
                        $time = time();
                        $heartTime = strtotime($powerHeart['heartTime']);
                        if($time-$heartTime > 60){
                            Db::table('powerBox')->where('PowerBoxId',$powerHeart['PowerBoxId'])->update(['online'=>2]);
                            Db::table('heartbeat_powerbox')->where('id',$powerHeart['id'])->update(['online'=>2]);
                            //离线设备上报
//                            $send['Server_id'] = $system ? $system['Server_id']:'';
//                            $send['address'] = $system ? $system['address']:'';
//                            $send['PowerBoxId'] = $powerHeart['PowerBoxId'];
//                            $send['offLineTime'] = date('Y-m-d H:i:s');
                        }
                    }
                }
            }
        }

    }

    public static function powerBoxStatus($arr){
        $powerBox_arr = self::where('PowerBoxId',$arr['id'])->find();
        if($arr['result']=='success'){
            if($powerBox_arr){
                if($arr['code']==1 || $arr['code']==2){
                    $powerBox_arr->V_12 = $arr['code']==1 ? 0:12;
                }elseif($arr['code']==3 || $arr['code']==4){
                    $powerBox_arr->V_24 = $arr['code']==3 ? 0:24;
                }elseif($arr['code']==5 || $arr['code']==6){
                    $powerBox_arr->V_220 = $arr['code']==5 ? 0:220;
                }elseif($arr['code']==7 || $arr['code']==8){
                    $powerBox_arr->Output_First = $arr['code']==7 ? 0:1;
                }elseif($arr['code']==9 || $arr['code']==10){
                    $powerBox_arr->Output_Second = $arr['code']==9 ? 0:1;
                }elseif($arr['code']==11 || $arr['code']==12){
                    $powerBox_arr->Output_Third = $arr['code']==11 ? 0:1;
                }elseif($arr['code']==13 || $arr['code']==14){
                    $powerBox_arr->Output_Fourth = $arr['code']==13 ? 0:1;
                }elseif ($arr['code']==15){

                }
            }
        }elseif($arr['result']=='error'){
            if($arr['code']==1 || $arr['code']==2){
                $powerBox_arr->V_12 = $arr['code']==1 ? 12:0;
            }elseif($arr['code']==3 || $arr['code']==4){
                $powerBox_arr->V_24 = $arr['code']==3 ? 24:0;
            }elseif($arr['code']==5 || $arr['code']==6){
                $powerBox_arr->V_220 = $arr['code']==5 ? 220:0;
            }elseif($arr['code']==7 || $arr['code']==8){
                $powerBox_arr->Output_First = $arr['code']==7 ? 1:0;
            }elseif($arr['code']==9 || $arr['code']==10){
                $powerBox_arr->Output_Second = $arr['code']==9 ? 1:0;
            }elseif($arr['code']==11 || $arr['code']==12){
                $powerBox_arr->Output_Third = $arr['code']==11 ? 1:0;
            }elseif($arr['code']==13 || $arr['code']==14){
                $powerBox_arr->Output_Fourth = $arr['code']==13 ? 1:0;
            }elseif ($arr['code']==15){

            }

        }
        $powerBox_arr->save();
    }
}