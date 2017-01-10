<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>进度跟踪</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<!-- 
		
		添加收付款记录页面

 -->
<body>

	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
 添加收付款
</button>
<hr>
		<form role="form">
			  <div class="form-group">
			    <label for="contractNoInput">合同编号</label>
			    <input type="text" class="form-control" id="contractNoInput" placeholder = "zxm123456" readonly>
			  </div>
			  <div class="form-group">
			    <label for="contractNameInput">合同名称</label>
			    <input type="text" class="form-control" id="contractNameInput" placeholder = "阿里巴巴淘宝系统" readonly>
			  </div>
			  <div class="form-group">
			    <label for="agentInput">经办人</label>
			    <input type="text" class="form-control" id="agentInput" placeholder ="张三" readonly>
			  </div>
		</form>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
       
      </div>
      <div class="modal-body">
       	<form role="form">
			  <div class="form-group">
			    <label for="numberInput">收付款次数</label>
			    <input type="text" class="form-control" id="numberInput">
			  </div>
			  <div class="form-group">
			    <label for="amountInput">收付款金额</label>
			    <input type="text" class="form-control" id="amountInput" >
			  </div>
			  <div class="form-group">
			    <label for="dateInput">收付款日期</label>
			    <input type="date" class="form-control" id="dateInput">
			  </div>
			   <div class="form-group">
			    <label for="typeInput">收付类型</label>
			    <input type="text" class="form-control" id="typeInput" >
			  </div>
			  <button type="submit" class="btn btn-primary">确定</button>
</form>
      </div>
    </div>
  </div>
</div>
<hr>
	<table class="table table-hover">
		<tr>
		<th>收付款次数</th>
		<th>收付款金额</th>
		<th>收付款日期</th>
		<th>收付类型</th>
		</tr>
		<tr>
		<td>1</td>
		<td>20000</td>
		<td>2015-1-30</td>
		<td>收款</td>
		</tr>
		<tr>
		<td>2</td>
		<td>50000</td>
		<td>2015-5-30</td>
		<td>收款</td>
		</tr>
		<tr>
		<td>3</td>
		<td>30000</td>
		<td>2015-11-30</td>
		<td>收款</td>
		</tr>
		<tr>
		<td>4</td>
		<td>100000</td>
		<td>2016-3-30</td>
		<td>收款</td>
		</tr>
	</table>
		
</body>
</html>