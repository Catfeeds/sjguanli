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
<!-- <div class="sjgl_lead">
    <ul>
        <li><a href="#">商家管理</a> > <a href="">管理员管理</a> > <a>添加管理员</a></li>
    </ul>
</div> -->
<style>
    .tabnr_change input {
        width: 230px;
        height: 34px;
        border: 1px solid #C8D5E0;
        border-radius: 3px;
        padding-left: 10px;
        vertical-align: middle;
    }
    tr{
        /* padding: 10px 0!important;
        height: 48px; */
    }
    input[type="submit"] {
        display: inline-block;
        background: #0ECEAF;
        border-radius: 3px;
        text-align: center;
        line-height: 34px;
        width: 112px;
        color: #FFFFFF;
        cursor: pointer;
        border: 0;
    }
    .tuanfabu_an{
        text-align: left;
        padding-left: 100px;
    }
    td::before{
        display: none;
    }
</style>
<div class="tuan_content">
    <div class="radius5 tuan_top">
        <div class="tuan_top_t">
            <!--<div class="left tuan_topser_l">商家添加的分店要在后台审核之后才能显示在前台</div>-->
        </div>
    </div>

    <div class="tabnr_change  show">
        <form method="post" action="<?php echo U('worker/create');?>" target="baocms_frm">
            <table class="tuanfabu_table" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="120">
                        <p class="tuanfabu_t">真实姓名：</p>
                    </td>
                    <td>
                        <div class="tuanfabu_nr">
                            <input type="text" name="truename" value="" class="tuanfabu_int tuanfabu_intw2" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="120">
                        <p class="tuanfabu_t">联系电话：</p>
                    </td>
                    <td>
                        <div class="tuanfabu_nr">
                            <input type="text" name="mobile" value=" " class="tuanfabu_int tuanfabu_intw2" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="120">
                        <p class="tuanfabu_t">密码：</p>
                    </td>
                    <td>
                        <div class="tuanfabu_nr">
                            <input type="password" name="password" value="" class="tuanfabu_int tuanfabu_intw2" />
                        </div>
                    </td>
                </tr>
            </table>
            <div class="tuanfabu_an tac_l">
                <input type="submit" class="radius3 sjgl_an tuan_topbt" value="确    定" />
            </div>
        </form>
    </div>
</div>
</body>
</html>