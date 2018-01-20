<?php
class PiaoFuTongService extends Model{
    // 测试
//    protected $api_url="http://open.12301dev.com/openService/MXSE_beta.wsdl";
//    protected $ac1="100019";//票付通账号 测试 100019
//    protected $pw1='jjl4yk11f82ce6c0f33a5c003f2fec56';// 测试 票付通账号跟密码''jjl4yk11f82ce6c0f33a5c003f2fec56

    //正式帐号
//    protected $api_url = "http://open.12301.cc/openService/MXSE.wsdl";
//    protected $ac1="592345";//正式 票付通账号
//    protected $pw1='586244a3357769d13d6db482353b5b9a';// 正式 票付通账号跟密码''

    protected $api_url = "";
    protected $ac1="";
    protected $pw1='';

    protected $s1 = '' ; //SoapClient
//测试产品：景区id：2633  门票id：5715 供应商id：113

//贝拉小镇亲子套票ID： 223158|61110|152569 贝拉小镇亲子套票（一

    /*正式帐号
    =======
    /*
    正式帐号
    >>>>>>> bbac753f59c5e9ef5c0bc21480b5720a722db9d3
    账号：17700796769
    密码：sjpt123456
    海南九春教育科技股份有限公司
    账号：592345
    密码：586244a3357769d13d6db482353b5b9a
      ["ac"] => string(6) "592345"
      ["pw"] => string(32) "586244a3357769d13d6db482353b5b9a"
    */
    public function __construct(){
        $this->api_url  = C('pft_api_url');
        $this->ac1      = C('pft_ac');
        $this->pw1      = C('pft_pw');
        $this->s1= new SoapClient($this->api_url,array('encoding' =>'UTF-8','cache_wsdl' => 0));//票付通接口地址
    }

//查询景区列表
// $n 返回的条数
// $m 返回的条数区间 limit  n,m 
    public function Get_ScenicSpot_List($n = 2,$m = 2){
        $n = 2;
        $m = 2;
        $result = $this->s1->__soapCall("Get_ScenicSpot_List",array("ac"=>$this->ac1,"pw"=>$this->pw1,"in0"=>$n,"in2"=>$m));
        $dom = new DOMDocument();
        $result = $dom->loadXML($result);
        $result = getArray($dom->documentElement);
        return $result;
    }
//查询景区详细信息
// $n 景区ID
    public function Get_ScenicSpot_Info($n=19221){
        $result =  false;
        if($n){
            $result = $this->s1->__soapCall("Get_ScenicSpot_Info",array("ac"=>$this->ac1,"pw"=>$this->pw1,"in0"=>$n));
        }
        $dom = new DOMDocument();
        $result = $dom->loadXML($result);
        $result = getArray($dom->documentElement);
        return $result;
    }
    //门票列表
    // $n 返回的条数
    // $m 返回的条数区间 limit  n,m
    public function Get_Ticket_List(){
        $data = array(
            "ac"=>$this->ac1, //账号
            "pw"=>$this->pw1, //密码
            "n"=>2633,                 //测试景区ID：2633,生产景区ID：61110
            "m"=>'',                    //生产门票ID：套票：140027  成人票：141812
        );
        $result = $this->s1->__soapCall("Get_Ticket_List",$data);
        $dom = new DOMDocument();
        $result = $dom->loadXML($result);
        $result = getArray($dom->documentElement);
        return $result;
    }

//动态价格、库存上限获取
// $aid 供应商ID
// $pid 产品ID
// $start_date 有效开始时间
// $end_date 有效结束时间

