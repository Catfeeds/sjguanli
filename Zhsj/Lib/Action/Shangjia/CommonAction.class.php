<?php



class CommonAction extends Action {

    protected $uid = 0;
    protected $member = array();
    protected $_CONFIG = array();
    protected $shop_id = 0;
    protected $shop = array();
    protected $shopcates = array();
    protected $listRows = 10;  //每页显示记录数

    protected function _initialize() {
        $this->shop_work_id = getShopUid();
        if (!empty($this->shop_work_id)) {
            $this->member = D('Shopworker')->find($this->shop_work_id);
        }
        if (strtolower(MODULE_NAME) != 'login' && strtolower(MODULE_NAME) != 'public') { //public 不受权限控制
            if (empty($this->shop_work_id)) {
                header("Location: " . U('login/index'));
                die;
            }
            $this->shop = D('Shop')->find(array("where" => array('shop_id' => $this->member['shop_id'], 'status' => 2)));
            if (empty($this->shop)) {
                $this->error('该用户没有开通商户', U('login/index'));
            }
            $this->shop_id = $this->shop['shop_id']; //为了程序调用的时候方便
            $this->assign('SHOP', $this->shop);
        }
        $this->_CONFIG = D('Setting')->fetchAll();
        define('__HOST__', 'http://' . $_SERVER['HTTP_HOST']);
        $this->assign('CONFIG', $this->_CONFIG);
        $this->assign('MEMBER', $this->member);
        $this->shopcates = D('Shopcate')->fetchAll();
        $this->assign('shopcates', $this->shopcates);
        $this->assign('ctl', strtolower(MODULE_NAME)); //主要方便调用
        $this->assign('act', ACTION_NAME);

        $this->assign('today', TODAY); //兼容模版的其他写法
        $this->assign('nowtime', NOW_TIME);
    }

    protected function display($templateFile = '', $charset = '', $contentType = '', $content = '', $prefix = '')
    {
        parent::display($this->parseTemplate($templateFile), $charset, $contentType, $content = '', $prefix = '');
    }

    protected function parseTemplate($template = '')
    {
        $depr = c('TMPL_FILE_DEPR');
        $template = str_replace(':', $depr, $template);
        define('THEME_PATH', BASE_PATH . '/' . APP_NAME . '/Tpl/Shangjia/');
        define('APP_TMPL_PATH', __ROOT__ . '/' . APP_NAME . '/Tpl/Shangjia/');

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

    protected function JcMsg($message, $jumpUrl = '', $time = 3000, $callback = '', $parent = true) {
        self::baoMsg($message, $jumpUrl = '', $time = 3000, $callback = '', $parent = true);
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

}
