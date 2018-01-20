<?php
define('TODAY', date("Y-m-d"));

//数据库开发、测试、生产配置
$db_config = require  BASE_PATH.'/'.APP_NAME.'/Conf/db/db_dev.php';
//$db_config = require  BASE_PATH.'/'.APP_NAME.'/Conf/db/db_test.php';
//$db_config = require  BASE_PATH.'/'.APP_NAME.'/Conf/db/db_prod.php';

//第三方应用开发、测试、生产配置
$wx_config = require  BASE_PATH.'/'.APP_NAME.'/Conf/other/other_dev.php';
//$wx_config = require  BASE_PATH.'/'.APP_NAME.'/Conf/other/other_test.php';
//$wx_config = require  BASE_PATH.'/'.APP_NAME.'/Conf/other/other_prod.php';

$config =  array(
    //'配置项'=>'配置值'
    'APP_GROUP_LIST' => 'Admin,Shangjia,Delivery,App,Mcenter,H5,Jigou,Proxy', //项目分组设定
    'DEFAULT_GROUP'  => 'App', //默认分组
    //SESSION 的设置
    'SESSION_AUTO_START'    => true,
    'SESSION_TYPE'          => 'DB',   
    'DEFAULT_APP'           => 'Zhsj',

    //URL设置
    'URL_MODEL'            => 2,
    'URL_HTML_SUFFIX'      => '.html',
    'URL_ROUTER_ON'        => true,
    'URL_CASE_INSENSITIVE' => true, //url不区分大小写
    'URL_ROUTE_RULES'      => array(
    ),

    'APP_SUB_DOMAIN_DEPLOY' => false,
    //默认系统变量
    'VAR_GROUP'            => 'g',
    'VAR_MODULE'           => 'm',
    'VAR_ACTION'           => 'a',
    'VAR_TEMPLATE'         => 'theme',

    //模版设置相关
    //'DEFAULT_THEME'         => 'default',
    'TMPL_L_DELIM'          => '<{',
    'TMPL_R_DELIM'          => '}>',
    'TMPL_ACTION_SUCCESS'   => 'public/dispatch_jump',
    'TMPL_ACTION_ERROR'     => 'public/dispatch_jump',

    'TAGLIB_LOAD'           => true,
    'APP_AUTOLOAD_PATH'     => '@.TagLib',
    'TAGLIB_BUILD_IN'       => 'Cx,Calldata',

    //版本信息
    'VERSION' => 'zhsj_v1.0',

    //404轉向
    'URL_404_REDIRECT' => '/Public/404.html',

);

return array_merge($config,$db_config,$wx_config);

?>