    public function GetRealTimeStorage($aid = 0 ,$pid = 0 ,$start_date = 0 ,$end_date = 0  ){
        $aid=113;
        $pid=2380;
        $start_date="2017-10-12";
        $end_date="2017-11-01";
        $result = $this->s1->__soapCall("GetRealTimeStorage",array("ac"=>$this->ac1,"pw"=>$this->pw1,"in0"=>$aid,"in1"=>$pid,"in2"=>$start_date,"in3"=>$end_date));
        $dom = new DOMDocument();
        $result = $dom->loadXML($result);
        $result = getArray($dom->documentElement);
        return $result;
    }
// 订单     身份证校验接口
// $personId 身份证号 
    public function Check_PersonID($personId = 0 ){
        $personId= '460028198205282418';
        $result = $this->s1->__soapCall("Check_PersonID",array("ac"=>$this->ac1,"pw"=>$this->pw1,"in0"=>$personId));
        $dom = new DOMDocument();
        $result = $dom->loadXML($result);
        $result = getArray($dom->documentElement);
        return $result;
    }
//-------------------------订单 
//  http://www.shijian666.comm/Pchome/test/PFT_Order_Submit
//  http://dev.hnwtt.cn/Pchome/test/PFT_Order_Submit
//订单    提交订单
//    测试产品：景区id：2633  门票id：5715 供应商id：113
//  供应商测试帐号：test    密码：pft@12301
    public function PFT_Order_Submit($parmas = array()){
        /*贝拉小镇景区id 914686
        贝拉小镇门票ID 223158
        贝拉小镇供应商id 126648
        商品 223158|61110|140027   就是门票id
        223158|61110|140027 【预售】贝拉小镇课程
        223158|61110|141812 贝拉小镇成人票
        223158|61110|140027
        223158|61110|141812
        */
        /*
         $personId= '460028198205282418';
         $data = array(
            "ac"=>$this->ac1, //账号
            "pw"=>$this->pw1, //密码
            "in0"=>61110,// //2633, //景区id
            "in1"=>140027,//商品 223158|61110|140027  供应商id|景区id|门票id  //5715,//门票id
            "in2"=> time(),//"20122dd030248",//远端订单号
            "in3"=>0.1, //门票价格
            "in4"=>1,//数量
            "in5"=>"2017-10-02",//游玩日期
            "in6"=>"苏贤甲", //客户姓名
            "in7"=>"15808902204",//客户手机号
            "in8"=>"15808902204", //联系人手机号
            "in9"=>1,//是否发送短信（0发送1不发送）
            "in10"=>2,//扣款方式（0使用账户余额2使用供应商处余额4现场支付
            "in11"=>0,//下单方式（0正常下单1手机用户下单）
            "in12"=>"",//集合地点
            "in13"=>"",//团号
            "in14"=>0,//联票ID
            "in15"=>0,//套票ID
            "in16"=>223158,// //113,//供应商id
            "in17"=>$personId //身份证 ,多个请用英文逗号隔开，
        );
        dump($data);*/
        //测试产品：景区id：2633  门票id：5715 供应商id：113
        $data = array(
            "ac"=>$this->ac1, //账号
            "pw"=>$this->pw1, //密码
            "lid"=>$parmas['scenicspot_id'],//测试：2633,//生产：61110, //景区id
            "tid"=>$parmas['ticket_id'],//测试：25715,//生产：140027,//门票id
            "remotenum"=> $parmas['order_id'],//远端订单号
            "tprice"=> $parmas['price']*100, //门票价格
            "tnum"=> $parmas['nums'],//数量
            "playtime"=> $parmas['start_time'],//游玩日期
            "ordername"=> $parmas['user'], //客户姓名
            "ordertel"=> $parmas['mobile'],//客户手机号
            "contactTEL"=> $parmas['lx_mobile'], //联系人手机号
            "smsSend"=>1,//是否发送短信（0发送1不发送）
            "paymode"=>2,//扣款方式（0使用账户余额2使用供应商处余额4现场支付
            "ordermode"=>0,//下单方式（0正常下单1手机用户下单）
            "assembly"=>"",//集合地点
            "series"=>"",//团号
            "concatID"=>0,//联票ID
            "pCode"=>0,//套票ID
            "m"=>$parmas['supplier_id'],//测试：113,//生产：223158,//供应商id
            "personID"=> $parmas['id_card'], //身份证 ,多个请用英文逗号隔开，
            'memo' => ''
        );

        $result = $this->s1->__soapCall("PFT_Order_Submit",$data);
        $dom = new DOMDocument();
        $result = $dom->loadXML($result);
        $result = getArray($dom->documentElement);
        return $result;
    }

