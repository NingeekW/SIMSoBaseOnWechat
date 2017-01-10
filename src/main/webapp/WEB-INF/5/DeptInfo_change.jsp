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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改部门信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="Dept_Update.htm">
    <input type="hidden" name="depId" value="${dept.depId}">
      <div class="form-group">
        <div class="label">
          <label>部门编号</label>
        </div>
        <div class="field">
          <span class="input w50">${dept.depId}</span>
          <div class="tips"></div>
        </div>    
      </div>
      <div class="form-group">
        <div class="label">
          <label>部门名称</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${dept.depName}" name="depName" data-validate="required:请输入名称" />
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>部门负责人</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${dept.depPrincipal}" name="depPrincipal" data-validate="required:请输入负责人" />
          <div class="tips"></div>
        </div>
      	</div>
 
      <div class="form-group">
        <div class="label">
          <label>部门联系电话</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${dept.depTelephone}" name="depTelephone" data-validate="required:请输入电话" />
          <div class="tips"></div>
        </div>
      </div>
 	<div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit">确认修改</button>
        </div>
      </div>
    </form>    
</div>
</div>
</body>
</html>