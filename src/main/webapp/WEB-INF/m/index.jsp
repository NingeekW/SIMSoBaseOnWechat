<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>信息系统首页</title>
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
						<li class="mui-table-view-cell"><a href="query.html">我要查询</a>
						</li>
						<li class="mui-table-view-cell"><a href="vote.html">我要投票</a>
						</li>
						<li class="mui-table-view-cell"><a href="rate.html">我要评价</a>
						</li>
						<li class="mui-table-view-cell"><a href="enroll.html">我要报名</a>
						</li>
						<li class="mui-table-view-cell"><a href="payment.html">我要缴费</a>
						</li>
						<li class="mui-table-view-cell"><a href="personCenter.htm">个人中心</a>
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
				<label id="classResult">查询</label>
			</div>
		</section>

		<section class="query">
			<table>
				<tr>
					<td>
						<a href="timetable.html">
							<img src="img/timetable.png">
							<p>课表查询</p>
						</a>
					</td>
					<td>
						<a href="query_classroom.html">
							<img src="img/classroom.png">
							<p>教室查询</p>
						</a>
					</td>
				</tr>
				<tr>
					<td>
						<a href="query_keshi.html">
							<img src="img/keshi.png">
							<p>科室查询</p>
						</a>
					</td>
					<td>
						<a href="query_score.html">
							<img src="img/chengji.png">
							<p>成绩查询</p>
						</a>
					</td>
				</tr>
				<tr>
					<td>
						<a href="query_dianfei.html">
							<img src="img/electricity.png">
							<p>电费查询</p>
						</a>
					</td>
				</tr>
			</table>
		</section>
	</div>
	<script src="js/mui.min.js"></script>
</body>
</html>