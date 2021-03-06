<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo ($CONFIG["site"]["title"]); ?>商户中心</title>
<meta name="description" content="<?php echo ($CONFIG["site"]["title"]); ?>商户中心" />
<meta name="keywords" content="<?php echo ($CONFIG["site"]["title"]); ?>商户中心" />
<link href="__TMPL__statics/css/newstyle.css" rel="stylesheet" type="text/css" />
<!-- <link href="../tatics/css/newstyle.css" rel="stylesheet" type="text/css" /> -->
 <link href="__PUBLIC__/js/jquery-ui.css" rel="stylesheet" type="text/css" />
<script>
var BAO_PUBLIC = '__PUBLIC__'; var BAO_ROOT = '__ROOT__';
</script>
<script src="__PUBLIC__/js/jquery.js"></script>
<script src="__PUBLIC__/js/jquery-ui.min.js"></script>
<script src="__PUBLIC__/js/web.js"></script>
<script src="__PUBLIC__/js/layer/layer.js"></script>

</head>

<body>
<iframe id="baocms_frm" name="baocms_frm" style="display:none;"></iframe>
<script src="__PUBLIC__/js/uploadify/ajaxfileupload.js"></script>
<script src="__PUBLIC__/js/my97/WdatePicker.js"></script>
<style>
    * {
        box-sizing: border-box;
    }

    i {
        font-style: normal;
    }

    .main {
        padding: 0 20px 140px 10px;
        min-width: 1340px;
    }

    input::-webkit-input-placeholder {
        color: #C8D5E0;
    }

    .main>div {
        overflow: hidden;
        margin-top: 42px;
    }

    .main>div select {
        width: 216px;
        height: 34px;
        border: 1px solid #C8D5E0;
        border-radius: 3px;
        position: relative;
    }

    .main>div .select {
        color: #C8D5E0;
    }

    .main>div select option {
        color: #304B5D;
    }

    .title {
        background: #EDF3F8;
        border-radius: 3px;
        line-height: 40px;
        margin-top: 32px;
        padding-left: 16px;
        font-size: 16px;
    }

    .left {
        float: left;
        width: 146px;
        text-align: right;
        line-height: 32px;
        margin-right: 10px;
    }

    .left i {
        display: inline-block;
        color: red;
        font-style: normal;
        font-weight: 600;
        font-size: 16px;
        transform: translateY(4px);
    }

    input {
        height: 34px;
        border: 1px solid #C8D5E0;
        border-radius: 3px;
        padding-left: 10px;
        vertical-align: middle;
    }

    .name input {
        width: 472px;
    }

    .tip {
        color: #A4B4C4;
        margin-left: 10px;
        line-height: 34px;
    }

    label {
        position: relative;
        transform: translateY(1px);
        margin: 0 16px 0 4px;
    }

    .thumbnail {
        position: relative;
    }

    .thumbnail input {
        border: none;
        float: left;
        width: 96px;
        height: 96px;
        position: relative;
        z-index: 4;
        opacity: 0;
        cursor: pointer;
    }

    .file {
        position: absolute;
        width: 96px;
        height: 96px;
        top: 0;
        background: #ECF3F8;
        border-radius: 3px;
        left: 156px;
        font-size: 76px;
    }

    .file i {
        position: absolute;
        width: 30px;
        height: 30px;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        /* cursor: pointer; */
        background: url('__TMPL__statics/images/icon_shangchuan30x30.png') center/cover no-repeat;
    }

    .file img {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
    }

    .thumbnail .tip {
        line-height: 20px;
    }

    .banner .pic {
        float: left;
        margin-right: 8px;
        position: relative;
    }

    .banner input,
    .banner .pic div {
        width: 96px;
        height: 96px;
        background: #ECF3F8;
        border-radius: 3px;
        /* line-height: 85px; */
        /* color: #fff; */
        /* text-align: center; */
        cursor: pointer;
    }

    .banner .pic div {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        font-size: 76px;
    }

    .banner .pic input {
        position: relative;
        z-index: 4;
        opacity: 0;
    }

    .banner img {
        width: 96px;
        height: 96px;
        border-radius: 3px;
    }

    textarea {
        border: 1px solid #C8D5E0;
        border-radius: 3px;
        padding: 15px 10px;
        line-height: 20px;
    }

    textarea::-webkit-input-placeholder {
        color: #C8D5E0;
    }

    .price {
        border-bottom: 1px solid #C8D5E0;
        padding-bottom: 48px;
    }

    .price input,
    .num input {
        width: 96px;
        height: 34px;
        margin-right: 8px;
    }

    .cultivate div {
        position: relative;
        cursor: pointer;
    }

    .cultivate input {
        opacity: 0;
    }

    .cultivate div b,
    .penum b {
        position: absolute;
        width: 14px;
        height: 14px;
        left: 0;
        top: 9px;
        border: 1px solid #C8D5E0;
        border-radius: 3px;
    }

    .cultivate div .active {
        background: url('__TMPL__statics/images/icon_xuanzhong_sel14x14.png') center/cover no-repeat;
        border: 0;
    }

    .penum {
        cursor: pointer;
        position: relative;
    }

    .penum input {
        opacity: 0;
    }

    .penum b {
        top: 8px;
        left: 69px;
    }

    .penum .active {
        background: url('__TMPL__statics/images/icon_xuanzhong_sel14x14.png') center/cover no-repeat;
        border: 0;
    }

    .num input[type='checkbox'] {
        width: 14px;
        height: 14px;
        margin: 0 0 0 64px;
        position: relative;
        transform: translateY(-1px);
    }

    .penum {
        width: 206px;
        margin-right: 0;
    }

    .notice input {
        width: 210px;
        margin-right: 8px;
    }

    .phase span {
        float: left;
        width: 104px;
        line-height: 32px;
        border: 1px solid #C8D5E0;
        border-radius: 3px;
        text-align: center;
        margin-right: 8px;
        cursor: pointer;
        position: relative;
    }

    .phase .active {
        border: 1px solid #009CF5;
        border-radius: 3px;
        color: #009CF5;
    }

    .phase input {
        position: absolute;
        visibility: hidden;
    }

    .phase .active i {
        position: absolute;
        bottom: 0;
        right: 0;
        width: 25px;
        height: 21px;
        background: url('__TMPL__statics/images/title_shixue25x21.png') center/cover no-repeat;
    }

    .ttop {
        transform: translateY(-10px);
    }

    input[type='radio'] {
        margin-right: 8px;
    }

    label {
        cursor: pointer;
    }

    .refund label {
        position: relative;
    }

    .refund label input {
        visibility: hidden;
    }

    .refund .active i {
        background: url('__TMPL__statics/images/icon_xuanzhong_sel14x14.png') center/cover no-repeat;
        border: 0;
    }

    .refund label i {
        position: absolute;
        width: 14px;
        height: 14px;
        left: 0;
        top: 3px;
        border: 1px solid #C8D5E0;
        border-radius: 3px;
    }

    .msg_phone input {
        width: 210px;
    }

    .msg_time input {
        width: 210px;
        height: 34px;
        border: 1px solid #C8D5E0;
        border-radius: 3px;
    }

    .address {
        position: relative;
        overflow: visible!important;
    }

    .address #iframe {
        position: absolute;
        top: -100px;
        left: 650px;
        z-index: 5;
        background: #fff;
        border: 1px solid #C8D5E0;
        display: none;
        z-index: 1002;
    }

    .msk {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0);
        z-index: 1001;
        display: none;
    }

    .main .address select {
        width: 112px;
        margin-right: 4px;
    }

    .main .address input {
        width: 418px;
    }

    .main .address .lat {
        width: 352px;
        margin: 24px 0 0 156px;
    }

    .main .address .btn {
        display: inline-block;
        width: 96px;
        line-height: 32px;
        border: 1px solid #C8D5E0;
        text-align: center;
        /* position: relative; */
        transform: translateY(13px);
        margin-left: 6px;
        cursor: pointer;
    }

    .limit {
        position: relative;
    }

    .limit div {
        position: absolute;
        bottom: 20px;
        right: 15px;
    }

    .address .tip {
        display: inline-block;
        transform: translateY(13px);
    }

    .fixed {
        position: fixed;
        bottom: 50px;
        right: 26px;
        z-index: 1000;
    }

    .fixed span {
        display: inline-block;
        width: 128px;
        height: 40px;
        border-radius: 3px;
        text-align: center;
        cursor: pointer;
        margin-left: 10px;
    }

    .fixed .btn1 {
        color: #fff;
        border: 0;
        background: #0ECEAF;
        line-height: 40px;
    }

    .fixed .btn2 {
        border: 1px solid #C8D5E0;
        line-height: 38px;
        background: #fff;
    }

    .thumbnail .left,
    .banner .left {
        transform: translateY(-10px);
    }

    .edui-editor-bottomContainer {
        display: none;
    }

    .flow {
        position: relative;
    }

    .edui-editor.edui-default {
        background: rgba(0, 0, 0, 0)!important;
    }

    .flow .placeholder {
        top: 112px;
        left: 200px;
        position: absolute;
        width: 520px;
        height: 210px;
        line-height: 20px;
        color: #C8D5E0;
    }

    .flow .placeholder span {
        display: inline-block;
        transform: translate(-28px);
    }
    /* preview-mask begin */
    .preview-mask {
        position: fixed;
        top: 0;
        left: 0;
        display: none;
        z-index: 9999;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, .5);
    }

    .preview-mask .phone-wrapper {
        position: relative;
        margin: 0 auto;
        margin-top:100px;
        padding: 65px 10px;
        width: 340px;
        height: 700px;
        background: url('__TMPL__statics/images/pic_iphone.png') center/cover no-repeat;
    }

    .preview-mask .phone-box {
        overflow-y: auto;
        overflow-x: hidden;
        width: 320px;
        height: 570px;
        background: #FFFFFF;
        border: 2px solid #D1D1D2;
        border-radius: 3px;
    }

    .fr {
        float: right;
    }

    .fl {
        float: left;
    }

    .clearfix {
        zoom: 1;
    }

    .clearfix::after,
    .clearfix::before {
        clear: both;
        content: ' ';
        display: block;
        line-height: 0;
        height: 0;
        visibility: hidden;
    }
    .activeDetail .bpic {
        display: block;
        width: 100%;
        height: 149px;
    }

    .activeDetail .titleBox {
        position: relative;
        padding: 0 10px;
        width: 100%;
        height: 60px;
        background-color: #fff;
        overflow: hidden;
    }

    .titleBox .text {
        float: left;
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        display: inline-block;
        width: 256px;
        line-height: 20px;
        vertical-align: middle;
        font-size: 14px;
        color: #333;
        overflow: hidden;
        text-overflow: ellipsis;
        display: box;
        display: -webkit-box;
        line-clamp: 2;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }

    .titleBox .answer {
        float: right;
    }

    .titleBox .answer em {
        position: relative;
        top: 5px;
        display: inline-block;
        vertical-align: middle;
        margin-top: -10px;
        width: 1px;
        height: 17px;
        background-color: #999;
    }

    .titleBox .answer .phone {
        position: relative;
        display: inline-block;
        top: 12px;
    }

    .answer .phone .icon {
        display: block;
        width: 26px;
        height: 26px;
        background: url('__TMPL__statics/images/icon_dianhua@52x52@2x.png') center/cover no-repeat;
    }

    .answer .phone p {
        text-align: center;
        line-height: 12px;
        font-size: 12px;
        color: #999;
    }

    .activeDetail .line1 {
        width: 100%;
        height: 5px;
        background-color: #f3f6f8;
    }

    .activeDetail .tab {
        padding: 0 17px;
        display: flex;
        width: 100%;
        height: 40px;
        line-height: 40px;
        background-color: #fff;
        transition: all 0.4s ease;
    }

    .tab li {
        flex: 1;
        font-size: 13px;
        color: #999;
        text-align: center;
    }

    .tab li span {
        display: inline-block;
        width: 75px;
        line-height: 21px;
        border-radius: 10px;
    }

    .activeDetail .line2 {
        width: 100%;
        height: 1px;
        background-color: #f3f6f8;
    }

    .activeDetail .explainBox {
        background-color: #fff;
        padding: 0 16px 108px 16px;
        text-align: center;
    }

    .explainBox .priceExplain {
        width: 100%;
        font-size: 13px;
    }

    .priceExplain .title {
        margin: 40px 0;
        text-align: center;
        width: 100%;
        height: 24px;
        background: url('__TMPL__statics/images/title_01@2x.png') center center no-repeat;
        background-size: 80px 12px;
    }

    .priceExplain .child {
        margin-bottom: 10px;
        line-height: 13px;
    }

    .priceExplain .child b {
        display: inline-block;
        text-align: left;
        /* width :460px; */
    }

    .priceExplain .main {
        line-height: 13px;
    }

    .priceExplain span {
        font-weight: 900;
        color: #ec8500;
    }

    .explainBox .details .title {
        margin: 25px 0;
        text-align: center;
        width: 100%;
        height: 24px;
        background: url('__TMPL__statics/images/title_02@2x.png') center center no-repeat;
        background-size: 80px 12px;
    }

    .explainBox .note {
        font-size: 13px;
    }

    .explainBox .note .title {
        margin: 20px 0;
        text-align: center;
        width: 100%;
        height: 24px;
        background: url('__TMPL__statics/images/title_03@2x.png') center center no-repeat;
        background-size: 80px 12px;
    }

    .explainBox .note span {
        color: #333;
    }
    .explainBox .note .local{
        margin-top:10px;
        position:relative;
    }
    .note .local .text{
        display: flex;
    }
    .note .local .text b{
        flex: 0 0 70px;
        font-weight: 900;
        color:#E36C09;
    }
    .note .local .text span{
        display:inline-block;
        width:180px;
        text-align:left;
    }
    .note .local em{
        position: absolute;
        right :5px;
        top :0;
        margin-right: 10px;
        width: 1px;
        height: 20px;
        background-color: #999;
    }
    .note .local .iconBox{
        position: absolute;
        right :0;
        top:-3px;
        width: 26px;
        height:26px;
    }
    .note .local .iconBox  i{
        position: absolute;
        width: 26px;
        height: 26px;
        background: url('__TMPL__statics/images/icon_dingwei@52x52@2x.png') center center no-repeat;
        background-size: 26px 26px;
    }
    .explainBox .refund .title {
        margin: 20px 0;
        text-align: center;
        width: 100%;
        height: 24px;
        background: url('__TMPL__statics/images/title_04@2x.png') center center no-repeat;
        background-size: 80px 12px;
    }

    .explainBox .refund p,.explainBox .reminder p,.explainBox .note p {
        text-align: left;
        font-size: 13px;
        line-height: 20px;
        color: #333;
    }

    .explainBox .reminder .title {
        margin: 20px 0;
        text-align: center;
        width: 100%;
        height: 24px;
        background: url('__TMPL__statics/images/title_05@2x.png') center center no-repeat;
        background-size: 80px 12px;
    }
    .signUp{
          display: block;
          width: 100%;
          height: 40px;
          line-height: 40px;
          text-align: center;
          background-color: #00bc71;
          color: #fff;
          font-size:14px;
      }
    .activeDetail .detailsPic{
        width:100%;
    }
    .activeDetail .detailsPic p{
        width:100%;
    }
    .activeDetail .detailsPic p img{
        display:block;
        width:100%;
    }
    .activeDetail .activityDetailSpecial p {
        text-align:left;
        font-size:13px;
        line-height: 20px;
        color: #333 !important;
    }
    strong{
        font-weight:900!important;
        display:inline-block;
        margin: 5px 0;
    }
    .close-preview{
        cursor: pointer;
        position: absolute;
        left: 50%;
        margin-left: -68px;
        bottom: -80px;
        width: 136px;
        height: 40px;
        line-height: 40px;
        border: 1px solid #FFFFFF;
        border-radius: 3px;
        background: transparent;
        text-align: center;
        font-family: PingFangHK-Regular;
        font-size: 15px;
        color: #FFFFFF;
        letter-spacing: 0;

    }
