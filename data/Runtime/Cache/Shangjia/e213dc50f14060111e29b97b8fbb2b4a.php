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
    body{
        background-color: rgba(228, 228, 228, 1);
    }
    *{
        box-sizing: border-box;
        color: #6B6B6B;
        font-family: '微软雅黑';
    }
    .w{
        width: 100%;
        min-width: 1300px;
        /* margin: 20px 0 0 190px; */
    }
    .status{
        background: white;
        height: 200px;
        padding: 20px 30px;
    }
    .status h3{
        font-size: 16px;
    }
    .status p{
        font-size: 14px;
        margin: 20px 0 30px 0;
    }
    .status button{
        font-size: 12px;
        width: 140px;
        /* height: 40px; */
        text-align: center;
        line-height: 40px;
        background: white;
        outline: none;
        border: 1px solid rgb(121, 121, 121);
        cursor: pointer;
        border-radius: 4px;
    }
    .msg{
        height: 740px;
        background: white;
        margin-top:10px;
        padding: 20px 30px; 
    }
    .msg h3{
        font-size: 16px;
        margin-bottom:25px; 
    }
    .msg .info{
        margin-bottom: 40px;
    }
    .msg .info span{
        font-size: 14px;
    }
    .msg .info .phone{
        margin-left: 140px;
    }
    .fl{
        float: left;
    }
    .msg .activity{
        overflow: hidden;
        font-size: 14px;
        margin-bottom: 40px;
    }
    .msg .activity .name{
        width: 800px;
    }
    .msg .activity .price{
        width: 180px;
    }
    .msg .activity .total span,
    .msg .activity .price span{
        font-size: 14px;
        display: block;
        margin-top: 49px;
    }
    .msg .activity .total{
        overflow: hidden;
    }
    .msg .activity p{
        border-bottom: 1px solid #b5b6b5;
        line-height: 40px;
        margin-bottom: 10px;
        font-size: 14px;
    }
    .msg .activity .name .pic{
        width: 120px;
        height: 90px;
        background: white;
    }
    .msg .activity .name .pic img{
        width: 100%;
        height: 100%;
    }
    .msg .activity .name section{
        overflow: hidden;
        padding-left: 20px;
        padding-right: 20px;
    }
    .msg .activity .name section .actName{
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }
    .msg .activity .name section div{
        margin-bottom: 20px;
        font-size: 14px;
    }
    .order{
        
    }
    .pay{
        float: right;
        width: 454px;
    }
    .order div,
    .pay div{
        font-size: 14px;
        margin-bottom: 20px;
    }
    .pay div{
        padding-left: 50px;
    }
    .pay .last{
        padding-left: 36px;
    }
    .pay .coupon{
        border-bottom: 1px solid #6B6B6B;
        padding-bottom: 12px;
        margin-bottom: 10px;
    }
</style>
<div class="w status">
    <h3>订单状态</h3>
    <p>当前订单状态：<?php echo ($info["status_name"]); ?></p>
    <?php if($info["remark"] != ''): ?><p>备注：<?php echo ($info["remark"]); ?></p><?php endif; ?>
</div>
<div class="msg w">
    <div class="inner">
        <div class="info">
            <h3>订单信息</h3>
            <span>会员昵称：<?php echo ($info["nickname"]); ?></span><span class="phone">联系电话：<?php echo ($info["mobile"]); ?></span>
        </div>
        <div class="activity">
            <div class="fl name">
                <p>活动名称</p>
                <div class="pic fl">
                    <img src="__ROOT__/attachs/<?php echo ($info["photo"]); ?>" alt="">
                </div>
                <section>
                    <div class="actName"><?php echo ($info["title"]); ?></div>
                    <div>活动起止时间：<?php echo (date('Y-m-d H:i:s',$info["start_time"])); ?> 至 <?php echo (date('Y-m-d H:i:s',$info["finaly_time"])); ?></div>
                    <!--<div>报名截止时间：-</div>-->
                </section>
            </div>
            <div class="fl price">
                <p>活动价格</p>
                <span>￥ <?php echo ($info["original_price"]); ?></span>
            </div>
            <div class="total">
                <p>小计（元）</p>
                <span><?php echo ($info["total_price"]); ?></span>
            </div>
        </div>
        <div class="order fl">
            <div>订单编号：<?php echo ($order_id); ?></div>
            <div>订单时间：<?php echo ($info["created_at"]); ?></div>
            <div>付款时间：<?php echo (date('Y-m-d H:i:s',$info["pay_time"])); ?></div>
        </div>
        <div class="pay">
            <div>活动小计：2370.00</div>
            <div>支付方式：微信支付</div>
            <div class="coupon">订单促销：-100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 优惠券</div>
            <div class="last">订单实收款：2270.00元</div>
        </div>
    </div>
</div>
</body>
</html>