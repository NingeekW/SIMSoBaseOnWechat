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
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改角色</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="doupdateByName.htm"> 

	<div class="form-group">
        <div class="label">
          <label>原角色名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="namenow" value="${rolenow.roleName}" readonly/>	
          
          <div class="tips"></div>
        </div>
      </div>
	
      <div class="form-group">
        <div class="label">
          <label>新角色名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="namenew" value="" data-validate="required:请输入新角色名称" />
          <div class="tips"></div>
        </div>
      </div>        
     
	 <div class="form-group">
        <div class="label">
          <label>启用状态：</label>
        </div>
        <div class="field">
          <div class="button-group radio">
          
          <label class="button active">
         	  <span class="icon icon-check"></span>             
              <input name="state" value="1" type="radio" checked="checked">启用             
          </label>             
        
          <label class="button active"><span class="icon icon-times"></span>          	
              <input name="state" value="0"  type="radio" checked="checked">禁止
          </label>         
           </div>       
        </div>
     </div>
	 
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>