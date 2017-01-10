<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>启用资源</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action=""> 

	<div class="form-group">
        <div class="label">
          <label>用户ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="title" value="${roleId}" disabled/>
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label >资源ID：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="title" value="${sourceId}" disabled/>
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label >操作结果：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="title" value="${result}" disabled/>
          <div class="tips"></div>
        </div>
      </div>
	
    <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
         <a class="button border-main" href="RoleManage_SourceManage.htm?role_id=${roleId}"><span class="icon-edit"></span> 确认</a>
         <div class="tips"></div>
        </div>
      </div>
      
    </form>
  </div>
</div>
</body>
</html>