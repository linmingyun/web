<%@ page language="java" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>基于JSP的AJAX</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
	<script type="text/javascript">
	var http_request = false;
	function send_request(url) {//初始化、指定处理函数、发送请求的函数
		file://开始初始化XMLHttpRequest对象
		if(window.XMLHttpRequest) { //Mozilla 浏览器
			http_request = new XMLHttpRequest();
			if (http_request.overrideMimeType) {//设置MiME类别
				http_request.overrideMimeType('text/xml');
			}
		}else if (window.ActiveXObject) { // IE浏览器
			try {
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					http_request = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		if (!http_request) { // 异常，创建对象实例失败
			window.alert("不能创建XMLHttpRequest对象实例.");
			return false;
		}
		http_request.onreadystatechange = processRequest;
		// 确定发送请求的方式和URL以及是否同步执行下段代码
		http_request.open("GET", url, true);
		http_request.send(null);
	}
	// 处理返回信息的函数
	function processRequest() {
		if (http_request.readyState == 4) { // 判断对象状态
			if(http_request.status == 200) { // 信息已经成功返回，开始处理信息
				alert(http_request.responseText);
			} else {
				file://页面不正常
				alert("您所请求的页面有异常。");
			}
		}
	}
	function userCheck() {
		var f = document.form1;
		var username = f.username.value;
		if(username=="") {
			window.alert("The user name can not be null!");
			f.username.focus();
			return false;
		} else {
			send_request('JSP_Check.jsp?username='+username);
		}
	}
	</script>
  <body>
	<form name="form1" action="" method="post">
		User Name:<input type="text" name="username" value="">&nbsp;
		<input type="button" name="check" value="check" onClick="userCheck()">
		<input type="submit" name="submit" value="submit">
	</form>
  </body>
</html>