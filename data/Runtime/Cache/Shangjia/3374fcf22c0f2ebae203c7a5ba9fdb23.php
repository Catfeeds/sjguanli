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
    * {
        box-sizing: border-box;
    }
    /* table,form{
        min-width: 1110px;
    } */
    /* .tuan_content {
        padding: 30px 1%;
        margin: 0 auto;
    }

    .tuanfabu_tabli.on {
        border-left: none;
        border-top: none;
        background-color: #ffffff;
        background: #1D99F9;
        border-radius: 3px;
    }

    .tuanfabu_tabli.on a {
        color: #fff;
    }

    .tuanfabu_tab {
        padding-bottom: 20px;
    }

    .tuanfabu_tabli {
        padding: 0 15px;
        height: 30px;
        border: none;
        border-bottom: none 0;
        background-color: #fff;
        float: left;
        margin: 0;
        margin-right: 12px;
    }

    .tuan_top_t {
        border-bottom: none;
    }

    .tuan_topser_l {
        border-left: none;
    } */
    /* .tuan_top_t {
        position: relative;
        transform: translate(-15px);
        padding: 0;
    } */
    /* .wave {
        font-size: 20px;
        margin: 0 5px;
    } */
    /* .tuan_table tr {
        border: none;
        border-bottom: solid 1px #EAF0F6;
        border-radius: 4px;
        overflow: hidden;
    } */

    .mar {
        margin: 0 28px 0 8px;
    }

    .act {
        width: 300px!important;
    }
    /* .tuan_topser {
        border-radius: 3px;
    }

    .tuan_topbt {
        border: 1px solid #A4B4C4;
        background-color: #fff;
        color: #364A5E;
        margin-left: 30px!important;
        border-radius: 3px;
    } */
    /* .tuan_table tr:first-child td{
        padding: 17px 0;
    } */

    .tuan_table tr td input {
        outline: none;
        border: 1px solid rgb(17, 139, 240);
        background: red;
    }
    /* .tuan_table {
        border: none;
    }

    .tuan_table td {
        padding: 20px 0;
    }

    .tuan_table {
        text-align: left;
    } */

    .tuan_table tr td:nth-child(1) {
        padding-left: 20px!important;
        /* width: 50px; */
    }

    .tuan_table tr td {
        padding-left: 30px!important;
        padding-right: 14px!important;
    }

    .tuan_table tr td:nth-child(2) {
        /* padding-left: 10px!important; */
    }

    .tuan_table tr td:nth-child(2)::before {
        /* display: none; */
    }

    .tuan_table tr td:nth-child(3) {
        /* padding-right: 40px!important; */
        /* width: 130px; */
    }

    .tuan_table tr td:nth-child(4) {
        /* width: 130px; */
    }

    .tuan_table tr td:nth-child(5) {
        padding-right: 30px!important;
    }

    .tuan_table tr td:nth-child(6) {
        /* width: 130px; */
    }

    .tuan_table tr td:nth-child(7) {
        /* width: 180px; */
    }

    .tuan_table tr td:nth-child(8) {
        /* width: 110px; */
    }

    input[type='text'] {
        height: 34px;
        margin-bottom: 16px;
    }

    input[type='checkbox'] {
        position: relative;
        transform: translateY(2px);
    }

    .tuan_top {
        margin-bottom: 4px;
    }

    .tuan_topser_l select {
        width: 180px;
        height: 34px;
        margin: 0 28px 0 10px;
        border: 1px solid #dbdbdb;
        /* color: #A4B4C4 ; */
        color: #C8D5E0;
        border-radius: 4px;
        padding-left: 5px;
    }

    .tuan_topser_l select option {
        height: 34px;
        color: #304B5D;
    }

    table,
    form {
        min-width: 1200px;
    }
</style>
<!-- <div class="sjgl_lead">
    <ul>
        <li>
            <a href="#">商家管理</a> >
            <a href="">商城</a> >
            <a>卖出商品</a>
        </li>
    </ul>
