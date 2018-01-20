<?php
 

class QrcodeWaterService extends Model
{

    public function __construct(){
    }

    /**
     * 生成缩略图函数（支持图片格式：gif、jpeg、png和bmp）
     * @author ruxing.li
     * @param  string $src      源图片路径
     * @param  int    $width    缩略图宽度（只指定高度时进行等比缩放）
     * @param  int    $width    缩略图高度（只指定宽度时进行等比缩放）
     * @param  string $filename 保存路径（不指定时直接输出到浏览器）
     * @return bool
     */
    public function mkThumbnail($src, $width = null, $height = null, $filename = null) {
        if (!isset($width) && !isset($height))
            return false;
        if (isset($width) && $width <= 0)
            return false;
        if (isset($height) && $height <= 0)
            return false;

        $size = getimagesize($src);
        if (!$size)
            return false;

        list($src_w, $src_h, $src_type) = $size;
        $src_mime = $size['mime'];
        switch($src_type) {
            case 1 :
                $img_type = 'gif';
                break;
            case 2 :
                $img_type = 'jpeg';
                break;
            case 3 :
                $img_type = 'png';
                break;
            case 15 :
                $img_type = 'wbmp';
                break;
            default :
                return false;
        }

        if (!isset($width))
            $width = $src_w * ($height / $src_h);
        if (!isset($height))
            $height = $src_h * ($width / $src_w);

        $imagecreatefunc = 'imagecreatefrom' . $img_type;
        $src_img = $imagecreatefunc($src);
        $dest_img = imagecreatetruecolor($width, $height);
        imagecopyresampled($dest_img, $src_img, 0, 0, 0, 0, $width, $height, $src_w, $src_h);

        $imagefunc = 'image' . $img_type;
        if ($filename) {
            $imagefunc($dest_img, $filename);
        } else {
            header('Content-Type: ' . $src_mime);
            $imagefunc($dest_img);
        }
        imagedestroy($src_img);
        imagedestroy($dest_img);
        return $filename;
    }

    //获得二维码图片
    public function downloadimagefromweixin($url){
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_HEADER,0);
        curl_setopt($ch, CURLOPT_NOBODY,0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
        $package = curl_exec($ch);
        $httpinfo = curl_getinfo($ch);
        curl_close($ch);
        return array_merge(array('body'=>$package),array('header'=>$httpinfo));
    }

    //下载二维码图片
    public function downQrcodeImg($urls,$user_id)
    {
        date_default_timezone_set('Asia/Shanghai');
        $filename = 'qrcode_src_'.$user_id.'.jpg'; //新文件名字
        if (!file_exists('Public/qrcode/weixin/'.date('Y-m-d',time()).'/')) {
            mkdir('./Public/qrcode/weixin/'.date('Y-m-d',time()),0777,true);    //创建二维码存放文件夹
        }
        if (!file_exists('Public/qrcode/weixin/'.date('Y-m-d',time()).'/' . $filename)) {
            $imageinfo = $this->downloadimagefromweixin($urls);
            $local_file = fopen('./Public/qrcode/weixin/'.date('Y-m-d',time()).'/' . $filename, 'w');
            //如果没有打开文件，进行写入操作
            if (false !== $local_file) {
                if (false !== fwrite($local_file, $imageinfo['body'])) {
                    fclose($local_file);
                }
            }
        }
        return 'Public/qrcode/weixin/'.date('Y-m-d',time()).'/' . $filename;
    }

    //下载微信头像图片
    public function downFaceImg($urls,$user_id)
    {
        date_default_timezone_set('Asia/Shanghai');
        $filename = 'face_src_'.$user_id.'.jpg'; //新文件名字
        if (!file_exists('Public/face/weixin/'.date('Y-m-d',time()).'/')) {
            mkdir('./Public/face/weixin/'.date('Y-m-d',time()),0777,true);    //创建微信头像存放文件夹
        }
        //if (!file_exists('Public/face/weixin/'.date('Y-m-d',time()).'/' . $filename)) {
            $imageinfo = $this->downloadimagefromweixin($urls);
            $local_file = fopen('./Public/face/weixin/'.date('Y-m-d',time()).'/' . $filename, 'w');
            //如果没有打开文件，进行写入操作
            if (false !== $local_file) {
                if (false !== fwrite($local_file, $imageinfo['body'])) {
                    fclose($local_file);
                }
            }
        //}
        return 'Public/face/weixin/'.date('Y-m-d',time()).'/' . $filename;
    }

