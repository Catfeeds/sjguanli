<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><?php echo ($CONFIG["site"]["title"]); ?>管理后台</title>
        <meta name="description" content="<?php echo ($CONFIG["site"]["title"]); ?>管理后台" />
        <meta name="keywords" content="<?php echo ($CONFIG["site"]["title"]); ?>管理后台" />
        <!-- <link href="__TMPL__statics/css/index.css" rel="stylesheet" type="text/css" /> -->
        <link href="__TMPL__statics/css/style.css" rel="stylesheet" type="text/css" />
        <link href="__TMPL__statics/css/land.css" rel="stylesheet" type="text/css" />
        <link href="__TMPL__statics/css/pub.css" rel="stylesheet" type="text/css" />
        <link href="__TMPL__statics/css/main.css" rel="stylesheet" type="text/css" />
        <link href="__TMPL__statics/css/modify.css" rel="stylesheet" type="text/css" />
        <link href="__PUBLIC__/js/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script> var BAO_PUBLIC = '__PUBLIC__'; var BAO_ROOT = '__ROOT__'; </script>
        <script src="__PUBLIC__/js/jquery.js"></script>
        <script src="__PUBLIC__/js/jquery-ui.min.js"></script>
        <script src="__PUBLIC__/js/my97/WdatePicker.js"></script>
        <script src="__PUBLIC__/js/admin.js?v=20150409"></script>
        <script src="__PUBLIC__/js/uploadify/ajaxfileupload.js"></script>
    </head>
    <body>
         <iframe id="baocms_frm" name="baocms_frm" style="display:none;"></iframe>
   <div class="main">
<div class="mainBt">
    <ul>
        <li class="li1">设置</li>
        <li class="li2">基本设置</li>
        <li class="li2 li3">微店类型设置</li>
    </ul>
</div>
<p class="attention"><span>注意：</span>
微店类型设置
</p>
<form  target="baocms_frm" action="<?php echo U('setting/mall');?>" method="post">
    <div class="mainScAdd">
        <div class="tableBox">
            <table  bordercolor="#dbdbdb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;" >
                <tr>
                    <td class="lfTdBt">微店类型1：</td>
                    <td class="rgTdBt">
                    	<input type="text" name="data[ming1]" value="<?php echo ($CONFIG["mall"]["ming1"]); ?>" class="scAddTextName w150" />
                        <code>微店类型名称</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="data[dian1]" value="<?php echo ($CONFIG["mall"]["dian1"]); ?>" class="scAddTextName w150" />
                        <code>ID是微店类型的固定数字，不重复即可</code>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">微店类型2：</td>
                    <td class="rgTdBt">
                    	<input type="text" name="data[ming2]" value="<?php echo ($CONFIG["mall"]["ming2"]); ?>" class="scAddTextName w150" />
                        <code>微店类型名称</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="data[dian2]" value="<?php echo ($CONFIG["mall"]["dian2"]); ?>" class="scAddTextName w150" />
                        <code>ID是微店类型的固定数字，不重复即可</code>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">微店类型3：</td>
                    <td class="rgTdBt">
                    	<input type="text" name="data[ming3]" value="<?php echo ($CONFIG["mall"]["ming3"]); ?>" class="scAddTextName w150" />
                        <code>微店类型名称</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="data[dian3]" value="<?php echo ($CONFIG["mall"]["dian3"]); ?>" class="scAddTextName w150" />
                        <code>ID是微店类型的固定数字，不重复即可</code>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">微店类型4：</td>
                    <td class="rgTdBt">
                    	<input type="text" name="data[ming4]" value="<?php echo ($CONFIG["mall"]["ming4"]); ?>" class="scAddTextName w150" />
                        <code>微店类型名称</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="data[dian4]" value="<?php echo ($CONFIG["mall"]["dian4"]); ?>" class="scAddTextName w150" />
                        <code>ID是微店类型的固定数字，不重复即可</code>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">微店类型5：</td>
                    <td class="rgTdBt">
                    	<input type="text" name="data[ming5]" value="<?php echo ($CONFIG["mall"]["ming5"]); ?>" class="scAddTextName w150" />
                        <code>微店类型名称</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="data[dian5]" value="<?php echo ($CONFIG["mall"]["dian5"]); ?>" class="scAddTextName w150" />
                        <code>ID是微店类型的固定数字，不重复即可</code>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">微店类型6：</td>
                    <td class="rgTdBt">
                    	<input type="text" name="data[ming6]" value="<?php echo ($CONFIG["mall"]["ming6"]); ?>" class="scAddTextName w150" />
                        <code>微店类型名称</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="data[dian6]" value="<?php echo ($CONFIG["mall"]["dian6"]); ?>" class="scAddTextName w150" />
                        <code>ID是微店类型的固定数字，不重复即可</code>
                    </td>
                </tr><tr>
                    <td class="lfTdBt">微店类型7：</td>
                    <td class="rgTdBt">
                    	<input type="text" name="data[ming7]" value="<?php echo ($CONFIG["mall"]["ming7"]); ?>" class="scAddTextName w150" />
                        <code>微店类型名称</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="data[dian7]" value="<?php echo ($CONFIG["mall"]["dian7"]); ?>" class="scAddTextName w150" />
                        <code>ID是微店类型的固定数字，不重复即可</code>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">微店类型8：</td>
                    <td class="rgTdBt">
                    	<input type="text" name="data[ming8]" value="<?php echo ($CONFIG["mall"]["ming8"]); ?>" class="scAddTextName w150" />
                        <code>微店类型名称</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="data[dian8]" value="<?php echo ($CONFIG["mall"]["dian8"]); ?>" class="scAddTextName w150" />
                        <code>ID是微店类型的固定数字，不重复即可</code>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">微店类型9：</td>
                    <td class="rgTdBt">
                    	<input type="text" name="data[ming9]" value="<?php echo ($CONFIG["mall"]["ming9"]); ?>" class="scAddTextName w150" />
                        <code>微店类型名称</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="data[dian9]" value="<?php echo ($CONFIG["mall"]["dian9"]); ?>" class="scAddTextName w150" />
                        <code>ID是微店类型的固定数字，不重复即可</code>
                    </td>
                </tr>
                <tr>
                    <td class="lfTdBt">微店类型10：</td>
                    <td class="rgTdBt">
                    	<input type="text" name="data[ming10]" value="<?php echo ($CONFIG["mall"]["ming10"]); ?>" class="scAddTextName w150" />
                        <code>微店类型名称</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" name="data[dian10]" value="<?php echo ($CONFIG["mall"]["dian10"]); ?>" class="scAddTextName w150" />
                        <code>ID是微店类型的固定数字，不重复即可</code>
                    </td>
                </tr>
            </table>
        </div>
        <div class="smtQr"><input type="submit" value="确认保存" class="smtQrIpt" /></div>
    </div>
</form>

</div>
</body>
</html>