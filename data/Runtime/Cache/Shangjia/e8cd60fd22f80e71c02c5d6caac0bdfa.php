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
<div class="poptip"></div>
<div class="popmask"></div>
<iframe id="baocms_frm" name="baocms_frm" style="display:none;"></iframe>
<script src="__PUBLIC__/js/my97/WdatePicker.js"></script>
<style>
    .balance {
        overflow: hidden;
        padding: 30px 0;
    }

    .price {
        float: left;
        overflow: hidden;
        width: 70%;
    }

    .price>div {
        width: 25%;
        text-align: center;
        float: left;
        position: relative;
    }

    .price>div s {
        position: absolute;
        right: 0;
        top: 50%;
        transform: translateY(-50%);
        width: 1px;
        height: 24px;
        background: #C8D5E0;
    }

    .price>div p {
        font-size: 31px;
    }

    .price>div p span {
        font-size: 20px;
    }

    .price>div div {
        font-size: 14px;
        color: #C8D5E0;
        margin-top: 4px;
        text-align: center;
    }

    .price>div div i {
        font-style: normal;
        display: inline-block;
        background: #f5ba23;
        width: 17px;
        height: 17px;
        border-radius: 50%;
        color: #fff;
        margin-left: 6px;
        cursor: pointer;
        transform: translateY(1px);
    }

    .price>div:first-child {
        color: #FF778E;
    }

    .settle {
        float: right;
        cursor: pointer;
    }

    .settle div {
        width: 266px;
        height: 72px;
        background-image: linear-gradient(90deg, #707CFF 0%, #FA83EE 100%);
        border-radius: 3px;
        text-align: center;
    }

    .settle div i {
        height: 14px;
        width: 14px;
        display: inline-block;
        background: url('__TMPL__statics/images/icon_shenqingjiesuan14x14.png') center/cover no-repeat;
        transform: translateY(1px);
    }

    .settle div span {
        font-size: 18px;
        color: #FFFFFF;
        line-height: 72px;
    }

    .tuan_table tr td:nth-child(1) {
        /* padding-left: 20px; */
    }

    a {
        font-size: 14px;
    }
</style>
<!-- <div class="sjgl_lead">
    <ul>
        <li><a href="#">商家管理</a> > <a href="">财务管理</a> > <a>账户余额</a></li>
    </ul>
</div> -->
<div class="tuan_content">
    <!-- <form method="post" action="<?php echo U('money/index');?>"> -->
    <!-- <div class="radius5 tuan_top">
        <div class="tuan_top_t">
            <div class="left tuan_topser_l">
             开始时间：<input type="text" class="radius3 tuan_topser"  name="bg_date" value="<?php echo (($bg_date)?($bg_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd'});"/>
            结束时间：<input type="text" class="radius3 tuan_topser"  name="end_date" value="<?php echo (($end_date)?($end_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd'});"/>
            <input type="submit" style="margin-left:10px;" class="radius3 sjgl_an tuan_topbt" value="搜 索"/>
            </div>
        </div>
    </div> -->
    <div class="balance">
        <div class="price">
            <div>
                <p>
                    <span>¥</span>
                    <?php echo ($sum["sum4"]); ?>
                </p>
                <div>总金额(元)</div>
                <s></s>
            </div>
            <div>
                <p>
                    <span>¥</span>
                    <?php echo ($sum["sum3"]); ?>
                </p>
                <div>可结算金额(元)</div>
                <s></s>
            </div>
            <div>
                <p>
                    <span>¥</span>
                    <?php echo ($sum["sum1"]); ?>
                </p>
                <div>已结算金额(元)</div>
                <s></s>
            </div>
            <div>
                <p>
                    <span>¥</span>
                    <?php echo ($sum["sum2"]); ?>
                </p>
                <div>冻结金额(元)
                    <i title="未结算资金（未完成活动、资金结算中及其他冻结中）">？</i>
                </div>
            </div>
        </div>
        <a href="<?php echo U('money/apply');?>" class="settle">
            <div>
                <i></i>
                <span>申请结算</span>
            </div>
        </a>
    </div>
    <!-- </form> -->
    <div class="tuanfabu_tab">
        <!--<ul>-->
        <!--<li class="tuanfabu_tabli on"><a href="<?php echo U('money/index');?>">余额日志</a></li>-->
        <!--<li class="tuanfabu_tabli"><a href="<?php echo U('money/shopmoney');?>">商家资金</a></li>-->
        <!--<li class="tuanfabu_tabli"><a href="<?php echo U('money/tjmonth');?>">月统计明细</a></li>-->
        <!--<li class="tuanfabu_tabli"><a href="<?php echo U('money/tjday');?>">日结算趋势</a></li>-->
        <!--</ul>-->
    </div>
    <table class="tuan_table" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="first_tr">
            <td class="arrow arrow1">活动时间
                <span>
                    <i></i>
                    <s></s>
                </span>
            </td>
            <td>活动名称</td>
            <td class="arrow arrow2">可提现金额
                <span>
                    <i></i>
                    <s></s>
                </span>
            </td>
            <td class="arrow arrow3">已冻结金额
                <span>
                    <i></i>
                    <s></s>
                </span>
            </td>
            <td class="arrow arrow4">已结算金额
                <span>
                    <i></i>
                    <s></s>
                </span>
            </td>
            <td>操作</td>
        </tr>
        <script>
            $(function () {
                arrow('arrow1')
                arrow('arrow2')
                arrow('arrow3')
                arrow('arrow4')

                function arrow(name) {
                    var i = 0;
                    $('.' + name + '').on('click', function () {
                        i++;
                        if (i % 2) {
                            this.childNodes[1].className = 'ascending';
                        } else {
                            this.childNodes[1].className = 'descending';
                        }
                    })
                }
            })
        </script>
        <?php if(is_array($list)): foreach($list as $key=>$var): if(($var["sum1"] > 0) OR ($var["sum2"] > 0) OR ($var["sum3"] > 0)): ?><tr>
                <td><?php echo (date('Y-m-d H:i:s' ,$var["start_time"])); ?></td>
                <td><?php echo ($var["title"]); ?></td>
                <td><?php echo ($var["sum1"]); ?></td>
                <td><?php echo ($var["sum2"]); ?></td>
                <td><?php echo ($var["sum3"]); ?></td>
                <td>
                    <a href="<?php echo U('money/balance',array('goods_id'=>$var['goods_id'],'title'=>$var['title']));?>" style="color: dodgerblue">结算明细</a>&nbsp;&nbsp;
                    <a href="<?php echo U('money/szhi',array('goods_id'=>$var['goods_id']));?>" style="color: dodgerblue">收支明细</a>
                </td>
            </tr><?php endif; endforeach; endif; ?>
    </table>
    <div class="paging">
        <?php echo ($page); ?>
    </div>
</div>

</body>
</html>