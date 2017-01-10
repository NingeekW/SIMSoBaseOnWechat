<%@page language="java" contentType="text/html; charset=UTF-8"
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
		<link rel="stylesheet" type="text/css" media="all" href="css/style.css">
		<script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>

	</head>

	<body>
		<div class="panel admin-panel">
			<div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 合同详细信息</strong></div>
			<div class="body-content">
				<form method="post" class="form-x" action="Dictinsertdictconf.htm">

					<div class="form-group">
						<div class="label">
							<label>请选择字典类型</label>
						</div>
						<div class="field">
							<select id="dtype"  name="dtype" class="input" style="width:200px; line-height:17px;">							
						           <c:forEach var="dicttypelist" items="${typelist }">
									<option value="${dicttypelist.dtype }"> ${dicttypelist.tdesc } </option>
									</c:forEach>
							</select>               
                        	
							<div class="tips">
							<a href="#loginmodal" class="flatbtn" id="modaltrigger">添加字典</a>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label>字典代码：</label>
						</div>
						<div class="field">
							<input id="code" name="code" type="text" class="input" name="stitle" value="" style="width: 20%;float:left;" data-validate="required:请填写字典代码" />
							<div class="tips"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label>字典代码说明：</label>
						</div>
						<div class="field">
							<input id="ddesc" name="ddesc" stype="text" class="input" name="stitle" value="" style="width: 40%;float:left;" data-validate="required:请填写字典代码说明" />
							<div class="tips"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label></label>
						</div>
							<div class="field">
								<button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
								<button class="button bg-main icon-refresh" type="reset"> 重置</button>
							<a class="button border-blue" href="Dictshowall.htm"><span class="icon-step-backward"></span> 返回上级</a>
							</div>

					</div>
				</form>
			</div>
		</div>
		
		<div id="loginmodal" style="display:none;">
			<h1>添加字典</h1>
			<form id="Dict_add_form" name="Dict_add_form" method="post" action="Dict_Type_add.htm">
				<label for="Dict_type" class="label">字典类型:</label>
				<input type="text" id="dtype" name="dtype" class="input" id="Dict_type" class="txtfield" tabindex="1" data-validate="required:请填写字典类型" >
				<label for="Dict_ddesc" class="label">字典类型说明:</label>
				<input type="Dict_ddesc" id="tdesc" name="tdesc" class="input" class="txtfield" tabindex="2" data-validate="required:请填写字典类型说明">
				<div class="center"><input type="submit" name="Dict_subtn" id="Dict_subtn" class="flatbtn-blu hidemodal" value="提交" tabindex="3"></div>
			</form>
		</div>

		<script type="text/javascript">
			$(function() {

				$('#Dict_add_form').submit(function(e) {

					return true;

				});

				$('#modaltrigger').leanModal({
					top: 110,
					overlay: 0.45,
					closeButton: ".hidemodal"
				});

			});
		</script>

		<script src="http://www.jq22.com/js/jq.js"></script>

	</body>

</html>