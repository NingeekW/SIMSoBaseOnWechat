<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>角色列表</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>



<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 角色列表</strong></div>
  <div class="padding border-bottom">  
	<a class="button border-yellow" href="AddRole.htm"><span class="icon-plus-square-o"></span> 添加角色</a>
  </div> 
  <table class="table table-hover text-center">
    <tr>
      <th width="5%">角色ID</th>     
      <th>角色名称</th>  
      <th width="250">启用状态</th>     
      <th >操作</th>
    </tr>
   
  <c:forEach items="${roles}" var="role">
    <tr>
      <td>${role.roleId}</td>      
      <td>${role.roleName}</td>  
      <td>${role.state}</td>      
      <td>
      <div class="button-group">
		<a class="button border-main" href="RoleManage_SourceManage.htm?role_id=${role.roleId}"><span class="icon-edit"></span> 资源管理</a>
		<a class="button border-main" href="RoleManage_ReviseRole.htm?roleId=${role.roleId}"><span class="icon-edit"></span> 修改</a>  
		<a class="button border-red" href="javascript:void(0)" onclick="return del(${role.roleId})"><span class="icon-trash-o"></span> 删除</a> 
      </div>
      </td>
    </tr> 
    </c:forEach>
    
<script>
function del(id){
	if(confirm("您确定要删除吗?")){
		window.location.href="delete.htm?id="+id;
	}
}
</script>

</body></html>