</style>
<form class="main" method="post" target="baocms_frm" action="<?php echo U('goods/createadd');?>">
<!-- <form class="main" method="post" action=""> -->
    <input type="hidden" name="goods_type" value="2"/>
    <input type="hidden" name="status_type" id="status_type" value="0"/>
    <div class="title">
        基本信息
    </div>
    <div>
        <div class="left">
            <i>*</i>
            <span>所属活动分类：</span>
        </div>
        <select class="select" name="com_type" id="com_type">
            <option value="0">请选择活动分类</option>
            <?php if(is_array($cates)): foreach($cates as $key=>$var): if(($var["parent_id"]) == "0"): ?><option value="<?php echo ($var["cate_id"]); ?>">
                        <?php echo ($var["cate_name"]); ?>
                    </option><?php endif; endforeach; endif; ?>
        </select>
    </div>
    <script>
        $(function () {
            $('.select').on('change', function () {
                $('.select').css('color', '#304B5D')
            })
        })
    </script>
    <div class="name">
        <div class="left">
            <i>*</i>
            <span>活动名称：</span>
        </div>
        <input type="text" id="title" name="title" value="">
        <span class="tip">(特殊字符除外:_ -* \ /,25个字以内)</span>
    </div>
    <div class="cultivate">
        <section class="left">
            <i>*</i>
            <span>能力培养：</span>
        </section>
        <?php if(is_array($abilitys)): foreach($abilitys as $key=>$va): ?><div style="float:left">
                <b></b>
                <input name="ability_type[]" type="checkbox" value="<?php echo ($va["id"]); ?>">
                <label>
                    <?php echo ($va["name"]); ?>
                </label>
            </div><?php endforeach; endif; ?>
        <span class="tip">(最多可选3项)</span>
    </div>
    <script>
        $(function () {
            $('.cultivate>div').on('click', function () {
                if ($(this).children('input').prop("checked")) {
                    $(this).children('input').prop("checked", false)
                    $(this).children('b').removeClass('active');
                } else {
                    if ($('.cultivate>div input:checked').length >= 3) {
                        return;
                    } else {
                        $(this).children('input').prop("checked", true);
                        $(this).children('b').addClass('active');
                    }

                }
            })
        })
    </script>
    <div class="thumbnail">
        <div class="left">
            <i>*</i>
            <span>缩略图：</span>
        </div>
        <div class="file">
            <i></i>
            <img id="photo_img" src="" alt="">
        </div>
        <input type="hidden" name="photo" value="" id="photo" />
        <input type="file" ref="avatarInput" id="photo_file" name="photo_file" accept="image/jpg,image/jpeg,image/png">
        <div class="tip" style="float:left">
            <div>(支持上传.jpg、.jpeg、.png格式图片</div>
            <div>图片比例为4:3且大小不能超过1M)</div>
        </div>
        <script>
            $('#photo_file').on('change', function () {
                if (judge("photo_file") == false) return false;
                ajaxFileUploads();
            });

            function ajaxFileUploads() {
                $.ajaxFileUpload({
                    url: '<?php echo U("app/upload/uploadify",array("model"=>"goods","flag"=>3,"type"=>2));?>',
                    type: 'POST',
                    secureuri: false,
                    fileElementId: 'photo_file', //file标签的id
                    dataType: 'content', //返回数据的类型
                    success: function (data, status) {
                        $("#photo").val(data);
                        $("#photo_img").attr('src', '__ROOT__/attachs/' + data).show();
                    },
                    error: function (data, status, e) {
                        alert(e);
                    }
                });
                $('#photo_file').change(function (e) { //再次绑定
                    ajaxFileUploads();
                })
                return false;
            }
        </script>
        <!-- <span class="tip">（<br></span> -->
    </div>
    <div class="banner">
        <div class="left">
            <i>*</i>
            <span>详情banner广告图：</span>
        </div>
        <div class="pic pic1" style="float:left">
            <div class="file">
                <i></i>
                <img id="img1" src="" alt="">
            </div>
            <input type="hidden" name="banner1" id="banner1" value="" />
            <input type="file" ref="avatarInput" name="banners1" id="banners1" accept="image/jpg,image/jpeg,image/png">
        </div>
        <script>
            $('#banners1').on('change', function () {
                if (judge("banners1") == false) return false;
                ajaxFileUploads1();
            });

            function ajaxFileUploads1() {
                $.ajaxFileUpload({
                    url: '<?php echo U("app/upload/uploadify",array("model"=>"goods","flag"=>3,"type"=>2));?>',
                    type: 'POST',
                    secureuri: false,
                    fileElementId: 'banners1', //file标签的id
                    dataType: 'content', //返回数据的类型
                    success: function (data, status) {
                        $("#banner1").val(data);
                        $("#img1").attr('src', '__ROOT__/attachs/' + data).show();
                    },
                    error: function (data, status, e) {
                        alert(e);
                    }
                });
                $('#banners1').change(function (e) { //再次绑定
                    ajaxFileUploads1();
                })
                return false;
            }
        </script>
        <div class="pic pic1" style="float:left">
            <div class="file">
                <i></i>
                <img id="img2" src="" alt="">
            </div>
            <input type="hidden" name="banner2" id="banner2" value="" />
            <input type="file" ref="avatarInput" name="banners2" id="banners2" accept="image/jpg,image/jpeg,image/png">
        </div>
        <script>
            $('#banners2').on('change', function () {
                if (judge("banners2") == false) return false;
                ajaxFileUploads2();
            });

            function ajaxFileUploads2() {
                $.ajaxFileUpload({
                    url: '<?php echo U("app/upload/uploadify",array("model"=>"goods","flag"=>3,"type"=>2));?>',
                    type: 'POST',
                    secureuri: false,
                    fileElementId: 'banners2', //file标签的id
                    dataType: 'content', //返回数据的类型
                    success: function (data, status) {
                        $("#banner2").val(data);
                        $("#img2").attr('src', '__ROOT__/attachs/' + data).show();
                    },
                    error: function (data, status, e) {
                        alert(e);
                    }
                });
                $('#banners2').change(function (e) { //再次绑定
                    ajaxFileUploads2();
                })
                return false;
            }
        </script>
        <div class="pic pic1" style="float:left">
            <div class="file">
                <i></i>
                <img id="img3" src="" alt="">
            </div>
            <input type="hidden" name="banner3" id="banner3" value="" />
            <input type="file" ref="avatarInput" name="banners3" id="banners3" accept="image/jpg,image/jpeg,image/png">
        </div>
        <script>
            $('#banners3').on('change', function () {
                if (judge("banners3") == false) return false;
                ajaxFileUploads3();
            });

            function ajaxFileUploads3() {
                $.ajaxFileUpload({
                    url: '<?php echo U("app/upload/uploadify",array("model"=>"goods","flag"=>3,"type"=>2));?>',
                    type: 'POST',
                    secureuri: false,
                    fileElementId: 'banners3', //file标签的id
                    dataType: 'content', //返回数据的类型
                    success: function (data, status) {
                        $("#banner3").val(data);
                        $("#img3").attr('src', '__ROOT__/attachs/' + data).show();
                    },
                    error: function (data, status, e) {
                        alert(e);
                    }
                });
                $('#banners3').change(function (e) { //再次绑定
                    ajaxFileUploads3();
                })
                return false;
            }

            function judge(str) {
                var max_size = 1024;
                var tmpFile = document.getElementById(str);
                var fileData = tmpFile.files[0];
                var size = fileData.size;
                if (size > max_size * 1024) {
                    alert("图片大小不能超过1M");
                    return false;
                } else {
                    return true;
                }
            }
        </script>
        <div class="tip" style="float:left">
            <div>(支持上传.jpg、.jpeg、.png格式图片</div>
            <div>图片比例为16:9且大小不能超过1M)</div>
        </div>
    </div>
    <div class="title">
        活动详情
    </div>
    <div class="flow">
        <div class="left ttop">
            <i>*</i>
            <span>活动流程：</span>
        </div>
        <div class="placeholder">
            <span>例：上午</span>
            <br> 7:00-7:10：签到
            <br> 7:10-10:00：驱车赶往活动地点
            <br> 下午
            <br> 14:00-15:00：自由活动
            <br> 17:00-18:00：驱车返回
            <br> 18:00：签退
        </div>
        <!-- <?php echo ($detail["instructions"]); ?> -->
        <script type="text/plain" id="data_instructions" name="flow" style="width:800px;height:360px;margin-left:158px;">
        </script>
        <link rel="stylesheet" href="__PUBLIC__/umeditor/themes/default/css/ueditor.min.css" type="text/css">
        <script type="text/javascript" charset="utf-8" src="__PUBLIC__/umeditor/ueditor.config.js"></script>
        <script type="text/javascript" charset="utf-8" src="__PUBLIC__/umeditor/ueditor.all.min.js"></script>
        <script type="text/javascript" src="__PUBLIC__/umeditor/lang/zh-cn/zh-cn.js"></script>
        <script>
            ue = UE.getEditor('data_instructions', {
                imageUrl: "<?php echo U('app/upload/editor');?>",
                imagePath: '__ROOT__/attachs/editor/',
                lang: 'zh-cn',
                focus: false,
            });
            ue.addListener("focus", function () {
                $('.placeholder').hide()
            });
            ue.addListener("blur", function () {
                if (!ue.getPlainTxt().trim()) {
                    $('.placeholder').show()
                }
            });
        </script>
    </div>
    </div>
    <div class="detail">
        <div class="left ttop">
            <i>*</i>
            <span>活动详情：</span>
        </div>
        <script type="text/plain" id="active_detail" name="details" style="width:800px;height:360px;margin-left:158px;">
        </script>
        <script>
            um = UE.getEditor('active_detail')
        </script>
        <!-- <div class="example">
            <textarea name="" id="" cols="72" style="resize:none" rows="10"></textarea>
        </div> -->
    </div>
    <div class="title">
        活动价格
    </div>
    <div class="price">
        <div class="left">
            <i>*</i>
            <span>市场价格：</span>
        </div>
        <div style="float:left">
            <input type="text" name="mall_price" placeholder="0.00" value=""/>
            <span>元</span>
        </div>
        <div class="left">
            <i>*</i>
            <span>活动价格：</span>
        </div>
        <div style="float:left">
            <input type="text" name="price" id="price" placeholder="0.00" value=""/>
            <span>元</span>
        </div>
        <div class="left">
            <i>*</i>
            <span>结算价格：</span>
        </div>
        <div style="float:left">
            <input type="text" name="settlement_price" placeholder="0.00" value="">
            <span>元</span>
        </div>
        <div class="tip" style="float:left">
            <div>(结算价格必须小于活动价格，系统将按照结算金额进行活动结算)</div>
        </div>
    </div>
    <div class="num">
        <div class="left">
            <span>最高可报名人数：</span>
        </div>
        <div style="float:left">
            <input type="text" name="max_num" placeholder="0" value=""/>
            <span>人</span>
        </div>
        <div class="left">
            <span>最低可报名人数：</span>
        </div>
        <div style="float:left">
            <input type="text" name="min_num" placeholder="0" value=""/>
            <span>人</span>
        </div>
        <div class="left penum">
            <b></b>
            <input type="checkbox" name="nolimit" value="1"/>
            <label>不限定报名人数</label>
        </div>
        <div class="tip" style="float:left">
            <div>(不满最低可报名人数，系统将自动取消活动并给予用户退款，请慎重填写)</div>
        </div>
    </div>
    <script>
        $(function () {
            $('.penum').on('click', function () {
                if ($(this).children('input').prop("checked")) {
                    $(this).children('input').prop("checked", false)
                    $(this).children('b').removeClass('active');
                } else {
                    $(this).children('input').prop("checked", true);
                    $(this).children('b').addClass('active');
                }
            })
        })
    </script>
    <div class="title">
        报名须知
    </div>
    <div class="notice">
        <div style="overflow:hidden">
            <div class="left">
                <i>*</i>
                <span>开始时间：</span>
            </div>
            <div style="float:left">
                <input type="text" class="radius3 tuan_topser" name="start_time" value="" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"
                />
            </div>
            <div class="left">
                <i>*</i>
                <span>结束时间：</span>
            </div>
            <div style="float:left">
                <input type="text" class="radius3 tuan_topser" name="end_time" value="" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"
                />
            </div>
            <div class="left">
                <span>报名截止时间：</span>
            </div>
            <div style="float:left">
                <input type="text" class="radius3 tuan_topser" name="finaly_time" value="" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});">
            </div>
        </div>
    </div>
    <div style="overflow:hidden">
        <div class="left">
            <i>*</i>
            <span>适学阶段：</span>
        </div>
        <span class="phase">
            <span>1～2年级
                <input type="checkbox" name="suit_type[]" value="1">
                <i></i>
            </span>
            <span>3～6年级
                <input type="checkbox" name="suit_type[]" value="2">
                <i></i>
            </span>
            <span>7～9年级
                <input type="checkbox" name="suit_type[]" value="3">
                <i></i>
            </span>
            <span>10～12年级
                <input type="checkbox" name="suit_type[]" value="4">
                <i></i>
            </span>
        </span>
        <script>
            $(function () {
                $('.phase span').on('click', function () {
                    // $('.phase input').prop("checked", false)
                    if ($(this).children('input').prop("checked")) {
                        $(this).removeClass('active');
                        $(this).children('input').prop("checked", false)
                    } else {
                        $(this).children('input').prop("checked", true);
                        $(this).addClass('active');
                    }
                })
            })
        </script>
    </div>
    <div>
        <div class="left ttop">
            <i>*</i>
            <span>使用说明：</span>
        </div>
        <div class="example">
            <textarea name="use_detail" id="use_detail" cols="72" style="resize:none" rows="10" placeholder="例:&#10;1.活动开始时间为每周六、日 早7:00-晚17:00;&#10;2.活动要求最低15人（组）报名成功;&#10;3.凭报名活动码、二维码到奥克斯广场环球中心B座25楼进行兑票;:&#10;4.活动需最多2位大人陪同;:&#10;5.活动不提供食宿，请自行携带餐食。"></textarea>
        </div>
    </div>
    <div class="title">
        退款说明
    </div>
    <div class="refund">
        <div class="left">
            <i>*</i>
            <span>退款规则：</span>
        </div>
        <div style="float:left">
            <label>
                <i></i>
                <input type="radio" name="refund_type" value="1"/>可以退款</label>
            <label>
                <i></i>
                <input type="radio" name="refund_type" value="2"/>不可退款</label>
            <label>
                <i></i>
                <input type="radio" name="refund_type" value="3"/>报名截止日前可退</label>
        </div>
    </div>
    <script>
        $(function () {
            $('.refund label').on('click', function () {
                // $('.phase input').prop("checked", false)
                $('.refund label').removeClass('active');
                // $(this).children('input').prop("checked", true);
                $(this).addClass('active');
            })
        })
    </script>
    <div>
        <div class="left ttop">
            <i>*</i>
            <span>退款说明：</span>
        </div>
        <div class="example textarea1">
            <span class="limit" style="display:inline-block">
                <textarea name="refund_detail" id="refund_detail" cols="72" style="resize:none" rows="10" maxlength="300" onchange="this.value=this.value.substring(0, 300)"
                    onkeydown="this.value=this.value.substring(0, 300)" onkeyup="this.value=this.value.substring(0, 300)" placeholder="例:&#10;1.该活动不支持退款、改签;&#10;2.该活动只可在报名截止日期进行申请退款;&#10;3.活动不满15人（组），无法达成开团要求的，系统将自动退款。"></textarea>
                <div class="">
                    <i>0</i>/
                    <span>300</span>
                </div>
            </span>
        </div>
    </div>
    <div class="title">
        基地信息
    </div>
    <div class="msg_phone">
        <div class="left">
            <span>咨询电话：</span>
        </div>
        <div style="float:left">
            <input type="text" id="phone" name="phone" value=""/>
            <span class="tip">(不填写系统将默认单位联系人电话)</span>
        </div>
    </div>
    <div class="msg_time">
        <div class="left">
            <span>营业时间：</span>
        </div>
        <div style="float:left">
            <input type="text" class="radius3 tuan_topser" name="business_start" value="" onfocus="WdatePicker({dateFmt: 'HH:mm:ss'});"
            />
            <span class="wave">~</span>
            <input type="text" class="radius3 tuan_topser" name="business_end" value="" onfocus="WdatePicker({dateFmt: 'HH:mm:ss'});"
            />
        </div>
    </div>
    <div class="address">
        <div class="left">
            <i>*</i>
            <span>基地地址：</span>
        </div>
        <select name="province" id="province" onchange="obtains(1)">
            <option value="0">省份</option>
            <?php if(is_array($province)): foreach($province as $key=>$vp): ?><option value="<?php echo ($vp["id"]); ?>">
                    <?php echo ($vp["name"]); ?>
                </option><?php endforeach; endif; ?>
        </select>
        <select name="city" id="city" onchange="obtains(2)">
            <option value="0">市级</option>
        </select>
        <select name="area" id="area">
            <option value="0">区/县</option>
        </select>
        <script>
            function obtains(u) {
                if (u == 1) {
                    var id = $("#province").val();
                    if (id == 0) {
                        $('#city').html('');
                        $('#area').html('');
                        $('#city').html('<option value="0">市级</option>');
                        $('#area').html('<option value="0">区/县</option>');
                    }
                } else {
                    var id = $("#city").val();
                    if (id == 0) {
                        $('#area').html('');
                        $('#area').html('<option value="0">区/县</option>');
                    }
                }

                $.ajax({
                    type: "POST", //提交方式
                    url: '<?php echo U("goods/obtains");?>', //路径
                    data: {
                        "uid": id,
                        "type": u
                    }, //数据，这里使用的是Json格式进行传输
                    success: function (result) { //返回数据根据结果进行相应的处理
                        if (result.code == 1) {
                            if (u == 1) {
                                $('#city').html('');
                                $('#area').html('');
                                $('#city').html(result.data);
                                $('#area').html('<option value="0">区/县</option>');
                            } else if (u == 2) {
                                $('#area').html('');
                                $('#area').html(result.data);
                            }
                        }
                    }
                });

            }
        </script>
        <input type="text" name="address" id="address" value="" placeholder="请填写详细地址"/>
        <br>
        <input class="lat" type="text" name="latandlng" placeholder="点击按钮获取地址经纬度" value=""/>
        <!-- <a class="btn" mini="select"  w="600" h="600" href="<?php echo U('public/maps');?>">获取经纬度</a> -->
        <iframe id="iframe" src="<?php echo U('public/maps');?>" name="bb" frameborder="0" width="600px" height="500px" onload="load()"></iframe>
        <span class="btn">获取经纬度</span>
        <span class="tip">(例如：112.76859973；28.76564738)</span>
    </div>
    <div class="msk"></div>
    <script>
        $('.btn').on('click', function () {
            $('#iframe').show()
            $('.msk').show()
        })
        $('.msk').on('click', function () {
            $('#iframe').hide()
            $('.msk').hide()
        })

        function load() {
            var iframe = $('#iframe').contents();
            iframe.find(".queren").on('click', function () {
                $('.lat').val(iframe.find("#lng").val() && iframe.find("#lat").val() ? iframe.find("#lng").val() +
                    ';' + iframe.find("#lat").val() : '')
                $('#iframe').hide()
                $('.msk').hide()
            })
        }
    </script>
    <div>
        <div class="left ttop">
            <i>*</i>
            <span>交通信息：</span>
        </div>
        <div class="example textarea2">
            <span class="limit" style="display:inline-block">
                <textarea name="traffic_info" id="traffic_info" cols="72" style="resize:none" rows="5" placeholder="例:：市内可乘坐158、66、112线路公交车、在世界之窗站下车即可。"
                    maxlength="100" onchange="this.value=this.value.substring(0, 100)" onkeydown="this.value=this.value.substring(0, 100)"
                    onkeyup="this.value=this.value.substring(0, 100)"></textarea>
                <div class="">
                    <i>0</i>/
                    <span>100</span>
                </div>
            </span>
        </div>
    </div>
    <div class="title">
        注意事项
    </div>
    <div>
        <div class="left ttop">
            <span>温馨提示：</span>
        </div>
        <div class="example textarea3">
            <span class="limit" style="display:inline-block">
                <textarea class="" name="notice" id="notice" cols="72" style="resize:none" rows="5" maxlength="100" onchange="this.value=this.value.substring(0, 100)"
                    onkeydown="this.value=this.value.substring(0, 100)" onkeyup="this.value=this.value.substring(0, 100)" placeholder="限定100个字以内"></textarea>
                <div class="">
                    <i>0</i>/
                    <span>100</span>
                </div>
            </span>
        </div>
    </div>
    <script>
        $(function () {
            key('textarea1', 300)
            key('textarea2', 100)
            key('textarea3', 100)

            function key(name, num) {
                $('.' + name + ' textarea').on('keyup', function () {
                    if ($(this).val().length >= num - 20) {
                        $('.' + name + ' div').css('color', 'red')
                    } else {
                        $('.' + name + ' div').css('color', '#304B5D')
                    }
                    $('.' + name + ' i').text($(this).val().length)
                })
            }
        })
    </script>
    <div class="fixed">
        <span class="btn1" onclick="save()">保存并提交审核</span>
        <span class="btn2" onclick="showpreview()">保存</span>
        <!--<span class="btn2" onclick="showpreview()">保存并预览</span>-->
    </div>
    <div class="preview-mask">
            <div class="phone-wrapper">
                <div class="phone-box">
                    <div class="contentBox activeDetail">
                        <img class="bpic" src='__TMPL__statics/images/5a2bd01e6f406.jpg' />
                        <div class="titleBox">
                            <div class="text fl" id="id_title">一柄木勺的故事</div>
                            <div class="answer fr">
                                <em></em>
                                <div class="phone">
                                    <i class="icon"></i>
                                    <p>咨询</p>
                                </div>
                            </div>
                        </div>
                        <div class="line1"></div>
                        <ul class="tab" ref="tab">
                            <li>
                                <span>价格说明</span>
                            </li>
                            <li>
                                <span>详情介绍</span>
                            </li>
                            <li>
                                <span>报名须知</span>
                            </li>
                        </ul>
                        <div class="line2"></div>
                        <div class="explainBox">
                            <div class="priceExplain">
                                <div class="title"></div>
                                <div class="child clearfix">
                                    <b class="fl" id="id_titles">一柄木勺的故事</b>
                                    <span class="fr" id="id_price">￥98</span>
                                </div>
                            </div>
                            <div class="details">
                                <div class="title"></div>
                                <div class="detailsPic"></div>
                            </div>
                            <div class="note">
                                <div class="title"></div>
                                <div class="activityDetailSpecial"></div>
                                <div class="local">
                                    <div class="text">
                                        <b>活动地址：</b>
                                        <span id="id_address">长沙市雨花区韶山南路637号几个木匠工场（长沙市外国语学校大门南侧上坡直行150米）</span>
                                    </div>
                                    <em class="fr"></em>
                                    <div class="iconBox fr">
                                        <i></i>
                                    </div>
                                </div>
                            </div>
                            <div class="refund">
                                <div class="title"></div>
                                <p id="id_refund_detail">活动开始前一天不可退不可改</p>
                            </div>
                            <div class="reminder">
                                <div class="title"></div>
                                <p id="id_notice">几个木匠工厂营业时间仅供参考。具体营业时间以实际营业时间为准。</p>
                                <!-- <p>2.不包含商店、餐厅和其他自费项目；不再与其他优惠同享。</p> -->
                            </div>
                        </div>
                        <!--<a href="javascript:;" class="signUp">立即报名</a>-->
                        <!-- <a class="signUp" :href="linkUrl+'/h5/index/addActive/shop_id/'+msg.shop_id+'/goods_id/'+msg.goods_id+'/coupon_id/-1'" v-if="msg.is_subscribe==1">立即报名</a> -->
                    </div>
                </div>
                <div class="close-preview" onclick="closepreview()">
                    关闭预览
                </div>
            </div>
        </div>
        <script>
            var form = document.querySelector('form');
            function save(){
                $('#status_type').val(2);
                form.submit()
            }
            function showpreview() {
                $('#status_type').val(1);
                form.submit();//先不弹框预览
//                $('#id_title').text($('#title').val());
//                $('#id_titles').text($('#title').val());
//                $('#id_address').text($('#province').find("option:selected").text()+$('#city').find("option:selected").text()+
//                    $('#area').find("option:selected").text()+$('#address').val());//地址
//                $('#id_price').text('￥'+$('#price').val());//活动价格
//                $('#id_refund_detail').text($('#refund_detail').val());//退款说明
//                $('#id_notice').text($('#notice').val());//温馨提示
//                $('.preview-mask').fadeIn(200)
            }
            function closepreview(){
                $('.preview-mask').fadeOut(200)
                form.submit();
            }
        </script>
</form>
</body>
</html>