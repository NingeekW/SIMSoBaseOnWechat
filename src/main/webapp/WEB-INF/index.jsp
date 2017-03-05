<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>学生信息后台管理中心</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>   
    <script >
    //$(function() {
	//	if("${admin}"!="1"){
	//		document.getElementById("ManageUser").style.display="none";//隐藏ManageUser
	//		document.getElementById("RoleManage").style.display="none";//隐藏RoleManage
	//	}
	//});
	</script>   
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
   <h1><a href="personCenter.htm" target="right" title="修改密码">
    <img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />
    </a>学生信息后台管理中心</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="approve.htm" target="right"><span class="icon-home"></span> 待审批（5）</a> &nbsp;&nbsp;<a href="sign.htm" class="button button-little bg-blue" target="right">
  <span class="icon-wrench"></span> 待签订（10）</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="pay_type.htm" target="right"><span class="icon-power-off"></span> 收付款（20）</a>
  <a class="button button-little bg-red" href="exit.htm"><span class="icon-power-off"></span> 安全退出</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>基础设置</strong></div>
  <h2><span class="icon-user"></span>基本设置</h2>
  <ul style="display:block">
    <li id="ManageUser"><a href="ManageUser.htm" target="right" ><span class="icon-caret-right"></span>用户管理</a></li>
    <li><a href="stulist.htm" target="right"><span class="icon-caret-right"></span>学生信息管理</a></li>
    <li id="RoleManage"><a href="RoleManage.htm" target="right"><span class="icon-caret-right"></span>角色管理</a></li>   
    <li><a href="Dictshowall.htm" target="right"><span class="icon-caret-right"></span>数据字典</a></li>   
    <li><a href="enlist.htm" target="right"><span class="icon-caret-right"></span>企业信息</a></li>
    <li><a href="courselist.htm" target="right"><span class="icon-caret-right"></span>课程信息</a></li>
    
    <li><a href="DepartDatas.htm" target="right"><span class="icon-caret-right"></span>组织机构</a></li>     
    <li><a href="changepwd.htm" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
  </ul>   
  <h2><span class="icon-pencil-square-o"></span>合同管理</h2>
  <ul>
    <li><a href="list.htm" target="right"><span class="icon-caret-right"></span>模板管理</a></li>
    <li><a href="new_contract.htm" target="right"><span class="icon-caret-right"></span>创建</a></li>
      <li><a href="show_all.htm" target="right"><span class="icon-caret-right"></span>合同详情展示</a></li>
    <li><a href="approve.htm" target="right"><span class="icon-caret-right"></span>审批</a></li>        
	<li><a href="sign.htm" target="right"><span class="icon-caret-right"></span>签订</a></li>
	<li><a href="pay_type.htm" target="right"><span class="icon-caret-right"></span>收付款管理</a></li>
	<li><a href="over.htm" target="right"><span class="icon-caret-right"></span>归档</a></li>
	<li><a href="cate.html" target="right"><span class="icon-caret-right"></span>统计分析</a></li>
	<li><a href="Union_Query.htm" target="right"><span class="icon-caret-right"></span>组合查询</a></li>
  
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
  <li><a href="Welcome.htm" target="right" class="icon-home"> 首页</a></li>
  <li><a href="Welcome.htm" target="right" id="a_leader_txt">关于系统</a></li>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="Welcome.htm" name="right" width="100%" height="100%"></iframe>
</div>

</body>
</html>
