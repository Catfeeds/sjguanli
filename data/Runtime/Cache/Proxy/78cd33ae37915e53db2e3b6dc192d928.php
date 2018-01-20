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
<script src="__PUBLIC__/js/highcharts/highcharts.js"></script>
<script src="__PUBLIC__/js/highcharts/modules/exporting.js"></script>
<!-- <div class="sjgl_lead"> -->
    <!-- <ul>
        <li><em class="sjgl_leadico"></em><a href="#">首页</a></li>
    </ul> -->
<!-- </div> -->
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
    .sy_center .pic{
        margin-right: 6px;
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
        width: 136px;
        height: 32px;
        background: #F5F8FB;
        border-radius: 3px;
        font-family: PingFangHK-Regular;
        font-size: 14px;
        color: #364A5E;
        letter-spacing: 0;
        line-height: 32px;
        text-align: center;
    }
    .sy_footer ul {
        display: flex;
        justify-content: space-between;
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
        border: none;
        background: url('__TMPL__statics/images/icon_more_normal40x40.png') no-repeat center;
    }
    .sy_footer .arrow:hover{
        background: url('__TMPL__statics/images/icon_more_sel40x40.png') no-repeat center;
    }
    .sy_footer .syf_right {
        flex: 1;
        background: #ffffff;
    }