    //订单查询
    // remoteOrdernum 云端订订单号
    public function OrderQuery($parmas = array()){
        $result = $this->s1->__soapCall("OrderQuery",array("ac"=>$this->ac1,"pw"=>$this->pw1,'pftOrdernum'=>'',"remoteOrdernum"=>$parmas['order_id']));
        $dom = new DOMDocument();
        $result = $dom->loadXML($result);
        $result = getArray($dom->documentElement);
        return $result;
    }


//修改、取消订单
// $in0 票付通订单号
// $in1 剩余数量 0为取消订单 -1 不做修改，指要修改订单取票人手机
// $in2 取票人的手机号
// $in3 预留参数  可为空
    public function Order_Change_Pro($parmas = array()){
        $data = array(
            "ac"=>$this->ac1, //账号
            "pw"=>$this->pw1, //密码
            "ordern"=>$parmas['ordern'],  //票付通订单号
            "num"=>$parmas['num'],  //0 为取消订单 -1 不做修改，指要修改订单取票人手机
            "ordertel"=> '',    //取票人手机号
            "m"=>'',    //预留参数
        );
        $result = $this->s1->__soapCall("Order_Change_Pro",$data);
        $dom = new DOMDocument();
        $result = $dom->loadXML($result);
        $result = getArray($dom->documentElement);
        return $result;
    }


//订单短信发送、重发接口
// $in0 票付通订单号
// $in1 预留参数  可为空
    public function reSend_SMS_Global_PL($in0= ''){
        $in0="pft20170710001";//'票付通订单号'
        $result = $this->s1->__soapCall("reSend_SMS_Global_PL",array("ac"=>$this->ac1,"pw"=>$this->pw1,"in0"=>$in0));
        $dom = new DOMDocument();
        $result = $dom->loadXML($result);
        $result = getArray($dom->documentElement);
        return $result;
    }



//凭证码查看
// $in0 票付通订单号
// $in1 预留参数  可为空
    public function Terminal_Code_Verify($in0= ''){
        $in0="pft20170710001";//'票付通订单号'
        $result = $this->s1->__soapCall("Terminal_Code_Verify",array("ac"=>$this->ac1,"pw"=>$this->pw1,"in0"=>$in0));
        $dom = new DOMDocument();
        $result = $dom->loadXML($result);
        $result = getArray($dom->documentElement);
        return $result;
    }


//获取场次信息接口
// $in0 门票ID
// $in1 查询日期  
    public function Get_Screenings_List($in0= ''){
        $in0="pft20170710001";//'票付通订单号'
        $result = $this->s1->__soapCall("Get_Screenings_List",array("ac"=>$this->ac1,"pw"=>$this->pw1,"in0"=>$in0));
        $dom = new DOMDocument();
        $result = $dom->loadXML($result);
        $result = getArray($dom->documentElement);
        return $result;
    }


//-------------------------合作关系 


//资金余额查看
// $in0 查询类型  0 自己的帐户余额 1 可用供应商余额 2 供应商开放额度
// $in1 供应商ID  
    public function PFT_Member_Fund($in0= 1,$in1= 4){
        $result = $this->s1->__soapCall("PFT_Member_Fund",array("ac"=>$this->ac1,"pw"=>$this->pw1,"in0"=>$in0,"in1"=>$in1));
        $dom = new DOMDocument();
        $result = $dom->loadXML($result);
        $result = getArray($dom->documentElement);
        return $result;
    }


//会员关系查看 
// $in0 查询类型  0 自己的帐户余额 1 可用供应商余额 2 供应商开放额度
// $in1 供应商ID  
    public function PFT_Member_Relationship($in0= 1,$in1= 4){
        $result = $this->s1->__soapCall("PFT_Member_Relationship",array("ac"=>$this->ac1,"pw"=>$this->pw1,"in0"=>$in0,"in1"=>$in1));
        $dom = new DOMDocument();
        $result = $dom->loadXML($result);
        $result = getArray($dom->documentElement);
        return $result;
    }


