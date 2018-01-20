<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><?php echo ($CONFIG["site"]["title"]); ?>管理后台</title>
        <meta name="description" content="<?php echo ($CONFIG["site"]["title"]); ?>管理后台" />
        <meta name="keywords" content="<?php echo ($CONFIG["site"]["title"]); ?>管理后台" />
        <!-- <link href="__TMPL__statics/css/index.css" rel="stylesheet" type="text/css" /> -->
        <link href="__TMPL__statics/css/style.css" rel="stylesheet" type="text/css" />
        <link href="__TMPL__statics/css/land.css" rel="stylesheet" type="text/css" />
        <link href="__TMPL__statics/css/pub.css" rel="stylesheet" type="text/css" />
        <link href="__TMPL__statics/css/main.css" rel="stylesheet" type="text/css" />
        <link href="__TMPL__statics/css/modify.css" rel="stylesheet" type="text/css" />
        <link href="__PUBLIC__/js/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script> var BAO_PUBLIC = '__PUBLIC__'; var BAO_ROOT = '__ROOT__'; </script>
        <script src="__PUBLIC__/js/jquery.js"></script>
        <script src="__PUBLIC__/js/jquery-ui.min.js"></script>
        <script src="__PUBLIC__/js/my97/WdatePicker.js"></script>
        <script src="__PUBLIC__/js/admin.js?v=20150409"></script>
        <script src="__PUBLIC__/js/uploadify/ajaxfileupload.js"></script>
    </head>
    <body>
         <iframe id="baocms_frm" name="baocms_frm" style="display:none;"></iframe>
   <div class="main">
<style>
    .mainScAdd .tableBox table tr td{
        padding-top: 0;
        padding-bottom: 0;
    }
    .submit-btn{
        /* display: none; */
        /* z-index: 4999; */
        /* position: fixed; */
        width: 100%;
        padding-right:20px;
        height: 50px;
        bottom: 0;
        right: 20px;
        background-color: transparent;
    }
    .smtQrIpt{
        z-index: 4400;
        position: fixed;
        width: 100%;
        bottom: 0;
        width: 100%;
        background-color: #999;
    }
</style>
<div class="mainBt">
    <ul>
        <li class="li1">商城</li>
        <li class="li2">产品管理</li>
        <li class="li2 li3">新增</li>
    </ul>
