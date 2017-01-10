<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>付款方式编辑</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>

<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改付款</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="pay_edit1.htm?Pid=${list.pid}&Cid=${list.cid}">  
      <div class="form-group">
        <div class="label">
          <label>合同编号：</label>
        </div>
        <div class="field">
           <input type="text" class="input w50" value="${list.cid}" readonly="readonly"/>       
          	 <%-- ${list.cid} --%>
        </div>
      </div> 
     
      <div class="form-group">
        <div class="label">
          <label for="sitename">收付款时间：</label>
        </div>
        <div class="field">

          <input type="text" class="input w50" id="tel" name="sfkDate" size="50"  data-validate="required:请输入需付款金额" /> 
              
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label for="sitename">需收付款金额：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="sfkMoney" name="sfkMoney" size="50"  data-validate="required:请输入需付款金额" />       
        </div>
      </div> 

      
       <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"style="margin-left:40%"> 提交</button>   
        </div>
    </form>
  </div>
</div>
</body>
</html>