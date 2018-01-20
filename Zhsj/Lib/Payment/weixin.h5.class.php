<?php


class weixinH5 {

    public function init($payment='') {
        // print_r($payment);die;
//        define('WEIXIN_APPID', $payment['appid']);
//        define('WEIXIN_MCHID', $payment['mchid']);
//        define('WEIXIN_APPSECRET', $payment['appsecret']);
//        define('WEIXIN_KEY',$payment['appkey']);

        //生产
//        define('WEIXIN_APPID', 'wx14bb80c57431331d');
//        define('WEIXIN_MCHID', '1488449442');
//        define('WEIXIN_APPSECRET', 'd9f2c6e4749398419b3cca839beb2f41');
//        define('WEIXIN_KEY', 'J3BMHPvEMf4QES6Ke680al6MhwWkb0XC');

        //测试
//        define('WEIXIN_APPID', 'wx72fca1face93614d');
//        define('WEIXIN_MCHID', '1489662692');
//        define('WEIXIN_APPSECRET', '46d85b9c8dbfa7bede2379cd7d07201e');
//        define('WEIXIN_KEY', 'J3BMHPvEMf4QES6Ke680al6MhwWkb0XC');

        define('WEIXIN_APPID', C('appId'));
        define('WEIXIN_MCHID', C('mchid'));
        define('WEIXIN_APPSECRET', C('appSecret'));
        define('WEIXIN_KEY', C('privatekey'));

        //=======【证书路径设置】=====================================
        /**
         * TODO：设置商户证书路径
         * 证书路径,注意应该填写绝对路径（仅退款、撤销订单时需要，可登录商户平台下载，
         * API证书下载地址：https://pay.weixin.qq.com/index.php/account/api_cert，下载之前需要安装商户操作证书）
         * @var path
         */
        /*
        //生产
        define('WEIXIN_SSLCERT_PATH', '../cert/apiclient_cert.pem');
        define('WEIXIN_SSLKEY_PATH', '../cert/apiclient_key.pem');
        */

        //测试
        define('WEIXIN_SSLCERT_PATH', '../cert/apiclient_cert.pem');
        define('WEIXIN_SSLKEY_PATH', '../cert/apiclient_key.pem');


        //=======【curl代理设置】===================================
        /**
         * TODO：这里设置代理机器，只有需要代理的时候才设置，不需要代理，请设置为0.0.0.0和0
         * 本例程通过curl使用HTTP POST方法，此处可修改代理服务器，
         * 默认CURL_PROXY_HOST=0.0.0.0和CURL_PROXY_PORT=0，此时不开启代理（如有需要才设置）
         * @var unknown_type
         */
        define('WEIXIN_CURL_PROXY_HOST', "0.0.0.0"); //"10.152.18.220";
        define('WEIXIN_CURL_PROXY_PORT', 0); //8080;
        //=======【上报信息配置】===================================
        /**
         * TODO：接口调用上报等级，默认紧错误上报（注意：上报超时间为【1s】，上报无论成败【永不抛出异常】，
         * 不会影响接口调用流程），开启上报之后，方便微信监控请求调用的质量，建议至少
         * 开启错误上报。
         * 上报等级，0.关闭上报; 1.仅错误出错上报; 2.全量上报
         * @var int
         */
        define('WEIXIN_REPORT_LEVENL', 1);

        require_once "weixin/WxPay.Api.php";

        require_once "weixin/WxPay.JsApiPay.php";

        //require_once "weixin/WxPay.Notify.php";

    }

