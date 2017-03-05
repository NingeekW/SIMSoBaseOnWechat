<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

		<form method="post" action="searchDicttypeconf.htm" id="searchDicttypeconf">
			<div class="panel admin-panel">
			
				<div class="panel-head"><strong class="icon-reorder"> 字典列表</strong>
					<a href="" style="float:right; display:none;">添加字段</a>
				</div>
				<div class="padding border-bottom">
					<a class="button border-yellow" href="adddic.htm"><span class="icon-plus-square-o"></span> 添加字典数据</a>
				</div>
				<div class="padding border-bottom">
					<ul class="search" style="padding-left:10px;">
                      
						<li>搜索：</li>
						<if condition="$iscid eq 1">
							<li>
								<select name="dtype" id="Dictrole_id" class="input" style="width:200px; line-height:17px;" onchange="changesearch()">
									<option value="">请选择字典分类</option>
									<c:forEach var="dicttypelist" items="${typelist }">
									<option value="${dicttypelist.dtype }"> ${dicttypelist.tdesc } </option>
									</c:forEach>
								</select>
							</li>
						</if>
						<li>
							<input type="text" placeholder="请输入字典代码" name="code" id="keywordscode" class="input" style="width:250px; line-height:17px;display:inline-block" />
							<input type="text" placeholder="请输入字典代码说明" name="ddesc" id="keywordscode" class="input" style="width:250px; line-height:17px;display:inline-block" />
						    <input type="submit" class="button border-main icon-search" value="搜索">
						</li>
						
					</ul>
				</div>
              
				<table class="table table-hover text-center">
					<tr>
						<th width="10%">字典类型</th>
						<th>字典代码</th>
						<th>字典代码说明</th>
					
						<th width="310">操作</th>
					</tr>
					
					  <c:forEach var="listv" items="${dictlist }">
						<tr>
							<td style="text-align:left; padding-left:20px;">${listv.tdesc }</td>
							<td width="20%"> ${listv.code }</td>
							<td>${listv.ddesc }</td>
							<td>
								<div class="button-group">
									<a class="button border-main" href="updatedicttypeconflist.htm?dicttypeconfcode=${listv.code }&&dicttypeconftdesc=${listv.tdesc }" ><span class="icon-edit"></span>修改</a>
									<a class="button border-red" href="deletedicttypeconf.htm?dicttypeconfcode=${listv.code }&&dicttypeconftdesc=${listv.tdesc }"  onclick="return confirm('你确定删除?')" ><span><span class="icon-trash-o"></span>删除</a>
								
								</div>
							</td>
						</tr>
						</c:forEach>
						<tr>
							<td colspan="11">
								<div class="pagelist">
									${page.pageStr}
								</div>
							</td>
						</tr>
				  </table>
				
			   </div>
		</form>	
			<script type="text/javascript">
	function del(id, mid, iscid) {
				if(confirm("你确定删除?")) {
					
				}
			}
	
</script>
	</body>
</html>