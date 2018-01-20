<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo ($CONFIG["site"]["title"]); ?>商户中心</title>
<meta name="description" content="<?php echo ($CONFIG["site"]["title"]); ?>商户中心" />
<meta name="keywords" content="<?php echo ($CONFIG["site"]["title"]); ?>商户中心" />
<!-- <link href="__TMPL__statics/css/newstyle.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="../tatics/css/newstyle.css" rel="stylesheet" type="text/css" /> -->
<link rel="stylesheet" href="__PUBLIC__/css/common.css">


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
<div class="poptip"></div>
<div class="popmask"></div>
<iframe id="baocms_frm" name="baocms_frm" style="display:none;"></iframe>
<script src="__PUBLIC__/js/my97/WdatePicker.js"></script>
<style>
    /*.balance{*/
        /*!* padding: 20px; *!*/
        /*color: #6B6B6B;*/
        /*height: 130px;*/
        /*background: white;*/
    /*}*/
    /*.balance p{*/
        /*font-size: 20px;*/
        /*margin-bottom: 30px;*/
    /*}*/
    /*.balance>div{*/
        /*float: left;*/
    /*}*/
    /*.balance>div div{*/
        /*font-size: 14px;*/
    /*}*/
    /*.balance>div div img{*/
        /*vertical-align: middle;*/
    /*}*/
    /*.balance .price{*/
        /*margin-right: 30px;*/
        /*margin-left: 40px;*/
    /*}*/
    /*.balance .price span{*/
        /*font-weight: 700;*/
    /*}*/
    .contain {
        padding: 0 32px;
    }
    .activity_info {
        padding: 30px 0 28px;
        font-family: PingFangHK-Regular;
        font-size: 14px;
        color: #364A5E;
        letter-spacing: 0;
        border-bottom: 1px solid #EAF0F6;
        position: relative;
    }
    .activity_info .activity_name {
        line-height: 20px;
        margin-bottom: 6px;
    }
    .activity_info .order_info .order_num {
        font-size: 20px;
        color: #ff788d;
        letter-spacing: 0;
        line-height: 20px;
    }
    .activity_info .export_data {
        position: absolute;
        top: 39px;
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
<!--活动名称-->
<form method="post" action="<?php echo U('money/balance');?>">
<input type="hidden" name="goods_id" value="<?php echo ($goods_id); ?>"/>
<input type="hidden" name="title" value="<?php echo ($title); ?>"/>
<div class="contain">
    <div class="activity_info">
        <p class="activity_name">活动名称: <span><?php echo ($title); ?></span></p>
        <p class="order_info">
            <span>预计待结算订单总数：<span class="order_num"><?php echo ($dcount); ?></span>个</span><span style="margin-left: 25px">预计待结算总金额：<span class="order_num"><?php echo ($sum); ?></span>元</span>
        </p>
        <div class="export_data"><i></i>导出数据</div>
    </div>
    <div class="search">
        订单编号 : <input type="text" class="radius3 tuan_topser mar" style="width:180px;margin-left: 8px;margin-right: 32px" />
        选择时间 : <input type="text" class="radius3 tuan_topser" name="bg_date" value="<?php echo (($bg_date)?($bg_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});" style="width:180px;margin-left:8px" />
                    <span class="wave">~</span>
                    <input type="text" class="radius3 tuan_topser" name="end_date" value="<?php echo (($end_date)?($end_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});" style="width:180px" />
        结算状态 : <select name="is_balance" class="radius3 tuan_topser mar" style="width:180px;margin-left: 8px;margin-right: 32px">
                        <option value="0">请选择结算状态</option>
                        <option value="1" <?php if($is_balance == 1): ?>selected="selected"<?php endif; ?>>待结算</option>
                        <option value="2" <?php if($is_balance == 2): ?>selected="selected"<?php endif; ?>>待审核</option>
                        <option value="3" <?php if($is_balance == 3): ?>selected="selected"<?php endif; ?>>审核不通过</option>
                        <option value="10" <?php if($is_balance == 10): ?>selected="selected"<?php endif; ?>>已结算</option>
                   </select>
        <input type="submit" class="order_sub radius3 sjgl_an tuan_topbt" value="查询" />
    </div>
    <table class="tuan_table" border="0" width="100%" cellspacing="0" cellpadding="0">
        <tbody>
        <tr class="first_tr">
            <!--<td>-->
                <!--<input type="checkbox" class="checkAll" rel="order_id" />-->
            <!--</td>-->
            <td>订单编号</td>
            <td class="arrow arrow1">
                下单时间
                <span>
                        <i></i>
                        <s></s>
                </span>
            </td>
            <td>客户名称</td>
            <td>联系电话</td>
            <td class="arrow arrow1">结算金额
                <span>
                        <i></i>
                        <s></s>
                </span>
            </td>
            <td>订单状态</td>
            <!-- <td>操作</td> -->
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
        <?php if(is_array($list)): foreach($list as $key=>$var): ?><tr>
            <td><?php echo ($var["order_id"]); ?></td>
            <td><?php echo ($var["created_at"]); ?></td>
            <td><?php echo ($var["nickname"]); ?></td>
            <td><?php echo ($var["mobile"]); ?></td>
            <td><?php echo ($var["total_price"]); ?></td>
            <td>
                <?php if($var["is_balance"] == '1'): ?>待结算<?php endif; ?>
                <?php if($var["is_balance"] == '2'): ?>待审核<?php endif; ?>
                <?php if($var["is_balance"] == '3'): ?>审核不通过<?php endif; ?>
                <?php if($var["is_balance"] == '10'): ?>已结算<?php endif; ?>
            </td>
        </tr><?php endforeach; endif; ?>
        </tbody>
    </table>
    <?php echo ($page); ?>
</div>
</form>
<!--<div class="sjgl_lead">-->
    <!--<ul>-->
        <!--<li><a href="#">活动销售详情</a></li>-->
    <!--</ul>-->
<!--</div>-->
<!--<div class="tuan_content">-->

    <!--<div class="balance">-->
        <!--<p>活动名称：<?php echo ($title); ?></p>-->
        <!--<div style="border:1px solid #ff0000;width:100%;height:60px;background-color:#f0f0f0">-->
            <!--<div style="width:100%;margin-top:20px;margin-left:30px">-->
                <!--预计待结算订单总数:<span style="color:#FF6600">99笔</span>&nbsp;&nbsp;&nbsp;&nbsp;预计待结算金额:<span style="color:#FF6600">9999</span>元</div>-->
        <!--</div>-->
    <!--</div>-->
    <!--<form method="post" action="<?php echo U('money/balance');?>">-->
        <!--<input type="hidden" name="goods_id" value="<?php echo ($goods_id); ?>"/>-->
        <!--<input type="hidden" name="title" value="<?php echo ($title); ?>"/>-->
    <!--<div class="radius5 tuan_top">-->
        <!--<div class="tuan_top_t">-->
            <!--<div class="left tuan_topser_l">-->
             <!--订单日期：<input type="text" class="radius3 tuan_topser"  name="bg_date" value="<?php echo (($bg_date)?($bg_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"/>-->
            <!--至&nbsp;<input type="text" class="radius3 tuan_topser"  name="end_date" value="<?php echo (($end_date)?($end_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"/>-->
            <!--订单编号：<input type="text" class="radius3 tuan_topser" name="order_id" value="<?php echo ($order_id); ?>"/>-->
            <!--<input type="submit" style="margin-left:10px;" class="radius3 sjgl_an tuan_topbt" value="搜 索"/>-->
            <!--</div>-->
        <!--</div>-->
    <!--</div>-->
    <!--</form>-->
    <!--<div class="tuanfabu_tab">-->
        <!--&lt;!&ndash;<ul>&ndash;&gt;-->
        <!--&lt;!&ndash;<li class="tuanfabu_tabli on"><a href="<?php echo U('money/index');?>">余额日志</a></li>&ndash;&gt;-->
        <!--&lt;!&ndash;<li class="tuanfabu_tabli"><a href="<?php echo U('money/shopmoney');?>">商家资金</a></li>&ndash;&gt;-->
        <!--&lt;!&ndash;<li class="tuanfabu_tabli"><a href="<?php echo U('money/tjmonth');?>">月统计明细</a></li>&ndash;&gt;-->
        <!--&lt;!&ndash;<li class="tuanfabu_tabli"><a href="<?php echo U('money/tjday');?>">日结算趋势</a></li>&ndash;&gt;-->
        <!--&lt;!&ndash;</ul>&ndash;&gt;-->
    <!--</div>-->
    <!--<table class="tuan_table" width="100%" border="0" cellspacing="0" cellpadding="0">-->
        <!--<tr style="background-color:#eee;">-->
            <!--<td>订单编号</td>-->
            <!--<td>下单时间</td>-->
            <!--<td>客户名称</td>-->
            <!--<td>联系电话</td>-->
            <!--<td>状态</td>-->
            <!--<td>结算金额</td>-->
        <!--</tr>-->
        <!--<?php if(is_array($list)): foreach($list as $key=>$var): ?>-->
            <!--<tr>-->
                <!--<td><?php echo ($var["order_id"]); ?></td>-->
                <!--<td><?php echo ($var["created_at"]); ?></td>-->
                <!--<td><?php echo ($var["nickname"]); ?></td>-->
                <!--<td><?php echo ($var["mobile"]); ?></td>-->
                <!--<td>-->
                    <!--<?php if($var["status"] == '1'): ?>待结算<?php endif; ?>-->
                    <!--<?php if($var["status"] == '2'): ?>待审核<?php endif; ?>-->
                    <!--<?php if($var["status"] == '3'): ?>审核不通过<?php endif; ?>-->
                    <!--<?php if($var["status"] == '10'): ?>已结算<?php endif; ?>-->
                <!--</td>-->
                <!--<td><?php echo ($var["total_price"]); ?></td>-->
            <!--</tr>-->
        <!--<?php endforeach; endif; ?>-->
    <!--</table>-->
    <!--<div class="paging">-->
        <!--<?php echo ($page); ?>-->
    <!--</div>-->
<!--</div>-->

</body>
</html>