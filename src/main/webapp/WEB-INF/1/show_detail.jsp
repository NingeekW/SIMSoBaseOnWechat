<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>进度跟踪</title>
<%-- <jsp:include page="/static/res/myres.jsp"></jsp:include> --%>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<style>
	tr.td{
	text-align:center;
	}
</style>
<!-- 
		
		收付款记录页面

 -->

<body>


<!-- <a href = "add_detail.htm"><button type="button" class="btn btn-primary btn-lg" id = "addDetail">添加收付款</button></a> -->
<!-- <button type="button" class="btn btn-primary btn-lg" onclick="openWindow()">添加收付款</button> -->
 <button class="button bg-main icon-check-square-o" onclick="openWindow()"> 添加收付款</button>
  <div id="light" class="white_content">
<!--      <form role="form" method = "post" action = "show_detail.htm">
			  <div class="form-group">
			    <label for="numberInput">收付款次数</label>
			    <input type="text" class="form-control" id="numberInput" placeholder = "5" readonly>
			  </div>
			  <div class="form-group">
			    <label for="accountInput">收付款金额</label>
			    <input type="text" class="form-control" id="accountInput">
			  </div>
			  <div class="form-group">
			    <label for="dateInput">收付款日期</label>
			    <input type="date" class="form-control" id="dateInput">
			  </div>
			  <div class="form-group">
			    <label for="typeInput">收付类型</label>
			    <input type="text" class="form-control" id="typeInput">
			  </div>
			   <button type="submit" class="btn btn-primary">确定</button>   -->
	 <form method="post" class="form-x" action="">    
      <div class="form-group">
        <div class="label">
          <label>收付款次数</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="title" placeholder = "5" readonly/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>收付款金额</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="url" value="" />
          <div class="tips"></div>
        </div>
      </div>
            <div class="form-group">
        <div class="label">
          <label>收付款日期</label>
        </div>
        <div class="field">
          <input type="date" class="input w50" name="url" value=""/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>收付类型</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="title"/>
          <div class="tips"></div>
        </div>
      </div>
       <button type = "submit" class="button bg-main icon-check-square-o">确定</button>
    </form>
	</form>
     <a href="#" onClick="closeWindow()"><button class="btn btn-primary">取消</button> </a></div>
    <div id="fade" class="black_overlay"></div>
<hr>
 
    <form method="post" class="form-x" action="">    
      <div class="form-group">
        <div class="label">
          <label>合同编号</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${con.cid }" name="title" readonly/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>合同名称</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="url" value="${con.contName }"  readonly/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>预收付款次数</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="url" value="5"  readonly/>
          <div class="tips"></div>
        </div>
      </div>
    </form>

<hr>
	<table class="table table-hover text-center">
		<tr>
		<th>收付款次数</th>
		<th>收付款金额</th>
		<th>收付款日期</th>
		<th>收付类型</th>
		</tr>
		<c:forEach var = "io" items = "${pds}" varStatus="i">
		<tr>
		<td>${i.count }</td>
		<td>${io.paymentFund}</td>
		<td>${io.paymentDate }</td>
		<td>${io.paytype}</td>
		</tr>
		</c:forEach>
		
<!-- 		<tr>
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
		</tr> -->
	</table>
		
</body>
    <style type="text/css">
          .black_overlay{
             display: none; 
             position: absolute;  
             top: 0%;  
             left: 0%;  
             width: 100%;  
             height: 100%;  
             background-color: black;  
             z-index:1001;  
             -moz-opacity: 0.8;  
             opacity:.80;  
             filter: alpha(opacity=80);  
        } 
        .white_content {
            display: none;  
            position: absolute; 
            top: 5%; 
            left: 10%; 
            width: 80%; 
            height: 85%; 
            padding: 16px;
            border: 2px solid orange; 
            background-color: white; 
            z-index:1002;
            overflow: auto;
        }  
    </style>
    <script language="javascript">
        function openWindow(){
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block';
        }
        function closeWindow(){
            document.getElementById('light').style.display='none';
            document.getElementById('fade').style.display='none';
        }
    </script>
</html>