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
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    table,
    form {
        min-width: 1262px;
    }

    .goods_tab {
        padding-top: 30px;
        padding-left: 16px;
    }

    .goods_form {
        overflow: visible;
    }

    .goods_main {
        padding-top: 0;
    }

    select {
        width: 180px;
        height: 34px;
        margin: 0 28px 0 10px;
        border: 1px solid #dbdbdb;
        /* color: #A4B4C4 ; */
        color: #C8D5E0;
        border-radius: 4px;
        padding-left: 5px;
    }

    select option {
        height: 34px;
        color: #304B5D;
    }
    form{
        padding-left: 20px;
        margin-bottom: 20px;
    }
    form button {
        border: 0;
        padding: 0;
        margin: 0!important;
        width: 112px;
        text-align: center;
        line-height: 35px;
        border: 0;
        background: #0ECEAF;
        color: #fff;
        font-size: 14px;
        border-radius: 4px;
    }

    table tr td:first-child {
        padding-left: 20px;
    }

    table tr {
        border-radius: 10px;
    }
</style>
<!-- <div class="sjgl_lead">
    <ul>
        <li><a href="#">商家管理</a> > <a href="">商城</a> > <a>商城商品</a></li>
    </ul>
</div> -->

<!-- 新增 -->
<div class="tuanfabu_tab goods_tab">
    <ul>
        <li class="tuanfabu_tabli <?php if($type == 0): ?>on<?php endif; ?>">
            <a href="<?php echo U('goods/index',array('type'=>0));?>">全部结算</a>
        </li>
        <li class="tuanfabu_tabli <?php if($type == 2): ?>on<?php endif; ?>">
            <a href="<?php echo U('goods/index',array('type'=>2));?>">待审核</a>
        </li>
        <li class="tuanfabu_tabli <?php if($type == 3): ?>on<?php endif; ?>">
            <a href="<?php echo U('goods/index',array('type'=>3));?>">审核不通过</a>
        </li>
        <li class="tuanfabu_tabli <?php if($type == 2): ?>on<?php endif; ?>">
            <a href="<?php echo U('goods/index',array('type'=>2));?>">待结算</a>
        </li>
        <li class="tuanfabu_tabli <?php if($type == 2): ?>on<?php endif; ?>">
            <a href="<?php echo U('goods/index',array('type'=>2));?>">已结算</a>
        </li>
        <!-- <li class="tuanfabu_tab publish right">
            <div class="right tuan_topfb_r" style="float: left">
                
                    <span>+</span>发布活动</a>
            </div>
        </li> -->
    </ul>
</div>
<form action="" method="post" target="baocms_frm">
    活动名称：
    <!-- <input type="text" placeholder="请输入活动名称或关键词" name="title" value="<?php echo ($title); ?>" class="radius3 tuan_topser mar act" style="width:180px"/> -->
    <select class="select" name="goods_id">
        <option value="-1">请选择要查询的活动</option>
        <?php if(is_array($arrs)): foreach($arrs as $key=>$vs): ?><option value="<?php echo ($vs["goods_id"]); ?>" <?php if(($goods_id) == $vs["goods_id"]): ?>selected="selected"<?php endif; ?>>
                <?php echo ($vs["title"]); ?>
            </option><?php endforeach; endif; ?>
    </select>
    <button>查询</button>
</form>
<div class="tuan_content goods_main">

    <table class="tuan_table" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="first_tr">
            <td class="arrow arrow1">
                结算时间
                <span>
                    <i></i>
                    <s></s>
                </span>
            </td>
            <td class="arrow arrow2">
                结算订单数
                <span>
                    <i></i>
                    <s></s>
                </span>
            </td>
            <td class="arrow arrow3">
                结算金额（元）
                <span>
                    <i></i>
                    <s></s>
                </span>
            </td>
            <td class="">订单状态
                <!-- <span>
                    <i></i>
                    <s></s>
                </span> -->
            </td>
            <td>操作</td>
            <!-- <td></td> -->
        </tr>
        <script>
            $(function () {
                arrow('arrow1')
                arrow('arrow2')
                arrow('arrow3')

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
        <?php if(is_array($list)): foreach($list as $key=>$var): ?><tr>
                <td>
                    <?php echo ($var["title"]); ?>
                </td>
                <td>
                    <?php echo ($var["mall_price"]); ?>
                </td>
                <td>
                    <?php echo (date('Y-m-d H:i:s' ,$var["start_time"])); ?>-
                        <?php echo (date('Y-m-d H:i:s' ,$var["finaly_time"])); ?>
                </td>
                <td>
                    <?php echo (date('Y-m-d H:i:s' ,$var["end_time"])); ?>
                </td>
                <td>
                    <a href=""></a>
                    <a href=""></a>
                </td>
            </tr><?php endforeach; endif; ?>
    </table>
    <?php echo ($page); ?>
</div>
<a href="<?php echo U('money/checksettlement');?>">
    fghfdgh
</a>
<script>
</script>
</body>
</html>