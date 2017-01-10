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

  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>企业信息</strong></div>
  <div class="body-content" align="center" >
    <form method="post" class="form-x" action="eninfoupdata.htm">
      <div class="form-group">
        <div class="label">
          <label>企业编号</label>
        </div>
        <div class="field" >
          <input  type="text" class="input w50" value="${eninfo.enId}" name="enId" readOnly="true" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group" align="center">
        <div class="label">
          <label>企业名称</label>
        </div>
        <div class="field" >
          <input type="text" class="input w50" name="enName" value="${eninfo.enName}"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group" >
        <div class="label">
          <label>企业联系人</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="enLinkman" class="input tips" style="width:25%; float:left;"  value="${eninfo.enLinkman}"/>
        </div>
      </div>
	  <div class="form-group" >
        <div class="label">
          <label>企业联系电话</label>
        </div>
        <div class="field" >
          <input type="text" class="input w50" name="enTelephone" value="${eninfo.enTelephone}"  />
          <div class="tips"></div>
        </div>
      </div>
      <div  class="form-group">
        <div class="label">
          <label>企业地址</label>
        </div>
        <div class="field" >
          <input type="text" class="input w50" name="enAddress" value="${eninfo.enAddress}"  />
        </div>
        <div class="field" style="padding: 10px;" align="center">
         	<div class="label"><label></label></div>
         	<button class="button bg-main icon-check-square-o" type="submit" id="change"> 提交</button>
          	<a class="button border-blue" href="enlist.htm"><span class="icon-step-backward"></span> 返回上级</a>
        </div>
      </div>
    </form>

  </div>
</div>

	<script type="text/javascript" src='js/jquery.js'></script>
	<script type="text/javascript">
	
		 document.getElementById("change").addEventListener("click",function(){
		 	$('#info').focus();
		 })
		 $("#tijiao").click(function(){
		 	alert("确定提交？");
		 })
	</script>
</body>
</html>