    public function get_callback_url(){

       //$data = '{"VerifyCode":"aa67c1bf2b411aa617c9d9e224582458","Order16U":"4694091"," ActionTime":"2016‐06‐14 16:44:35","OrderCall":"241","Tnumber":"3","OrderState": 1,"AllCheckNum":"3","Source":"4","Action":"1"}';

        $poststr = file_get_contents('php://input');
        //$poststr = $data;
        $post_arr = json_decode($poststr,1);
        $order_id = $post_arr['OrderCall'];
        //$order_id = str_replace('J8C3J9Y5X0S5ZHSJPT', '', $order_id);
        if($post_arr['OrderState'] == 1){
            //对自身订单做处理
            $re = M('order')->where(array(
                'order_id' => $order_id
            ))->save(array(
                'status' => 3
            ));
            if($re){
                return 'success';
            }
        }

        if($post_arr){
            D('PiaofutongCallback')->add(array(
                'data' => $poststr,
                'create_ip' => get_client_ip(),
                'create_time' => time(),
            ));
        }

//bao_piaofutong_callback  收到数据， 你们要对自己的订单做处理

//file_put_contents('./poststr.txt', $poststr );
       // $result = 'success';//array();
//$result = '200';//array();
        //return $result;
    }


    /*

    VerifyCode string 账号+密码的MD5值，请在业务执行前验证码

    order16U string 票付通订单号
    orderCall  string 远端订单
    ActionTime string 执行时间

    Tnumber  string 本次消费 OrderState =1/7: 表示本次消费票数
    8: 表示刺余可用票数，加上总消费数为实际票数订单数量
    9: 表示实际验证数最


    OrderState string 通知类型 1-- 全部消费通知 7-部分消费通知
    AllCheckNum  string 总消费数

    */



//-------------------------进阶接口 
    public function ErrorCode($value=0){
        $result = array(
            101 => '无授权，拒绝连接',
            102 => '传输数据类型出错',
            103 => '传输数据格式出错',
            104 => '数据无法传输',
            105 => '数据为空或者重叠',
            106 => '数据服务出错，无法提交订单',
            107 => '返回数据非XML格式',
            108 => '网络中断',
            109 => '重复查询',
            110 => '重复提交',
            111 => '数据含有非法字条',
            112 => '手机格式错误',
            113 => '错误的联票方式',
            114 => '编码出错，无法继续',
            115 => '网站服务出错，请联系技术开发人员',
            116 => '短信重发次数过多',
            117 => '在线支付 未支付成功，无法发送短信',
            118 => '终端信息出错，请联系技术人员',
            119 => '订单已消费，不充许退款',
            120 => '订单号已超出系统承载，无法生成',
            1201 => '凭证码 生成错误，已超出系统承载',
            121 => '状态参数出错',
            122 => '资金帐户余额不足',
            123 => '未知的订单号',
            124 => '权限不够',
            130 => '邮件格式错误',
            131 => '手机格式错误',
            132=> '短信插入失败',
            133 => '时间未到',
            134 => '时间超过',
            135 => '联系人姓名格式错误',
            141 => '无修改返回',
            142 => '在时间交集',
            143 => '未按照预期更新数据',
            144 => '加优惠计划的订单不支持修改订单',
            145 => '修改订单内容不能全部为空',
            1050 => '门票价格传输错误',
            1051 => '门票数据不存在',
            1052 => '没有分销权限',
            1053 => '门票数量不符合规范',
            1061 => '无此日期的价格',
            1062 => '库存已售罄',
            1063 => '总库存已售罄',
            1064 => '错误的分销差价设置',
            1065 => '无此商品的分销价格',
            1066 => '商品票类数据出错',
            1067 => '商品数据出错',
            1068 => '商品需提前预定',
            1069 => '已超过当日购买的时间',
            1070 => '支付方式错误',
            1071 => '游玩时间必填',
            1072 => '取票人姓名、手机不能为空',
            1073 => '错误的供应链',
            1074 => '短信发送失败',
            1075 => '远端订单号不能重复',
            1076=> '过期的订单无法修改',
            1077=> '订单不是未使用状态，无法取消或修改',
            1078=> '订单修改数量只能减少，不能增加',
            1079=> '票有效期已过，不允许下单',
            1080=> '游玩日期当天不可验证，不允许下单',
            1081=> '下单时间已超过验证时间，不允许下单',
            1082=> '订单有效期内都不可验证，不允许下单',
            1083=> '游玩日期超过有效期',
            1084=> '票限制了验证时间，选择日期无效',
            1085=> '游客手机号/ 身份证号购票数量超出限制',
            1086=> '套票子票模式主票订单号不能为空',
            1087=> '拉卡拉支付订单不允许取消',
            1088=> '演出订单信息错误',
            1089=> '时间段超出',
            1090=> '远端平台订单同步失败',
            1091=> '门票数最不在单次购买数最范用内',
            1092=> '取票人身份证号必填/1(2015-12-24新增)',
            1093=> '身份证格式错误11(2015-12-24新增)',
            1094=> '实名制门票每次限购一张//(2015-12-24新增);',
            1095=> '退票申请成功，请等待审核结果通知// (2016-03-18新增);',
            1096=> '退票申请失败，拒绝退款/(2016-03-18新增);',
            1097=> '退票申请已受理，请勿重复提交//2016-03-18新增);',
            1098=> '此票限制了购买年龄，游客年龄不符合规则，请检查身份证号是否有误//(2016-09-13新增);',
            1099=> '门票数超过分批验证1限制r ]票数//(2016-10-13新增);',
            1100=> '有效开始时间不能小f 当前日期/(2017-03-23新增);',
            1101=> '订单游玩数量和身份证数量不符/(2016-11-30新增);',
            1102=> '订单已过期超过31天，不可取消',
            1103=> '该订单的「1票属性设置了票一码，修改订单必须传输身份证',
            1104=> '该订单的门票属性设置了一票一码，修改订单传输的身份证必须与修改票数一致',
            1105=> '订单分批验证，剩余数量必须是大于等于已验证数量才可以取消成功',
            1413=> '该门票设置了退票限制，不可退票',
            1414=> '已超过退票有效期',
            1415=> '子票不可单独取消',
            1416=> '未过期订单，供应商不可退',
            222=> '上级供应余额不足',
            2021=> '套票子票产品设置错误',
            2023=> '套票部分产品已经使用或状态错误',
            3000=> '产品抓取lID不能为空',
            3001=> '产品抓取地址无效',
            3002=> '产品抓取通知地址无效',
            3003=> '产品抓取设定错误',
            3004=> '产品抓取地址或通知地址为空',
            3005=> '禁止使用同接口服务器一样的地址',
            4001=> '自助取票] 查询需要必要的参数(景区编码）',
            4002=> '[自助取票]不能查询非自供的订单',
            4003=> '[自助取票] 无权限操作回调接[ ',
            4004=> '[自助取票]订单号错误或无权限修改',
            4005=> '己取票的订单不允许退票',
            5001=> '第三方系统下单出，请联系供应商',
            5002=> '因场次或座位的时间问题无法修改订单',
            5003=> '第三方系统下单超时',
            5004=> '第三方票务系统接1故障，下单失败',
            5005=> '提交数据频繁，请间隔60秒后再尝试提交',
        );
        return $result [$value];
    }


}

function getArray($node) {
    $array = false;

    if ($node->hasAttributes()) {
        foreach ($node->attributes as $attr) {
            $array[$attr->nodeName] = $attr->nodeValue;
        }
    }

    if ($node->hasChildNodes()) {
        if ($node->childNodes->length == 1) {
            $array[$node->firstChild->nodeName] = getArray($node->firstChild);
        } else {
            foreach ($node->childNodes as $childNode) {
                if ($childNode->nodeType != XML_TEXT_NODE) {
                    $array[$childNode->nodeName][] = getArray($childNode);
                }
            }
        }
    } else {
        return $node->nodeValue;
    }
    return $array;
}


?>