<%@ page language="java" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>����JSP��AJAX</title>
    
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
	function send_request(url) {//��ʼ����ָ������������������ĺ���
		file://��ʼ��ʼ��XMLHttpRequest����
		if(window.XMLHttpRequest) { //Mozilla �����
			http_request = new XMLHttpRequest();
			if (http_request.overrideMimeType) {//����MiME���
				http_request.overrideMimeType('text/xml');
			}
		}else if (window.ActiveXObject) { // IE�����
			try {
				http_request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					http_request = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		if (!http_request) { // �쳣����������ʵ��ʧ��
			window.alert("���ܴ���XMLHttpRequest����ʵ��.");
			return false;
		}
		http_request.onreadystatechange = processRequest;
		// ȷ����������ķ�ʽ��URL�Լ��Ƿ�ͬ��ִ���¶δ���
		http_request.open("GET", url, true);
		http_request.send(null);
	}
	// ��������Ϣ�ĺ���
	function processRequest() {
		if (http_request.readyState == 4) { // �ж϶���״̬
			if(http_request.status == 200) { // ��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ
				alert(http_request.responseText);
			} else {
				file://ҳ�治����
				alert("���������ҳ�����쳣��");
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