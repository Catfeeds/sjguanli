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
<style>
    .sy_content {
        padding: 0;
        background: #f5f5f5;
        height: 1000px;
    }
    .sy_top {
        height: 176px;
        background: #ffffff;
    }
    .sy_top ul {
        height: 100%;
        line-height: 176px;
    }
    .sy_top ul li {
        margin-top: 76px;
        width: 25%;
        text-align: center;
        float: left;
        box-sizing: border-box;
        height: 24px;
        border-right: 1px solid  #C8D5E0;
    }
    .sy_top ul li:last-child {
        border-right: none;
    }
    .sy_top ul li div {
        height: 70px;
        margin-top: -20px;
    }
    .sy_top ul li div p:first-child {
        font-family: PingFangHK-Regular;
        font-size: 36px;
        letter-spacing: 0;
        line-height: 42px;
    }
    .sy_top ul li div p:last-child {
        font-family: PingFangHK-Regular;
        font-size: 14px;
        color: #C8D5E0;
        letter-spacing: 0;
        line-height: 28px;
    }
    .sy_center {
        height: 112px;
        margin-top: 12px;
        background: #ffffff;
    }
    .sy_center ul {
        display: flex;
        justify-content: space-between;
        padding: 16px;
    }
    .sy_center ul li {
        flex: 1;
        box-sizing: content-box;
        margin-right: 16px;
        height: 80px;
        background: #000;
        border-radius: 3px;
        font-family: PingFangHK-Regular;
        font-size: 18px;
        color: #FFFFFF;
        letter-spacing: 0;
        line-height: 80px;
        text-align: center;
    }
    .sy_center ul li a {
        display: block;
        width: 100%;
        height: 100%;
        font-size: 18px;
        color: #FFFFFF;
        cursor: pointer;
    }
    .sy_center ul li a i {
        width: 14px;
        height: 14px;
        display: inline-block;
        margin-right: 8px;

    }
    .sy_center ul li:first-child a i {
        background: url("__TMPL__statics/images/icon_release14x14.png") center/cover no-repeat;
    }
    .sy_center ul li:nth-child(2) a i {
        background: url("__TMPL__statics/images/icon_daishiyong14x14.png") center/cover no-repeat;
    }
    .sy_center ul li:nth-child(3) a i {
        background: url("__TMPL__statics/images/icon_shenqingjiesuan14x14.png") center/cover no-repeat;
    }
    .sy_center ul li:nth-child(4) a i {
        background: url("__TMPL__statics/images/icon_tianjiayuangong14x1.png") center/cover no-repeat;
    }
    .sy_center ul li:first-child {
        background-image: linear-gradient(-90deg, #FF82CE 0%, #FF6D97 100%);
    }
    .sy_center ul li:nth-child(2) {
        background-image: linear-gradient(90deg, #6D80FF 0%, #26D0FD 100%);
    }
    .sy_center ul li:nth-child(3) {
        background-image: linear-gradient(90deg, #707CFF 0%, #FA83EE 100%);
    }
    .sy_center ul li:last-child {
        margin-right: 0;
        background-image: linear-gradient(90deg, #07B0E9 0%, #2AF39B 100%);
    }
    .sy_footer {
        height: 364px;
        margin-top: 16px;
        display: flex;
    }
    .sy_footer .syf_left,.sy_footer .syf_right {
        box-sizing: border-box;
        background: #ffffff;
        width: 1040px;
        margin-right: 16px;
        padding: 106px 154px 52px 48px;
        position: relative;
    }
    .sy_footer .release_activities {
        position: absolute;
        left: 48px;
        top: 32px;
        width: 70px;
        height: 20px;
        padding: 7px 28px 5px 38px;
        background: #F5F8FB;
        border-radius: 3px;
        font-family: PingFangHK-Regular;
        font-size: 14px;
        color: #364A5E;
        letter-spacing: 0;
        line-height: 20px;
        text-align: center;
    }
    .sy_footer .release_activities i {
        position: absolute;
        top: 9px;
        left: 16px;
        display: inline-block;
        width: 14px;
        height: 14px;
        margin-right: 8px;

    }
    .sy_footer .syf_left .release_activities i {
        background: url("__TMPL__statics/images/title_yifabu14x14.png") center/cover no-repeat;
    }
    .sy_footer .syf_right .release_activities i {
        background: url("__TMPL__statics/images/title_kejiesuan14x14.png") center/cover no-repeat;
    }
    .sy_footer ul {
        display: flex;
        justify-content: left;
        height: 100%;
    }
    .sy_footer ul li {
        width: 112px;
        height: 100%;
        font-size: 14px;
        color: #A4B4C4;
        letter-spacing: 0;
        line-height: 20px;
        font-family: PingFangHK-Regular;
        margin-right: 130px;
    }
    .sy_footer ul li:last-child {
        margin-right: 0;
    }
    .sy_footer .syf_right ul li {
        margin-right: 70px;
    }
    .sy_footer .syf_right ul li:last-child {
        margin-right: 0;
    }
    .sy_footer ul li p:first-child {
        font-family: PingFangHK-Regular;
        height: 44px;
        overflow:hidden;
        text-overflow:ellipsis;
        -o-text-overflow:ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        font-size: 16px;
        color: #364A5E;
        letter-spacing: 0;
        line-height: 22px;
        margin-bottom: 24px;
    }
    .sy_footer ul li p:nth-child(3) {
        font-family: PTSans-Caption;
        font-size: 26px;
        color: #364A5E;
        letter-spacing: 0;
        line-height: 37px;
        margin-top: 6px;
        margin-bottom: 12px;
    }
    .sy_footer .syf_right ul li p:nth-child(3) {
        color: #FDBE39;
        font-size: 20px;
    }
    .sy_footer .syf_right ul li p:nth-child(3) span {
        font-size: 14px;
    }
    .sy_footer ul li p:last-child {
        font-family: PTSans-Caption;
        font-size: 26px;
        color: #FF7089;
        letter-spacing: 0;
        line-height: 37px;
    }
    .sy_footer .arrow {
        width: 40px;
        height: 40px;
        position: absolute;
        top: 161px;
        right: 40px;
        border-radius: 50%;
    }
    .sy_footer .arrow a {
        display: block;
        width: 100%;
        height: 100%;
        background: url("__TMPL__statics/images/icon_more_normal40x40.png") center/cover no-repeat;
    }
    .sy_footer .arrow a:hover {
        background: url("__TMPL__statics/images/icon_more_sel40x40.png") center/cover no-repeat;
    }
    .sy_footer .syf_right {
        flex: 1;
        background: #ffffff;
    }
</style>
<script src="__PUBLIC__/js/highcharts/highcharts.js"></script>
<script src="__PUBLIC__/js/highcharts/modules/exporting.js"></script>
<div class="sy_content">
    <div class="sy_top">
        <ul class="clear">
            <li>
                <div class="sy_money">
                    <p style="color: #FF788D; height: 42px"><span style="font-size: 20px">¥</span><?php echo ($sum["sum1"]); ?></p>
                    <p>近七日收入金额(元)</p>
                </div>
            </li>
            <li>
                <div>
                    <p style="color: #FF7CCD; height: 42px"><?php echo ($sevenc); ?></p>
                    <p>近七日订单(个)</p>
                </div>
            </li>
            <li>
                <div>
                    <p style="color: #4FB1FD; height: 42px"><span style="font-size: 20px">¥</span><?php echo ($sum["sum4"]); ?></p>
                    <p>总金额(元)</p>
                </div>
            </li>
            <li>
                <div>
                    <p style="color: #FDBE39; height: 42px"><span style="font-size: 20px">¥</span><?php echo ($sum["sum3"]); ?></p>
                    <p>可结算金额(元)</p>
                </div>
            </li>
        </ul>
    </div>
    <div class="sy_center">
        <ul>
            <li><a href="<?php echo U('goods/chosetype');?>"><i></i>发布活动</a></li>
            <li><a href="<?php echo U('order/index',array('type'=>2));?>"><i></i>待使用订单</a></li>
            <li><a href="<?php echo U('money/apply');?>"><i></i>申请结算</a></li>
            <li><a href="<?php echo U('worker/create');?>"><i></i>添加员工</a></li>
        </ul>
    </div>
    <div class="sy_footer">
        <div class="syf_left">
            <div class="release_activities"><i></i>已发布活动</div>
            <ul>
                <?php if(is_array($goods)): foreach($goods as $key=>$v): ?><li>
                        <a href="#">
                            <p><?php echo ($v["title"]); ?></p>
                            <p style="color:#A4B4C4;">已报名人数</p>
                            <p><?php echo ($v["count"]); ?></p>
                            <?php if($v["goods_type"] == 2): ?><p style="color:#A4B4C4;">距离开团还剩</p>
                                <p><?php echo ($v["difference"]); ?>人</p><?php endif; ?>
                        </a>
                    </li><?php endforeach; endif; ?>
            </ul>
            <div class="arrow">
                <a href="<?php echo U('goods/index',array('type'=>4));?>"></a>
            </div>
        </div>
        <div class="syf_right">
            <div class="release_activities"><i></i>可结算活动</div>
            <ul>
                <?php if(is_array($kgoods)): foreach($kgoods as $key=>$vk): if($vk["sum"] > 0): ?><li>
                        <a href="#">
                            <p><?php echo ($vk["title"]); ?></p>
                            <p style="color:#A4B4C4;">可结算金额(元)</p>
                            <p><span>¥</span><?php echo ($vk["sum"]); ?></p>
                        </a>
                    </li><?php endif; endforeach; endif; ?>
            </ul>
            <div class="arrow">
                <a href="<?php echo U('money/index');?>"></a>
            </div>
        </div>
    </div>
</div>
</body>
</html>