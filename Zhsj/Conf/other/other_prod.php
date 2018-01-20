<?php
/*
 * 第三方账号相关配置信息
 * */
    return  array(
        /****************************微信API配置*******************************/
        //生产环境配置
        'appId'         => "wx14bb80c57431331d",
        'appSecret'     => "d9f2c6e4749398419b3cca839beb2f41",
        'mchid'         => "1488449442", //商户号
        'privatekey'    => "J3BMHPvEMf4QES6Ke680al6MhwWkb0XC", //私钥

        /****************************Lumen API接口地址URL*******************************/
        //生产
        'API_RUL' => 'http://api.shijian666.com',

        /****************************微信退款秘钥证书*******************************/
        //生产
        'WEIXIN_SSLCERT_PATH' => '/home/wwwroot/www.shijian666.com/Zhsj/Lib/cert/prod/apiclient_cert.pem',
        'WEIXIN_SSLKEY_PATH' => '/home/wwwroot/www.shijian666.com/Zhsj/Lib/cert/prod/apiclient_key.pem',

        /****************************票付通接口账号配置*******************************/
        //正式帐号
        'pft_api_url'   =>  "http://open.12301.cc/openService/MXSE.wsdl",
        'pft_ac'   =>  "592345",       //正式 票付通账号
        'pft_pw'   =>  '586244a3357769d13d6db482353b5b9a',     // 正式 票付通账号跟密码

        /****************************阿里云短信通道账号配置*******************************/
        //帐号
        'aliyun_accessKeyId'   =>  "LTAIc3PnWOpc18L9",
        'aliyun_accessKeySecret'   =>  "YCz3lwNSgBhvXYcKPinec6zqfQmNEv",

        /****************************网易短信通道账号配置*******************************/
        //帐号
        'net_AppKey'   =>  "76538729685de0f74816ef0aa5406d6e",
        'net_AppSecret'   =>  "4115cc4832cb",





);