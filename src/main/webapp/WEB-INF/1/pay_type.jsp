<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib  prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<title>付款方式</title>

</head>
<body>
<form  method="post" action="" >
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">付款方式</strong></div>
   
         

    </div>
    <table id="tableId"  class="table table-hover text-center">
      <tr>
        <th width="120">合同编号</th>  
        <th>合同名称</th>   
        <th>付款方式</th>   
        <th>需收付款次数</th>
        <th>需收付款金额</th>
        <th>详情</th>
        <th>进度</th>
    </tr>      

        <c:forEach var="cont" items="${cont}">
        	<tr>
        		<td>${cont.contNo}</td>
        		<%-- <td>${list.paymentType}</td> --%>
        		<td>${cont.contName}</td>
        		<td>${cont.io}</td>
        		<td>${cont.len}</td>
        	<%-- 	<td>${list.size()}</td> --%>
        		<td>${cont.totalFund}</td>	
				<td><div class='button-group'> <a class='button border-main' href="pay_detail.htm?Cid=${cont.cid}">查看详情</a></div> </td>		
				<td><div class='button-group'> <a class='button border-main' href='show_detail.htm'>查看进度</a></div> </td>
<%-- 				<td><div class='button-group'> <a class='button border-main' href='pay_edit.htm?Pid=${cont.cid}'>修改</a><a class='button border-red' href="pay_delete.htm" onclick='return del(1,1,1)'>删除</a> </div></td>
 --%>        	</tr>
        </c:forEach>
 
      <c:forEach var = "con" items = "${cons}">
       <tr>
          <td><input type="checkbox" name="id[]" value="1" />
            ${con.cid}</td>
          <td>${con.contName}</td>
          <td>${con.io}</td>
          <td>NULL</td> 
           <td>${con.totalFund}</td>
          <td><div class="button-group"> <a class="button border-main" href="pay_detail.htm?cid=${con.cid}">查看详情</a></div> </td>
          <td><div class="button-group"> <a class="button border-main" href="show_contract.htm?cid=${con.cid }">查看进度</a></div> </td>
          <td><div class="button-group"> <a class="button border-main" href="pay_edit.htm?cid=${con.cid}">修改</a><a class="button border-red" href="javascript:void(0)" onclick="return del(${con.cid})">删除</a> </div></td>
        </tr>
      </c:forEach>

      <tr>
        <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
      </tr>
    </table>

</form>
<script type="text/javascript">

function del(id){
	if(confirm("您确定要删除吗?")){
		window.location.href="contractDelete.htm?cid="+cid;
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
</body>
</html>