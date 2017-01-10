function ajax(method,url,data,callback)
{
	var xhr;
	if(window.XMLHttpRequest)
	{
		xhr = new XMLHttpRequest();
	}else{
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xhr.open(method,url);
	if(method.toLowerCase() == "post"){
		xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
	}
	xhr.send(data);
	xhr.onreadystatechange=function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			data = eval("("+data+")");
			callback(data);
		}
	};
}