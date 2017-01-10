<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<!-- <script src="js/pintuer.js"></script> -->
<script type="text/javascript">
function checkFile() {
	//用元素的id获得该元素的值，从而进行判断选择的文件是否合法  
	var file = document.getElementById("attch_path").value;
	if (file == null || file == "") {
		alert("未选择文件!");
		return false;
	}
	if (file.lastIndexOf(".") == -1) {
		alert("路径不正确!");
		return false;
	}
	/* var allType = ".doc|.docx|";//可扩展类型
	var extName = file.substring(file.lastIndexOf("."));
	if (allType.indexOf(extName + "|") == -1) {
		errMsg = "请上传 " + allType + " 类型的文件，当前文件类型为" + extName;
		alert(errMsg);
		document.getElementById("attch_path").value="";
		return false;
	} */
}
</script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 合同附件上传</strong></div>
  <div class="body-content">
  		<form method="post" class="form-x" action="upload_attchment.htm" enctype="multipart/form-data">
	      <input type="hidden" name="cid" value="${cid}"/>
	      <c:if test="${result != null}">
	      		 <div class="form-group" >
			        <div class="label" >
			          <label for="sitename">操作结果：</label>
			        </div>
			        <div class="field">
			          <label for="sitename" style="color: red;">${result }</label>      
			        </div>
			      </div>   
	      </c:if>
	        
	      <div class="form-group">
	        <div class="label">
	          <label for="sitename">附件名称：</label>
	        </div>
	        <div class="field">
	          <input type="text" class="input w50" id="attch_name" name="attch_name" size="50"  data-validate="required:请输入附件名称" />       
	        </div>
	      </div>      
	      <div class="form-group">
	        <div class="label">
	          <label for="sitename">附件文件：</label>
	        </div>
	        <div class="field">
	          <input type="file" class="input w50" id="attch_path" value="attch_path" name="attch_path" size="50" onchange="return checkFile(this);" />         
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


</body>
</html>