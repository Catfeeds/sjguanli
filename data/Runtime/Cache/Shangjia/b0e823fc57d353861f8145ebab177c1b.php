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
<script src="__PUBLIC__/js/my97/WdatePicker.js"></script>
<!-- <div class="sjgl_lead">
    <ul>
        <li><a href="#">商家管理</a> > <a href="">商城</a> > <a>发布商品</a></li>
    </ul>
</div>
<div class="tuan_content">
    <div class="radius5 tuan_top">
        <div class="tuan_top_t">
            <div class="left tuan_topser_l">商家发布的商品要在后台审核之后才能显示在前台</div>
        </div>
    </div> 
    <div class="tabnr_change  show">
    	<form method="post"  action="<?php echo U('goods/create');?>"  target="baocms_frm">
        <script type="text/javascript" src="__PUBLIC__/js/uploadify/jquery.uploadify.min.js"></script>
        <link rel="stylesheet" href="__PUBLIC__/js/uploadify/uploadify.css">
    	<table class="tuanfabu_table" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="120"><p class="tuanfabu_t">商品名称：</p></td>
                <td><div class="tuanfabu_nr">
                <input type="text" name="data[title]" value="<?php echo (($detail["title"])?($detail["title"]):''); ?>" class="tuanfabu_int tuanfabu_intw2" />
                </div></td>
            </tr>
             <tr>
                    <td width="120"><p class="tuanfabu_t">商品简介：</p></td>
                    <td><div class="tuanfabu_nr">
                            <input type="text" name="data[intro]" value="<?php echo (($detail["intro"])?($detail["intro"]):''); ?>" class="tuanfabu_int tuanfabu_intw2" />
                        </div></td>
                </tr>
                <tr>
                    <td width="120"><p class="tuanfabu_t">产品规格：</p></td>
                    <td><div class="tuanfabu_nr">
                           <input type="text" name="data[guige]" value="<?php echo (($detail["guige"])?($detail["guige"]):''); ?>" class="tuanfabu_int tuanfabu_intw2" />
                        </div></td>
                         </tr>
                          <tr>
                    <td width="120"><p class="tuanfabu_t">库存：</p></td>
                    <td><div class="tuanfabu_nr">
                           <input type="text" name="data[num]" value="<?php echo (($detail["num"])?($detail["num"]):''); ?>" class="tuanfabu_int tuanfabu_intw2" />
                        </div></td>
                         </tr>
            <tr>
                    <td width="120"><p class="tuanfabu_t">分类：</p></td>
                    <td><div class="tuanfabu_nr">
                            <select name="parent_id" id="parent_id" class="seleFl w100" style="display: inline-block; margin-right: 10px;">
                            <option value="0">请选择...</option>
                            <?php if(is_array($cates)): foreach($cates as $key=>$var): if(($var["parent_id"]) == "0"): ?><option value="<?php echo ($var["cate_id"]); ?>"><?php echo ($var["cate_name"]); ?></option><?php endif; endforeach; endif; ?>
                        </select>
                        <select id="cate_id" name="data[cate_id]" class="seleFl w100" style="display: inline-block;">

                        </select>
                        <script>
                            $(document).ready(function (e) {
                                $("#parent_id").change(function () {
                                    var url = '<?php echo U("admin/goodscate/child",array("parent_id"=>"0000"));?>';
                                    if ($(this).val() > 0) {
                                        var url2 = url.replace('0000', $(this).val());
                                        $.get(url2, function (data) {
                                            $("#cate_id").html(data);
                                        }, 'html');
                                    }
                                });

                            });
                        </script>
                        </div></td>
                </tr>
                   <tr>
                    <td width="120"></td>
                    <td id="jq_setting">


                    </td>
                </tr>
                <script>
                    var ajaxurl = '<?php echo U("admin/goodscate/ajax",array("cate_id"=>"0000"));?>';
                    $(document).ready(function () {
                        $("#cate_id").change(function () {
                            if ($(this).val() > 0) {
                                var link = ajaxurl.replace('0000', $(this).val());
                                $.get(link, function (data) {
                                    $("#jq_setting").html(data);
                                }, 'html');

                            } else {
                                alert("请选择分类");
                            }
                        });
                    });
                </script>
            <tr>
                <td width="120"><p class="tuanfabu_t">商家分类：</p></td>
                <td><div class="tuanfabu_nr">
                <select id="shopcate_id" name="data[shopcate_id]" class="manageSelect w200" style="width: 140px;">
                <?php if(is_array($autocates)): foreach($autocates as $key=>$var): ?><option value="<?php echo ($var["cate_id"]); ?>"  <?php if(($var["cate_id"]) == $detail["cate_id"]): ?>selected="selected"<?php endif; ?> ><?php echo ($var["cate_name"]); ?></option><?php endforeach; endif; ?>
                </select>
                </div></td>
            </tr>
            <tr>
                <td><p class="tuanfabu_t">商品图片：</p></td>
                <td><div class="tuanfabu_nr">
                <div style="width: 300px;height: 100px; float: left;">
                    <input type="hidden" name="data[photo]" value="<?php echo ($detail["photo"]); ?>" id="data_photo" />
                    <input id="photo_file" name="photo_file" type="file" multiple="true" value="" />
                </div>
                <div style="width: 300px;height: 100px; float: left;">
                    <img id="photo_img" width="80" height="80"  src="__ROOT__/attachs/<?php echo (($detail["photo"])?($detail["photo"]):'default.jpg'); ?>" />
                    建议尺寸<?php echo ($CONFIG["attachs"]["goods"]["thumb"]); ?>
                </div>
                <script>
                    $("#photo_file").uploadify({
                        'swf': '__PUBLIC__/js/uploadify/uploadify.swf?t=<?php echo ($nowtime); ?>',
                        'uploader': '<?php echo U("app/upload/uploadify",array("model"=>"goods"));?>',
                        'cancelImg': '__PUBLIC__/js/uploadify/uploadify-cancel.png',
                        'buttonText': '上传商品图片',
                        'fileTypeExts': '*.gif;*.jpg;*.png',
                        'queueSizeLimit': 1,
                        'onUploadSuccess': function (file, data, response) {
                            $("#data_photo").val(data);
                            $("#photo_img").attr('src', '__ROOT__/attachs/' + data).show();
                        }
                    });
                </script>
                </div>
                </td>
            </tr>
             <tr>
                    <td><p class="tuanfabu_t">更多详情图：</p></td>
                    <td class="rgTdBt">
                        <div class="tuanfabu_nr">
                            <div>
                                  <input id="logo_file" name="logo_file" type="file" multiple="true" value="" />
                            </div>
                            <div class="jq_uploads_img">
                                <?php if(is_array($thumb)): foreach($thumb as $key=>$item): ?><span style="width: 200px; height: 120px; float: left; margin-left: 5px; margin-top: 10px;">
                                       <img width="100" height="100" src="__ROOT__/attachs/<?php echo ($item["photo"]); ?>">

                                        <input type="hidden" name="photos[]" value="<?php echo ($item["photo"]); ?>" />
                                        <a href="javascript:void(0);">取消</a>
                                    </span><?php endforeach; endif; ?>
                            </div>
                        </div>
                        <script>

                                $("#logo_file").uploadify({

                                    'swf': '__PUBLIC__/js/uploadify/uploadify.swf?t=<?php echo ($nowtime); ?>',

                                    'uploader': '<?php echo U("app/upload/uploadify",array("model"=>"goodspic"));?>',

                                    'cancelImg': '__PUBLIC__/js/uploadify/uploadify-cancel.png',

                                    'buttonText': '上传图片',

                                    'fileTypeExts': '*.gif;*.jpg;*.png',

                                    'queueSizeLimit': 10,

                                    'onUploadSuccess': function (file, data, response) {

                                        var str = '<span style="width: 200px; height: 120px; float: left; margin-left: 5px; margin-top: 10px;">  <img width="200" height="100" src="__ROOT__/attachs/' + data + '">  <input type="hidden" name="photos[]" value="' + data + '" />    <a href="javascript:void(0);">取消</a>  </span>';

                                        $(".jq_uploads_img").append(str);

                                    }

                                });



                                $(document).on("click", ".jq_uploads_img a", function () {

                                    $(this).parent().remove();

                                });





                            </script>
                    </td>
                </tr>
                 <tr>
                    <td width="120"><p class="tuanfabu_t">属性：</p></td>
                    <td><div class="tuanfabu_nr">
                             <label><span>认证商家：</span><input type="checkbox" name="data[is_vs1]" value="1" /></label>
                        <label><span style="margin-left: 20px;">正品保证：</span><input type="checkbox" name="data[is_vs2]" value="1" /></label>
                        <label><span style="margin-left: 20px;">假一赔十：</span><input type="checkbox" name="data[is_vs3]" value="1" /></label>
                        <label><span style="margin-left: 20px;">当日送达：</span><input type="checkbox" name="data[is_vs4]" value="1" /></label>
                        <label><span style="margin-left: 20px;">免运费：</span><input type="checkbox" name="data[is_vs5]" value="1" /></label>
                        <label><span style="margin-left: 20px;">货到付款</span><input type="checkbox" name="data[is_vs6]" value="1" /></label>

                        </div></td>
                </tr>
            <tr>
                <td width="120"><p class="tuanfabu_t">市场价格：</p></td>
                <td><div class="tuanfabu_nr">
                <input type="text" name="data[price]" value="<?php echo (($detail["price"])?($detail["price"]):''); ?>" class="tuanfabu_int tuanfabu_intw2" />
                </div></td>
            </tr>
            <tr>
                <td width="120"><p class="tuanfabu_t">商城价格：</p></td>
                <td><div class="tuanfabu_nr">
                <input type="text" name="data[mall_price]" value="<?php echo (($detail["mall_price"])?($detail["mall_price"]):''); ?>" class="tuanfabu_int tuanfabu_intw2" />
                </div></td>
            </tr>
            <tr>
                <td width="120"><p class="tuanfabu_t">可使用积分数：</p></td>
                <td><div class="tuanfabu_nr">
                <input type="text" name="data[use_integral]" value="<?php echo (($detail["use_integral"])?($detail["use_integral"]):''); ?>" class="tuanfabu_int tuanfabu_intw2" />
                <code>最大可使用的积分数，100积分抵扣1元，不填表示不可使用积分</code>
                </div>
                </td>
            </tr>

            <tr>
                <td><p class="tuanfabu_t">购买须知：</p></td>
                <td><div class="tuanfabu_nr">
                <script type="text/plain" id="data_instructions" name="data[instructions]" style="width:800px;height:360px;"><?php echo ($detail["instructions"]); ?></script>
                <link rel="stylesheet" href="__PUBLIC__/umeditor/themes/default/css/umeditor.min.css" type="text/css">
				<script type="text/javascript" charset="utf-8" src="__PUBLIC__/umeditor/umeditor.config.js"></script>
                <script type="text/javascript" charset="utf-8" src="__PUBLIC__/umeditor/umeditor.min.js"></script>
                <script type="text/javascript" src="__PUBLIC__/umeditor/lang/zh-cn/zh-cn.js"></script>
                <script>
                                um = UM.getEditor('data_instructions', {
                                    imageUrl: "<?php echo U('app/upload/editor');?>",
                                    imagePath: '__ROOT__/attachs/editor/',
                                    lang: 'zh-cn',
                                    langPath: UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
                                    focus: false
                                });
                </script>
                </div></td>
            </tr>
            <tr>
                <td><p class="tuanfabu_t">商品详情：</p></td>
                <td><div class="tuanfabu_nr">
                <script type="text/plain" id="data_details" name="data[details]" style="width:800px;height:360px;"><?php echo ($detail["details"]); ?></script>
                <script>
					um = UM.getEditor('data_details', {
						imageUrl: "<?php echo U('app/upload/editor');?>",
						imagePath: '__ROOT__/attachs/editor/',
						lang: 'zh-cn',
						langPath: UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
						focus: false
					});
				</script>
                </div></td>
            </tr>
            <tr>
                <td width="120"><p class="tuanfabu_t">过期时间：</p></td>
                <td><div class="tuanfabu_nr">
                <input type="text" name="data[end_date]" value="<?php echo (($detail["end_date"])?($detail["end_date"]):''); ?>" onfocus="WdatePicker();" class="tuanfabu_int tuanfabu_intw2" />
                </div></td>
            </tr>
        </table>
        <div class="tuanfabu_an">
        <input type="submit" class="radius3 sjgl_an tuan_topbt" value="确认发布" />
        </div>
        </form>
    </div> 
