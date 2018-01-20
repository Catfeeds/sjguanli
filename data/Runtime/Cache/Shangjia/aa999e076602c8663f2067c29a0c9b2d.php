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
    /* sjgl_top start */
    .sjgl_top{
        height: 60px;
        line-height: 60px;
        background-color: #1C99FA !important;
    }
    .modify{
        padding: 0;
        line-height: 60px;
    }
    .sjgl_top .modify .pic{
        float: left;
        margin-top:12px;
        margin-left: 32px;
        margin-right:0;
        vertical-align: bottom;

    }
    .modify .name{
        margin-left:16px;
        margin-right:8px;
        float: left;
        font-family: PingFangHK-Medium;
        font-size: 20px;
        color: #FFFFFF;
        letter-spacing: 0;
    }
    .modify .title{
        float: left;
        margin-top:21px;
        width: 70px;
        height: 20px;
        line-height: 20px;
        background: #FFFFFF;
        border-radius: 4px;
        font-family: PingFangHK-Regular;
        font-size: 14px;
        color: #0099FF;
        letter-spacing: 0;
        text-align: center;
    }
    .sjgl_top_r .sjgl_toplixl{
        padding-right: 47px;
        font-family: PingFangHK-Regular;
        font-size: 16px;
        color: #FFFFFF;
        letter-spacing: 0;
    }
    .sjgl_topli{
        font-family: PingFangHK-Regular;
        font-size: 16px;
        color: #FFFFFF;
        letter-spacing: 0;
    }
    /* sjgl_top end */
    /* sjgl_leftmenu start */
    .sjglBox .sjgl_leftmenu{
        width: 168px;
        background: #FFFFFF;
        border-top: 0;
        border-right: solid 16px #f5f5f5;
        border-left: solid 16px #f5f5f5;
    }
    .sjgl_leftmenu .leftMenu_li{
        width: 168px;
        border-bottom: 0;
    }
    /* .sjgl_leftmenu .leftMenu_li .leftMenu_a{
        font-family: PingFangHK-Regular;
        font-size: 16px;
        color: #364A5E;
        letter-spacing: 0;
    } */
    .leftNav2 ul li a{
        text-align: center;
        font-size: 14px;
    }
    .leftMenu_li{
        margin-bottom: 8px;
    }
    .sjglBox{
        /* position: relative; */
        padding-top:60px; 
    }
    .left.sjgl_leftmenu{
        position: fixed;
        top: 60px;
        left:0;
    }
    .sjgl_top{
        position: fixed;
        top: 0;
        left:0;
    }
    /* sjgl_leftmenu end */
</style>
<script type="text/javascript">
	$(document).ready(function(){
        $('.leftMenu_li').click(function(){
            $('.leftMenu_li').removeClass("active")
            $(this).addClass("active")
        })
		$(".leftMenu_a").click(function(){
			$(".leftMenu_a").removeClass("on");
			$(this).addClass("on");
			$(".leftNav2").hide();
			$(this).parent().find(".leftNav2").show();
		});

		$(".leftNav2 li").click(function(){
			$(".leftNav2 li a").removeClass('on');
			$(this).find('a').addClass('on');
		});
	});
</script>

<div class="sjgl_top">
    <div class="left sjgl_toplogo modify">
        <img src="__TMPL__statics/images/logo.png" alt="" class="pic">
        <div class="name">学生综合实践平台</div>
        <div class="title">商家后台</div>
    </div>
    <div class="right sjgl_top_r">
        <ul>
            <li class="left sjgl_topli sjgl_toplixl"><a href="<?php echo U('shangjia/index/index');?>"><?php echo ($SHOP["shop_name"]); ?>，您好！</a>
                <!--
                <div class="sjgl_topxl">
                    <div class="sjgl_topcz">
                        <div class="left"><p class="sjgl_topyet">帐户余额</p><p class="sjgl_topyet sjgl_topye"><big><?php echo ($MEMBER["gold"]); ?></big>金块</p></div>
                        <div class="right"><a class="radius5 sjgl_topczA" target="main_frm" href="<?php echo U('gold/index');?>">立即充值</a></div>
                    </div>
                    <a class="sjgl_topA sjgl_topA1" target="main_frm" href="<?php echo U('shop/about');?>">去资料中心>></a>
                    <a class="sjgl_topA" href="<?php echo U('login/logout');?>"><em>&nbsp;</em>退出</a>
                </div>
                -->
            </li>
            <li class="left sjgl_topli"><a href="<?php echo U('login/logout');?>"><em class="toptc"><img src="__TMPL__statics/images/sing_out.png" /></em>退出</a></li>
        </ul>
    </div>
