<?php

class WxMsgTmpService extends Model
{
    private $APPID = '';
    private $SECRET = '';

    /**
     * 构造器
     * */
    public function __construct(){
        $this->APPID = config('wechat_consume.APPID');
        $this->SECRET = config('wechat_consume.APPSECRET');
    }

    /**
     * 发送微信模板消息
     * */
    private function sendWxTmpMsg($template_msg = array()) {
        if(empty($template_msg)){
            return false;
        }
        $ac = file_get_contents('https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$this->APPID.'&secret='.$this->SECRET);
        Log::debug(__FILE__ . ":" . __LINE__ . ' ' . '发送微信模板消息开始：' . json_encode($ac));
        $wxt = json_decode($ac,true);
        $url = 'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=' . $wxt['access_token'];//access_token改成你的有效值
        $curl = curl_init($url);
        $header = array();
        $header[] = 'Content-Type: application/x-www-form-urlencoded';
        curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
        // 不输出header头信息
        curl_setopt($curl, CURLOPT_HEADER, 0);
        // 伪装浏览器
        curl_setopt($curl, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36');
        // 保存到字符串而不是输出
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        // post数据
        curl_setopt($curl, CURLOPT_POST, 1);
        // 请求数据
        curl_setopt($curl,CURLOPT_POSTFIELDS,json_encode($template_msg));
        $response = curl_exec($curl);
        curl_close($curl);
        Log::debug(__FILE__ . ":" . __LINE__ . ' ' . '发送微信模板消息结束：' . json_encode($response));
    }

    /**
     * 发送退款完成微信模板消息
     * */
    public function sendRefundFinishMsg($params = array())
    {
        if (empty($params)) {
            return false;
        }
        $WX_MSG_TMP_DATA = config('wechat_consume.WX_MSG_TMP_DATA');
        $data = array(
            'first' => array(
                'value' => '您申请的<' . $params['title'] . '>活动已退款成功，退款金额将返回您的付款账户，预计3个工作日到账。',
                'color' => '#173177'
            ),
            'keyword1' => array(
                'value' => $params['time'],
                'color' => '#173177'
            ),
            'keyword2' => array(
                'value' => $params['title'],
                'color' => '#173177'
            ),
            'keyword3' => array(
                'value' => $params['amount'],
                'color' => '#173177'
            ),
            'remark' => array(
                'value' => '点击详情查看退款进度！',
                'color' => '#173177'
            )
        );
        $template_msg = array(
            'touser' => $params['open_id'],
            'template_id' => $WX_MSG_TMP_DATA['REFUND_FINISH'],
            'topcolor' => '#173177',
            'url' => $params['url'],
            'data' => $data
        );
        $this->sendWxTmpMsg($template_msg);
    }





}
?>