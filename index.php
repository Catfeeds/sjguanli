<?php

//定义根目录
define('BASE_PATH', dirname(__FILE__));

//开启过滤
if (ini_get('magic_quotes_gpc')) {
    function stripslashesRecursive(array $array) {
        foreach ($array as $k => $v) {
            if (is_string($v)) {
                $array[$k] = stripslashes($v);
            } else if (is_array($v)) {
                $array[$k] = stripslashesRecursive($v);
            }
        }
        return $array;
    }
    $_GET = stripslashesRecursive($_GET);
    $_POST = stripslashesRecursive($_POST);
}

//调试模式开启php.ini报错
ini_set('display_errors','On');
//报错级别
error_reporting(0);
//调试开启
define('APP_DEBUG', true);
//定义项目名称
define('APP_NAME', 'Zhsj');
//定义项目路径
define('APP_PATH', BASE_PATH . '/Zhsj/');
//定义runtime目录
define('RUNTIME_PATH', BASE_PATH.'/data/Runtime/');
//设置时间域
ini_set('date.timezone', 'Asia/Shanghai');
header("Content-type:text/html;charset=utf-8");
//加载框架入文件
require './ThinkPHP/ThinkPHP.php';