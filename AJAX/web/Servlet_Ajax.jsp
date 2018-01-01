<%@ page language="java" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>����Servlet��AJAX</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		function getResult(stateVal) {
		����var url = "servlet/SelectCityServlet?state="+stateVal; 
		����if (window.XMLHttpRequest) {
		   		req = new XMLHttpRequest(); 
		����}else if (window.ActiveXObject) { 
				req = new ActiveXObject("Microsoft.XMLHTTP"); 
		����} 
		����if(req){
				req.open("GET",url, true); 
				req.onreadystatechange = callback; 
				req.send(null); 
		����} 
		}
		function callback(){
			if (req.readyState == 4) {
				if (req.status == 200) {
					var city = req.responseXML.getElementsByTagName("city"); 
					file://alert(city.length);
					var str=new Array();
					for(var i=0;i<city.length;i++){
						str[i]=city[i].firstChild.data;
					}
					file://alert(document.getElementById("city"));
					buildSelect(str,document.getElementById("city"));
				}
			}
		}
		function buildSelect(str,sel) {
			sel.options.length=0;
			for(var i=0;i<str.length;i++) {
				sel.options[sel.options.length]=new Option(str[i],str[i])
			}
		}
	</script>
  </head>
  
  <body>
	<select name="state" onchange="getResult(this.value)">
	����<option value="">Select</option>
	����<option value="zj">�㽭</option>
	����<option value="zs">����</option>
	</select>
	<select id="city">
	����<option value="">CITY</option>
	</select>
  </body>
</html>