<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>合同审批</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 审批信息</strong> </div>
  <table class="table table-hover text-center">
    <tr>
      <th>合同号</th> 
      <th>审批部门</th>   
	  <th>审批人</th> 
      <th>是否同意</th>  
	  <th>审批意见</th> 
      <th>收到时间</th>     
      <th>提交时间</th>
    </tr>
   
   <c:forEach var="e" items="${el}">
    <tr>
      <td id=cono>${e.getId()}</td> 
      <td>${e.getDname()}</td>  
	  <td>${e.getName()}</td> 
      <td>${e.getAgree()}</td> 
	  <td>${e.getAdvice()}</td>  
      <td>${e.getRtime()}</td>      
      <td>${e.getStime()}</td>
    </tr>  
   </c:forEach>    
  </table>
</div>
<script>
function del(id){
	if(confirm("您确定要删除吗?")){
		
	}
}
</script>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>提交审批信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="pro.htm">   
      <input type="hidden" name="id"  value="" />  
      <div class="form-group">
        <div class="label">
          <label>审批部门：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="dep" value="" data-validate="required:请输入部门" />         
          <div class="tips"></div>
        </div>
      </div> 
	 <div class="form-group">
        <div class="label">
          <label>审批人：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="person" value="" data-validate="required:请输入审批人姓名" />         
          <div class="tips"></div>
        </div>
     </div> 
      <div class="form-group">
        <div class="label">
          <label>意见填写：</label>
        </div>
        <div class="field">
          <textarea type="text" class="input" name="advice" style="height:100px;" ></textarea>        
        </div>
     </div>
    
     <div class="form-group">
        <div class="label">
          <label>是否同意：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="agree" value="" data-validate="required:请输入同意或不同意" />         
          <div class="tips"></div>
        </div>
     </div> 
     <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button> <strong><a href="sign-lzc.htm" class="button bg-main icon-check-square-o" >返回</a></strong>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>