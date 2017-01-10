<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理中心</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>   
    <script >
		alert("欢迎使用合同管理系统");
	</script>   
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
   <h1><a href="Welcome.html" target="right" title="个人中心">
    <img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />
    </a>合同管理中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="" target="_blank"><span class="icon-home"></span> 待审批（5）</a> &nbsp;&nbsp;<a href="##" class="button button-little bg-blue">
  <span class="icon-wrench"></span> 待签订（10）</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="login.html"><span class="icon-power-off"></span> 收付款（20）</a>
  <a class="button button-little bg-red" href="exit.htm"><span class="icon-power-off"></span> 安全退出</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>基础设置</strong></div>
  <h2><span class="icon-user"></span>基本设置</h2>
  <ul style="display:block">
    <li><a href="info.html" target="right"><span class="icon-caret-right"></span>用户管理</a></li>
    <li><a href="pass.html" target="right"><span class="icon-caret-right"></span>日志管理</a></li>
    <li><a href="page.html" target="right"><span class="icon-caret-right"></span>角色权限</a></li>  
    <li><a href="adv.html" target="right"><span class="icon-caret-right"></span>数据字典</a></li>   
    <li><a href="book.html" target="right"><span class="icon-caret-right"></span>客户信息</a></li>     
    <li><a href="column.html" target="right"><span class="icon-caret-right"></span>栏目管理</a></li>
    <li><a href="changepwd.htm" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>合同管理</h2>
  <ul>
    <li><a href="list.html" target="right"><span class="icon-caret-right"></span>模板管理</a></li>
    <li><a href="add.html" target="right"><span class="icon-caret-right"></span>创建</a></li>
    <li><a href="cate.html" target="right"><span class="icon-caret-right"></span>审批</a></li>        
	<li><a href="cate.html" target="right"><span class="icon-caret-right"></span>签订</a></li>
	<li><a href="cate.html" target="right"><span class="icon-caret-right"></span>进度更新</a></li>
	<li><a href="cate.html" target="right"><span class="icon-caret-right"></span>归档</a></li>
	<li><a href="cate.html" target="right"><span class="icon-caret-right"></span>统计分析</a></li>
  
  </ul>  
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="Welcome.html" target="right" class="icon-home"> 首页</a></li>
  <li><a href="Welcome.html" target="right" id="a_leader_txt">关于系统</a></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="Welcome.html" name="right" width="100%" height="100%"></iframe>
</div>

</body>
</html>