</style>
<div class="sy_content">
    <div class="sy_top">
        <ul class="clear">
            <li>
                <div class="sy_money">
                    <p style="color: #FF788D"><span style="font-size: 20px">¥</span>0.00</p>
                    <p>近七日收入金额(元)</p>
                </div>
            </li>
            <li>
                <div>
                    <p style="color: #FF7CCD">0</p>
                    <p>近七日订单(个)</p>
                </div>
            </li>
            <li>
                <div>
                    <p style="color: #4FB1FD"><span style="font-size: 20px">¥</span>0.00</p>
                    <p>总金额(元)</p>
                </div>
            </li>
            <li>
                <div>
                    <p style="color: #FDBE39"><span style="font-size: 20px">¥</span>0.00</p>
                    <p>可结算金额(元)</p>
                </div>
            </li>
        </ul>
    </div>
    <div class="sy_center">
        <ul>
			<li><a><img src="__TMPL__statics/images/icon_shenqingkaitong12x12.png" alt="" class="pic">申请开通资源单位</a></li>
            <li><a><img src="__TMPL__statics/images/icon_daishiyong14x14.png" alt="" class="pic">待使用订单</a></li>
            <li><a href="#"><img src="__TMPL__statics/images/icon_shenqingjiesuan14x14.png" alt="" class="pic">查看结算</a></li>
            <li><a><img src="__TMPL__statics/images/icon_tianjiayuangong14x1.png" alt="" class="pic">添加员工</a></li>
        </ul>
    </div>
    <div class="sy_footer">
        <div class="syf_left">
            <div class="release_activities"><i></i>已发布活动</div>
            <ul>
                <li>
                    <p>暖冬行动手作芳香植物唇膏关爱地方</p>
                    <p>已报名人数</p>
                    <p>26人</p>
                    <p>距离开团还剩</p>
                    <p>6人</p>
                </li>
                <li>
                    <p>暖冬行动手作芳香植物唇膏关爱地方</p>
                    <p>已报名人数</p>
                    <p>26人</p>
                    <p>距离开团还剩</p>
                    <p>6人</p>
                </li>
                <li>
                    <p>暖冬行动手作芳香植物唇膏关爱</p>
                    <p>已报名人数</p>
                    <p>26人</p>
                    <p>距离开团还剩</p>
                    <p>6人</p>
                </li>
                <li>
                    <p>暖冬行动手作芳</p>
                    <p>已报名人数</p>
                    <p>26人</p>
                    <p>距离开团还剩</p>
                    <p>6人</p>
                </li>
            </ul>
            <div class="arrow">

            </div>
        </div>
        <div class="syf_right">
            <div class="release_activities"><i></i>可结算活动</div>
            <ul>
                <li>
                    <p>勇士召集一元生存挑战强势来袭</p>
                    <p>可结算金额(元)</p>
                    <p><span>¥</span>1,288.00</p>
                </li>
                <li>
                    <p>一柄木勺的故事</p>
                    <p>可结算金额(元)</p>
                    <p><span>¥</span>1,288.00</p>
                </li>
                <li>
                    <p>暖冬行动手作芳香植物唇膏关爱地方</p>
                    <p>可结算金额(元)</p>
                    <p><span>¥</span>1,288.00</p>
                </li>
            </ul>
            <div class="arrow">

            </div>
        </div>
    </div>
    <!--<div class="sy_c1">-->
        <!--<ul>-->
            <!--<li class="left sy_c1Li">-->
                <!--<div class="sy_c1Linr">-->
                    <!--<div class="sy_c1Linr_t">统计中心</div>-->
                    <!--<div class="sy_c1List">-->
                        <!--<ul>-->
                            <!--<li class="sy_c1nrLi">-->
                                <!--<div class="left sy_c1nrLit">今日订单</div>-->
                                <!--<div class="left sy_c1nrLit sy_c1nrLis"><?php echo ($counts["totay_order"]); ?>个</div>-->
                                <!--<div class="right"><a class="radius3 sy_lookan" href="<?php echo U('shangjia/order/index');?>">查看</a></div>-->
                            <!--</li>-->
                            <!--<li class="sy_c1nrLi">-->
                                <!--<div class="left sy_c1nrLit">总订单</div>-->
                                <!--<div class="left sy_c1nrLit sy_c1nrLis"><?php echo ($counts["order"]); ?>个</div>-->
                                <!--<div class="right"><a class="radius3 sy_lookan" href="<?php echo U('shangjia/order/index');?>">查看</a></div>-->
                            <!--</li>-->
                            <!--<li class="sy_c1nrLi">-->
                                <!--<div class="left sy_c1nrLit">今日优惠券</div>-->
                                <!--<div class="left sy_c1nrLit sy_c1nrLis"><?php echo ($counts["today_yuyue"]); ?>个</div>-->
                                <!--<div class="right"><a class="radius3 sy_lookan" href="<?php echo U('shangjia/coupon/index');?>">查看</a></div>-->
                            <!--</li>-->
                            <!--<li class="sy_c1nrLi">-->
                                <!--<div class="left sy_c1nrLit">总优惠券</div>-->
                                <!--<div class="left sy_c1nrLit sy_c1nrLis"><?php echo ($counts["yuyue"]); ?>个</div>-->
                                <!--<div class="right"><a class="radius3 sy_lookan" href="<?php echo U('shangjia/coupon/index');?>">查看</a></div>-->
                            <!--</li>-->
                            <!--<li class="sy_c1nrLi">-->
                                <!--<div class="left sy_c1nrLit">点评消息</div>-->
                                <!--<div class="left sy_c1nrLit sy_c1nrLis"><?php echo ($counts["dianping"]); ?>个</div>-->
                                <!--<div class="right"><a class="radius3 sy_lookan" href="<?php echo U('shangjia/dianping/index');?>">查看</a></div>-->
                            <!--</li>-->
                        <!--</ul>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</li>-->
            <!--<li class="left sy_c1Li">-->
                <!--<div class="sy_c1Linr">-->
                    <!--<div class="sy_c1Linr_t">商家资金时间段（<?php echo ($bg_date); ?> - <?php echo ($end_date); ?>）内走势 &#45;&#45;&#45;&#45; <?php echo ($SHOP['shop_name']); ?></div>-->
                    <!--<div class="sy_c1List">-->
                        <!--<script>-->
                            <!--$(function () {-->
                            <!--$('#container3').highcharts({-->
                                <!--chart: {-->
                            <!--type: 'line',-->
                            <!--margin: [50, 0, 60, 80] //距离上下左右的距离值-->
                            <!--},-->
                            <!--title: {-->
                            <!--text: '',-->
                                    <!--x: - 20 //center-->
                            <!--},-->
                                    <!--subtitle: {-->
                                    <!--text: "",-->
                                            <!--x: - 20-->
                                    <!--},-->
                                    <!--xAxis: {-->
                                    <!--categories: [<?php echo ($money["d"]); ?>]-->
                                    <!--},-->
                                    <!--yAxis: {-->
                                    <!--min: 0,  -->
                                    <!--title: {-->
                                    <!--text: '单位元'-->
                                    <!--},-->
                                            <!--plotLines: [{-->
                                            <!--value: 0,-->
                                                    <!--width: 1,-->
                                                    <!--color: '#808080'-->
                                            <!--}]-->
                                    <!--},-->
                                    <!--series: [{-->
                                    <!--name: '收入金额',-->
                                            <!--data: [<?php echo ($money["price"]); ?>]-->
                                    <!--}]-->
                            <!--});-->
                            <!--});</script>-->
                                                <!--<div id="container3" style="height: 215px;">-->

                        <!--</div>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</li>-->
        <!--</ul>-->
    <!--</div>-->
    <!--<div class="sy_c1">-->
        <!--<ul>-->
            <!--<li class="left sy_c1Li">-->
                <!--<div class="sy_c1Linr">-->
                    <!--<div class="sy_c1Linr_t">统计分析</div>-->
                    <!--<div class="sy_c2tjnr">-->
                        <!--<script>-->
                            <!--$(function () {-->
                            <!--$('#container').highcharts({-->
                            <!--title: {-->
                            <!--text: '抢购金额时间段（<?php echo ($bg_date); ?> - <?php echo ($end_date); ?>）内趋势',-->
                                    <!--x: - 20 //center-->
                            <!--},-->
                                    <!--subtitle: {-->
                                    <!--text: "<?php echo ($SHOP['shop_name']); ?>",-->
                                            <!--x: - 20-->
                                    <!--},-->
                                    <!--xAxis: {-->
                                    <!--categories: [<?php echo ($money["d"]); ?>]-->
                                    <!--},-->
                                    <!--yAxis: {-->
                                    <!--title: {-->
                                    <!--text: '单位元'-->
                                    <!--},-->
                                            <!--plotLines: [{-->
                                            <!--value: 0,-->
                                                    <!--width: 1,-->
                                                    <!--color: '#808080'-->
                                            <!--}]-->
                                    <!--},-->
                                    <!--series: [{-->
                                    <!--name: '购买金额',-->
                                            <!--data: [<?php echo ($money["price"]); ?>]-->
                                    <!--}]-->
                            <!--});-->
                            <!--});</script>-->
                        <!--<div id="container">-->

                        <!--</div>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</li>-->
            <!--<li class="left sy_c1Li">-->
                <!--<div class="sy_c1Linr">-->
                    <!--<div class="sy_c1Linr_t">销售额分析</div>-->
                    <!--<div class="sy_c2tjnr">-->
                        <!--<script>-->
                            <!--$(function () {-->
                            <!--$('#container2').highcharts({-->
                            <!--title: {-->
                            <!--text: '销售金额时间段（<?php echo ($bg_date); ?> - <?php echo ($end_date); ?>）内趋势',-->
                                    <!--x: - 20 //center-->
                            <!--},-->
                                    <!--subtitle: {-->
                                    <!--text: "<?php echo ($SHOP['shop_name']); ?>",-->
                                            <!--x: - 20-->
                                    <!--},-->
                                    <!--xAxis: {-->
                                    <!--categories: [<?php echo ($ordermoney["d"]); ?>]-->
                                    <!--},-->
                                    <!--yAxis: {-->
                                    <!--title: {-->
                                    <!--text: '单位元'-->
                                    <!--},-->
                                            <!--plotLines: [{-->
                                            <!--value: 0,-->
                                                    <!--width: 1,-->
                                                    <!--color: '#808080'-->
                                            <!--}]-->
                                    <!--},-->
                                    <!--series: [{-->
                                    <!--name: '购买金额',-->
                                            <!--data: [<?php echo ($ordermoney["price"]); ?>]-->
                                    <!--}]-->
                            <!--});-->
                            <!--});</script>-->
                        <!--<div id="container2">-->

                        <!--</div>-->
                    <!--</div>-->
                <!--</div>-->
            <!--</li>-->
        <!--</ul>-->
    <!--</div>-->

</div>
</body>
</html>