<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
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
</head>
<body>

<form method="post" action="sign.htm" id="listform">
  <div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 待签订合同列表[${total}]</strong> 
  	<div>
  	  合同名： <input type="text" placeholder="请输入搜索关键字" name="contName" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <input  class="button border-main icon-search"  type ="submit" value="搜索"/>
  	</div>
   
    <table class="table table-hover text-center">
        <tr>
          <th width="100" style="text-align:left; padding-left:20px;">合同编号</th>
          <th>合同名称</th>
          <th>状态</th>
          <th>合同类型</th>
          <th width="10%">预签订时间</th>
          <th width="310">操作</th>
        </tr>
               
      <volist name="list" id="vo">
      
      <c:forEach items="${list}" var="li" >
           <tr>
          <td  style="text-align:left; padding-left:20px;"><input type="checkbox" name="check" value="${li.getCid()}" />${li.getContNo()}</td>
          <td>${li.getContName()}</td>
          <td><font color="#00CC99">待签订</font></td>
          <td>${li.getContType()}</td>
          <td>${li.getSignDate()}</td>
          <td><div class="button-group"> <a class="button border-main" href="upload2.htm?id=${li.getCid()}"><span class="icon-edit"></span> 签订</a> <a class="button border-black" href="show_all.htm?cid=${li.getCid()}" >详情</a> </div></td>
        </tr>
        
      </c:forEach>      	
		
        <tr>
          <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>全选 </td>
          <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a></td>
        </tr>
		
        <tr>
         <td colspan="5"><div class="pagelist">
      		${page.pageStr}
      	 </div></td>
        </tr>
        
        
    </table>
  </div>
</form>
<script type="text/javascript">




//全选
$("#checkall").click(function(){ 
  $("input[name='check']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='check']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}


</script>
</body>
</html>