<?php
/**
 * Created by PhpStorm.
 * Date: 2017/9/22
 * Time: 9:40
 * op : 基类控制器
 */
 class BaseAction extends Action
 {

     public $u_id;
     //tp默认构造函数
     public function _initialize()
     {
         //session('u_openid','1234567890');
        //每个前台控制器都要过
        // code ...
         $u_openid = session('u_openid');
         $this->u_id = M('users')->where(array('p_openid'=>$u_openid))->getField('user_id');//11227;//
         //echo $u_openid;
         if(empty($u_openid)){
            redirect('/H5/Wxauth/index');
         }
     }

     //重写模板指向地址
     public function display($templateFile = '', $charset = '', $contentType = '', $content = '', $prefix = '') {
         parent::display($this->parseTemplate($templateFile), $charset, $contentType, $content = '', $prefix = '');
     }

     private function getTemplateTheme() {
         define('THEME_NAME','default');

         if ($this->theme) { // 指定模板主题
             $theme = $this->theme;
         } else {
             /* 获取模板主题名称 */
             $theme = D('Template')->getDefaultTheme();
             if (C('TMPL_DETECT_THEME')) {// 自动侦测模板主题
                 $t = C('VAR_TEMPLATE');
                 if (isset($_GET[$t])) {
                     $theme = $_GET[$t];
                 } elseif (cookie('think_template')) {
                     $theme = cookie('think_template');
                 }
                 if (!in_array($theme, explode(',', C('THEME_LIST')))) {
                     $theme = C('DEFAULT_THEME');
                 }
                 cookie('think_template', $theme, 864000);
             }
         }
         return $theme ? $theme . '/' : '';
     }

     private function parseTemplate($template = '') {

         $depr = C('TMPL_FILE_DEPR');
         $template = str_replace(':', $depr, $template);
         // 获取当前主题名称
         $theme = $this->getTemplateTheme();
         define('NOW_PATH',BASE_PATH.'/themes/'.$theme.'H5/');
         // 获取当前主题的模版路径
         define('THEME_PATH', BASE_PATH . '/themes/default/H5/');
         define('APP_TMPL_PATH', __ROOT__ . '/themes/default/H5/');

         // 分析模板文件规则
         if ('' == $template) {
             // 如果模板文件名为空 按照默认规则定位
             $template = strtolower(MODULE_NAME) . $depr . ACTION_NAME;
           //  $template = strtolower(MODULE_NAME) . $depr . strtolower(ACTION_NAME);
         } elseif (false === strpos($template, '/')) {
             $template = strtolower(MODULE_NAME) . $depr . $template;
            // $template = strtolower(MODULE_NAME) . $depr . strtolower($template);
         }
         $file = NOW_PATH . $template . C('TMPL_TEMPLATE_SUFFIX');
         if(file_exists($file)) return $file;
         return THEME_PATH . $template . C('TMPL_TEMPLATE_SUFFIX');
     }


     protected function baoSuccess($message, $jumpUrl = '', $time = 3000) {
         $str = '<script>';
         $str .='parent.success("' . $message . '",' . $time . ',\'jumpUrl("' . $jumpUrl . '")\');';
         $str.='</script>';
         exit($str);
     }


     protected function baoMsg($message, $jumpUrl = '', $time = 3000) {
         $str = '<script>';
         $str .='parent.bmsg("' . $message . '","' . $jumpUrl .'","'.$time. '");';
         $str.='</script>';
         exit($str);
     }


     protected function baoErrorJump($message, $jumpUrl = '', $time = 3000) {
         $str = '<script>';
         $str .='parent.error("' . $message . '",' . $time . ',\'jumpUrl("' . $jumpUrl . '")\');';
         $str.='</script>';
         exit($str);
     }

     protected function baoError($message, $time = 3000, $yzm = false) {
         $str = '<script>';
         if ($yzm) {
             $str .='parent.error("' . $message . '",' . $time . ',"yzmCode()");';
         } else {
             $str .='parent.error("' . $message . '",' . $time . ');';
         }
         $str.='</script>';
         exit($str);
     }

     protected function baoAlert($message, $url = '') {
         $str = '<script>';
         $str.='parent.alert("' . $message . '");';
         if (!empty($url)) {
             $str.='parent.location.href="' . $url . '";';
         }
         $str.='</script>';
         exit($str);
     }

     protected function baoLoginSuccess() { //异步登录
         $str = '<script>';
         $str .='parent.parent.LoginSuccess();';
         $str.='</script>';
         exit($str);
     }

     protected function ajaxLogin() {
         $str = '<script>';
         $str .='parent.ajaxLogin();';
         $str.='</script>';
         exit($str);
     }

     protected function checkFields($data = array(), $fields = array()) {
         foreach ($data as $k => $val) {
             if (!in_array($k, $fields)) {
                 unset($data[$k]);
             }
         }
         return $data;
     }

     protected function ipToArea($_ip) {
         return IpToArea($_ip);
     }

     protected function niuSuccess($message, $jumpUrl = '', $time = 3000) {
         $str = '<script>';
         $str .='parent.success("' . $message . '",' . $time . ',\'jumpUrl("' . $jumpUrl . '")\');';
         $str.='</script>';
         exit($str);
     }

     protected function niuMsg($message, $jumpUrl = '', $time = 3000) {
         $str = '<script>';
         $str .='parent.boxmsg("' . $message . '","' . $jumpUrl .'","'.$time. '");';
         $str.='</script>';
         exit($str);
     }


     protected function niuErrorJump($message, $jumpUrl = '', $time = 3000) {
         $str = '<script>';
         $str .='parent.error("' . $message . '",' . $time . ',\'jumpUrl("' . $jumpUrl . '")\');';
         $str.='</script>';
         exit($str);
     }

     protected function niuAlert($message, $url = '') {
         $str = '<script>';
         $str.='parent.alert("' . $message . '");';
         if (!empty($url)) {
             $str.='parent.location.href="' . $url . '";';
         }

         $str.='</script>';
         exit($str);
     }

     protected function niuError($message, $time = 3000, $yzm = false) {
         $str = '<script>';
         if ($yzm) {
             $str .='parent.error("' . $message . '",' . $time . ',"yzmCode()");';
         } else {
             $str .='parent.error("' . $message . '",' . $time . ');';
         }
         $str.='</script>';
         exit($str);
     }

     protected function niuLoginSuccess() { //异步登录
         $str = '<script>';
         $str .='parent.parent.LoginSuccess();';
         $str.='</script>';
         exit($str);
     }


 }

