<?php
/*
 * 第三方账号相关配置信息
 * */
    return  array(
        /****************************微信API配置*******************************/
        //测试环境配置
        'appId'         => "wx72fca1face93614d",
        'appSecret'     => "46d85b9c8dbfa7bede2379cd7d07201e",
        'mchid'         => "1489662692", //商户号
        'privatekey'    => "J3BMHPvEMf4QES6Ke680al6MhwWkb0XC", //私钥

        /****************************Lumen API接口地址URL*******************************/
        //测试
        'API_RUL' => 'http://test-api.shijian666.com',

        /****************************微信退款秘钥证书*******************************/
        //测试
        'WEIXIN_SSLCERT_PATH' => '/home/wwwroot/test.shijian666.com/Zhsj/Lib/cert/test/apiclient_cert.pem',
        'WEIXIN_SSLKEY_PATH' => '/home/wwwroot/test.shijian666.com/Zhsj/Lib/cert/test/apiclient_key.pem',

        /****************************票付通接口账号配置*******************************/
        //测试帐号
        'pft_api_url'   =>  "http://open.12301dev.com/openService/MXSE_beta.wsdl",
        'pft_ac'   =>  "100019",       //票付通账号 测试 100019
        'pft_pw'   =>  'jjl4yk11f82ce6c0f33a5c003f2fec56',     // 测试 票付通账号跟密码''jjl4yk11f82ce6c0f33a5c003f2fec56

        /****************************阿里云短信通道账号配置*******************************/
        //帐号
        'aliyun_accessKeyId'   =>  "LTAIc3PnWOpc18L9",
        'aliyun_accessKeySecret'   =>  "YCz3lwNSgBhvXYcKPinec6zqfQmNEv",

        /****************************网易短信通道账号配置*******************************/
        //帐号
        'net_AppKey'   =>  "76538729685de0f74816ef0aa5406d6e",
        'net_AppSecret'   =>  "4115cc4832cb",





);