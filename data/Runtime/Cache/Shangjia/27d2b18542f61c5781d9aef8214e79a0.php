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
<style>
	.tuan_topbt {
		float: right;
	}

	.add {
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

	.add span {
		font-size: 20px;
		vertical-align: center;
		position: relative;
		font-weight: 600;
		display: inline-block;
		transform: translateY(1px);
		margin-right: 4px;
	}

	table tr td:first-child {
		padding-left: 30px;
	}

	.tuan_table {
		margin-top: 58px;
	}

	.tag1 {
		color: #fff;
		background: #0ECEAF;
	}

	.tag {
		cursor: pointer;
		display: inline-block;
		width: 56px;
		height: 24px;
		text-align: center;
		line-height: 24px;
		border-radius: 3px;
	}

	.tag2 {
		border: 1px solid #C8D5E0;
		line-height: 22px;
		margin-left: 10px;
	}
</style>
<!-- <div class="sjgl_lead">
	<ul>
		<li><a href="#">商家管理</a> > <a href="">管理员管理</a> > <a>管理员列表</a></li>
	</ul>
</div> -->
<div class="tuan_content">
	<a class="radius3 sjgl_an tuan_topbt add" href="<?php echo U('worker/create');?>">
		<span>+</span>添加管理员</a>
	<form method="post" action="<?php echo U('worker/index');?>">
		<div class="radius5 tuan_top">
			<div class="tuan_top_t">
				<!--<div class="left tuan_topser_l">-->
				<!--商家添加员工进行团购、优惠券、预约的受理，还能生成员工的微名片！<input type="text" class="radius3 tuan_topser" name="keyword" value="<?php echo ($keyword); ?>"/><input type="submit" style="margin-left:10px;" class="radius3 sjgl_an tuan_topbt" value="搜 索"/>-->
				<!--</div>-->
			</div>
		</div>
	</form>
	<table class="tuan_table" width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr class="first_tr">
			<td>真实姓名</td>
			<td>客户电话</td>
			<td class="arrow">创建时间
				<span>
					<i></i>
					<s></s>
				</span>
			</td>
			<td>操作</td>
		</tr>
		<script>
			$(function () {
				var i = 0;
				$('.arrow').on('click', function () {
					i++;
					if (i % 2) {
						this.childNodes[1].className = 'ascending';
					} else {
						this.childNodes[1].className = 'descending';
					}
				})
			})
		</script>
		<?php if(is_array($list)): foreach($list as $key=>$var): ?><tr>
				<td>
					<?php echo ($var["work_name"]); ?>
				</td>
				<td>
					<?php echo ($var["work_mobile"]); ?>
				</td>
				<td>
					<?php echo ($var["created_at"]); ?>
				</td>
				<td>
					<a class="tag tag1" href="<?php echo U('worker/edit',array('work_id'=>$var['shop_work_id']));?>">编辑</a>
					<a class="tag tag2" href="<?php echo U('worker/delete',array('work_id'=>$var['shop_work_id']));?>">删除</a>
				</td>
			</tr><?php endforeach; endif; ?>
	</table>
	<?php echo ($page); ?>
</div>