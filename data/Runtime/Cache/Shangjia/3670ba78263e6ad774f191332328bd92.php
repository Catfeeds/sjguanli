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
<div class="sjgl_lead">
    <ul>
        <li><a href="#">结算</a> > <a href="">资金记录</a> > <a>商家资金</a></li>
    </ul>
</div>
<div class="tuan_content">
    <form method="post" action="<?php echo U('money/shopmoney');?>">
    <div class="radius5 tuan_top">
        <div class="tuan_top_t">
            <div class="left tuan_topser_l">
             开始时间：<input type="text" class="radius3 tuan_topser"  name="bg_date" value="<?php echo (($bg_date)?($bg_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd'});"/>
            结束时间：<input type="text" class="radius3 tuan_topser"  name="end_date" value="<?php echo (($end_date)?($end_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd'});"/>       
            <input type="submit" style="margin-left:10px;" class="radius3 sjgl_an tuan_topbt" value="搜 索"/>
            </div>
        </div>
    </div>
    </form>
    <div class="tuanfabu_tab">
        <ul>
            <li class="tuanfabu_tabli"><a href="<?php echo U('money/index');?>">余额日志</a></li>
            <li class="tuanfabu_tabli on"><a href="<?php echo U('money/shopmoney');?>">商家资金</a></li>
            <li class="tuanfabu_tabli"><a href="<?php echo U('money/tjmonth');?>">月统计明细</a></li>
            <li class="tuanfabu_tabli"><a href="<?php echo U('money/tjday');?>">日结算趋势</a></li>
        </ul>
    </div> 
    <table class="tuan_table" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr style="background-color:#eee;">
            <td>资金</td>
            <td>类型</td>
            <td>原始订单</td>
            <td>说明</td>
            <td>日期</td>
        </tr>
        <?php if(is_array($list)): foreach($list as $key=>$var): ?><tr>
                <td><?php echo round($var['money']/100,2);?></td>
                <td><?php if($var['type'] == 'tuan'): ?>抢购<?php elseif($var['type'] == 'goods'): ?>购物<?php elseif($var['type'] == 'ele'): ?>订餐<?php else: ?>订座<?php endif; ?></td>
                <td><?php echo ($var["order_id"]); ?></td>       
                <td><?php echo ($var["intro"]); ?></td>
                <td><?php echo (date('Y-m-d H:i:s',$var["create_time"])); ?></td>
                
            </tr><?php endforeach; endif; ?>
    </table>
    <div class="paging">
        <?php echo ($page); ?>
    </div>
</div>

</body>
</html>