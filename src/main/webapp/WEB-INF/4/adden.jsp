<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<body >
<div class="panel admin-panel margin-top" id="add"  >

  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span><a href="addenifo.htm"></a>添加企业</strong></div>
  <div class="body-content" >
    <form method="post" class="form-x" action="eninfoadd.htm">
      <div class="form-group">
        <div class="label">
          <label>企业编号</label>
        </div>
        <div class="field" > 
          <input align="center" type="text" class="input w50" id="enId" name="enId" 
          placeholder="请输入数字" data-validate="required:请输入企业编号,number:仅可输入数字,length#<=8:企业编号不能大于8位"/>
        </div>
      </div>
      <div class="form-group" align="center">
        <div class="label">
          <label>企业名称</label>
        </div>
        <div class="field" >
          <input type="text" class="input w50"  id="enName" name="enName" 
          data-validate="required:请输入企业名称"/>
        </div>
      </div>
      <div class="form-group" >
        <div class="label">
          <label>企业联系人</label>
        </div>
        <div class="field">
          <input type="text" id="enLinkman" name="enLinkman" class="input tips" style="width:25%; float:left;"  
		 data-validate="required:请输入企业联系人"/>
        </div>
      </div>
	  <div class="form-group" >
        <div class="label">
          <label>企业联系电话</label>
        </div>
        <div class="field" >
          <input type="text" class="input w50" id="enTelephone" name="enTelephone" value="" data-validate="required:请输入企业联系地址,tel:输入正确企业联系电话" />
          <div class="tips"></div>
        </div>
      </div>
      <div  class="form-group">
        <div class="label">
          <label>企业地址</label>
        </div>
        <div class="field" >
          <input type="text" class="input w50" id="enAddress" name="enAddress" value=""   data-validate="required:请输入企业联系地址"/>
        </div>
        <div class="field" style="padding: 10px;" >
         	<div class="label"><label></label></div>
         	<button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
          	<button class="button bg-main icon-refresh" type="reset"> 重置</button> 
          	<a class="button border-blue" href="enlist.htm"><span class="icon-step-backward"></span> 返回上级</a>
        </div>
      </div>
    </form>

  </div>
</div>
</body>
</html>