</div> -->
<div class="tuan_content">
    <form method="get" action="<?php echo U('order/index');?>">
        <div class="tuanfabu_tab">
            <ul>
                <li class="tuanfabu_tabli <?php if($type == 1): ?>on<?php endif; ?>">
                    <a href="<?php echo U('order/index',array('type'=>1));?>">全部订单</a>
                </li>
                <li class="tuanfabu_tabli <?php if($type == 2): ?>on<?php endif; ?>">
                    <a href="<?php echo U('order/index',array('type'=>2));?>">待使用</a>
                </li>
                <li class="tuanfabu_tabli <?php if($type == 3): ?>on<?php endif; ?>">
                    <a href="<?php echo U('order/index',array('type'=>3));?>">已使用</a>
                </li>
                <li class="tuanfabu_tabli <?php if($type == 4): ?>on<?php endif; ?>">
                    <a href="<?php echo U('order/index',array('type'=>4));?>">退款</a>
                </li>
            </ul>
        </div>
        <div class="radius5 tuan_top">
            <div class="tuan_top_t">
                <div class="left tuan_topser_l">活动名称：
                    <!-- <input type="text" placeholder="请输入活动名称或关键词" name="title" value="<?php echo ($title); ?>" class="radius3 tuan_topser mar act" style="width:180px"/> -->
                    <select class="select" name="goods_id">
                        <option value="-1">请选择要查询的活动</option>
                        <?php if(is_array($arrs)): foreach($arrs as $key=>$vs): ?><option value="<?php echo ($vs["goods_id"]); ?>" <?php if(($goods_id) == $vs["goods_id"]): ?>selected="selected"<?php endif; ?>>
                                <?php echo ($vs["title"]); ?>
                            </option><?php endforeach; endif; ?>
                    </select>
                    <script>
                        $(function () {
                            console.log($('.select').val(),1)
                            if($('.select').val()!='-1'){
                                $('.select').css('color', '#304B5D')
                            }
                            $('.select').on('change', function () {
                                $('.select').css('color', '#304B5D')
                            })
                        })
                    </script>
                    订单编号：
                    <input type="text" name="order_id" value="<?php echo ($order_id); ?>" class="radius3 tuan_topser mar" style="width:180px" /> 客户名称：
                    <input type="text" placeholder="请输入客户名称" name="nickname" value="<?php echo ($nickname); ?>" class="radius3 tuan_topser mar" style="width:180px"
                    />
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;客户电话：
                    <input type="text" placeholder="请填写客户的电话号码" name="mobile" value="<?php echo ($mobile); ?>" class="radius3 tuan_topser mar" style="width:180px"
                    />选择时间：
                    <input type="text" class="radius3 tuan_topser" name="bg_date" value="<?php echo (($bg_date)?($bg_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"
                        style="width:180px;margin-left:8px" />
                    <span class="wave">~</span>
                    <input type="text" class="radius3 tuan_topser" name="end_date" value="<?php echo (($end_date)?($end_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"
                        style="width:180px" />
                    <!--订单状态：<select name="status" class="radius3 tuan_topser" style="width:180px">-->
                    <!--<option value="">请选择订单状态</option>-->
                    <!--<?php if(is_array($status_type)): foreach($status_type as $k=>$vs): ?>-->
                    <!--<option value="<?php echo ($k); ?>" <?php if(($k) == $status): ?>selected="selected"<?php endif; ?>><?php echo ($vs); ?></option>-->
                    <!--<?php endforeach; endif; ?>-->
                    <!--</select>-->
                    <input type="submit" style="margin-left:10px;" class="radius3 sjgl_an tuan_topbt" value="查询" />
                </div>
            </div>
        </div>
    </form>
    <table class="tuan_table" border="0" width="100%" cellspacing="0" cellpadding="0">
        <tbody>
            <tr class="first_tr">
                <!-- <td>
                    <input type="checkbox" class="checkAll" rel="order_id" />
                </td> -->
                <td>订单编号</td>
                <td>
                    活动名称</td>
                <td class="arrow arrow1">
                    订单金额
                    <span>
                        <i></i>
                        <s></s>
                    </span>
                </td>
                <td>
                    用户昵称</td>
                <td>
                    用户电话</td>
                <td class="arrow arrow2">
                    提交时间
                    <span>
                        <i></i>
                        <s></s>
                    </span>
                </td>
                <td>
                    状态</td>
                <!-- <td>操作</td> -->
            </tr>
            <script>
                $(function () {
                    arrow('arrow1')
                    arrow('arrow2')

                    function arrow(name) {
                        var i = 0;
                        $('.' + name + '').on('click', function () {
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
            <?php if(is_array($list)): foreach($list as $key=>$var): ?><tr>
                    <!-- <td>
                        <input class="child_order_id" type="checkbox" name="order_id[]" value="<?php echo ($var["order_id"]); ?>" />
                    </td> -->
                    <td>
                        <a href="<?php echo U('order/detail',array('order_id'=>$var['order_id']));?>" style="color:dodgerblue">
                            <?php echo ($var["order_id"]); ?>
                        </a>
                    </td>
                    <td>
                        <?php echo ($var["title"]); ?>
                    </td>
                    <td>
                        <?php echo ($var["total_price"]); ?>
                    </td>
                    <td>
                        <?php echo ($var["nickname"]); ?>
                    </td>
                    <td>
                        <?php echo ($var["mobile"]); ?>
                    </td>
                    <td>
                        <?php echo ($var["created_at"]); ?>
                    </td>
                    <td>
                        <?php if($var["status"] == 0): ?>未付款
                            <?php elseif($var["status"] == 1): ?>已付款待出票
                            <?php elseif($var["status"] == 2): ?>已出票
                            <?php elseif($var["status"] == 3): ?>已核销
                            <?php elseif($var["status"] == 10): ?>申请退款
                            <?php elseif($var["status"] == 12): ?>退款中
                            <?php elseif($var["status"] == 15): ?>退款完成
                            <?php else: endif; ?>
                    </td>
                </tr><?php endforeach; endif; ?>
        </tbody>
    </table>
    <?php echo ($page); ?>
</div>

</body>
</html>