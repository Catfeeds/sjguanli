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
        <li class="li1">商城</li>
        <li class="li2">商家产品</li>
        <li class="li2 li3">商品类别</li>
    </ul>
</div>
<div class="main-cate">
    <p class="attention"><span>注意：</span>暂时2级分类,分类名称后面（）内的是分类的ID，每个分类要设定一个默认的结算汇率，汇率只能是千分之几，不能再有小数，比如千分之6，就代表商家要扣除平台的千分之六的佣金</p>
    <div class="jsglNr">
        <form id="cate_action" action="" target="baocms_frm" method="post">
            <div class="selectNr" style="border-top: 1px solid #dbdbdb;">
                <div class="left">
                    <?php echo BA('goodscate/create','','添加一级分类','load','',600,300);?>
                </div>
                <div class="right">
                    <?php echo BA('goodscate/update','','更新','list','remberBtn');?>
                </div>
            </div>
            <div class="tableBox">
                <table bordercolor="#dbdbdb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; margin:0px; vertical-align:middle; background-color:#FFF; text-align:center;">
                    <tr bgcolor="#3896C9" height="48px;" style="color:#FFF; font-size:16px; line-height:48px;">
                      <td>UID</td>
                        <td>分类</td>
                        <td>排序</td>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                        <td width="20%">自定字段1</td>
                           				<td width="20%">自定字段2</td>
                            			<td width="20%">自定字段3</td>
                            			<td width="20%">自定字段4</td>
                            			<td width="20%">自定字段5</td>
                                          </tr>
                      </table></td>
                        <td>费率</td>
                        <td>操作</td>
                    </tr>
                    <?php if(is_array($list)): foreach($list as $key=>$var): if(($var["parent_id"] == 0)): ?><tr bgcolor="#B3DCF0" height="48px" style="font-size:14px; color:#545454; text-align:left; line-height:48px;">
                              <td style="padding-left:20px;"><?php echo ($var["cate_id"]); ?></td>

                                <td style="padding-left:20px;"><?php echo ($var["cate_name"]); ?></td>
                                <td style="padding-left:70px;"><input name="orderby[<?php echo ($var["cate_id"]); ?>]" value="<?php echo ($var["orderby"]); ?>" type="text" class="remberinput w80" /></td>
                                <td>&nbsp;</td>
                                <td><?php echo ($var["rate"]); ?>‰（千分）</td>
                                <td style="text-align: center;">

                                    <?php echo BA('goodscate/create',array("parent_id"=>$var["cate_id"]),'添加子分类','load','remberBtn',600,300);?>
                                    <?php echo BA('goodscate/edit',array("cate_id"=>$var["cate_id"]),'编辑','load','remberBtn',600,300);?>
                                    <?php echo BA('goodscate/delete',array("cate_id"=>$var["cate_id"]),'删除','act','remberBtn');?>
                                </td>

                            </tr>
                           <?php if(is_array($list)): foreach($list as $key=>$var2): if(($var2["parent_id"]) == $var["cate_id"]): ?><tr bgcolor="#CBEBFA" style="font-size:14px; color:#545454; text-align:center; line-height:48px;" height="48px">
                                  <td align="left" style="padding-left:20px;"><?php echo ($var2["cate_id"]); ?></td>
                                    <td align="left" style="padding-left:20px;">&nbsp;&nbsp;&nbsp;&nbsp;|----<?php echo ($var2["cate_name"]); ?></td>
                                    <td style="padding-left:70px;">&nbsp;&nbsp;&nbsp;&nbsp;<input name="orderby[<?php echo ($var2["cate_id"]); ?>]" value="<?php echo ($var2["orderby"]); ?>" type="text" class="remberinput w80" /></td>
                                  <td>&nbsp;</td>
                                    <td><?php echo ($var2["rate"]); ?>‰（千分）</td>
                                    <td style="text-align: center;">
                                        <?php echo BA('goodscate/createone',array("parent_id"=>$var2["cate_id"]),'添加子分类','load','remberBtn',600,300);?>
                                        <?php echo BA('goodscate/edit',array("cate_id"=>$var2["cate_id"]),'编辑','load','remberBtn',600,300);?>
                                        <?php echo BA('goodscate/delete',array("cate_id"=>$var2["cate_id"]),'删除','act','remberBtn');?>
                                    </td>
                                </tr>
                                <?php if(is_array($list)): foreach($list as $key=>$var3): if(($var3["parent_id"]) == $var2["cate_id"]): ?><tr height="48px" style="font-size:14px; color:#545454; text-align:center; line-height:48px;">
                                      <td align="left" style="padding-left:20px;"><?php echo ($var3["cate_id"]); ?></td>
                                        <td align="left" style="padding-left:20px;">
                                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                            |----<?php echo ($var3["cate_name"]); ?>
                                        </td>
                                        <td style="padding-left:70px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input name="orderby[<?php echo ($var3["cate_id"]); ?>]" value="<?php echo ($var3["orderby"]); ?>" type="text" class="remberinput w80" />
                                      </td>
                                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                        <td width="20%"><?php echo ($var3["select1"]); ?></td>
                           				<td width="20%"><?php echo ($var3["select2"]); ?></td>
                            			<td width="20%"><?php echo ($var3["select3"]); ?></td>
                            			<td width="20%"><?php echo ($var3["select4"]); ?></td>
                            			<td width="20%"><?php echo ($var3["select5"]); ?></td>
                                          </tr>
                                        </table></td>
                                        <td><?php echo ($var3["rate"]); ?>‰（千分）</td>
                                 
                                        <td style="text-align: center;">
                                         	<?php echo BA('goodscate/setting',array("cate_id"=>$var3["cate_id"]),'配置分类','','remberBtn');?>
                                            <?php echo BA('goodscate/editone',array("cate_id"=>$var3["cate_id"]),'编辑','load','remberBtn',600,300);?>
                                            <?php echo BA('goodscate/delete',array("cate_id"=>$var3["cate_id"]),'删除','act','remberBtn');?>
                                        </td>
                                    </tr><?php endif; endforeach; endif; endif; endforeach; endif; endif; endforeach; endif; ?>        
                </table>
            </div>
        </form>
    </div>
</div>

</div>
</body>
</html>