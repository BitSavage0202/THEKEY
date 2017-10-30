<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>保存结果</title>
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
			alert("删除成功");
			//window.parent.nextPage(1);
			document.getElementById('zhongxin').style.display = 'none';
			top.Dialog.close();
			//window.parent.nextPage('1');
		}else{
			alert("删除失败");
			top.Dialog.close();
		} 
	</script>
</body>
</html>