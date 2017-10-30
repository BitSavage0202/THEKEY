<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保存结果</title>
<base href="<%=basePath%>">
<!-- <meta name="description" content="overview & stats" /> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
<%@ include file="/WEB-INF/jsp/system/index/top.jsp"%>
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="static/ace/js/bootbox.js"></script>
</head>
<body style="background-color: white;">
	<input type="hidden" id="refreshFlag" value="${refreshFlag}"/>
	<div class="main-container" id="zhongxin">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class=" hr-18 dotted "></div>
					<div class="row">
						<div class="col-xs-12">
							<div class="error-container">
								<div class="">
									<h1 class="grey lighter smaller" style="font-size: 22px;">
										<span class="blue bigger-125" id="message" >  <i class="icon-sitemap"></i> 操作失败！</span>
									</h1>
									<div class="space"></div>
									<div style="text-align: center;">
										<a class="btn btn-mini btn-primary" style="font-size: 14px;" onclick="closeDiag();">确定 </a>
									</div>
								</div>
							</div>
		<input type="hidden" value="${msg }" id="msg">
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->


		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<script type="text/javascript">
	//$(top.hangge());
	$(function() {
		var msg = $("#msg").val();
		if(msg=="success" || msg=="" || msg=="ok"){
			$("#message").html("操作成功！");
			document.getElementById('zhongxin').style.display = 'none';
			top.Dialog.close();
		}else if(msg=="failed" || msg=="no"){
			$("#message").html("操作失败！");
			$("#message").removeClass("blue").css("color","red");
		}else{
			$("#message").removeClass("blue").css("color","red");
			var leng = Number(msg.length);
			if(leng>10){
				$("#message").parent().css("font-size","12px").css("line-height","22px");
				//根据提示语，动态扩展窗口大小
				var	width = $(top.window).width();
				var	height = $(top.window).height();
				var x = 350;
				var y = 220;
				if(leng>400){
					x = 700;y= 550;
				}else if(leng>300){
					x = 650;y= 450;
				}else if(leng>200){
					x = 600;y= 380;
				}else if(leng>150){
					x = 560;y= 330;
				}else if(leng>100){
					x = 530;y= 300;
				}else if(leng>50){
					x = 500;y= 280;
				}
				parent.$("#_Container_0").width(x).height(y);
				parent.$("#_DialogTable_0").css("width","auto");
				var dia = parent.$("#_DialogDiv_0");
				if(x < width){
					dia.css("left",((width-x)/2)+"px");
				}else{
					dia.css("left","0px");
				}
				if(y < height){
					dia.css("top",((height-y)/2)+"px");
				}else{
					dia.css("top","0px");
				}
			}
			//弹出后台提示语
			$("#message").html(msg);
		}
	});
	function closeDiag(){
		top.Dialog.close();
	}
	</script>
</body>
</html>