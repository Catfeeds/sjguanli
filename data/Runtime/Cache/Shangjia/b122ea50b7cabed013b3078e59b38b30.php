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
        box-sizing: border-box;
    }

    .title {
        padding-bottom: 30px;
        padding-left: 30px;
    }

    .title p {}

    .title div {
        margin-top: 15px;
    }

    .title div span,
    .title div i {
        font-style: normal;
        color: red;
    }

    td div {
        cursor: pointer;
    }

    form td div {
        position: relative;
        display: inline-block;
        transform: translateY(3px);
        width: 13px;
        height: 13px;
        background: #fff;
    }

    form td div input {
        visibility: hidden;
    }

    form .active i {
        background: url('__TMPL__statics/images/icon_xuanzhong_sel14x14.png') center/cover no-repeat;
        border: 0;
    }

    form td div i {
        position: absolute;
        width: 14px;
        height: 14px;
        left: 0;
        top: 0px;
        border: 1px solid #C8D5E0;
        border-radius: 3px;
    }

    .btn div {
        display: inline-block;
        border: 0;
        color: #fff;
        border: 0;
        background: #0ECEAF;
        line-height: 40px;
        display: inline-block;
        width: 128px;
        height: 40px;
        border-radius: 3px;
        text-align: center;
        cursor: pointer;
        margin-left: 10px;
    }
    .btn{
        text-align: center;
        margin-top: 50px;
    }
    a{
        color: #1C99FA;
        text-decoration: underline;
    }
    .poptip{
        top:20%;

    }
</style>
<div class="tuan_content">
    <div class="title">
        <p>每月X-X日为对账日，X-X日为打款日，请知悉并认真核对结算单</p>
        <div>已选择可结算订单数：
            <span>0</span> 已选择可结算总金额：
            <i>0</i> 元</div>
    </div>
    <form method="post" target="baocms_frm" action="<?php echo U('goods/index');?>">
        <input type="hidden" name="ids" id="ids" value=""/>
        <table class="tuan_table" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr class="first_tr">
                <td class="check" style="width:80px">
                    <div class="all" for="in1">
                        <i></i>
                        <input id="in1" name="refund" type="checkbox" name="index" value="0">
                    </div>
                </td>
                <td>活动名称</td>
                <td class="arrow arrow1">可结算订单数
                    <span>
                        <i></i>
                        <s></s>
                    </span>
                </td>
                <td class="arrow arrow2">可结算金额
                    <span>
                        <i></i>
                        <s></s>
                    </span>
                </td>
            </tr>
            <script>
                $(function () {
                    arrow('arrow1')
                    arrow('arrow2')

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
            <?php if(is_array($goods_info)): foreach($goods_info as $key=>$vg): if($vg["count"] != 0): ?><tr>
                    <td>
                        <div class="item">
                            <i></i>
                            <input name="refund" type="checkbox" name="goods_id[]" value="<?php echo ($vg["goods_id"]); ?>" />
                        </div>
                    </td>
                    <td>
                        <?php echo ($vg["title"]); ?>
                    </td>
                    <td>
                        <a href="<?php echo U('money/balance',array('goods_id'=>$vg['goods_id'],'title'=>$vg['title'],'is_balance'=>1));?>">
                            <?php echo ($vg["count"]); ?>
                        </a>
                    </td>
                    <td class="price">
                        <?php echo ($vg["sum"]); ?>
                    </td>
                </tr><?php endif; endforeach; endif; ?>
        </table>
        <script>
            $(function () {
                $('.all').on('click', function () {
                    $('.all').toggleClass('active');
                    $('.all').hasClass('active') ? $('.item').addClass('active') : $('.item').removeClass('active');
                    $('input').prop('checked', $('.all').hasClass('active'));
                    calc()
                })
                $('.item').on('click', function () {
                    $(this).toggleClass('active');
                    $(this).children('input').prop('checked', $(this).hasClass('active'));
                    console.log($(this).children('input').prop('checked'));
                    calc()
                })
                var ids;
                function calc() {
                    ids = '';
                    var num = 0,price = 0;
                    var items = $('.item');
                    for (let i = 0; i < items.length; i++) {
                        if ($($('.item')[i]).hasClass('active')) {
                            console.log(items[i].childNodes[3].value)
                            ids+=items[i].childNodes[3].value+',';
                            num+=$($('.item')[i]).parents('tr').children()[2].innerText/1;;
                            price+=$($('.item')[i]).parents('tr').children()[3].innerText/1;
                        }
                    }
                    $('.title span').text(num)
                    $('.title i').text(price)
                }
                $('.btn div').on('click',function () {
                    if($('.title span').text()==0){
                        jctip('请选择活动')
                    //     $('.poptip').fadeIn(200)
                    //     setTimeout(() => {
                    //     $('.poptip').fadeOut(200)
                    // }, 2000);
                    }else{
                        $("#ids").val(ids);
                        $('form').submit();
//                        console.log(ids);
                        console.log('<?php echo U("money/submit");?>');
                        location.href = '<?php echo U("money/submit");?>'+'?ids='+ids;
//                        $.ajax({
//                            type: "POST", //提交方式
//                            url: '<?php echo U("money/applydata");?>', //路径
//                            data: {"ids": ids}, //数据，这里使用的是Json格式进行传输
//                            success: function (result) { //返回数据根据结果进行相应的处理
//                                console.log(result.url);
//                                alert(result.msg);
//                                if(result.code == 1){
//                                    window.location.href = result.url;
//                                }
//                            }
//                        });
                    }
                })
            })
        </script>
        <div class="btn"><div>生成结算单</div></div>
    </form>
    <!-- <div class="poptip"></div> -->
    <div class="paging">
        <?php echo ($page); ?>
    </div>
</div>

</body>
</html>