</div>

<div style="width:100%;height:16px;background-color:#f5f5f5">

</div>

<div class="sjglBox">
    <div class="left sjgl_leftmenu">
        <ul style="margin-top:32px">
            <li class="leftMenu_li"><a class="leftMenu_a on" target="main_frm" href="<?php echo U('index/main');?>"><em>&nbsp;</em>首页</a></li>
            <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a2"  target="main_frm" href="<?php echo U('goods/index');?>"><em>&nbsp;</em>活动管理</a>
                <div class="leftNav2">
                    <ul>
                        <li><a target="main_frm" href="<?php echo U('goods/index');?>">活动列表</a></li>
                    </ul>
                </div>
            </li>
            <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a3" target="main_frm" href="<?php echo U('order/index');?>"><em>&nbsp;</em>订单管理</a>
                <div class="leftNav2">
                    <ul>
                        <li><a target="main_frm" href="<?php echo U('order/index');?>">订单列表</a></li>
                    </ul>
                </div>
            </li>
            <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a4" target="main_frm" href="<?php echo U('money/index');?>"><em>&nbsp;</em>财务管理</a>
                <div class="leftNav2">
                    <ul>
                        <li><a target="main_frm" href="<?php echo U('money/index');?>">账户查询</a></li>
                    </ul>
                    <ul>
                        <li><a target="main_frm" href="<?php echo U('money/clearinglist');?>">结算列表</a></li>
                    </ul>
                </div>
            </li>
            <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a5" target="main_frm" href="<?php echo U('worker/index');?>"><em>&nbsp;</em>管理员管理</a>
                <div class="leftNav2">
                    <ul>
                        <li><a target="main_frm" href="<?php echo U('worker/index');?>">管理员列表</a></li>
                    </ul>
                </div>
            </li>

        </ul>

        <!--
        <ul>

            <li class="leftMenu_li"><a class="leftMenu_a on" target="main_frm" href="<?php echo U('index/main');?>"><em>&nbsp;</em>首页</a></li>

            <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a2"  target="main_frm" href="<?php echo U('branch/index');?>"><em>&nbsp;</em>商家管理</a>

                <div class="leftNav2">

                    <ul>

                        <li><a class="on" target="main_frm" href="<?php echo U('info/password');?>"><em>&nbsp;</em>修改密码</a></li>

                         <li><a target="main_frm" href="<?php echo U('shop/about');?>"><em>&nbsp;</em>店铺管理</a></li>

                    	<li><a  target="main_frm" href="<?php echo U('branch/index');?>"><em>&nbsp;</em>分店地址</a></li>
                        <li><a  target="main_frm" href="<?php echo U('worker/index');?>"><em>&nbsp;</em>员工管理</a></li>

                    </ul>

                </div>

            </li>

            <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a3" target="main_frm" href="<?php echo U('info/password');?>"><em>&nbsp;</em>团购优惠</a>

            	<div class="leftNav2">

                    <ul>

                        <li><a target="main_frm" href="<?php echo U('tuan/index');?>"><em>&nbsp;</em>团购管理</a></li>

                        <li><a target="main_frm" href="<?php echo U('coupon/index');?>"><em>&nbsp;</em>优惠券</a></li>

                    </ul>

                </div>

            </li>

            <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a4" target="main_frm" href="<?php echo U('goods/index');?>"><em>&nbsp;</em>微店</a>

            	<div class="leftNav2">

                    <ul>

                        <li><a target="main_frm" href="<?php echo U('goodsshopcate/index');?>"><em>&nbsp;</em>产品分类</a></li>

                        <li><a target="main_frm" href="<?php echo U('goods/index');?>"><em>&nbsp;</em>微店产品</a></li>

                        <li><a target="main_frm" href="<?php echo U('order/index');?>"><em>&nbsp;</em>卖出产品</a></li>

                        <li><a target="main_frm" href="<?php echo U('order/wait');?>"><em>&nbsp;</em>付款订单</a></li>

                        <li><a target="main_frm" href="<?php echo U('order/wait2');?>"><em>&nbsp;</em>货到付款</a></li>

                        <li><a target="main_frm" href="<?php echo U('order/picks');?>"><em>&nbsp;</em>捡货单管理</a></li>

                        <?php if(($SHOP["is_pei"]) == "0"): ?><li><a target="main_frm" href="<?php echo U('order/count');?>"><em>&nbsp;</em>配送员订单统计</a></li><?php endif; ?>

                        <li><a target="main_frm" href="<?php echo U('goods/weidian');?>"><em>&nbsp;</em>微店资料修改</a></li>

                    </ul>

                </div>

            </li>



            <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a5" target="main_frm" href="<?php echo U('integral/index');?>"><em>&nbsp;</em>粉丝</a>

            	<div class="leftNav2">

                    <ul>

                        <li><a class="on"  target="main_frm" href="<?php echo U('fans/index');?>"><em>&nbsp;</em>粉丝列表</a></li>

                        <li><a target="main_frm" href="<?php echo U('integral/index');?>"><em>&nbsp;</em>金块换积分</a></li>

                        <li><a target="main_frm" href="<?php echo U('integrallogs/index');?>"><em>&nbsp;</em>积分日志</a></li>

                    </ul>

                </div>

            </li>

                <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a19" target="main_frm" href="<?php echo U('ele/index');?>"><em>&nbsp;</em>外卖</a>

            	<div class="leftNav2">

                    <ul>

                        <li><a target="main_frm" href="<?php echo U('elecate/index');?>"><em>&nbsp;</em>菜系分类</a></li>

                        <li><a target="main_frm" href="<?php echo U('eleproduct/index');?>"><em>&nbsp;</em>菜单管理</a></li>

                        <?php if(($SHOP["is_pei"]) == "1"): ?><li><a class="on" target="main_frm" href="<?php echo U('ele/index');?>"><em>&nbsp;</em>营业设置</a></li>

                        <li><a target="main_frm" href="<?php echo U('eleorder/index');?>"><em>&nbsp;</em>确认订单</a></li>

                        <li><a target="main_frm" href="<?php echo U('eleorder/wait');?>"><em>&nbsp;</em>配送订单</a></li>

                        <li><a target="main_frm" href="<?php echo U('eleorder/over');?>"><em>&nbsp;</em>完成订单</a></li><?php endif; ?>

                        <?php if(($SHOP["is_pei"]) == "0"): ?><li><a target="main_frm" href="<?php echo U('eleorder/count');?>"><em>&nbsp;</em>配送员订单统计</a></li><?php endif; ?>



                    </ul>

                </div>

            </li>

            <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a18" target="main_frm" href="<?php echo U('life/index');?>"><em>&nbsp;</em>同城信息</a>

            	<div class="leftNav2">

                    <ul>

                        <li><a target="main_frm" href="<?php echo U('life/index');?>"><em>&nbsp;</em>生活信息</a></li>

                    </ul>

                </div>

            </li>

      

        

            <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a11" target="main_frm" href="<?php echo U('ding/setting');?>"><em>&nbsp;</em>订座</a>

            	<div class="leftNav2">

                    <ul>

                        <li><a class="on" target="main_frm" href="<?php echo U('ding/setting');?>"><em>&nbsp;</em>订座配置</a></li>

                        <li><a target="main_frm" href="<?php echo U('dingorder/index');?>"><em>&nbsp;</em>订座列表</a></li>

                        <li><a target="main_frm" href="<?php echo U('ding/room');?>"><em>&nbsp;</em>包厢设置</a></li>

                        <li><a target="main_frm" href="<?php echo U('dingcate/index');?>"><em>&nbsp;</em>菜品分类</a></li>

                        <li><a target="main_frm" href="<?php echo U('dingmenu/index');?>"><em>&nbsp;</em>菜品配置</a></li>

                    </ul>

                </div>

            </li>

            

             <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a12" target="main_frm" href="<?php echo U('dianping/index');?>"><em>&nbsp;</em>评价管理</a>

            	<div class="leftNav2">

                    <ul>  

                        <li><a target="main_frm" href="<?php echo U('dianping/index');?>"><em>&nbsp;</em>商家评价</a></li>

                        <li><a target="main_frm" href="<?php echo U('dianping/tuan');?>"><em>&nbsp;</em>团购评价</a></li>

                        <li><a target="main_frm" href="<?php echo U('dianping/waimai');?>"><em>&nbsp;</em>外卖点评</a></li>

                        <li><a target="main_frm" href="<?php echo U('dianping/ding');?>"><em>&nbsp;</em>订座评价</a></li>

                    </ul>

                </div>

            </li>

                   <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a13" target="main_frm" href="<?php echo U('money/index');?>"><em>&nbsp;</em>结算</a>

            	<div class="leftNav2">

                    <ul>  

                         <li><a target="main_frm" href="<?php echo U('money/index');?>"><em>&nbsp;</em>资金记录</a></li>

                         <li><a target="main_frm" href="<?php echo U('money/shopmoney');?>"><em>&nbsp;</em>商家资金</a></li>

                         <li><a target="main_frm" href="<?php echo U('money/tixianlog');?>"><em>&nbsp;</em>提现申请</a></li>

                    </ul>

                </div>

            </li>

             <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a10" target="main_frm" href="<?php echo U('weixin/index');?>"><em>&nbsp;</em>营销管理</a>

            	<div class="leftNav2">

                    <ul>

                        <li><a target="main_frm" href="<?php echo U('award/index');?>"><em>&nbsp;</em>抽奖</a></li>

                        <li><a target="main_frm" href="<?php echo U('vote/index');?>"><em>&nbsp;</em>投票功能</a></li>

                        <li><a target="main_frm" href="<?php echo U('weixin/index');?>"><em>&nbsp;</em>微信营销</a></li>

                        <li><a target="main_frm" href="<?php echo U('news/index');?>"><em>&nbsp;</em>文章群发</a></li>

                    </ul>

                </div>

            </li>

                <li class="leftMenu_li"><a class="leftMenu_a leftMenu_a12" target="main_frm" href="<?php echo U('work/index');?>"><em>&nbsp;</em>其他</a>

            	<div class="leftNav2">

                    <ul>

                        <li><a class="on" target="main_frm" href="<?php echo U('work/index');?>"><em>&nbsp;</em>人才招聘</a></li>

                        <li><a target="main_frm" href="<?php echo U('housework/index');?>"><em>&nbsp;</em>家政服务</a></li>

                        <li><a target="main_frm" href="<?php echo U('yuyue/index');?>"><em>&nbsp;</em>预约列表</a></li>

                        <li><a target="main_frm" href="<?php echo U('yuyue/used');?>"><em>&nbsp;</em>消费确认</a></li>

                    </ul>

                </div>

            </li>

        </ul>
        -->
    </div>

    <div id="sjgl_right" style="padding-left:200px; height:100%;">

        <div class="sjgl_main" style="height:1000px;">

            <iframe src="<?php echo U('index/main');?>" marginheight="0" marginwidth="0" frameborder="0" width="100%" height=100% id="main_frm" name="main_frm"></iframe>

        </div>

    </div>

</div>

</body>
</html>