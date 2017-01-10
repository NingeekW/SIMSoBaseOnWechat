<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#hehe").click(function(){
		var elem=document.createElement("TR");
		var string=" <td style='text-align:left; padding-left:20px;'>"+
		"<input type='checkbox' name='id[]' value='' />"+
        '7'+"</td>"+
        "<td width='15%'>银行贷款合同模板</td>"+
        "<td width='10%'><img src='images/银行合同书.jpg' alt='' width='70' height='50'/></td>"+
        "<td>银行模板</td>"+
        "<td><font color='#00CC99'>首页</font></td>"+
        "<td>描述</td>"+
        "<td>2016-12-26</td>"+
        "<td><div class='button-group'> <a class='button border-main' href='add.htm'><span class='icon-edit'></span> 修改</a> <a class='button border-red' href='javascript:void(0)' onclick='return '> 附件下载</a> </div></td>";
		elem.innerHTML=string;
		$("#tbody").append(elem);
	});
});


</script>

<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
	<form method="post" action="list.htm" id="listform">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder"> 内容列表</strong> <a href=""
					style="float: right; display: none;">添加字段</a>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">
					<li><a class="button border-main icon-plus-square-o"
						href="add.htm">添加模板</a></li>
					<li>搜索：</li>
					<li>首页 <select name="s_ishome" class="input"
						onchange="changesearch()"
						style="width: 60px; line-height: 17px; display: inline-block">
							<option value="">选择</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select> &nbsp;&nbsp; 推荐 <select name="s_isvouch" class="input"
						onchange="changesearch()"
						style="width: 60px; line-height: 17px; display: inline-block">
							<option value="">选择</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select> &nbsp;&nbsp; 置顶 <select name="s_istop" class="input"
						onchange="changesearch()"
						style="width: 60px; line-height: 17px; display: inline-block">
							<option value="">选择</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select>
					</li>
					<li>&nbsp;&nbsp; 模板类别 <select name="cid" class="input"
						style="width: 100px; line-height: 17px; display: inline-block;"
						onchange="changesearch()">
							<option value="">自定义模板</option>
							<option value="">金融模板</option>
							<option value="">银行模板</option>
							<option value="">工程模板</option>
							<option value="">工厂模板</option>
							<option value="">政府模板</option>
							<option value="">软件模板</option>
					</select>
					</li>
					<li><input type="text" placeholder="请输入模板ID"
						name="keywords" class="input"
						style="width: 150px; line-height: 17px; display: inline-block" />
						<a href="javascript:void(0)"
						class="button border-main icon-search" onclick="changesearch()">
							查看合同模板</a></li>
				</ul>
			</div>
			<table id="table1" class="table table-hover text-center">
				<thead>
					<tr>
						<th width="20%">模板ID</th>
						<th width="20%">模板名称</th>
						<th width="20%">文件路径</th>
						<th width="20%">板类型</th>
						<th width="20%">操作</th>
					</tr>
				</thead>
				<tbody id="tbody">
			  	<c:forEach items="${temps}" var="item">   	
					<tr>
						<td>${item.tempId}</td>
						<td>${item.tempName}</td>
						<td><a id="xiazai" href="downloadTemplate.htm?filePath=${item.tempPath}" onmousedown="return ">点击下载文件</a></td>
						<td>${item.tempType}</td>
						<td><div class="button-group"> <a class="button border-main" href="modify.htm?tempId=${item.tempId}"><span class='icon-edit'></span> 修改</a><a class="button border-red" href="deleteTemp.htm?tempId=${item.tempId}" >删除</a> </div></td>
					</tr>
			 	</c:forEach>   	
					 <tr>
						<td colspan="5">
							<div class="pagelist">
								${page.pageStr}
							</div>
						</td>
					</tr>
				</tbody>
				

			</table>
		</div>
	</form>
	
<script type="text/javascript">
$(function(){
	$("#hehe").click(function(){
		var elem=document.createElement("TR");
		var string=" <td style='text-align:left; padding-left:20px;'>"+
		"<input type='checkbox' name='id[]' value='' />"+
        '7'+"</td>"+
        "<td width='15%'>银行贷款合同模板</td>"+
        "<td width='10%'><img src='images/银行合同书.jpg' alt='' width='70' height='50'/></td>"+
        "<td>银行模板</td>"+
        "<td><font color='#00CC99'>首页</font></td>"+
        "<td>描述</td>"+
        "<td>2016-12-26</td>"+
        "<td><div class='button-group'> <a class='button border-main' href='add.htm'><span class='icon-edit'></span> 修改</a> <a class='button border-red' href='javascript:void(0)' onclick='return '> 附件下载</a> </div></td>";
		elem.innerHTML=string;
		$("#tbody").append(elem);
		return false;
	});
}); 


//搜索
function changesearch(){	
		
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
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
	 $("input[name='id[]']").each(function(){
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

//批量排序
function sorts(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		return false;
	}
}


//批量首页显示
function changeishome(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}

//批量推荐
function changeisvouch(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");	
		
		return false;
	}
}

//批量置顶
function changeistop(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}


//批量移动
function changecate(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		
		return false;
	}
}

//批量复制
function changecopy(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		var i = 0;
	    $("input[name='id[]']").each(function(){
	  		if (this.checked==true) {
				i++;
			}		
	    });
		if(i>1){ 
	    	alert("只能选择一条信息!");
			$(o).find("option:first").prop("selected","selected");
		}else{
		
			$("#listform").submit();		
		}	
	}
	else{
		alert("请选择要复制的内容!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
</body>
</html>