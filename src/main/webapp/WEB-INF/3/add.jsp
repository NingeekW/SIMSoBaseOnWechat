<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="s.htm">  
      <div class="form-group">
        <div class="label">
          <label>合同模板ID</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="temp_id" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
	  <div class="form-group">
        <div class="label">
          <label>合同模板名称</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="temp_name" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>合同模板路径</label>
        </div>
        <div class="field">
          <input type="file" id="image1" name="temp_path" value="浏览上传" style="float:left;"/>
        </div>
      </div>     
      
      <if condition="$iscid eq 1">
        <div class="form-group">
          <div class="label">
            <label>模板分类：</label>
          </div>
          <div class="field">
            <select name="temp_type" class="input w50">
              <option value="0">自定义模板</option>
              <option value="1">金融模板</option>
              <option value="2">银行模板</option>
              <option value="3">工程模板</option>
              <option value="4">工厂模板</option>
              <option value="5">政府模板</option>
              <option value="6">软件模板</option>
            </select>
            <div class="tips"></div>
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