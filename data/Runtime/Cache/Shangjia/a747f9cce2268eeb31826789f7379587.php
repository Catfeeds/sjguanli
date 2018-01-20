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

    .main {
        padding: 70px 0 0 120px;
    }

    h3 {
        font-size: 24px;
        margin-bottom: 48px;
        font-weight: normal;
    }

    h4 {
        font-size: 30px;
        color: #FFFFFF;
        /* margin-top: 26px; */
        font-weight: 600;
    }

    p {
        font-size: 18px;
        color: #FFFFFF;
        margin-top: 3px;
    }

    .main>div {
        margin-bottom: 32px;
        width: 560px;
        height: 128px;
        border-radius: 3px;
        overflow: hidden;
        cursor: pointer;
        position: relative;
    }
    
    .main>div div {
        background-image: linear-gradient(90deg, #9AA6B0 0%, rgba(226, 233, 234, 0.70) 100%);
        opacity: .9;
        padding-left: 48px;
        padding-top: 26px;
        height: 100%;
    }
    .group{
        height: 100%;
        background: url('__TMPL__statics/images/bg_group_normal.png') center/cover no-repeat;
    }
    .ticket{
        height: 100%;
        background: url('__TMPL__statics/images/bg_ticket_normal.png') center/cover no-repeat;
    }
    .group.active div{
        background-image: linear-gradient(90deg, #008DFF 0%, rgba(32, 222, 255, 0.70) 100%);
        opacity: .9;
    }
    .group.active {
        background: url('__TMPL__statics/images/bg_group_sel.png') center/cover no-repeat;
    }

    .ticket.active div{
        background-image: linear-gradient(90deg, #707CFF 0%, rgba(255, 108, 255, 0.70) 100%);
        opacity: .9;
    }
    .ticket.active {
        background: url('__TMPL__statics/images/bg_ticket_sel.png') center/cover no-repeat;
    }

    .active i {
        position: absolute;
        top: 0;
        right: 0;
        width: 80px;
        height: 80px;
        background: url('__TMPL__statics/images/title_yixuanze80x80.png') center/cover no-repeat;
    }

    .confirm {
        display: inline-block;
        background: #0ECEAF;
        border-radius: 3px;
        text-align: center;
        line-height: 34px;
        width: 112px;
        color: #FFFFFF;
        cursor: pointer;
    }
</style>
<div class="main">
    <h3>选择活动方式</h3>
    <div class="group active" data-type=1>
        <div>
            <h4>组团实践活动</h4>
            <p>用户可参与指定活动时间内的团体实践活动</p>
        </div>
        <i></i>
    </div>
    <div class="ticket" data-type=2>
        <div>
            <h4>票务型活动</h4>
            <p>在活动时间内随时可报名参与活动</p>
        </div>
        <i></i>
    </div>
    <span class="confirm">确定</span>
</div>
<script>
    $(function () {
        var type=1;
        $('.main>div').on('click', function () {
            $('.main>div').removeClass('active')
            type = this.dataset.type;
            console.log(this.dataset.type)
            // console.log($(this).data('type'))
            $(this).addClass('active')
        })
        $('.confirm').on('click', function () {
            if (type==1) {
                location.href = "<?php echo U('goods/creategroup');?>";
            }else if(type==2){
                location.href = "<?php echo U('goods/createticket');?>";
            }
        })
    })
</script>
</body>
</html>