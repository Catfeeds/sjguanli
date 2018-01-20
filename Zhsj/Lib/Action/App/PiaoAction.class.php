<?php

 
class PiaoAction extends CommonAction {
//http://www.shijian666.comm/App/Piao/get_callback_url

    public function get_callback_url(){
        $in0 = $_GET['in0'];
        $in1 = $_GET['in1'];
        $in2 = $_GET['in2'];
        $in3 = $_GET['in3'];
        $in4 = $_GET['in4'];
        $in5 = $_GET['in5'];
        $s = D('PiaoFuTong','Service'); //$User = D('User','Service');
        $result = $s->get_callback_url($in0,$in1,$in2,$in3,$in4,$in5);
        echo($result);
    }
}
