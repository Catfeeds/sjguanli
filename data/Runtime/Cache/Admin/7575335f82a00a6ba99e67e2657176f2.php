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
        <li class="li1">系统</li>
        <li class="li2">管理员管理</li>
        <li class="li2 li3">角色管理</li>
    </ul>
</div>
<div class="main-jsgl">
    <p class="attention"><span>注意：</span>每个角色有对应的权限，默认超级管理员角色不能删除！</p>
    <div class="jsglNr" style="  border-top: 1px solid #e1e6eb;">
        <div class="selectNr">
            <div class="left">
                <?php echo BA('role/create','','添加角色','load','',600,220);?>
            </div>
            <form method="post" action="<?php echo U('role/index');?>">
                <div class="right">
                    <input type="text" name="keyword" value="<?php echo ($keyword); ?>" class="inptText" /><input type="submit" value="  搜索"  class="inptButton" />
                </div>
            </form>
        </div>
        <div class="tableBox">
            <table bordercolor="#e1e6eb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;"  >
                <tr>
                    <td>用户ID</td>
                    <td>用户名</td>
                    <td>操作</td>
                </tr>
                <?php if(is_array($list)): foreach($list as $key=>$var): ?><tr>
                        <td><?php echo ($var["role_id"]); ?></td>
                        <td><?php echo ($var["role_name"]); ?></td>
                        <td><?php if(($var["role_id"]) == "1"): ?>没有可操作的
                    <?php else: ?>
                    <?php echo BA('role/auth',array("role_id"=>$var['role_id']),'角色权限','','remberBtn');?>
                    <?php echo BA('role/delete',array("role_id"=>$var['role_id']),'删除','act','remberBtn'); endif; ?></td>
                    </tr><?php endforeach; endif; ?>
            </table>
            <?php echo ($page); ?>
        </div>
    </div>
</div>

</div>
</body>
</html>