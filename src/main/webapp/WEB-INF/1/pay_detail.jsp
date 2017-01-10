<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib  prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>付款方式详情</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder">详情列表</strong>
  <div ></br></div>
   <div class="field">
          <a class="button bg-main icon-check-square-o"  href="pay_add.htm?Cid=${cont.cid}" > 增加</a>   
        </div>
  </div>
    <!-- <div class="body-content">
   
     
       
        <label style="vertical-align:middle">合同编号</label>
        
         hetong <input type="text" class="input w50" value="HT00001" name="title" data-validate="required:HT00001" readonly/>
     
         <span style="vertical-align:middle">合同名称</span>
        
          <input type="text" class="input w50" value="中信银行" name="title" data-validate="required:HT00001" readonly/>
    
    
   </div> -->
  <div class="padding border-bottom">  
  <button class="button border-blue">合同编号：${cont.contNo}</button>
  <button class="button border-blue">合同名称：${cont.contName}</button>
  <button class="button border-blue">付款类型：${cont.io}</button>
  <button class="button border-blue">需付款次数：${cont.len}</button>
  <button class="button border-blue">付款金额：${cont.totalFund}</button>
  </div> 
    <table class="table table-hover text-center"id="pay_table">
       
    <tr>
      <th>合同ID:</th>     
      <th>收付款金额</th>  
      <th>收付款时间</th>  
      <th>操作</th> 
      
    </tr>
   
   <c:forEach var="list" items="${list}">
        	<tr>
        		<td>${list.cid}</td>       		
        		<td>${list.paymentFund}</td>
        		<td>${list.paymentDate}</td>
 				<td><div class='button-group'> <a class='button border-main' href='pay_edit.htm?Pid=${list.pid}'>修改</a>
 				<a class='button border-red' href="pay_delete.htm?Pid=${list.pid}" onclick='return del(1,1,1)'>删除</a> </div></td>
     	</tr>
        </c:forEach>
  </table>
    
</div>

</body>
</html>