    /*
     * 将二维码水印图片复制到目标图片上
     * */
    public function qrcodeWater($weixin_qrcode_url,$user_id)
    {
        date_default_timezone_set('Asia/Shanghai');
        //将二维码增加至图片上
        //$qrcode_img = qrcode();
        $dir_name = 'Public/qrcode/images/'.date('Y-m-d',time());
        if (!is_dir($dir_name)){
            mkdir($dir_name,0777,true);
        }
        $new_img_path = $dir_name.'/'."image_finish_".$user_id.".jpg";
        $dev_img_path = $dir_name.'/'."image_qrcode_".$user_id.".jpg";
        $dst_path = 'Public/Jigou/image/main_img.jpg';
        //echo '<img src='.$dst_path.'>';
        //die($dst_path);
        $src_path = $this->downQrcodeImg($weixin_qrcode_url,$user_id);    //下载微信二维码图片
        $src_path = $this->mkThumbnail($src_path, 260, 260, $dev_img_path);
        //die($src_path);
        //创建图片的实例
        $dst = imagecreatefromstring(file_get_contents($dst_path));
        $src = imagecreatefromstring(file_get_contents($src_path));
        //获取水印图片的宽高
        list($src_w, $src_h) = getimagesize($src_path);
        //将水印图片复制到目标图片上，最后个参数50是设置透明度，这里实现半透明效果
        $test = imagecopymerge($dst, $src, 750, 950, 0, 0, $src_w, $src_h, 100);

        //如果水印图片本身带透明色，则使用imagecopy方法
        //imagecopy($dst, $src, 10, 10, 0, 0, $src_w, $src_h);
        //输出图片
        list($dst_w, $dst_h, $dst_type) = getimagesize($dst_path);
        switch ($dst_type) {
            case 1://GIF
                //header('Content-Type: image/gif');
                imagegif($dst, $new_img_path);
                break;
            case 2://JPG
                //header('Content-Type: image/jpeg');
                imagejpeg($dst, $new_img_path);
                break;
            case 3://PNG
                //header('Content-Type: image/png');
                imagepng($dst, $new_img_path);
                break;
            default:
                break;
        }
        imagedestroy($dst);
        imagedestroy($src);
        return $new_img_path;
    }

    /*
     * 将二维码水印图片复制到目标图片上（二维码、头像、昵称）
     * */
    public function qrcodeWaterFace($weixin_qrcode_url,$face_url,$nickname,$user_id)
    {
        date_default_timezone_set('Asia/Shanghai');
        //将二维码增加至图片上
        //$qrcode_img = qrcode();
        $dir_name = 'Public/qrcode/images/'.date('Y-m-d',time());
        if (!is_dir($dir_name)){
            mkdir($dir_name,0777,true);
        }
        $new_img_path = $dir_name.'/'."image_finish_".$user_id.".jpg";
        $dev_img_path = $dir_name.'/'."image_qrcode_".$user_id.".jpg";
        $dst_path = 'Public/Jigou/image/main_img_bak_5.jpg';
        //微信头像图片
        $face_dir_name = 'Public/face/images/'.date('Y-m-d',time());
        if (!is_dir($face_dir_name)){
            mkdir($face_dir_name,0777,true);
        }
        $face_new_img_path = $face_dir_name.'/'."image_finish_".$user_id.".jpg";
        $face_dev_img_path = $face_dir_name.'/'."image_face_".$user_id.".jpg";
        $face_img_path = $face_url;//'http://wx.qlogo.cn/mmopen/vi_32/JDULaVdViaon3aX40bGkhiad5LhP2dibyibLF5zkfVdjSk0XC8SdxmmmqcQAFm3pLICicaHLzn5Zu5hcQPTDG532dXg/0';
        //echo '<img src='.$dst_path.'>';
        //die($dst_path);
        $src_path = $this->downQrcodeImg($weixin_qrcode_url,$user_id);    //下载微信二维码图片
        $face_src_path = $this->downFaceImg($face_img_path, $user_id);    //微信头像
        //微信二维码图片
        $src_path = $this->mkThumbnail($src_path, 230, 230, $dev_img_path);
        //微信头像图片
        $face_src_path = $this->mkThumbnail($face_src_path, 100, 100, $face_dev_img_path);
        //die($src_path);
        //创建图片的实例
        $dst = imagecreatefromstring(file_get_contents($dst_path));
        $src = imagecreatefromstring(file_get_contents($src_path));
        //微信头像图片
        $face_src = imagecreatefromstring(file_get_contents($face_src_path));
        //获取水印图片的宽高
        list($src_w, $src_h) = getimagesize($src_path);
        //获取微信头像图片水印图片的宽高
        list($face_src_w, $face_src_h) = getimagesize($face_src_path);
        //将水印图片复制到目标图片上，最后个参数50是设置透明度，这里实现半透明效果
        $test = imagecopymerge($dst, $src, 416, 1139, 0, 0, $src_w, $src_h, 100);
        //微信头像图片
        $test = imagecopymerge($dst, $face_src, 380, 518, 0, 0, $face_src_w, $face_src_h, 100);
        //微信昵称
        $col = imagecolorallocatealpha($dst,255,255,255,1);    //指定字体颜色
        $font = 'Public/font/vistaBold.ttf';
        $test = imagefttext($dst, 40, 0, 510, 585, $col, $font, $nickname);

        //如果水印图片本身带透明色，则使用imagecopy方法
        //imagecopy($dst, $src, 10, 10, 0, 0, $src_w, $src_h);
        //输出图片
        list($dst_w, $dst_h, $dst_type) = getimagesize($dst_path);
        switch ($dst_type) {
            case 1://GIF
                //header('Content-Type: image/gif');
                imagegif($dst, $new_img_path);
                break;
            case 2://JPG
                //header('Content-Type: image/jpeg');
                imagejpeg($dst, $new_img_path);
                break;
            case 3://PNG
                //header('Content-Type: image/png');
                imagepng($dst, $new_img_path);
                break;
            default:
                break;
        }
        imagedestroy($dst);
        imagedestroy($src);
        return $new_img_path;
    }

