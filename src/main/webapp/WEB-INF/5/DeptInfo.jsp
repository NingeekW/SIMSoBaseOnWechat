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
    <title>部门信息</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 组织机构</strong></div>
  <div class="padding border-bottom">  
  
  <ul class="search" style="padding-left:10px;">
  	<li><a class="button border-yellow" href="DepartData_Add.htm"><span class="icon-plus-square-o"></span>添加部门</a></li>
  	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
  	<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
    <li>
    	<select class="input" id="ktype">
    		<option>*选择条件*</option>
    		<option>部门编号</option>
    		<option>部门名称</option>
    	</select>
    </li>
    <li>
    	<input type="text" id="kwords" placeholder="请输入对字段" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
         <a class="button border-main icon-search" onclick="return doSerach()">搜索</a></li>
  </ul>
  </div>
  <table class="table table-hover text-center">
  	<thead>
    <tr>
      <th width="10%">部门编号</th>     
      <th>部门名称</th>  
      <th>部门负责人</th>     
      <th>部门联系电话</th>
      <th width="250">操作</th>
    </tr>
   </thead>
   <tbody>
   <c:forEach items="${depts}" var="dept">
   	<tr>
      <td>${dept.depId}</td>      
      <td>${dept.depName}</td>  
      <td>${dept.depPrincipal}</td>
      <td>${dept.depTelephone}</td>
      <td>
      <div class="button-group">
      <a type="button" class="button border-main" href="DepartData_update.htm?id=${dept.depId}"><span class="icon-edit"></span>修改</a>
       <a class="button border-red" onclick="return del(${dept.depId})"><span class="icon-trash-o"></span> 删除</a>
      </div>
      </td>
    </tr> 
   </c:forEach>
   </tbody> 
   <tfoot>
   		<tr>
   		<!-- 个人写的分页 -->
         <!-- <td colspan="5"><div class="pagelist">
        	第<span class="current">${cp}</span>页  共<span class="current">${pages}</span>页
        	<a href="deptPage.htm?cp=1">首页</a> 
         	 <a href="deptPage.htm?cp=${cp-1}">上一页</a> 
              <a href="deptPage.htm?cp=${cp+1}">下一页</a>
              <a href="deptPage.htm?cp=${pages}">尾页</a> 
            </div>
          </td> -->
          
          <!-- 老师的分页 -->
          <td colspan="5"><div class="pagelist">
      		${page.pageStr}
      	 </div></td>
      </tr>
   </tfoot>
  </table>
</div>
<script>
function del(id){
	if(confirm("您确定要删除吗?")){
		window.location.href="DeptDelete.htm?id="+id;
	}
}

function doSerach(){
	var ktype=$('#ktype').val();
	
	if(ktype=='部门编号'){
		ktype='depId';
	}else if(ktype=='部门名称'){
		ktype='depName';
	}else{
		ktype=null;
	}
	
	if(ktype==null){
		alert("查询时，条件不能为空！");
	}else{
		var kwords=$('#kwords').val();
		if(kwords==null){
			alert("查询时，值不能为空！");
		}else{
			window.location.href="DepartDatas.htm?"+ktype+"="+kwords;
		}
	}
	
		
}
</script>

</body>
</html>