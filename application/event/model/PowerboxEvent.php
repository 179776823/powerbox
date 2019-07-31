<?php


namespace app\event\model;


use think\Db;
use think\Model;

class PowerboxEvent extends Model
{
    protected $table = 'powerboxEvent';

    public static function reportEvent($params){
        $report_set = Db::table('powerBoxreport')->find();
        $powerbox = Db::table('powerBox')->where('PowerBoxId',$params['PowerBoxId'])->find();
        if($report_set){
            $data['PowerBoxId'] = $params['PowerBoxId'];
            $data['address'] = $powerbox['address'];
            $data['triggerTime'] = date('Y-m-d H:i:s',time());
            $data['alert']=1;
            $data['createTime'] = date('Y-m-d H:i:s',time());
            if($report_set['V12_report']!=0){
                if($report_set['V12_report']-$report_set['V12_scope']>$params['V_12']){
                    $data['eventCode'] = 23;
                    $data['note'] = eventType_name(23);
                    self::create($data);
                }
            }elseif ($report_set['V24_report']!=0){
                if($report_set['V24_report']-$report_set['V24_scope']>$params['V_24']){
                    $data['eventCode'] = 24;
                    $data['note'] = eventType_name(24);
                    self::create($data);
                }
            }elseif ($report_set['V220_report']!=0){
                if($report_set['V220_report']-$report_set['V220_scope']>$params['V_220']){
                    $data['eventCode'] = 25;
                    $data['note'] = eventType_name(25);
                    self::create($data);
                }
            }elseif($report_set['temperature_report']!=0){
                if($report_set['temperature_report']-$report_set['temperature_scope']>$params['temperature']){
                    $data['eventCode'] = 26;
                    $data['note'] = eventType_name(26);
                    self::create($data);
                }
            }elseif($report_set['humidity_report']!=0){
                if($report_set['humidity_report']-$report_set['humidity_scope']>$params['humidity']){
                    $data['eventCode'] = 27;
                    $data['note'] = eventType_name(27);
                    self::create($data);
                }
            }
        }
    }
}