    /*
     * 获取微信公众号带用户编号的二维码
     * */
    public function getWxQrcodeByParams($weixin_qrcode_url,$user_id)
    {
        date_default_timezone_set('Asia/Shanghai');
        //将二维码增加至图片上
        //$qrcode_img = qrcode();
        $dir_name = 'Public/qrcode/images/'.date('Y-m-d',time());
        if (!is_dir($dir_name)){
            mkdir($dir_name,0777,true);
        }
        $new_img_path = $dir_name.'/'."image_finish_".$user_id.".jpg";
        $dev_img_path = $dir_name.'/'."image_qrcode_".$user_id.".jpg";
        $dst_path = 'Public/Jigou/image/main_img.jpg';
        //echo '<img src='.$dst_path.'>';
        //die($dst_path);
        $src_path = $this->downQrcodeImg($weixin_qrcode_url,$user_id);    //下载微信二维码图片
        $src_path = $this->mkThumbnail($src_path, 260, 260, $dev_img_path);
        //die($src_path);
        //创建图片的实例
        $dst = imagecreatefromstring(file_get_contents($dst_path));
        $src = imagecreatefromstring(file_get_contents($src_path));
        //获取水印图片的宽高
        list($src_w, $src_h) = getimagesize($src_path);
        //将水印图片复制到目标图片上，最后个参数50是设置透明度，这里实现半透明效果
        $test = imagecopymerge($dst, $src, 788, 1630, 0, 0, $src_w, $src_h, 100);

        //如果水印图片本身带透明色，则使用imagecopy方法
        //imagecopy($dst, $src, 10, 10, 0, 0, $src_w, $src_h);
        //输出图片
        list($dst_w, $dst_h, $dst_type) = getimagesize($dst_path);
        switch ($dst_type) {
            case 1://GIF
                //header('Content-Type: image/gif');
                imagegif($dst, $new_img_path);
                break;
            case 2://JPG
                //header('Content-Type: image/jpeg');
                imagejpeg($dst, $new_img_path);
                break;
            case 3://PNG
                //header('Content-Type: image/png');
                imagepng($dst, $new_img_path);
                break;
            default:
                break;
        }
        imagedestroy($dst);
        imagedestroy($src);
        return $dev_img_path;
    }

    /*
     * 使用PHP二维码生成类库PHP QR Code生成二维码
     * */
    public function png($text, $outfile=false, $level=QR_ECLEVEL_L, $size=5, $margin=3, $saveandprint=false){
        $enc = QRencode::factory($level, $size, $margin);
        return $enc->encodePNG($text, $outfile, $saveandprint=false);
    }


}

 
?>