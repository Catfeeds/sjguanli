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
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }
    table,form{
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

    .publish {
        border: none;
        width: 112px;
        margin-right: 10px;
        padding: 0;
        margin: 0!important;
        transform: translate(-19px);
    }

    .publish>div {
        width: 112px;
    }

    .goods_publish {
        padding: 0;
        margin: 0!important;
        width: 112px;
        text-align: center;
        line-height: 35px;
        border: 0;
        background: #0ECEAF;
        color: #fff;
        font-size: 14px;
    }

    .goods_publish span {
        font-size: 20px;
        vertical-align: center;
        position: relative;
        font-weight: 600;
        display: inline-block;
        transform: translateY(1px);
        margin-right: 4px;
    }

    .goods_btn {
        padding: 0 20px;
    }

    .goods_inp {
        font-size: 14px;
    }

    .goods_name {
        width: 340px!important;
        margin-right: 20px;
    }

    .goods_time {
        width: 210px!important;
    }

    .wave {
        font-size: 20px;
        margin: 0 5px;
    }

    table tr td:first-child {
        padding-left: 20px;
    }

    table tr {
        border-radius: 10px;
    }
    /* table .first_tr{
        border: 0;
    }
    table .first_tr td{
        background: #EDF3F8;
    }
    table .first_tr td:first-child{
        background: #EDF3F8;
        border-bottom-left-radius: 4px;
        border-top-left-radius: 4px;
    }
    table .first_tr td:last-child{
        background: #EDF3F8;
        border-bottom-right-radius: 4px;
        border-top-right-radius: 4px;
    } */

    .operation1 {
        color: #fff;
    }

    .operation {
        cursor: pointer;
        display: inline-block;
        width: 56px;
        height: 24px;
        text-align: center;
        line-height: 24px;
        border-radius: 3px;
    }

    .operation2 {
        border: 1px solid #C8D5E0;
        line-height: 22px;
        margin-left: 10px;
    }
    .count{
        color: #1C99FA;
        text-decoration: underline;
    }
    /* 下架 */
    form,table{
        min-width: 1316px;
        overflow: hidden;
    }
    .bgY {
        background: #F8C556;
    }
    /* 取消申请 */

    .bgR {
        background: #FF5EC2;
    }
    /* 编辑 */

    .bgG {
        background: #0ECEAF;
    }
    /* 下架删除 */

    .col1 {
        color: #A4B4C4;
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
            <a href="<?php echo U('goods/index',array('type'=>0));?>">全部活动</a>
        </li>
        <li class="tuanfabu_tabli <?php if($type == 1): ?>on<?php endif; ?>">
            <a href="<?php echo U('goods/index',array('type'=>1));?>">编辑中</a>
        </li>
        <li class="tuanfabu_tabli <?php if($type == 2): ?>on<?php endif; ?>">
            <a href="<?php echo U('goods/index',array('type'=>2));?>">待审核</a>
        </li>
        <li class="tuanfabu_tabli <?php if($type == 3): ?>on<?php endif; ?>">
            <a href="<?php echo U('goods/index',array('type'=>3));?>">审核不通过</a>
        </li>
        <li class="tuanfabu_tabli <?php if($type == 4): ?>on<?php endif; ?>">
            <a href="<?php echo U('goods/index',array('type'=>4));?>">已发布</a>
        </li>
        <li class="tuanfabu_tabli <?php if($type == 88): ?>on<?php endif; ?>">
            <a href="<?php echo U('goods/index',array('type'=>88));?>">已结束</a>
        </li>
        <li class="tuanfabu_tabli <?php if($type == 99): ?>on<?php endif; ?>">
            <a href="<?php echo U('goods/index',array('type'=>99));?>">回收站</a>
        </li>
        <li class="tuanfabu_tab publish right">
            <div class="right tuan_topfb_r" style="float: left">
                <a class="radius3 sjgl_an tuan_topbt goods_publish" target="main_frm" href="<?php echo U('goods/chosetype');?>">
                    <span>+</span>发布活动</a>
            </div>
        </li>
    </ul>
</div>
<div class="tuan_content goods_main">
    <form method="post" action="<?php echo U('goods/index');?>">
        <div class="radius5 tuan_top">
            <div class="tuan_top_t goods_form">
                <!-- <div class="left tuan_topser_l goods_inp">
            活动名称：<input type="text" class="radius3 tuan_topser goods_name"  name="name" value="<?php echo ($name); ?>" style="width:180px"/>
            活动起止时间：<input type="text" class="radius3 tuan_topser goods_time"  name="bg_date" value="<?php echo (($bg_date)?($bg_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"style="width:180px"/>
            <span class="wave">~</span> <input type="text" class="radius3 tuan_topser goods_time"  
            name="end_date" value="<?php echo (($end_date)?($end_date):''); ?>" onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd HH:mm:ss'});"style="width:180px"/> -->
                <!-- 活动状态：<select name="status" class="radius3 tuan_topser" style="width:180px">
                <option value="">请选择订单状态</option>
                <?php if(is_array($status_type)): foreach($status_type as $k=>$vs): ?><option value="<?php echo ($k); ?>" <?php if(($k) == $status): ?>selected="selected"<?php endif; ?>><?php echo ($vs); ?></option><?php endforeach; endif; ?>
            </select>
            排序：<select name="order" class="radius3 tuan_topser" style="width:180px">
                <option value="">请选择排序规则</option>
                <option value="1">按活动开始时间</option>
                <option value="2">按报名截止时间</option>
            </select> -->
                <!-- <input type="submit" style="margin-left:10px;" class="radius3 sjgl_an tuan_topbt goods_btn" value="查询"/>
            </div> -->
            </div>
        </div>
    </form>

    <table class="tuan_table" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr class="first_tr">
            <td>活动图片</td>
            <td class="arrow arrow1">
                活动名称
                <span>
                    <i></i>
                    <s></s>
                </span>
            </td>
            <td class="arrow arrow2">
                市场价格
                <span>
                    <i></i>
                    <s></s>
                </span>
            </td>
            <td class="arrow arrow3">
                活动起止时间
                <span>
                    <i></i>
                    <s></s>
                </span>
            </td>
            <td class="arrow arrow4">报名截止时间
                <span>
                    <i></i>
                    <s></s>
                </span>
            </td>
            <td>已报名人数</td>
            <td>状态</td>
            <td>操作</td>
            <!-- <td></td> -->
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
        <?php if(is_array($list)): foreach($list as $key=>$var): ?><tr>
                <td style="height: 80px;">
                    <img src="__ROOT__/attachs/<?php echo ($var["photo"]); ?>" style="width: 80px;margin: 0px auto;" />
                </td>
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
                    <a class="count" href="<?php echo U('goods/count');?>"><?php echo ($var["count"]); ?></a>
                    
                </td>
                <td>
                    <?php if($var["status"] == '1'): ?>编辑中<?php endif; ?>
                    <?php if($var["status"] == '2'): ?>待审核<?php endif; ?>
                    <?php if($var["status"] == '3'): ?>审核不通过<?php endif; ?>
                    <?php if($var["status"] == '4'): ?>已发布<?php endif; ?>
                </td>
                <td>
                    <?php if((($var["status"] == 1) OR ($var["status"] == 3)) AND ($de == 0)): ?><a class="operation operation1 bgG" href="<?php echo U('goods/editgoods',array('goods_id'=>$var['goods_id'],'goods_type'=>$var['goods_type']));?>">编辑</a><?php endif; ?>
                    <?php if(($de != 1) AND ($var["status"] == 2)): ?><span class="operation operation1 bgR" onclick="returnedits(<?php echo ($var["goods_id"]); ?>)">取消申请</span><?php endif; ?>
                    <?php if(($de != 1) AND (($var["status"] == 4) OR ($tt == 1))): ?><span class="operation operation1 bgY" onclick="copys(<?php echo ($var["goods_id"]); ?>)">复制信息</span><?php endif; ?>
                    <?php if($de == 1): ?><span class="operation operation1 bgR" onclick="recovers(<?php echo ($var["goods_id"]); ?>)">恢复</span><?php endif; ?>
                    <?php if(($de != 1) AND (($var["status"] == 1) OR ($var["status"] == 3) OR ($tt == 1)) ): ?><span class="operation operation2" onclick="deletes(<?php echo ($var["goods_id"]); ?>)">删除</span><?php endif; ?>
                </td>
                <!-- <td>
                <a class="radius3 sy_c1an" href="<?php echo U('goods/edit',array('goods_id'=>$var['goods_id']));?>">编辑</a>
            </td> -->
            </tr><?php endforeach; endif; ?>
    </table>
    <?php echo ($page); ?>
</div>
<script>
    function deletes(id) {
        var goods_id = id;
        if (confirm("是否确定删除？")) {
            $.ajax({
                type: "POST", //提交方式
                url: '<?php echo U("goods/deletes");?>', //路径
                data: {
                    "goods_id": goods_id
                }, //数据，这里使用的是Json格式进行传输
                success: function (result) { //返回数据根据结果进行相应的处理
                    alert(result.msg);
                    window.location.reload();
                }
            });
        }
    }

    function grounds(id, val) {
        var goods_id = id;
        var val = val;
        if (val == 1) {
            var str = '是否执行上架操作？';
        } else {
            var str = '是否执行下架操作？';
        }
        if (confirm(str)) {
            $.ajax({
                type: "POST", //提交方式
                url: '<?php echo U("goods/grounds");?>', //路径
                data: {
                    "goods_id": goods_id,
                    "val": val
                }, //数据，这里使用的是Json格式进行传输
                success: function (result) { //返回数据根据结果进行相应的处理
                    alert(result.msg);
                    window.location.reload();
                }
            });
        }
    }

    function copys(id) {
        var goods_id = id;
        if (confirm("是否确定复制此条活动信息?")) {
            $.ajax({
                type: "POST", //提交方式
                url: '<?php echo U("goods/copys");?>', //路径
                data: {
                    "goods_id": goods_id
                }, //数据，这里使用的是Json格式进行传输
                success: function (result) { //返回数据根据结果进行相应的处理
                    alert(result.msg);
                    window.location.reload();
                }
            });
        }
    }

    function returnedits(id) {
        var goods_id = id;
        if (confirm("是否确定取消申请?")) {
            $.ajax({
                type: "POST", //提交方式
                url: '<?php echo U("goods/returnedits");?>', //路径
                data: {
                    "goods_id": goods_id
                }, //数据，这里使用的是Json格式进行传输
                success: function (result) { //返回数据根据结果进行相应的处理
                    alert(result.msg);
                    window.location.reload();
                }
            });
        }
    }

    function recovers(id) {
        var goods_id = id;
        if (confirm("是否确定恢复此条活动?")) {
            $.ajax({
                type: "POST", //提交方式
                url: '<?php echo U("goods/recovers");?>', //路径
                data: {
                    "goods_id": goods_id
                }, //数据，这里使用的是Json格式进行传输
                success: function (result) { //返回数据根据结果进行相应的处理
                    alert(result.msg);
                    window.location.reload();
                }
            });
        }
    }
</script>
</body>
</html>