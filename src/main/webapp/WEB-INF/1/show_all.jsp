<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>合同详情展示</title>
 <link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css"> 
<script src="js/jquery.js"></script>
<!-- <script src="js/pintuer.js"></script> -->
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 合同基本信息</strong></div>
  <div class="body-content" style="margin-left: 20px;">
  	
  	<div style="margin-left: 20px;">
  		<div><label style="font-weight: bold;">合同编号：</label><span>${contract.contNo }</span><label style="font-weight: bold;margin-left: 30px;">合同名称：</label><span>${contract.contName }</span></div>
  	</div>
  	<hr>
  	<div style="margin-left: 20px;margin-top: 15px;">
  		<div><label style="font-weight: bold;">甲方：</label><span>${contract.operA }</span><label style="font-weight: bold;margin-left: 30px;">负责人：</label><span>${contract.principalA}</span></div>
  	</div>
  	<div style="margin-left: 20px;margin-top: 15px;">
  		<div><label style="font-weight: bold;">已方：</label><span>${contract.operB }</span><label style="font-weight: bold;margin-left: 30px;">负责人：</label><span>${contract.principalB }</span></div>
  	</div>
  	<hr>
  	<div style="margin-left: 20px;margin-top: 15px;">
  		<div><label style="font-weight: bold;">合同类型：</label><span>${map["contType"] }</span><label style="font-weight: bold;margin-left: 30px;">所属部门：</label><span>${map["departName"] }</span></div>
  	</div>
  	<div style="margin-left: 20px;margin-top: 15px;">
  		<div><label style="font-weight: bold;">合同总额：</label><span>￥${contract.totalFund }元</span><label style="font-weight: bold;margin-left: 30px;">收付类型：</label><span>${map["io"] }</span></div>
  	</div>
  	<div style="margin-left: 20px;margin-top: 15px;">
  		<div><label style="font-weight: bold;">履行开始时间：</label><span><fmt:formatDate value="${contract.performStartDate}" pattern="yyyy-MM-dd"/></span><label style="font-weight: bold;margin-left: 30px;">履行结束时间：</label><span><fmt:formatDate value="${contract.performEndDate}" pattern="yyyy-MM-dd"/></span><label style="font-weight: bold;margin-left: 30px;">合同状态：</label><span>${map["state"] }</span></div>
  	</div>
  	<hr>
  	<div style="margin-left: 20px;margin-top: 15px;">
  		<div><label style="font-weight: bold;">创建人：</label><span><fmt:formatDate value="${contract.performStartDate}" pattern="yyyy-MM-dd"/></span><label style="font-weight: bold;margin-left: 30px;">创建日期：</label><span><fmt:formatDate value="${contract.createDate}" pattern="yyyy-MM-dd"/></span></div>
  	</div>
  	<hr>
  	<div style="margin-left: 20px;margin-top: 15px;">
  		<div><label style="font-weight: bold;">合同文件：</label><span>${fn:substringAfter(contract.contPath, 'contract/')}</span><a style="margin-left: 5px;color: green;" href="contract_download.htm?fileName=${fn:substringAfter(contract.contPath, 'contract/')}">下载</a></div>
  	</div>
  </div>
</div>
<!--  -->
<div class="panel admin-panel" style="margin-top: 10px;">
  <div class="panel-head"><strong><span class="icon-key"></span>合同附件</strong></div>
  <div class="body-content">
  		 <a type="button" style="margin-left: 20px;" class="button border-blue" href="attchment.htm?cid=1">上传附件</a>
  		 <hr>
  		 <label style="font-weight: bold;margin-left: 20px;">附件列表</label>
  		 <hr>
  		 <div>
  		 	
  		 		 <table class="table table-hover text-center">
			      <tr>
			        <th width="120">序号</th>
			        <th>附件名称</th>       
			        <th>操作</th>
			      </tr>
			      <c:forEach items="${contractAttchments }" var="i" varStatus="n">      
			        <tr>
			          <td>${n.count }</td>
			          <td>${i.attchName }</td>
			          <td><div class="button-group"> <a class="button border-main" href="contract_download.htm?fileName=${fn:substringAfter(i.attchPath, 'contractAttchment/')}">下载</a></div> </td>
			          </tr>
			       </c:forEach>
			    </table>
  		 	
  		 </div>
  </div>
  </div>
</body>
</html>