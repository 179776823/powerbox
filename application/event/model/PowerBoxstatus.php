<?php


namespace app\event\model;


use think\Model;
use think\Db;

class PowerBoxstatus extends Model
{
    protected $table = 'powerBoxstatus';

    public static function PowerStatus($PowerBoxId,$eventCode){
        $PowerBoxstatus = self::where('PowerBoxId',$PowerBoxId)->find();
        if($PowerBoxstatus){
            if($eventCode==1 || $eventCode==2){
                $PowerBoxstatus->V12_status = $eventCode==1 ? 1:0;
            }elseif($eventCode==3 ||$eventCode==4){
                $PowerBoxstatus->V24_status = $eventCode==3 ? 1:0;
            }elseif($eventCode==5 ||$eventCode==6){
                $PowerBoxstatus->V220_status = $eventCode==5 ? 1:0;
            }elseif($eventCode==7 ||$eventCode==8){
                $PowerBoxstatus->LightingV12_status = $eventCode==7 ? 1:0;
            }elseif($eventCode==9 ||$eventCode==10){
                $PowerBoxstatus->LightingV24_status = $eventCode==9 ? 1:0;
            }elseif($eventCode==11 ||$eventCode==12){
                $PowerBoxstatus->LightingV220_status = $eventCode==11 ? 1:0;
            }elseif($eventCode==15 ||$eventCode==16){
                $PowerBoxstatus->ElectricalFirst_status = $eventCode==15 ? 1:0;
            }elseif($eventCode==17 ||$eventCode==18){
                $PowerBoxstatus->ElectricalSecond_status = $eventCode==17 ? 1:0;
            }elseif($eventCode==19 ||$eventCode==20){
                $PowerBoxstatus->ElectricalThird_status = $eventCode==19 ? 1:0;
            }elseif($eventCode==21 ||$eventCode==22){
                $PowerBoxstatus->ElectricalFourth_status = $eventCode==21 ? 1:0;
            }
            $PowerBoxstatus->save();
        }else{
            self::create([
                'PowerBoxId'  =>  $PowerBoxId,
                'V12_status' =>  $eventCode==1 ? 1:0,
                'V24_status'=> $eventCode==3 ? 1:0,
                'V220_status'=> $eventCode==5 ? 1:0,
                'LightingV12_status'=> $eventCode==7 ? 1:0,
                'LightingV24_status'=> $eventCode==9 ? 1:0,
                'LightingV220_status'=> $eventCode==11 ? 1:0,
                'ElectricalFirst_status'=> $eventCode==15 ? 1:0,
                'ElectricalSecond_status'=> $eventCode==17 ? 1:0,
                'ElectricalThird_status'=> $eventCode==19 ? 1:0,
                'ElectricalFourth_status'=> $eventCode==21 ? 1:0,
            ]);
        }

    }

    //自动清除设备报警状态
    public static function clearAlarm($PowerBoxId){
        $PowerBoxstatus = self::where('PowerBoxId',$PowerBoxId)->find();
        // 三分钟内没有发送报警信息，自动给取消
        $date_begin = date('Y-m-d H:i:s', strtotime('-3 minute'));
        $date_end = date('Y-m-d H:i:s',time());
        if($PowerBoxstatus->V12_status==1){
            $where['eventCode']=['eventCode','=',2];
            $total_12 = Db::table('powerboxEvent')->where($where)->whereBetweenTime('triggerTime',$date_begin,$date_end)->count();
            if($total_12==0){
                $PowerBoxstatus->V12_status=0;
            }            
        }
        if($PowerBoxstatus->V24_status==1){
            $where = [];
            $where['eventCode']=['eventCode','=',4];
            $total_24 = Db::table('powerboxEvent')->where($where)->whereBetweenTime('triggerTime',$date_begin,$date_end)->count();
            if(!$total_24){
                $PowerBoxstatus->V24_status=0;
            }            
        }

        if($PowerBoxstatus->V220_status==1){
            $where = [];
            $where['eventCode']=['eventCode','=',6];
            $total_220 = Db::table('powerboxEvent')->where($where)->whereBetweenTime('triggerTime',$date_begin,$date_end)->count();
            if(!$total_220){
                $PowerBoxstatus->V220_status=0;
            }            
        }

        if($PowerBoxstatus->LightingV12_status==1){
            $where = [];
            $where['eventCode']=['eventCode','=',8];
            $total_LightingV12 = Db::table('powerboxEvent')->where($where)->whereBetweenTime('triggerTime',$date_begin,$date_end)->count();
            if(!$total_LightingV12){
                $PowerBoxstatus->LightingV12_status=0;
            }            
        }

        if($PowerBoxstatus->LightingV24_status==1){
            $where = [];
            $where['eventCode']=['eventCode','=',10];
            $total_LightingV24 = Db::table('powerboxEvent')->where($where)->whereBetweenTime('triggerTime',$date_begin,$date_end)->count();
            if(!$total_LightingV24){
                $PowerBoxstatus->LightingV24_status=0;
            }            
        }

        if($PowerBoxstatus->LightingV220_status==1){
            $where = [];
            $where['eventCode']=['eventCode','=',12];
            $total_LightingV220 = Db::table('powerboxEvent')->where($where)->whereBetweenTime('triggerTime',$date_begin,$date_end)->count();
            if(!$total_LightingV220){
                $PowerBoxstatus->LightingV220_status=0;
            }            
        }

        if($PowerBoxstatus->ElectricalFirst_status==1){
            $where = [];
            $where['eventCode']=['eventCode','=',16];
            $total_Electrical1 = Db::table('powerboxEvent')->where($where)->whereBetweenTime('triggerTime',$date_begin,$date_end)->count();
            if(!$total_Electrical1){
                $PowerBoxstatus->ElectricalFirst_status=0;
            }            
        }

        if($PowerBoxstatus->ElectricalSecond_status==1){
            $where = [];

            $where['eventCode']=['eventCode','=',18];
            $total_Electrical2 = Db::table('powerboxEvent')->where($where)->whereBetweenTime('triggerTime',$date_begin,$date_end)->count();
            if(!$total_Electrical2){
                $PowerBoxstatus->ElectricalSecond_status=0;
            }            
        }

        if($PowerBoxstatus->ElectricalThird_status==1){
            $where = [];
            $where['eventCode']=['eventCode','=',20];
            $total_Electrical3 = Db::table('powerboxEvent')->where($where)->whereBetweenTime('triggerTime',$date_begin,$date_end)->count();
            if(!$total_Electrical3){
                $PowerBoxstatus->ElectricalThird_status=0;
            }            
        }

        if($PowerBoxstatus->ElectricalFourth_status==1){
            $where = [];
            $where['eventCode']=['eventCode','=',22];
            $total_Electrical4 = Db::table('powerboxEvent')->where($where)->whereBetweenTime('triggerTime',$date_begin,$date_end)->count();
            if(!$total_Electrical4){
                $PowerBoxstatus->ElectricalFourth_status=0;
            }            
        }

        $PowerBoxstatus->save();
    }
}