</div>
<div class="mainScAdd ">

    <div class="tableBox">
        <form enctype="multipart/form-data" target="baocms_frm" action="<?php echo U('goods/create');?>" method="post">
            <table bordercolor="#e1e6eb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;" >
                <tr>
                    <td class="lfTdBt">产品名称：</td>
                    <td class="rgTdBt"><input type="text" name="data[title]" value="<?php echo (($detail["title"])?($detail["title"]):''); ?>" class="manageInput" />

                    </td>
                </tr>
                <tr>
                    <td  class="lfTdBt">产品副标题：</td>
                    <td class="rgTdBt"><input type="text" name="data[intro]" value="<?php echo (($detail["intro"])?($detail["intro"]):''); ?>" class="manageInput" />

                    </td>
                </tr>
                <tr>
                    <td  class="lfTdBt">产品规格：</td>
                    <td class="rgTdBt"><input type="text" name="data[guige]" value="<?php echo (($detail["guige"])?($detail["guige"]):''); ?>" class="manageInput" />

                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">教育等级：</td>
                    <td class="rgTdBt">
                        <select name="data[com_edu]">
                            <option value=" ">请选择</option>
                            <option value="1">小学</option>
                            <option value="2">初中</option>
                            <option value="3">高中</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td  class="lfTdBt">库存：</td>
                    <td class="rgTdBt"><input type="text" name="data[num]" value="<?php echo (($detail["num"])?($detail["num"]):''); ?>" class="manageInput" />

                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">商家：</td>
                    <td class="rgTdBt">
                        <div class="lt">
                            <input type="hidden" id="shop_id" name="data[shop_id]" value="<?php echo (($detail["shop_id"])?($detail["shop_id"]):''); ?>"/>
                            <input type="text" id="shop_name" name="shop_name" value="" class="manageInput" />
                        </div>
                        <a mini="select"  w="1000" h="600" href="<?php echo U('shop/select');?>" class="remberBtn">选择商家</a>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">分类：</td>
                    <td class="rgTdBt">
                        <select name="data[parent_id]" id="parent_id" class="seleFl w100" style="display: inline-block; margin-right: 10px;">
                            <option value="0">请选择...</option>
                            <?php if(is_array($cates)): foreach($cates as $key=>$var): if(($var["parent_id"]) == "0"): ?><option value="<?php echo ($var["cate_id"]); ?>"><?php echo ($var["cate_name"]); ?></option><?php endif; endforeach; endif; ?>
                        </select>
                        <select id="cate_id" name="data[cate_id]" class="seleFl w100" style="display: inline-block;">

                        </select>
                        <script>
                            $(document).ready(function (e) {
                                $("#parent_id").change(function () {
                                    var url = '<?php echo U("goodscate/child",array("parent_id"=>"0000"));?>';
                                    if ($(this).val() > 0) {
                                        var url2 = url.replace('0000', $(this).val());
                                        $.get(url2, function (data) {
                                            if(data == 1){
                                                $("#cate_id").attr('style','display:none');
                                            }else{
                                                $("#cate_id").attr('style','display: inline-block; margin-right: 10px;');
                                                $("#cate_id").html(data);
                                            }
//                                            $("#cate_id").html(data);
                                        }, 'html');
                                    }
                                });

                            });
                        </script>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt"></td>
                    <td  class="rgTdBt" id="jq_setting">

                    </td>
                </tr>
                <script>
                    var ajaxurl = '<?php echo U("goodscate/ajax",array("cate_id"=>"0000"));?>';
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
                <script type="text/javascript" src="__PUBLIC__/js/uploadify/jquery.uploadify.min.js"></script>
                <link rel="stylesheet" href="__PUBLIC__/js/uploadify/uploadify.css">
                <tr>
                    <td class="lfTdBt">列表banner图：</td>
                    <td class="rgTdBt">
                        <div style="width: 300px;height: 100px; float: left;">
                            <input type="hidden" name="data[photo]" value="<?php echo ($detail["photo"]); ?>" id="data_photo" />
                            <input id="photo_file" name="photo_file" type="file" multiple="true" value="" />
                        </div>
                        <div style="width: 300px;height: 100px; float: left;">
                            <img id="photo_img" width="80" height="80"  src="__ROOT__/attachs/<?php echo (($detail["photo"])?($detail["photo"]):'default.jpg'); ?>" />
                            <a href="<?php echo U('setting/attachs');?>">缩略图设置</a>
                            建议尺寸<?php echo ($CONFIG["attachs"]["goods"]["thumb"]); ?>
                        </div>
                        <script>
                            $('#photo_file').on('change', function() {
                                ajaxFileUploads();
                            });
                            function ajaxFileUploads(){
                                $.ajaxFileUpload({
                                    url:'<?php echo U("app/upload/uploadify",array("model"=>"goods","flag"=>3,"type"=>2));?>',
                                    type:'POST',
                                    secureuri:false,
                                    fileElementId:'photo_file',//file标签的id
                                    dataType: 'content',//返回数据的类型
                                    success: function (data, status) {
                                        $("#data_photo").val(data);
                                        $("#photo_img").attr('src', '__ROOT__/attachs/' + data).show();
                                    },
                                    error: function (data, status, e) {
                                        alert(e);
                                    }
                                });
                                $('#photo_file').change(function(e) {//再次绑定
                                    ajaxFileUploads();
                                })
                                return false;
                            }
                        </script>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">详情banner图：</td>
                    <td class="rgTdBt">
                        <div style="width: 300px;height: 100px; float: left;">
                            <input type="hidden" name="data[detail_photo]" value="<?php echo ($detail["detail_photo"]); ?>" id="data_detail_photo" />
                            <input id="detail_photo_file" name="detail_photo_file" type="file" multiple="true" value="" />
                        </div>
                        <div style="width: 300px;height: 100px; float: left;">
                            <img id="detail_photo_img" width="80" height="80"  src="__ROOT__/attachs/<?php echo (($detail["detail_photo"])?($detail["detail_photo"]):'default.jpg'); ?>" />
                            <a href="<?php echo U('setting/attachs');?>">缩略图设置</a>
                            建议尺寸<?php echo ($CONFIG["attachs"]["goods"]["thumb"]); ?>
                        </div>
                        <script>
                            $('#detail_photo_file').on('change', function() {
                                ajaxFileUploads2();
                            });
                            function ajaxFileUploads2(){
                                $.ajaxFileUpload({
                                    url:'<?php echo U("app/upload/uploadify",array("model"=>"goods","flag"=>3,"type"=>2));?>',
                                    type:'POST',
                                    secureuri:false,
                                    fileElementId:'detail_photo_file',//file标签的id
                                    dataType: 'content',//返回数据的类型
                                    success: function (data, status) {
                                        $("#data_detail_photo").val(data);
                                        $("#detail_photo_img").attr('src', '__ROOT__/attachs/' + data).show();
                                    },
                                    error: function (data, status, e) {
                                        alert(e);
                                    }
                                });
                                $('#detail_photo_file').change(function(e) {//再次绑定
                                    ajaxFileUploads2();
                                })
                                return false;
                            }
                        </script>
                    </td>
                </tr>
                <tr>

                    <td class="lfTdBt">



                        更多详情图：

                    </td>

                    <td class="rgTdBt">

                        <div>

                            <input id="logo_file" name="logo_file" type="file" multiple="true" value="" />

                        </div>

                        <div class="jq_uploads_img">

                            <?php if(is_array($photos)): foreach($photos as $key=>$item): ?><span style="width: 200px; height: 120px; float: left; margin-left: 5px; margin-top: 10px;">

                                        <img width="100" height="100" src="__ROOT__/attachs/<?php echo ($item["photo"]); ?>">

                                        <input type="hidden" name="photos[]" value="<?php echo ($item["photo"]); ?>" />

                                        <a href="javascript:void(0);">取消</a>

                                    </span><?php endforeach; endif; ?>

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
                    <td  class="lfTdBt">属性：</td>
                    <td class="rgTdBt">
                        <label><span>认证商家：</span><input type="checkbox" name="data[is_vs1]" value="1" /></label>
                        <label><span style="margin-left: 20px;">正品保证：</span><input type="checkbox" name="data[is_vs2]" value="1" /></label>
                        <label><span style="margin-left: 20px;">假一赔十：</span><input type="checkbox" name="data[is_vs3]" value="1" /></label>
                        <label><span style="margin-left: 20px;">当日送达：</span><input type="checkbox" name="data[is_vs4]" value="1" /></label>
                        <label><span style="margin-left: 20px;">免运费：</span><input type="checkbox" name="data[is_vs5]" value="1" /></label>
                        <label><span style="margin-left: 20px;">货到付款</span><input type="checkbox" name="data[is_vs6]" value="1" /></label>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">市场价格：</td>
                    <td class="rgTdBt"><input type="text" name="data[price]" value="<?php echo (($detail["price"])?($detail["price"]):''); ?>" class="manageInput" />

                    </td>
                </tr><tr>
                <td class="lfTdBt">商城价格：</td>
                <td class="rgTdBt"><input type="text" name="data[mall_price]" value="<?php echo (($detail["mall_price"])?($detail["mall_price"]):''); ?>" class="manageInput" />

                </td>
            </tr>
                <!--<tr>-->
                <!--<td class="lfTdBt">手机下单优惠价格：</td>-->
                <!--<td class="rgTdBt"><input type="text" name="data[mobile_fan]" value="<?php echo (($detail["mobile_fan"])?($detail["mobile_fan"]):''); ?>" class="manageInput" />-->

                <!--</td>-->
                <!--</tr>-->
                <tr>
                    <td class="lfTdBt">结算价格：</td>
                    <td class="rgTdBt"><input type="text" name="data[settlement_price]" value="<?php echo (($detail["settlement_price"])?($detail["settlement_price"]):''); ?>" class="manageInput" />
                        <code>结算价格必须填写，否则该产品不能设置通过审核。</code>
                    </td>
                </tr>
                <!--<tr>-->
                <!--<td class="lfTdBt">推广佣金：</td>-->
                <!--<td class="rgTdBt"><input type="text" name="data[commission]" value="<?php echo (($detail["commission"])?($detail["commission"]):''); ?>" class="manageInput" />-->
                <!--<code>佣金大于0才会出现在推广列表里，不能为负数</code>-->
                <!--</td>-->
                <!--</tr>-->
                <!--<tr>-->
                <!--<td class="lfTdBt">卖出数量：</td>-->
                <!--<td class="rgTdBt"><input type="text" name="data[sold_num]" value="<?php echo (($detail["sold_num"])?($detail["sold_num"]):''); ?>" class="manageInput" />-->

                <!--</td>-->
                <!--</tr>-->
                <tr>
                    <td class="lfTdBt">浏览量：</td>
                    <td class="rgTdBt"><input type="text" name="data[views]" value="<?php echo (($detail["views"])?($detail["views"]):''); ?>" class="manageInput" />

                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">参加活动人数：</td>
                    <td class="rgTdBt"><input type="text" name="data[max_num]" value="<?php echo (($detail["max_num"])?($detail["max_num"]):''); ?>" class="manageInput" />

                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">活动地址：</td>
                    <td class="rgTdBt"><input type="text" name="data[address]" value="<?php echo (($detail["address"])?($detail["address"]):''); ?>" class="manageInput" />
                        <code>活动地址必须填写，否则该产品不能设置通过审核。</code>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">活动坐标：</td>
                    <td class="rgTdBt">
                        经度<input type="text" name="data[longitude]" id="data_lng" value="<?php echo (($detail["longitude"])?($detail["longitude"]):''); ?>" class="scAddTextName w200" />
                        纬度 <input type="text" name="data[latitude]" id="data_lat" value="<?php echo (($detail["latitude"])?($detail["latitude"]):''); ?>" class="scAddTextName w200" />
                        <a style="margin-left: 10px;" mini="select"  w="600" h="600" href="<?php echo U('public/maps');?>" class="seleSj">百度地图</a>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">购买须知：</td>
                    <td class="rgTdBt">
                        <script type="text/plain" id="data_instructions" name="data[instructions]" style="width:800px;height:360px;"><?php echo ($detail["instructions"]); ?></script>
                        </td>
                        </tr>
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
                <tr>
                    <td class="lfTdBt">商品详情：</td>
                    <td class="rgTdBt">
                        <script type="text/plain" id="data_details" name="data[details]" style="width:800px;height:360px;"><?php echo ($detail["details"]); ?></script>
                        </td>
                        </tr>
                        <script>
                        um = UM.getEditor('data_details', {
                            imageUrl: "<?php echo U('app/upload/editor');?>",
                            imagePath: '__ROOT__/attachs/editor/',
                            lang: 'zh-cn',
                            langPath: UMEDITOR_CONFIG.UMEDITOR_HOME_URL + "lang/",
                            focus: false
                        });
                        </script>
                <tr>
                    <td class="lfTdBt">温馨提示：</td>
                    <td class="rgTdBt">
                        <textarea name="data[notice]" rows="10" cols="100"></textarea>
                    </td>
                </tr>
                <!--<tr>-->
                <!--<td class="lfTdBt">过期时间：</td>-->
                <!--<td class="rgTdBt"><input type="text" name="data[end_date]" value="<?php echo (($detail["end_date"])?($detail["end_date"]):''); ?>" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });"  class="inputData" />-->

                <!--</td>-->
                <!--</tr>-->
                <tr>
                    <td class="lfTdBt">活动开始时间：</td>
                    <td class="rgTdBt"><input type="text" name="data[start_time]" value="<?php echo (($detail["start_time"])?($detail["start_time"]):''); ?>" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });"  class="inputData" />

                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">活动结束时间：</td>
                    <td class="rgTdBt"><input type="text" name="data[finaly_time]" value="<?php echo (($detail["finaly_time"])?($detail["finaly_time"]):''); ?>" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });"  class="inputData" />
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">报名截止时间：</td>
                    <td class="rgTdBt"><input type="text" name="data[end_time]" value="<?php echo (($detail["end_time"])?($detail["end_time"]):''); ?>" onfocus="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });"  class="inputData" />

                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">排序：</td>
                    <td class="rgTdBt"><input type="text" name="data[orderby]" value="<?php echo (($detail["orderby"])?($detail["orderby"]):''); ?>" class="manageInput" />

                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">退改类型：</td>
                    <td class="rgTdBt">
                        <select name="data[refund_type]" class="seleFl">
                            <option value="">请选退改类型</option>
                            <?php if(is_array($refund_type)): foreach($refund_type as $key=>$rt): ?><option value="<?php echo ($rt["id"]); ?>"><?php echo ($rt["name"]); ?></option><?php endforeach; endif; ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">活动类型：</td>
                    <td class="rgTdBt">
                        <input type="radio" id="check_radio" name="data[goods_type]" value="1"/>普通活动
                        <input type="radio" id="check_radio2" name="data[goods_type]" value="2"/>团体活动
                    </td>
                </tr>
                <script>
                    $(function(){
                        $("#check_radio").change(function() {
                            $("#display_tr").attr('style','display:none');
                            $("#display_tr2").attr('style','display:none');
                        });
                        $("#check_radio2").change(function() {
                            $("#display_tr").attr('style','display:both');
                            $("#display_tr2").attr('style','display:both');
                        });
                    });
                </script>
                <tr id="display_tr" style="display:none">
                    <td class="lfTdBt">指派老师：</td>
                    <td class="rgTdBt">
                        <a mini="select"  w="1000" h="600" href="<?php echo U('user/teacher');?>" class="remberBtn">指派老师</a>
                    </td>

                </tr>
                <tr id="display_tr2" style="display:none">
                    <td class="lfTdBt">已指派老师：</td>
                    <td class="rgTdBt">
                        <input type="hidden" name="data[user_id]" id="user_id" value=""/>
                        <input type="text" name="user_name" id="user_name" value="暂无" style="width:400px;text-align:left;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px" readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">入园日期：</td>
                    <td class="rgTdBt">
                        <input type="radio" name="data[is_service_time]" value="1"/>需要
                        <input type="radio" name="data[is_service_time]" value="2"/>不需要
                    </td>
                </tr>
            </table>
            <div class="submit-btn">
                <input type="submit" value="确认添加" class="smtQrIpt" />
                <div>
        </form>
    </div>
</div>

</div>
</body>
</html>