<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有合同</title>
<%-- <jsp:include page="/static/res/myres.jsp"></jsp:include> --%>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<form method="post" action="">
  <div class="panel admin-panel">
    <div class="padding border-bottom">
      <ul class="search">
        
          <li>
            <select name="cid" class="input" style="width:200px; line-height:17px;" onchange="changesearch()">
              <option value="">请选择搜索方式</option>
              <option value="">按合同编号</option>
              <option value="">按合同名称</option>
              <option value="">按经办人</option>
            </select>
          </li>
        
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    

    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="120">合同编号</th>
        <th>合同名称</th>       
        <th>预计收付款次数</th>
        <th>合同金额</th>
        <th>收付款进度</th>
        <th>操作</th>       
      </tr> 
      <c:forEach var = "con" items = "${ios}">
      	<tr>
      		<td>${con.cid }</td>
      		<td>${con.contName }</td>
      		<td>null</td>
      		<td>${con.totalFund }</td>
      	    <td>
	  			<div class="progress">
				<div class="progress-bar-danger" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
				   20%
				</div>
				</div>  
  			</td>
  			<td>
				 <div class="button-group">
		              <a class="button border-main" href="show_detail.htm?cid=${con.cid }"><span class="icon-edit"></span>款项详情</a>
         		 </div>
  			</td>
      		<td></td>
      	</tr>
      
      </c:forEach>     
<!--         <tr>
          <td>zxm123456</td>
          <td>阿里巴巴淘宝系统</td>
          <td>2015-9-11</td>
          <td>5</td> 
          <td>张三</td>
          <td>
	  			<div class="progress">
				<div class="progress-bar-danger" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%;">
				   20%
				</div>
				</div>  
  			</td>
  			<td>
				 <div class="button-group">
		              <a class="button border-main" href="show_detail.htm"><span class="icon-edit"></span>款项详情</a>
         		 </div>
  			</td>
        </tr>
        <tr>
         <td>hwei123456</td>
          <td>建行日结算系统</td>
          <td>2016-1-20</td> 
          <td>4</td> 
          <td>李四</td>
		  <td>
	  			<div class="progress">
				<div class="progress-bar-danger" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
				   40%
				</div>
				</div>
  			</td>
  			<td>
				 <div class="button-group">
		              <a class="button border-main" href="show_detail.htm"><span class="icon-edit"></span>款项详情</a>
         		 </div>
  			</td>
        </tr>
          <tr>
         <td>hxy123456</td>
          <td>图书管理系统系统</td>
          <td>2016-11-11</td> 
          <td>10</td>
          <td>王嘛</td>
		  <td>
	  			<div class="progress">
				<div class="progress-bar-danger" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 80%;">
				   80%
				</div>
  			</td>
  			<td>
				 <div class="button-group">
		              <a class="button border-main" href="show_detail.htm"><span class="icon-edit"></span>款项详情</a>
         		 </div>
  			</td>
        </tr>
        -->
	    <tr>
	        <td colspan="6"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
	    </tr> 
    </table>

</form>
<script type="text/javascript">

</script>
</body>
</html>