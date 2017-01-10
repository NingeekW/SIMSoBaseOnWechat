<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>付款方式添加</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
 <div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加付款</strong></div>
    <div class="body-content">
    <form method="post" class="form-x" action="pay_add1.htm?Cid=${Cid}">  
      <div class="form-group">
        <div class="label">
          <label>合同ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${ Cid }" name="htNum" readonly="readonly"/>  
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>付款时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="fkDate" />
          <div class="tips"></div>
        </div>
      </div>     
    
      <div class="form-group">
        <div class="label">
          <label>需付款金额：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="fkMoney" value="" style="width:15%"/>
        </div>
      </div>
       <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>   
        </div>
    </form>
  </div>
</div>

</body>
</html>