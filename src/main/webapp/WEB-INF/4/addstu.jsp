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
<script src="inc/laydate/laydate.js"></script>
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

</head>
<body >
<div class="panel admin-panel margin-top" id="add"  >

  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span><a href="addenifo.htm"></a>添加课程</strong></div>
  <div class="body-content" >
    <form method="post" class="form-x" action="stuinfoadd.htm">
        <div class="form-group">
        <div class="label">
          <label>学号</label>
        </div>
        <div class="field" >
          <input  type="text" class="input w50"  name="stuId" 
          placeholder="请输入数字" data-validate="required:请输入学号,number:仅可输入数字,length#<=10:学号不能大于10位"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group" align="center">
        <div class="label">
          <label>姓名</label>
        </div>
        <div class="field" >
          <input type="text" class="input w50" name="stuName"
           placeholder="请输入姓名" data-validate="required:请输入姓名,length#<=20:姓名不能大于20位"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group" >
        <div class="label">
          <label>性别</label>
        </div>
        <select name="stuSex" class="input" onchange="changesearch()" style="width:25%; float:left;">
            <option value="男">男</option>
            <option value="女">女</option>
            <option value="其他">其他</option>
         </select>
      </div>
      
            <div class="form-group" >
        <div class="label">
          <label>生日</label>
        </div>
        <div class="field">
          <input type="date" class="input w50" id="stuBirth" name="stuBirth" size="50" value="2017-01-01" data-validate="required:请输入生日" onclick="laydate()"/>       
        </div>
      </div>
      
      <div class="form-group" >
        <div class="label">
          <label>民族</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="stuNation" class="input tips" style="width:25%; float:left;"  
           placeholder="请输入民族" data-validate="required:请输入民族,length#<=8:姓名不能大于8位"/>
        </div>
      </div>
      
      <div class="form-group" >
        <div class="label">
          <label>班级号</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="stuClassId" class="input tips" style="width:25%; float:left;"  
           placeholder="请输入班级号" data-validate="required:请输入班级号,length#<=4:班级号不能大于4位"/>
        </div>
      </div>
      
      
      <div class="form-group" >
        <div class="label">
          <label>入学时间</label>
        </div>
       <div class="field">
          <input type="date" class="input w50" id="stuEntranceDate" name="stuEntranceDate" size="50" value="2017-01-01" data-validate="required:请选择入学日期" onclick="laydate()"/>       
        </div>
      </div>
      
      
      <div class="form-group" >
        <div class="label">
          <label>家庭住址</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="stuHome" class="input tips" style="width:25%; float:left;"  
           placeholder="请输入家庭住址" data-validate="required:请输入家庭住址,length#<=40:家庭住址不能大于40位"/>
        </div>
      </div>
      
      <div class="form-group" >
        <div class="label">
          <label>政治面貌</label>
        </div>
        <div class="field">
        <select name="stuPolitic" class="input" onchange="changesearch()" style="width:25%; line-height:17px;display:inline-block">
            <option value="群众">群众</option>
            <option value="党员">党员</option>
            <option value="团员">团员</option>
          </select>
        </div>
      </div>
      
      
      <div class="form-group" >
        <div class="label">
          <label>身份证号</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="idNumber" class="input tips" style="width:25%; float:left;"  
           placeholder="请输入身份证号" data-validate="required:请输入身份证号,length# == 18:身份证号错误"/>
        </div>
      </div>
      
      
      <div class="form-group" >
        <div class="label">
          <label>专业</label>
        </div>
        <div class="field">
          <input type="text" id="url1" name="stuSpecialty" class="input tips" style="width:25%; float:left;"  
           placeholder="请输入专业" data-validate="required:请输入专业,length#<=20:专业不能大于20位"/>
        </div>
      </div>
      
	  
      <div  class="form-group">
         <div class="field" style="padding: 10px;" >
         	<div class="label"><label></label></div>
         	<button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
          	<button class="button bg-main icon-refresh" type="reset"> 重置</button> 
          	<a class="button border-blue" href="stulist.htm"><span class="icon-step-backward"></span> 返回上级</a>
        </div>
      </div>
    </form>

  </div>
</div>
</body>
<script>
function changesearch(){	
	
}
		;!function(){
		laydate({
		   elem: '#perform_end_date'
		})
		}();
	</script>
</html>