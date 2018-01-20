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
<style>
    .contain {
        padding: 0 32px;
    }
    .activity_info {
        padding: 26px 0;
        font-family: PingFangHK-Regular;
        font-size: 14px;
        color: #364A5E;
        letter-spacing: 0;
        border-bottom: 1px solid #EAF0F6;
        position: relative;
    }
    .activity_info .activity_name {
        line-height: 20px;
    }
    .activity_info .order_info .order_num {
        font-size: 20px;
        color: #ff788d;
        letter-spacing: 0;
        line-height: 20px;
    }
    .activity_info .export_data {
        position: absolute;
        top: 19px;
        right: 0;
        width: 112px;
        height: 34px;
        border-radius: 3px;
        background: #0ECEAF;
        color: #ffffff;
        text-align: center;
        line-height: 34px;
    }
    .activity_info .export_data i {
        display: inline-block;
        width: 12px;
        height: 12px;
        transform: rotateZ(-90deg);
        margin-right: 6px;
        background: url("__TMPL__statics/images/icon_exit16x16.png") center/cover no-repeat;
    }
    .search {
        padding: 24px 0;
        font-family: PingFangHK-Regular;
        font-size: 14px;
        color: #364A5E;
        letter-spacing: 0;
    }
    .search .order_sub {
        width: 80px;
        margin-left: 16px;
        box-sizing: border-box;
    }
</style>
<div class="contain">
    <div class="activity_info">
        <p class="activity_name">活动名称: <span>户外小小魔术师</span></p>
        <div class="export_data"><i></i>导出数据</div>
    </div>
    <div class="search">
        订单编号 : <input type="text" class="radius3 tuan_topser mar" style="width:180px;margin-left: 8px;margin-right: 32px" />
        选择时间 : <input type="text" class="radius3 tuan_topser" name="bg_date" value="<?php echo (($bg_date)?($bg_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});" style="width:180px;margin-left:8px" />
        <span class="wave">~</span>
        <input type="text" class="radius3 tuan_topser" name="end_date" value="<?php echo (($end_date)?($end_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});" style="width:180px" />
        <input type="submit" class="order_sub radius3 sjgl_an tuan_topbt" value="查询" />
    </div>
    <table class="tuan_table" border="0" width="100%" cellspacing="0" cellpadding="0">
        <tbody>
            <tr class="first_tr">
            <!--<td>-->
            <!--<input type="checkbox" class="checkAll" rel="order_id" />-->
            <!--</td>-->
                <td>订单编号</td>
                <td class="arrow arrow1">下单时间
                    <span>
                        <i></i>
                        <s></s>
                    </span>
                </td>
                <td>类型</td>
                <td class="arrow arrow1">收入
                    <span>
                        <i></i>
                        <s></s>
                    </span>
                </td>
                <td class="arrow arrow1">支出
                    <span>
                        <i></i>
                        <s></s>
                    </span>
                </td>
            </tr>
            <script>
                $(function () {
                    arrow('arrow1')
                    arrow('arrow2')
                    function arrow(name) {
                        var i = 0;
                        $('.'+name+'').on('click', function () {
                            i++;
                            console.log(this.childNodes)
                            if (i % 2) {
                                this.childNodes[1].className = 'ascending';
                            } else {
                                this.childNodes[1].className = 'descending';
                            }
                        })
                    }
                })
            </script>
                <tr>
                    <!--<td>-->
                    <!--<input class="child_order_id" type="checkbox" name="order_id[]" value="<?php echo ($var["order_id"]); ?>" />-->
                    <!--</td>-->
                    <td>
                        D2017120848529910518
                    </td>
                    <td>
                        2017-10-01 16:34:08
                    </td>
                    <td>
                        活动收入
                    </td>
                    <td style="color: #1D99F9;">
                        +128.00
                    </td>
                    <td style="color:#FF788D;">
                        -128.00
                    </td>
                </tr>
                <tr>
                    <td>
                        D2017120848529910518
                    </td>
                    <td>
                        2017-10-01 16:34:08
                    </td>
                    <td>
                        活动收入
                    </td>
                    <td style="color: #1D99F9;">
                        +128.00
                    </td>
                    <td style="color:#FF788D;">
                        -128.00
                    </td>
                </tr>
        </tbody>
    </table>
    <?php echo ($page); ?>
</div>
</body>
</html>