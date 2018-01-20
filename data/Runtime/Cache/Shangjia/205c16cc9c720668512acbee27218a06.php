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

    .contain {
        padding: 0 32px;
        min-width: 1160px;
    }
    .footer{
        min-width: 1160px;
    }
    .contain .top {
        letter-spacing: 0;
        padding: 26px 0;
        position: relative;
    }

    .contain .top p {
        font-family: PingFangHK-Regular;
        font-size: 14px;
        color: #364A5E;
        line-height: 20px;
    }

    .contain .top span {
        display: inline-block;
        width: 48px;
        height: 16px;
        background: #364A5E;
        border-radius: 3px;
        color: #fff;
        font-size: 12px;
        line-height: 16px;
        margin-left: 5px;
        text-align: center;
    }

    .center_table .table_header {
        font-family: PingFangHK-Regular;
        font-size: 14px;
        color: #364A5E;
        letter-spacing: 0;
        padding: 0 24px;
        background: #EDF3F8;
        border-radius: 3px;
        height: 52px;
        line-height: 52px;
    }

    .center_table .table_header span:first-child {
        margin-right: 175px;
    }

    .center_table .table_header span:nth-child(2) {
        margin-right: 277px;
    }

    .center_table table tr td {
        border-right: 1px solid #EAF0F6;
        border-bottom: 1px solid #EAF0F6;
        padding-left: 24px;
        font-family: PingFangHK-Regular;
        font-size: 14px;
        color: #364A5E;
        line-height: 40px;
        letter-spacing: 0;
    }

    .center_table table tr:nth-child(n+3) td {
        height: 54px;
    }

    .center_table table tr td:last-child {
        border-right: none;
    }

    .center_table table tr:nth-child(2) td:last-child {
        border-right: 1px solid #EAF0F6;
    }

    .footer {
        font-family: PingFangHK-Regular;
        font-size: 14px;
        color: #A4B4C4;
        letter-spacing: 0;
        padding-top: 16px;
        line-height: 20px;
    }

    .footer p:nth-child(n+3) {
        margin-top: 16px;
        color: #364A5E;
    }

    tr:first-child td::before {
        width: 0;
        height: 0;
    }

    .export_data {
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

    .export_data a {
        display: block;
        width: 100%;
        height: 100%;
        color: #ffffff;
    }

    .export_data .pic {
        /* vertical-align: middle; */
        margin-right: 6px;
    }

    textarea {
        border: 1px solid #C8D5E0;
        border-radius: 3px;
        padding: 15px 10px;
        line-height: 20px;
        margin-top: 30px;
    }

    textarea::-webkit-input-placeholder {
        color: #C8D5E0;
    }

    .confirm {
        text-align: center;
    }

    .confirm i {
        display: inline-block;
        width: 14px;
        height: 14px;
        border: 1px solid #C8D5E0;
        border-radius: 3px;
        cursor: pointer;
        margin-right: 6px;
        transform: translateY(2px);
    }

    .confirm .active {
        background: url('__TMPL__statics/images/icon_xuanzhong_sel14x14.png') center/cover no-repeat;
        border: 0;
    }

    .confirm div {
        margin: 20px 0;
        display: inline-block;
        width: 128px;
        height: 40px;
        border-radius: 3px;
        text-align: center;
        cursor: pointer;
        color: #fff;
        border: 0;
        background: #0ECEAF;
        line-height: 40px;
    }
    
</style>
<div class="contain">
    <div class="top">
        <p>湖南九春教育科技股份有限公司结算单
            <span>资源单位</span>
        </p>
        <div class="export_data">
            <a href="#">
                <img src="__TMPL__statics/images/icon_download12x12.png" alt="" class="pic">下载表单</a>
        </div>
    </div>
    <div class="center_table">
        <div class="table_header">
            <span>结算编号：JS201802288001-D</span>
            <span>资源单位：智诚阳光教育机构</span>
            <span>时间：2018-01-10 10:12:56</span>
        </div>
        <form action="">
            <table border="0" width="100%" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr>
                        <td>活动名称</td>
                        <td>活动时间</td>
                        <td>订单数 (个)</td>
                        <td>销售单价 (元)</td>
                        <td>销售总金额（元）</td>
                        <td>结算单价 (元)</td>
                        <td>结算总金额（元）</td>
                    </tr>
                    <!--数据部分-->
                    <tr>
                        <td style="width: 180px; line-height:20px; padding-right: 20px">小小魔术师哈哈哈哈哈哈哈哈哈哈哈哈哈</td>
                        <td>2017-10-12 16:34:08</td>
                        <td>100</td>
                        <td>128.00</td>
                        <td>12,800.00</td>
                        <td>5%</td>
                        <td>64</td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <p style="width: 50px; display: inline-block">总计</p>
                            <p style="float: right;">人民币（大写）：壹万陆仟肆佰壹拾陆元整； 人民币（小写）：
                                <i style="color: red">¥16,416.00</i>元</p>
                        </td>
                    </tr>
                </tbody>
            </table>
            <textarea name="remark" id="" cols="88" style="resize:none" rows="6" placeholder="备注"></textarea>
            <!-- <div class="audit" style="margin-top:15px;">
                <span style="margin-right:280px;">审核人：</span>
                <span>申请人：舒威</span> -->
            </div>
            <div class="confirm" style="margin-top:80px;">
                <p>
                    <i></i>我已确认结算单结算正确，无任何异议</p>
                <div>提交申请</div>
            </div>
        </form>
        <script>
            $(function () {
                var time;
                function tip(txt) {
                    clearTimeout(time)
                    $('.poptip').text(txt);
                    $('.poptip').fadeIn(200)
                    time = setTimeout(() => {
                        $('.poptip').fadeOut(200)
                    }, 2000);
                }
                $('.confirm i').on('click', function () {
                    $(this).toggleClass('active');
                })
                $('.confirm div').on('click', function () {
                    if($('.confirm i').hasClass('active')){
                        tip('成功提交申请结算');

                    }else{
                        tip('请先确认结算单');
                    }
                })
            })
        </script>
        <div class="poptip"></div>
    </div>
    <div class="footer" style="font-size:12px;padding-left:30px;">
        <p>名词解释：【订单数】本次活动可结算订单数；【销售单价】本次活动在平台的销售单价；【总金额】订单数×销售单价；【平台服务费】总金额×当前代理商协议的平台服务费率；【资源单位结算单价】本次活动与资源单位的结算单价
            【资源单位结算总金额】与资源单位的结算单价×订单数；【业绩金额】总金额-资源单位结算总金额-平台服务费（本结算单最终解释权归海南九春教育科技股份有限公司所有）</p>
        <p>备注：线下结算了7个单，请核实！</p>
        <p>审核人：爱迪生</p>
        <p>申请人：梵高</p>
    </div>
</div>

</body>
</html>