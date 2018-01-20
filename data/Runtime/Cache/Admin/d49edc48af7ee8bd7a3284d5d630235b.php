<?php if (!defined('THINK_PATH')) exit();?>
<!DOCTYPE html>
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
<style>
/* .sp:hover{
    background-color: red;
} */
</style>
<div class="mainBt">
    <ul>
        <li class="li1">商城</li>
        <li class="li2">商城订单</li>
        <li class="li2 li3">订单汇总</li>
    </ul>
</div>
<div class="main-jsgl main-sc">
    <p class="attention"><span>注意：</span>这里只是明细查询的地方，如果发货需要在等待捡货那边进行操作！订单退货暂时只支持线下退货，线上可以在资金管理添加记录；等待发货的到付在这里状态筛选不出来，只能在到付等待捡货筛选！</p>
    <div class="jsglNr">
        <div class="selectNr" style="margin-top: 0px; border-top:none; padding-bottom: 0px;">
            <div class="right">
                <form class="search_form" method="post" action="<?php echo U('order/index');?>"> 
                    <div class="seleHidden" id="seleHidden">
                        <div class="seleK"> 
                            <label>
                                <input type="hidden" id="user_id" name="user_id" value="<?php echo (($user_id)?($user_id):''); ?>" />
                                <input type="text" name="nickname" id="nickname"  value="<?php echo ($nickname); ?>"   class="text" />
                                <a mini="select"  w="800" h="600" href="<?php echo U('user/select');?>" class="sumit">选择用户</a>
                            </label>
                            <label>
                                <span>状态</span>
                                <select name="st" class="select w100">
                                    <option value="999">请选择</option>
                                    <?php if(is_array($types)): foreach($types as $key=>$item): ?><option <?php if(($st) == $key): ?>selected="selected"<?php endif; ?>  value="<?php echo ($key); ?>"><?php echo ($item); ?></option><?php endforeach; endif; ?>

                                </select>
                            </label>
                            <label>
                                <span>订单编号</span>
                                <input type="text" name="keyword" value="<?php echo ($keyword); ?>" class="inptText" />

                                <input type="submit" value="   搜索"  class="inptButton" />
                            </label>
                        </div>
                    </div> 
                </form>
                <a href="javascript:void(0);" class="searchG">高级搜索</a>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
        <form method="post" action="<?php echo U('order/index');?>">
            <div class="selectNr selectNr2">
                <div class="left">
                    <div class="seleK">
                        <label>
                            <input type="hidden" id="user_id" name="user_id" value="<?php echo (($user_id)?($user_id):''); ?>" />
                            <input type="text" name="nickname" id="nickname"  value="<?php echo ($nickname); ?>"   class="text w150" />
                            <a style="margin-right: 5px;" mini="select"  w="800" h="600" href="<?php echo U('user/select');?>" class="sumit">选择用户</a>
                        </label>
                        <label>
                            <span>商家</span>
                            <input type="hidden" id="shop_id" name="shop_id" value="<?php echo (($shop_id)?($shop_id):''); ?>"/>
                            <input type="text"   id="shop_name" name="shop_name" value="<?php echo ($shop_name); ?>" class="text w150" />
                            <a style="margin-right: 5px;"  href="<?php echo U('shop/select');?>" mini='select' w='800' h='600' class="sumit">选择商家</a>
                        </label>
                        <label>
                            <span>状态</span>
                            <select name="st" class="select w80">
                                <option value="999">请选择</option>
                                <?php if(is_array($types)): foreach($types as $key=>$item): ?><option <?php if(($st) == $key): ?>selected="selected"<?php endif; ?>  value="<?php echo ($key); ?>"><?php echo ($item); ?></option><?php endforeach; endif; ?>

                            </select>
                        </label>
                        <label>
                            <span>开始时间</span>
                            <input type="text" name="bg_date" value="<?php echo (($bg_date)?($bg_date):''); ?>"  onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"  class="text w150" />
                        </label>
                        <label>
                            <span>结束时间</span>
                            <input type="text" name="end_date" value="<?php echo (($end_date)?($end_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"  class="text w150" />
                        </label>
                        <label>
                            <span>订单编号</span>
                            <input type="text" name="keyword" value="<?php echo ($keyword); ?>" class="inptText w100" />
                        </label>
                    </div>
                </div>
                <div class="right">
                    <input type="submit" value="   搜索"  class="inptButton" />
                </div>
                <div class="clear"></div>
            </div>
        </form>
        <div class="tableBox">

            <form  target="baocms_frm" method="post">

                <?php if(is_array($list)): foreach($list as $key=>$order): ?><table bordercolor="#e1e6eb" cellspacing="0" width="100%" border="1px"  style=" border-collapse: collapse; vertical-align:middle; background-color:#FFF; margin-top: 10px;"  >
                        <tr class="no sp">
                            <td><input class="child_order_id" name="order_id[]"  type="checkbox" value="<?php echo ($order["order_id"]); ?>" /> ID</td>
                            <td><?php echo ($order["order_id"]); ?></td>
                            <td>买家 </td>
                            <td><?php echo ($users[$order['user_id']]['account']); ?></td>


                            <td>创建时间</td>
                            <td><?php echo (date('Y-m-d H:i:s',$order["create_time"])); ?></td>
                            <td>创建IP</td>
                            <td><?php echo ($order["create_ip"]); ?></td>

                        </tr>

                        <tr class="no sp">
                            <td>总价值</td>
                            <td><?php echo round($order['total_price'],2);?></td>
                            <td>
                                卖家
                            </td>
                            <td>
                                <?php echo ($shops[$order['shop_id']]['shop_name']); ?>
                            </td>
                            <td>收货地址</td>
                            <td>
                                <?php echo ($areas[$addrs[$order['addr_id']]['area_id']]['area_name']); ?>、
                                <?php echo ($business[$addrs[$order['addr_id']]['business_id']]['business_name']); ?>、

                                <?php echo ($addrs[$order['addr_id']]['addr']); ?>
                                <br/>
                                <?php echo ($addrs[$order['addr_id']]['name']); ?>
                                <?php echo ($addrs[$order['addr_id']]['mobile']); ?>
                            </td>
                            <td>状态</td>
                            <td style="color: red;">
                                <?php if(($order["is_daofu"]) == "1"): ?>货到付款 ---<?php endif; ?>
                                <?php echo ($types[$order['status']]); ?>

                            </td>

                        </tr>

                        <tr class="no">
                            <td colspan="8">

                                <table class="spWidth" style="width:100%;">
                                    <tr class="no">
                                        <th>图片</th>
                                        <th>商品名称</th>
                                        <th>数量</th>
                                        <th>单价</th>
                                        <th>总价</th>
                                        <!--<th>状态</th>-->
                                        <!--<th>操作</th>-->
                                    </tr>  
                                    <?php if(is_array($goods)): foreach($goods as $key=>$good): if(($good["order_id"]) == $order["order_id"]): ?><tr class="no">
                                            <td><img width="80" src="__ROOT__/attachs/<?php echo ($products[$good['goods_id']]['photo']); ?>" /></td>
                                            <td><?php echo ($products[$good['goods_id']]['title']); ?></td>

                                            <td><?php echo ($good["num"]); ?></td>
                                            <td><?php echo ($good['price']); ?></td>
                                            <td><?php echo ($good['total_price']); ?></td>
                                            <!--
                                            <td  style="color: red;">
                                        <?php if($order['status'] != 0): echo ($goodtypes[$good['status']]); endif; ?>
                                        </td>
                                        -->
                                            <!--<td><a id="returnMoney" style="color:red;" onclick="wxRefund(<?php echo ($order["order_id"]); ?>)">申请退款</a></td>-->
                                        </tr><?php endif; endforeach; endif; ?>



                                </table>

                            </td>                    
                        </tr>


                    </table><?php endforeach; endif; ?>

                <?php echo ($page); ?>
            </form>
        <script>
            function wxRefund(id){
                var order_id = id;
                alert(order_id);die;
                $.ajax({
                    type : "POST",  //提交方式
                    url : '<?php echo U("app/upload/uploadify");?>',//路径
                    data : {
                        "org.id" : "${org.id}"
                    },//数据，这里使用的是Json格式进行传输
                    success : function(result) {//返回数据根据结果进行相应的处理
                        if ( result.success ) {
                            $("#tipMsg").text("删除数据成功");
                            tree.deleteItem("${org.id}", true);
                        } else {
                            $("#tipMsg").text("删除数据失败");
                        }
                    }
                });
            }
        </script>
        </div>
        
</div>
</body>
</html>