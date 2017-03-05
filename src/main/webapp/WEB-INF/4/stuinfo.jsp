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

  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>课程信息</strong></div>
  <div class="body-content" align="center" >
    <form method="post" class="form-x" action="stuinfoupdata.htm">
      <div class="form-group">
        <div class="label">
          <label>学号</label>
        </div>
        <div class="field" >
          <input  type="text" class="input w50" value="${StuInfo.stuId}" name="stuId" readOnly="true" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group" align="center">
        <div class="label">
          <label>姓名</label>
        </div>
        <div class="field" >
          <input type="text" class="input w50" name="stuName" value="${StuInfo.stuName}"  />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group" >
        <div class="label">
          <label>性别</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="stuSex" class="input tips" style="width:25%; float:left;"  value="${StuInfo.stuSex}"/>
        </div>
      </div>
      
            <div class="form-group" >
        <div class="label">
          <label>生日</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="stuBirth" class="input tips" style="width:25%; float:left;"  value="${StuInfo.stuBirth}"/>
        </div>
      </div>
      
      <div class="form-group" >
        <div class="label">
          <label>民族</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="stuNation" class="input tips" style="width:25%; float:left;"  value="${StuInfo.stuNation}"/>
        </div>
      </div>
      
      <div class="form-group" >
        <div class="label">
          <label>班级号</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="stuClassId" class="input tips" style="width:25%; float:left;"  value="${StuInfo.stuClassId}"/>
        </div>
      </div>
      
      
      <div class="form-group" >
        <div class="label">
          <label>入学时间</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="stuEntranceDate" class="input tips" style="width:25%; float:left;"  value="${StuInfo.stuEntranceDate}"/>
        </div>
      </div>
      
      
      <div class="form-group" >
        <div class="label">
          <label>家庭住址</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="stuHome" class="input tips" style="width:25%; float:left;"  value="${StuInfo.stuHome}"/>
        </div>
      </div>
      
      <div class="form-group" >
        <div class="label">
          <label>政治面貌</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="stuPolitic" class="input tips" style="width:25%; float:left;"  value="${StuInfo.stuPolitic}"/>
        </div>
      </div>
      
      <div class="form-group" >
        <div class="label">
          <label>身份证号</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="idNumber" class="input tips" style="width:25%; float:left;"  value="${StuInfo.idNumber}"/>
        </div>
      </div>
      
      
      <div class="form-group" >
        <div class="label">
          <label>专业</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="stuSpecialty" class="input tips" style="width:25%; float:left;"  value="${StuInfo.stuSpecialty}"/>
        </div>
      </div>
      

	  
      <div  class="form-group">
        <div class="field" style="padding: 10px;" align="center">
         	<div class="label"><label></label></div>
         	<button class="button bg-main icon-check-square-o" type="submit" id="change"> 提交</button>
          	<a class="button border-blue" href="stulist.htm"><span class="icon-step-backward"></span> 返回上级</a>
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
		 	alert("确认修改并提交？");
		 })
	</script>
</body>
</html>