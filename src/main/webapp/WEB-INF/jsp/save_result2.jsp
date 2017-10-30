<%@ page language="java" contentType="text/html; charset=gb22312" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb22312" />
<title>±£´æ½á¹û</title>
<base href="<%=basePath%>">
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>

</head>
<body>
	<div id="zhongxin"></div>
	<script type="text/javascript">
		var msg="${msg}";
		if(msg=="success" || msg==""){
			alert("SUCCESS RELOAD!!");
			document.getElementById('zhongxin').style.display = 'none';
			top.Dialog.close();
		}else{
			alert("FAIL RELOAD!!");
			top.Dialog.close();
		} 
	</script>
</body>
</html>