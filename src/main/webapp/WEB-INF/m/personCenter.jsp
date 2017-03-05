<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>个人中心</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- loading mui -->
	<link rel="stylesheet" type="text/css" href="css/mui.min.css">
	<!-- custorm style -->
	<link rel="stylesheet" type="text/css" href="css/mstyle.css">
</head>
<body>
	<!-- 导航栏 -->
	<header id="header" class="mui-bar mui-bar-nav">
		<h1 class="mui-title">武汉工程大学邮电与信息工程学院</h1>
		<a class="mui-action-back mui-btn mui-btn-blue mui-btn-link mui-btn-nav mui-pull-left" href="javascript:history.go(-1)"><span class="mui-icon mui-icon-left-nav"></span></a>
		<a class="mui-icon mui-icon-bars mui-pull-right" href="#topPopover"></a>
	</header>
	<!-- 右上角弹出菜单 -->
	<div id="topPopover" class="mui-popover">
			<div class="mui-popover-arrow"></div>
			<div class="mui-scroll-wrapper">
				<div class="mui-scroll">
					<ul class="mui-table-view">
						<li class="mui-table-view-cell">
							<a href="query.html">我要查询</a>
						</li>
						<li class="mui-table-view-cell"><a href="vote.html">我要投票</a>
						</li>
						<li class="mui-table-view-cell"><a href="rate.html">我要评价</a>
						</li>
						<li class="mui-table-view-cell"><a href="enroll.html">我要报名</a>
						</li>
						<li class="mui-table-view-cell"><a href="payment.html">我要缴费</a>
						</li>
						<li class="mui-table-view-cell"><a href="personCenter.html">个人中心</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 主内容部分 -->
	<div class="content">
		<section class="xueqi">
			<div class="class">
				<label id="classResult">个人中心</label>
			</div>
		</section>
		<section class="personData">
			<ul class="mui-table-view mui-table-view-chevron">
				<li class="mui-table-view-cell mui-media">
					<a class="mui-navigate-right" href="#">
						<img class="mui-media-object mui-pull-left head-img" id="
						head-img" src="img/timg.jpeg">
						<label class="name">${stuInfo.stuName}</label>
					</a>
				</li>
			</ul>
			<ul class="mui-table-view">
				<li class="mui-table-view-cell">
					<a>班级<span class="mui-pull-right">${stuInfo.stuClassId}</span></a>
				</li>
				<li class="mui-table-view-cell">
					<a>学号<span class="mui-pull-right">${stuInfo.stuId}</span></a>
				</li>
				<li class="mui-table-view-cell">
					<a>性别<span class="mui-pull-right">${stuInfo.stuSex}</span></a>
				</li>
				<li class="mui-table-view-cell">
					<a>专业<span class="mui-pull-right">${stuInfo.stuSpecialty}</span></a>
				</li>
				<li class="mui-table-view-cell">
					<a>身份证号<span class="mui-pull-right">${stuInfo.idNumber}</span></a>
				</li>
				<li class="mui-table-view-cell">
					<a>年龄<span class="mui-pull-right">${stuInfo.stuEntranceDate}</span></a>
				</li>
				<li class="mui-table-view-cell">
					<a>民族<span class="mui-pull-right">${stuInfo.stuNation}</span></a>
				</li>
				<li class="mui-table-view-cell">
					<a>政治面貌<span class="mui-pull-right">${stuInfo.stuPolitic}</span></a>
				</li>				
			</ul>
		</section>
	</div>
	<script src="js/mui.min.js"></script>
</body>
</html>