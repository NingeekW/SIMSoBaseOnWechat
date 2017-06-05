<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="cn.ning3f1.wechat.domain.Userinfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<script type="text/javascript">
		$(function() {
			var error = "${error}";
			if(error){
				alert(error);
			}
		});
		
</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 找回密码</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="dofindpass.htm">    
      <div class="form-group">
        <div class="label">
          <label for="sitename">用户名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="username" name="username" size="50" placeholder="请输入用户名" data-validate="required:请输入用户名" "/>       
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">真实姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="name" size="50" placeholder="请输入真实姓名" data-validate="required:请输入真实姓名" />         
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>  
          <button class="button bg-main icon-refresh w106" type="reset"> 重置</button>   
        </div>
      </div>      
    </form>
  </div>
</div>
</body>
</html>