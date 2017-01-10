<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<style type="text/css">
button{
      width: 48px;
      height: 30px;
      background: #E5E5E5;
      border:1px solid #E5E5E5;
      border-radius: 5px;
    }
    #delet:hover{
      color:#0099FF;
    }
    #select:hover{
      color:#0099ff;
    }
    </style>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder">企业列表</strong> </div>

  <div class="padding border-bottom">  
 
 <!--添加企业-->
<div class="panel admin-panel margin-top" id="add" style="overflow: hidden;">
  <div class="panel-head" style="width: 20%;float: left">
    <a class="button border-yellow" href="addenifo.htm">
      <span class="icon-plus-square-o"></span> 添加企业
    </a>
  </div>
  <form action="SelectByName.htm" id="SelectByName">
  <div style="float: left margin-left:15px;">
    <input type="serch"  placeholder="请输入搜索企业名称" id="serchEnid" name="enName" style="width:350px;height:42px;border:1px solid #5DC7F1;border-radius: 5px; padding-bottom: 5px;position: relative;top:7px;">
    <button style="margin-left: 20px;height: 42px;width: 120px;border: 1px solid #5DC7F1;
    position: relative;top:11px;background:#fff;font-size: 16px;line-height: 42px;border-radius: 5px;color:#5DC7F1" id='btn-serch' type="submit">查询</button>
  </div>
  </form>
  </div>
  </div>

  <table class="table table-hover text-center">
  	<thead>
    <tr>
      <th width="15%">企业编号</th>
      <th width="20%">企业名称</th>
      <th width="20%">企业联系人</th>
	  <th width="20%">企业电话</th>
      <th width="10%">企业地址</th>
      <th width="15%">操作</th>
    </tr>
   </thead>

   
   <c:forEach items="${enInfos}" var="enInfo">
   	<tr id="${enInfo.enId}">
      <td>${enInfo.enId}</td>      
      <td>${enInfo.enName}</td>  
      <td>${enInfo.enLinkman}</td>
      <td>${enInfo.enTelephone}</td>
      <td>${enInfo.enAddress}</td>
      <td>
      <div class="button-group">
              <a class="button border-main" href="enpinfo.htm?id=${enInfo.enId}"><span class="icon-edit"></span> 详情</a>
              <a class="button border-red" href="eninfodelete.htm?id=${enInfo.enId}" onclick="javascript:return del()"><span class="icon-trash-o"></span> 删除</a>
       </div>
       </td>
    </tr> 
   </c:forEach>
      <tr>
      	<td colspan="5">
      	<div class="pagelist">
      		${pages.pageStr}
      		<td></td>
      	 </div>
      	 </td>
      	 
      </tr>

  </table>
</div>

  

<script type="text/javascript">
function del(){
	if(confirm("您确定要删除吗?") == true){
		return true;
	}else{
		return false;
	}
}
</script>
</body>
</html>