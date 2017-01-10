<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
<script src="js/laydate.js"></script>
<script src="js/laydate.dev.js"></script>

<link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css" />
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettify-1.0.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">
<link href="css/bootstrap-datetimepicker.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/default.css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="js/moment-with-locales.js"></script>
<script src="js/bootstrap-datetimepicker.js"></script>
</head>
<body>
<form method="post" action="approve.htm" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 待审批合同列表[${total_approve}]</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
  搜索： 
          <div class="container">
                        <div class="row">
                          <div class="col-md-2">
          					<span>预定审批时间</span>
          				  </div>
                            <div class='col-md-4'>
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker1'>
                                        <input type='text' class="form-control" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $(function () {
                                    $('#datetimepicker1').datetimepicker();
                                });
                            </script>
                        </div>

                        <div class="row">
                          <div class="col-md-2">
          				    <span>更新时间 </span>
          				  </div>
                            <div class='col-md-4'>
                                <div class="form-group">
                                    <div class='input-group date' id='datetimepicker2'>
                                        <input type='text' class="form-control" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <script type="text/javascript">
                                $(function () {
                                    $('#datetimepicker2').datetimepicker();
                                });
                            </script>
                        </div>
                    </div>

      <ul class="search" style="padding-left:10px;">
        
        <if condition="$iscid eq 1">
          <li>分类：
            <select name="cid" class="input" style="width:200px; line-height:17px;display:inline-block" onchange="changesearch()">
              <option value="">请选择分类</option>
              <option value="">软件合同</option>
              <option value="">工程合同</option>
              <option value="">金融合同</option>
              <option value="">银行合同</option>
			  <option value="">工厂合同</option>
			  <option value="">政府合同</option>
            </select>
          </li>
        </if>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="contName" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <input type="submit" value="提交" style="width:50px; line-height:17px;display:inline-block"/></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
        <tr>
          <th width="100" style="text-align:left; padding-left:20px;">合同号</th>
          <th>合同名称</th>
          <th>状态</th>
          <th>合同类型</th>
          <th width="10%">截止时间</th>
          <th width="310">操作</th>
        </tr>
       
       	
        
      <volist name="list" id="vo">
      
      <c:forEach items="${list}" var="li" >
        <tr>
          <td id=contno style="text-align:left; padding-left:20px;"><input type="checkbox" name="check" value="${li.getCid()}" />${li.getContNo()}</td>
       
          <td>${li.getContName()}</td>
          <td><font color="#00CC99">${li.getState()}</font></td>
          <td>${li.getContType()}</td>
          <td>${li.getSignDate()}</td>
          <td><div class="button-group"> <a class="button border-main" href="approvelist.htm?id=${li.getContNo()}"><span class="icon-edit"></span> 审批</a> <a class="button border-black" href="show_all.htm?cid=${li.getCid()}"> 详情</a> </div></td>
        </tr> 
      </c:forEach>    

        <tr>
          <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>全选 </td>
          <td colspan="7" style="text-align:left;padding-left:20px;"><a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a></td>
        </tr>
		<!-- 
		<tr>
          <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
        </tr>
		 -->
        
        <td colspan="5"><div class="pagelist">
      		${page.pageStr}
      	 </div></td>
    </table>
  </div>
</form>

<script type="text/javascript">

//全选
$("#checkall").click(function(){ 
  $("input[name='check']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='check']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}


</script>
</body>
</html>