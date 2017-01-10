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
    <title>${role.roleName}资源列表</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> ${role.roleName}资源列表</strong></div>
  
  
   <!--
  <div class="padding border-bottom">
      <ul class="search">
        <li>
     <button type="button"  class="button border-green" id="checkall"><span class="icon-check"></span> 全选</button>
 	      <button type="submit" class="button border-green"><span class="icon"></span> 批量启用</button>
		  <button type="submit" class="button border-green"><span class="icon"></span> 批量禁止</button>
          <button type="submit" class="button border-red"><span class="icon-trash-o"></span> 批量删除</button>    
		  <a class="button border-main" href="RoleManage_SourceManage_AddResource.htm"><span class="icon-glass"></span> 添加资源</a> 
        </li>
      </ul>
    </div>
    -->
  
  

  
  <table class="table table-hover text-center">
      <tr>
        <th width="120">资源ID</th>
        <th>资源名称</th>       
        <th>资源路径</th>
        <th>是否可用</th>
        <th>操作</th>       
      </tr>   
      
       <c:forEach items="${source}" var="sourc">
    <tr>
      <td>${sourc.sourceId}</td>      
      <td>${sourc.sourceName}</td>  
      <td>${sourc.sourcePath}</td> 
      <td>${msg[sourc.sourceId]}</td>      
      <td>
       <div class="button-group">
			<a class="button border-main" href="RoleManage_SourceManage_ReviseRole.htm?roleId=${role.roleId}&sourceId=${sourc.sourceId}"><span class="icon-edit"></span>启用</a> 
			<a class="button border-red" href="javascript:void(0)" onclick="return del(${role.roleId},${sourc.sourceId})"><span class="icon-trash-o"></span> 不启用</a> 
		</div>
      </td>
    </tr> 
    </c:forEach>
  
  <!--
      <tr>
        <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
      </tr>
  -->
  
    </table>
  </div>

<script type="text/javascript">

function del(role_id,source_id){
	if(confirm("您确定要禁用吗?")){
		window.location.href="deleteRoleSource.htm?role_id="+role_id+"&source_id="+source_id;
	}
}

$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false; 		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

</script>

</body></html>