    public function prePay($openid, $order_info) {

        $this->init();
        //①、获取用户openid
        $tools = new JsApiPay();
        //$SERVER_NAME = 'www.shijian666.com';
        $SERVER_NAME = $_SERVER['SERVER_NAME'];
        $openId = $openid;
        $total = $order_info['total_price'] *100;
        //echo $openId;die;
        $input = new WxPayUnifiedOrder();
        $input->SetBody($order_info['order_intro']);   //设置商品或支付单简要描述
        $input->SetAttach($order_info['subject']);  //设置附加数据，在查询API和支付通知中原样返回，该字段主要用于商户携带订单的自定义数据
        $input->SetOut_trade_no($order_info['order_id_s']);  //设置商户系统内部的订单号,32个字符内、可包含字母, 其他说明见商户订单号
        $input->SetTotal_fee("{$total}"); //设置订单总金额，只能为整数，详见支付金额
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 600));
        //$input->SetGoods_tag($order_info['subject']);  //设置商品标记，代金券或立减优惠功能的参数，说明详见代金券或立减优惠
        $input->SetNotify_url("http://".$SERVER_NAME."/H5/Wxauth/payCallBack");  //设置回调地址
        $input->SetTrade_type("JSAPI");
        $input->SetOpenid($openId);
        $order = WxPayApi::unifiedOrder($input);
        //   echo '<font color="#f00"><b>统一下单支付单信息</b></font><br/>';

        $jsApiParameters = $tools->GetJsApiParameters($order);

        $str = '<script>function jsApiCall()
	{
		WeixinJSBridge.invoke(
			\'getBrandWCPayRequest\',
			'.$jsApiParameters.',
			function(res){
                            if(res.err_msg ==\'get_brand_wcpay_request:ok\'){ 
                                location.href="'.U('/H5/Index/payOk',array('order_id'=>$order_info['order_id'])).'";
                            }
			}
		);
	}

	function callpay()
	{
		if (typeof WeixinJSBridge == "undefined"){
		    if( document.addEventListener ){
		        document.addEventListener(\'WeixinJSBridgeReady\', jsApiCall, false);
		    }else if (document.attachEvent){
		        document.attachEvent(\'WeixinJSBridgeReady\', jsApiCall); 
		        document.attachEvent(\'onWeixinJSBridgeReady\', jsApiCall);
		    }
		}else{
		    jsApiCall();
		}
	}</script>
        


        ';
//<button   class="payment" type="button" onclick="callpay()" >立即支付</button>
        return $str;
    }

    /**
     * @func 申请退款方法
     * @param int $order_id 系统背部订单id
     * @return bool 成功时返回，其他抛异常
     */
    public function wxRefund($order_id){
        $order = D('Order')->alias('o')
            ->field('p.trans_list_id,p.notify_transaction_id,tl.trans_amount')
            ->join('practice_weixin_unifiedorders as p on p.wx_product_id = o.order_id')
            ->join('practice_trans_lists as tl on tl.order_id = o.order_id')
            ->where(array('o.order_id' => $order_id,'p.notify_return_code'=>'SUCCESS'))
            ->find();
        $merchid = C('mchid');
        if(!$order) return false;
        include_once "Zhsj/Lib/Payment/weixin/WxPay.Data.php";
        include_once "Zhsj/Lib/Payment/weixin/WxPay.Api.php";

        $input = new WxPayRefund();//WxPay.Data.php提交退款输入对象
        $input->SetOut_trade_no($order['trans_list_id']);//自己的订单号
        $input->SetTransaction_id($order['notify_transaction_id']);//微信官方生成的订单流水号，在支付成功中有返回
        $input->SetOut_refund_no($order['trans_list_id']);//退款单号
        $input->SetTotal_fee($order['trans_amount']*100);//订单标价金额，单位为分
        $input->SetRefund_fee($order['trans_amount']*100);//退款总金额，订单总金额，单位为分，只能为整数
        $input->SetOp_user_id($merchid);//设置操作员帐号, 默认为商户号
//        var_dump(2222);die;
        $result = WxPayApi::refund($input); //退款操作
        // 这句file_put_contents是用来查看服务器返回的退款结果 测试完可以删除了
        //file_put_contents(APP_ROOT.'/Api/wxpay/logs/log3.txt',arrayToXml($result),FILE_APPEND);
        return $result;
    }

}
