<?php



class CommonAction extends Action {

    protected $proxy_id = 0;
    protected $member = array();
    protected $_CONFIG = array();
    protected $shop_id = 0;
    protected $proxy = array();
    protected $shopcates = array();
    protected $listRows = 10;  //每页显示记录数

    protected function _initialize() {
        $this->proxy_work_id = getProxyUid();
        if (!empty($this->proxy_work_id)) {
            $this->member = D('ProxyWorker')->find($this->proxy_work_id);
        }
        if (strtolower(MODULE_NAME) != 'login' && strtolower(MODULE_NAME) != 'public') { //public 不受权限控制
            if (empty($this->proxy_work_id)) {
                header("Location: " . U('login/index'));
                die;
            }
            $this->proxy = D('Proxy')->find(array("where" => array('proxy_id' => $this->member['proxy_id'], 'status' => 0)));
            if (empty($this->proxy)) {
                $this->error('该用户没有开通代理商权限', U('login/index'));
            }
            $this->proxy_id = $this->proxy['proxy_id']; //为了程序调用的时候方便
            $this->assign('PROXY', $this->proxy);
        }
        $this->_CONFIG = D('Setting')->fetchAll();
        define('__HOST__', 'http://' . $_SERVER['HTTP_HOST']);
        $this->assign('CONFIG', $this->_CONFIG);
        $this->assign('PROXY_MEMBER', $this->member);
        //$this->shopcates = D('Shopcate')->fetchAll();
        //$this->assign('shopcates', $this->shopcates);
        //$this->assign('ctl', strtolower(MODULE_NAME)); //主要方便调用
        //$this->assign('act', ACTION_NAME);

        //$this->assign('today', TODAY); //兼容模版的其他写法
        //$this->assign('nowtime', NOW_TIME);
    }

    protected function display($templateFile = '', $charset = '', $contentType = '', $content = '', $prefix = '')
    {
        parent::display($this->parseTemplate($templateFile), $charset, $contentType, $content = '', $prefix = '');
    }

    protected function parseTemplate($template = '')
    {
        $depr = c('TMPL_FILE_DEPR');
        $template = str_replace(':', $depr, $template);
        define('THEME_PATH', BASE_PATH . '/' . APP_NAME . '/Tpl/Proxy/');
        define('APP_TMPL_PATH', __ROOT__ . '/' . APP_NAME . '/Tpl/Proxy/');

        if ('' == $template) {
            $template = strtolower(MODULE_NAME) . $depr . strtolower(ACTION_NAME);
        }
        else if (false === strpos($template, '/')) {
            $template = strtolower(MODULE_NAME) . $depr . strtolower($template);
        }
        //var_dump(THEME_PATH . $template . c('TMPL_TEMPLATE_SUFFIX'));die();
        return THEME_PATH . '/' .$template . c('TMPL_TEMPLATE_SUFFIX');
    }


    protected function baoMsg($message, $jumpUrl = '', $time = 3000, $callback = '', $parent = true) {
        $parents = $parent ? 'parent.' : '';
        $str = '<script>';
        $str .=$parents . 'bmsg("' . $message . '","' . $jumpUrl . '","' . $time . '","' . $callback . '");';
        $str.='</script>';
        exit($str);
    }

    protected function baoOpen($message, $close = true, $style) {
        $str = '<script>';
        $str .='parent.bopen("' . $message . '","' . $close . '","' . $style . '");';
        $str.='</script>';
        exit($str);
    }

    protected function baoSuccess($message, $jumpUrl = '', $time = 3000, $parent = true) {
        $this->baoMsg($message, $jumpUrl, $time, '', $parent);
    }

    protected function baoErrorJump($message, $jumpUrl = '', $time = 3000) {
        $this->baoMsg($message, $jumpUrl, $time);
    }

    protected function baoError($message, $time = 3000, $yzm = false, $parent = true) {

        $parent = $parent ? 'parent.' : '';
        $str = '<script>';
        if ($yzm) {
            $str .= $parent . 'bmsg("' . $message . '","",' . $time . ',"yzmCode()");';
        } else {
            $str .= $parent . 'bmsg("' . $message . '","",' . $time . ');';
        }
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

    public function sjSuccess($message, $jumpUrl = '', $time = 3000){
        $str = '<script>';
        $str .= 'parent.success("' . $message . '",' . $time . ',\'jumpUrl("' . $jumpUrl . '")\');';
        $str .= '</script>';
        exit($str);
    }

    public function sjError($message, $time = 3000, $yzm = false){
        $str = '<script>';
        if ($yzm) {
            $str .= 'parent.error("' . $message . '",' . $time . ',"yzmCode()");';
        } else {
            $str .= 'parent.error("' . $message . '",' . $time . ');';
        }
        $str .= '</script>';
        exit($str);
    }

}
