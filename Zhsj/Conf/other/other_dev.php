<?php
/*
 * 第三方账号相关配置信息
 * */
    return  array(
        /****************************微信API配置*******************************/
        //开发环境配置
        'appId'         => "wxb892f1a8c00f964d",
        'appSecret'     => "1954ae45a99549cc79e7b0caf7511805",
        'mchid'         => "1489664932", //商户号
        'privatekey'    => "J3BMHPvEMf4QES6Ke680al6MhwWkb0XC", //私钥

        /****************************Lumen API接口地址URL*******************************/
        //开发
        'API_RUL' => 'http://dev-api.shijian666.com',

        /****************************微信退款秘钥证书*******************************/
        //开发
        'WEIXIN_SSLCERT_PATH' => '/home/wwwroot/dev.shijian666.com/Zhsj/Lib/cert/dev/apiclient_cert.pem',
        'WEIXIN_SSLKEY_PATH' => '/home/wwwroot/dev.shijian666.com/Zhsj/Lib/cert/dev/apiclient_key.pem',

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