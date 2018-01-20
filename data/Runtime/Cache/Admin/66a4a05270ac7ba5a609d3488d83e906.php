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
        <li class="li2">检查系统</li>
        <li class="li2 li3">发现系统BUG</li>
    </ul>
</div>
<div class="main-jsgl">
    <p class="attention"><span>注意：</span>因为历史原因可能部分客户的系统数据表存在问题，这里一次性检查！检查结果会被缓存10分钟，如果已经修改的情况下发现检查还存在问题可以清空缓存试试！</p>
    <div class="jsglNr" style="border-top:1px solid #dbdbdb;">
       
        <div class="tableBox">
            <table bordercolor="#dbdbdb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;"  >
                <tr>
                    <td colspan="20">不存在的数据表如下</td>
                  
                </tr>
             
                    <tr>  
                        <?php $i=0;foreach($tables as $val){$i++; ?>
                        <td><?php echo ($val); ?></td>
                        <?php } if($i%20==0) echo '</tr><tr>'; ?>
                 
                    </tr>
                
            </table>
        </div>
        
           <div class="tableBox">
            <table bordercolor="#dbdbdb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;"  >
                <tr>
                    <td colspan="3">不存在的数据库字段</td>
                </tr>
                <tr>  
                    <td>数据表</td>
                    <td>字段</td>
                    <td>字段类型</td>
                </tr>
                <?php foreach($cols as $k=>$val){ foreach($val as $v){ ?>
                <tr>  
                    <td><?php echo ($k); ?></td>
                    <td><?php echo ($v["col"]); ?></td>
                    <td><?php echo ($v["type"]); ?></td>
                </tr>
                <?php }} ?>
            </table>
        </div>
             <div class="tableBox">
            <table bordercolor="#dbdbdb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF;"  >
                <tr>
                    <td colspan="3">字段类型不正确的</td>
                </tr>
                <tr>  
                    <td>数据表</td>
                    <td>字段</td>
                    <td>需要改为</td>
                </tr>
                <?php foreach($coltype as $k=>$val){ foreach($val as $v){ ?>
                <tr>  
                    <td><?php echo ($k); ?></td>
                    <td><?php echo ($v["col"]); ?></td>
                    <td><?php echo ($v["type"]); ?></td>
                </tr>
                <?php }} ?>
            </table>
        </div>
    </div>
</div>

</div>
</body>
</html>