</div> -->
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

    .main>div {
        overflow: hidden;
        margin-top: 42px;
    }

    .main>div select {
        width: 216px;
        height: 34px;
        border: 1px solid #C8D5E0;
        border-radius: 3px;
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
        margin: 0 16px 0 8px;
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

    .thumbnail .file {
        position: absolute;
        width: 96px;
        height: 96px;
        top: 0;
        background: #ECF3F8;
        border-radius: 3px;
        line-height: 85px;
        color: #fff;
        text-align: center;
        left: 156px;
        font-size: 76px;
    }

    .thumbnail .tip {
        line-height: 20px;
    }

    .banner .pic {
        float: left;
        margin-right: 8px;
        position: relative;
    }

    .banner .pic input,
    .banner .pic div {
        width: 96px;
        height: 96px;
        background: #ECF3F8;
        border-radius: 3px;
        line-height: 85px;
        color: #fff;
        text-align: center;
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
        z-index: 3;
        opacity: 0;
        cursor: pointer;
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

    .phase active {
        border: 1px solid #009CF5;
        border-radius: 3px;
        color: #009CF5;
    }

    .phase active i {
        position: absolute;
        bottom: 0;
        right: 0;
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

    .msg_phone input {
        width: 210px;
    }

    .msg_time input {
        width: 210px;
        height: 34px;
        border: 1px solid #C8D5E0;
        border-radius: 3px;
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
    .fixed{
        position: fixed;
        bottom: 50px;
        right:26px;
        
    }
    .fixed button{
        width: 128px;
        height: 40px;
        border-radius: 3px;
        text-align: center;
        cursor: pointer;
        margin-left: 10px;
    }
    .fixed .btn1{
        color: #fff;
        border: 0;
        background: #0ECEAF;
        line-height: 40px;
    }
    .fixed .btn2{
        border: 1px solid #C8D5E0;
        line-height: 38px;
        background: #fff;
    }
</style>
<form class="main">
    <div class="title">
        基本信息
    </div>
    <div>
        <div class="left">
            <i>*</i>
            <span>所属活动分类：</span>
        </div>
        <select name="" id="">
            <option value="1" style="color:red;display:none" disabled selected>请选择要查询的活动</option>
            <option value="1">1111111</option>
            <option value="2">2222222</option>
            <option value="2">2222222</option>
        </select>
    </div>
    <div class="name">
        <div class="left">
            <i>*</i>
            <span>活动名称：</span>
        </div>
        <input type="text">
        <span class="tip">(特殊字符除外:_ -* \ /,25个字以内)</span>
    </div>
    <div class="cultivate">
        <div class="left">
            <i>*</i>
            <span>能力培养：</span>
        </div>
        <div style="float:left">
            <input type="checkbox" id="a">
            <label for="a">社会视野</label>
        </div>
        <div style="float:left">
            <input type="checkbox" id="b">
            <label for="b">人际交往</label>
        </div>
        <div style="float:left">
            <input type="checkbox" id="c">
            <label for="c">团队协作</label>
        </div>
        <div style="float:left">
            <input type="checkbox" id="d">
            <label for="d">自我管理</label>
        </div>
        <span class="tip">(最多可选3项)</span>
    </div>
    <div class="thumbnail">
        <div class="left">
            <i>*</i>
            <span>缩略图：</span>
        </div>
        <div class="file">+</div>
        <input type="file" ref="avatarInput" name="thumbnail" accept="image/*">
        <div class="tip" style="float:left">
            <div>(支持上传.jpg、.jpeg、.png格式图片</div>
            <div>图片比例为4:3且大小不能超过1M)</div>
        </div>
        <!-- <span class="tip">（<br></span> -->
    </div>
    <div class="banner">
        <div class="left">
            <i>*</i>
            <span>详情banner广告图：</span>
        </div>
        <div class="pic pic1" style="float:left">
            <div class="file">+</div>
            <input type="file" ref="avatarInput" name="thumbnail" accept="image/*">
        </div>
        <div class="pic pic1" style="float:left">
            <div class="file">+</div>
            <input type="file" ref="avatarInput" name="thumbnail" accept="image/*">
        </div>
        <div class="pic pic1" style="float:left">
            <div class="file">+</div>
            <input type="file" ref="avatarInput" name="thumbnail" accept="image/*">
        </div>
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
        <div class="example">
            <textarea name="" id="" cols="72" style="resize:none" rows="10" placeholder="例：上午&#10;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7:00-7:10：签到&#10;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7:10-10:00：驱车赶往活动地点&#10;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下午&#10;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;14:00-15:00：自由活动&#10;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;17:00-18:00：驱车返回&#10;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;18:00：签退"></textarea>
        </div>
    </div>
    </div>
    <div class="detail">
        <div class="left ttop">
            <i>*</i>
            <span>活动详情：</span>
        </div>
        <div class="example">
            <textarea name="" id="" cols="72" style="resize:none" rows="10"></textarea>
        </div>
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
            <input type="text" placeholder="0.00">
            <span>元</span>
        </div>
        <div class="left">
            <i>*</i>
            <span>活动价格：</span>
        </div>
        <div style="float:left">
            <input type="text" placeholder="0.00">
            <span>元</span>
        </div>
        <div class="left">
            <i>*</i>
            <span>结算价格：</span>
        </div>
        <div style="float:left">
            <input type="text" placeholder="0.00">
            <span>元</span>
        </div>
        <div class="tip" style="float:left">
            <div>(支持上传.jpg、.jpeg、.png格式图片图片比例为16:9且大小不能超过1M)</div>
        </div>
    </div>
    <div class="num">
        <div class="left">
            <span>最高可报名人数：</span>
        </div>
        <div style="float:left">
            <input type="text" placeholder="0">
            <span>人</span>
        </div>
        <div class="left">
            <span>最低可报名人数：</span>
        </div>
        <div style="float:left">
            <input type="text" placeholder="0">
            <span>人</span>
        </div>
        <div class="left penum">
            <input type="checkbox" id="num">
            <label for="num">不限定报名人数</label>
        </div>
        <div class="tip" style="float:left">
            <div>(不满最低可报名人数，系统将自动取消活动并给予用户退款，请慎重填写)</div>
        </div>
    </div>
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
                <input type="text">
            </div>
            <div class="left">
                <i>*</i>
                <span>结束时间：</span>
            </div>
            <div style="float:left">
                <input type="text">
            </div>
            <div class="left">
                <span>报名截止时间：</span>
            </div>
            <div style="float:left">
                <input type="text">
            </div>
        </div>
    </div>
    <div style="overflow:hidden">
        <div class="left">
            <i>*</i>
            <span>适学阶段：</span>
        </div>
        <span class="phase">
            <span>1～2年级</span>
            <span>3～6年级</span>
            <span>7～9年级</span>
            <span>10～12年级</span>
        </span>
    </div>
    <div>
        <div class="left ttop">
            <i>*</i>
            <span>使用说明：</span>
        </div>
        <div class="example">
            <textarea name="" id="" cols="72" style="resize:none" rows="10" placeholder="例:&#10;1.活动开始时间为每周六、日 早7:00-晚17:00;&#10;2.活动要求最低15人（组）报名成功;&#10;3.凭报名活动码、二维码到奥克斯广场环球中心B座25楼进行兑票;:&#10;4.活动需最多2位大人陪同;:&#10;5.活动不提供食宿，请自行携带餐食。"></textarea>
        </div>
    </div>
    <div class="title">
        退款说明
    </div>
    <div>
        <div class="left">
            <i>*</i>
            <span>退款规则：</span>
        </div>
        <div style="float:left">
            <label>
                <input name="refund" type="radio">可以退款</label>
            <label>
                <input name="refund" type="radio">不可退款</label>
            <label>
                <input name="refund" type="radio">报名截止日前可退</label>
        </div>
    </div>
    <div>
        <div class="left ttop">
            <i>*</i>
            <span>退款说明：</span>
        </div>
        <div class="example">
            <span class="limit" style="display:inline-block">
                <textarea name="" id="" cols="72" style="resize:none" rows="10" placeholder="例:&#10;1.该活动不支持退款、改签;&#10;2.该活动只可在报名截止日期进行申请退款;&#10;3.活动不满15人（组），无法达成开团要求的，系统将自动退款。"></textarea>
                <div>
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
            <input type="text">
            <span class="tip">(不填写系统将默认单位联系人电话)</span>
        </div>
    </div>
    <div class="msg_time">
        <div class="left">
            <span>营业时间：</span>
        </div>
        <div style="float:left">
            <input type="text" class="radius3 tuan_topser" name="bg_date" value="" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"
            />
            <span class="wave">~</span>
            <input type="text" class="radius3 tuan_topser" name="end_date" value="" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"
            />
        </div>
    </div>
    <div class="address">
        <div class="left">
            <i>*</i>
            <span>基地地址：</span>
        </div>
        <select name="" id="">
            <option value="">省份</option>

        </select>
        <select name="" id="">
            <option value="">市级</option>

        </select>
        <select name="" id="">
            <option value="">区/县</option>

        </select>
        <input type="text" placeholder="请填写详细地址">
        <br>
        <input class="lat" type="text" placeholder="点击按钮获取地址经纬度">
        <span class="btn">获取经纬度</span>
        <span class="tip">(例如：112.76859973；28.76564738)</span>
    </div>
    <div>
        <div class="left ttop">
            <i>*</i>
            <span>交通信息：</span>
        </div>
        <div class="example">
            <span class="limit" style="display:inline-block">
                <textarea name="" id="" cols="72" style="resize:none" rows="10" placeholder="例:：市内可乘坐158、66、112线路公交车、在世界之窗站下车即可。"></textarea>
                <div>
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
        <div class="example">
            <span class="limit" style="display:inline-block">
                <textarea name="" id="" cols="72" style="resize:none" rows="5" placeholder="限定100个字以内"></textarea>
                <div>
                    <i>0</i>/
                    <span>100</span>
                </div>
            </span>
        </div>
    </div>
    <div class="fixed">
        <button class="btn1">保存并提交审核</button>
        <button class="btn2">保存并预览</button>
    </div>
</form>
</body>
</html>