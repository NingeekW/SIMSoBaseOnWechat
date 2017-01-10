<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>上传文件</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 上传文件</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="<%=request.getContextPath() %>/commit.htm" enctype="multipart/form-data">
    <div class="form-group">
        <div class="label">
          <label>合同id</label>
        </div>
        <div class="field">  
             <input type="text" name="id" class="input w50" id="id" size="50"  value="${id}"/>
            
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>签订时间</label>
        </div>
        <div class="field">  
             <input type="text" name="date" class="input w50" id="id" size="50"  value=""/>
            
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">合同状态：</label>
        </div>
        <div class="field">
      		<select id="cont_type" name="state" class="input w50" >
              <option value="1">待审核</option>
              <option value="2">待签订</option>
              <option value="3">执行中</option>
              <option value="0">已归档</option>
            </select>
        </div>
      </div>
 
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">  
             <input type="file" name="file" class="input w50" id="file" size="50" onchange="document.getElementById('theFilePath').value=this.value"/>
             <input type="hidden" name="theFilePath" class="input w50" id="theFilePath" size="50" value="" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button> &nbsp;<strong><a href="sign.htm" class="button bg-main icon-check-square-o" >返回</a></strong>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>