<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
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
</head>
<body> 
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>个人信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="">  
      <div class="form-group">
        <div class="label">
          <label>用户名：</label>
        </div>
        <div class="label">
          <label>${Userinfo.username }</label>
        </div>
      </div>
	<div class="form-group">
        <div class="label">
          <label>真实姓名：</label>
        </div>
        <div class="label">
          <label>${Userinfo.name }</label>
        </div>
     </div>
	  <div class="form-group">
        <div class="label">
          <label>手机号码：</label>
        </div>
        <div class="field">
        <input type="phone" class="input w50" value="${Userinfo.phone }" name="title" data-validate="required:请输入手机号码" />
        </div>
      </div>
      
      <div class="form-group">
       <div class="label">
          <label>邮箱地址：</label>
        </div>

        <div class="field">
        <input type="phone" class="input w50" value="${Userinfo.email }" name="title" data-validate="required:请输入手机号码" />
        </div>

      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
        	<a class="button border-blue" href="changepwd.htm"><span class="icon-pencil-square-o"></span> 修改密码</a>
        	<a class="button border-blue" href="ManageUser_ChangeInfo.htm"><span class="icon-pencil-square-o"></span> 修改个人信息</a>
        
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>