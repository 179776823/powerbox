<?php


namespace app\agbox\model;


use think\Model;

class PowerBoxput extends Model
{
    protected $table='powerBoxput';

    public static function OutputAndInputset(){
        $putset = self::find();
        if($putset){
            $status['input1'] = isset($putset['input1']) ? $putset['input1']:'输入口1';
            $status['input2'] =isset($putset['input2']) ? $putset['input2']:'输入口1';
            $status['input3'] = isset($putset['input3']) ? $putset['input3']:'输入口1';
            $status['input4'] = isset($putset['input4']) ? $putset['input4']:'输入口1';
            $status['output1'] = isset($putset['output1']) ? $putset['output1']:'输出口1';
            $status['output2'] = isset($putset['output2']) ? $putset['output2']:'输出口2';
            $status['output3'] = isset($putset['output3']) ? $putset['output3']:'输出口3';
            $status['output4'] = isset($putset['output4']) ? $putset['output4']:'输出口4';
        }else{
            $status['input1'] = '输入口1';
            $status['input2'] = '输入口2';
            $status['input3'] = '输入口3';
            $status['input4'] = '输入口4';
            $status['output1'] = '输出口1';
            $status['output2'] = '输出口2';
            $status['output3'] = '输出口3';
            $status['output4'] = '输出口4';
        }
        return $status;
    }
}