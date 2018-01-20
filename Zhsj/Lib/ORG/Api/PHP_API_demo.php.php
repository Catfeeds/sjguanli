<?php
$ac1="100019";
$pw1="jjl4yk11f82ce6c0f33a5c003f2fec56"; //票付通账号跟密码
$s1= new SoapClient("http://open.12301dev.com/openService/MXSE_beta.wsdl",array('encoding' =>'UTF-8','cache_wsdl' => 0));//票付通接口地址

//查询景区列表
print_r($s1->__soapCall("Get_ScenicSpot_List",array("ac"=>$ac1,"pw"=>$pw1,"in0"=>100,"in2"=>"")));

//查询景区详细信息
print_r($s1->__soapCall("Get_ScenicSpot_Info",array("ac"=>$ac1,"pw"=>$pw1,"in0"=>2633)));

//门票列表
print_r($s1->__soapCall("Get_Ticket_List",array("ac"=>$ac1,"pw"=>$pw1,"in0"=>2633,"in1"=>5715)));

//动态价格、库存上限获取
print_r($s1->__soapCall("GetRealTimeStorage",array("ac"=>$ac1,"pw"=>$pw1,"in0"=>113,"in1"=>2380,"in2"=>"2017-04-12","in3"=>"2017-05-01")));

//提交订单
print_r($s1->__soapCall("PFT_Order_Submit",array(
		"ac"=>$ac1, //账号
		"pw"=>$pw1, //密码
		"in0"=>5785, //景区id
		"in1"=>11459,//门票id
		"in2"=>"20122dd030236",//远端订单号
		"in3"=>100, //门票价格
		"in4"=>1,//数量
		"in5"=>"2015-01-29",//游玩日期
		"in6"=>"pzp", //客户姓名
		"in7"=>"15959110796",//客户手机号
		"in8"=>"", //联系人手机号
		"in9"=>1,//是否发送短信（0发送1不发送）
		"in10"=>2,//扣款方式（0使用账户余额2使用供应商处余额4现场支付
		"in11"=>0,//下单方式（0正常下单1手机用户下单）
		"in12"=>"",//集合地点
		"in13"=>"",//团号
		"in14"=>0,//联票ID
		"in15"=>0,//套票ID
		"in16"=>113,//供应商id
		"in17"=>"350321199123456789" //身份证
		)
));

//订单查询
print_r($s1->__soapCall("OrderQuery",array("ac"=>$ac1,"pw"=>$pw1,"in0"=>"","in1"=>"pft20170710001")));


//订单短信发送、重发接口
print_r($s1->__soapCall("reSend_SMS_Global_PL",array("ac"=>$ac1,"pw"=>$pw1,"in0"=>'票付通订单号')));

//修改、取消订单
print_r($s1->__soapCall("Order_Change_Pro",array("ac"=>$ac1,"pw"=>$pw1,"in0"=>'票付通订单号',"in1"=>0,"in2"=>'')));

//凭证码查看
print_r($s1->__soapCall("Terminal_Code_Verify",array("ac"=>$ac1,"pw"=>$pw1,"in0"=>"票付通订单号")));

//资金余额查看
print_r($s1->__soapCall("PFT_Member_Fund",array("ac"=>$ac1,"pw"=>$pw1,"in0"=>1,"in1"=>4)));

?>