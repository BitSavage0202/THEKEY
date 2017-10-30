<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ts" uri="/rights"  %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
						<!-- 检索  -->
						<form action="pay/checkList.do" method="post" name="colForm" id="colForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input style="width:145px;" class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="searchs();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								
							</tr>
						</table>
							<input type="hidden" value="${pd.DR_ID}" name="dr_id" id="dr_id"/>
							<input type="hidden" value="${pd.colName}" name="colName" id="colName"/>
						<!-- 检索  -->
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
							<thead>
								<tr>
									<th class="center" style="width:35px;">操作
									<!-- <label class="pos-rel">
									<input type="checkbox" class="ace" id="zcheckbox" />
									<span class="lbl"></span></label> -->
									</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">校验名称</th>
									<th class="center">校验类型</th>
									<th class="center">校验值</th>
								</tr>
							</thead>
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty checkList}">
									<c:forEach items="${checkList}" var="col" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' value="${col.ID }" onclick="checkboxOnclick(this, '${col.ID }')"
												<c:if test="${fn:contains(checkids, col.ID)}">
												checked="checked" 
												</c:if> 
												class="ace"/><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class="center">${col.CHECK_NAME }</td>
											<td class="center">${col.CHECK_TYPE}</td>
											<td class="center">${col.CHECK_VALUE}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<%-- <td style="vertical-align:top;">
									<ts:rights code="col/goAdd">
										<a class="btn btn-mini btn-success" onclick="add();">新增</a>
									</ts:rights>
									<ts:rights code="col/deleteAll">
										<a title="批量删除" class="btn btn-mini btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
									</ts:rights>
								</td> --%>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
						</div>
						</form>
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
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</body>
 	<script type="text/javascript">
		$(top.hangge());
		/* $(function() {
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
			
		}); */
		
		//chekbox点击事件
		function checkboxOnclick(obj,CHECK_ID){
			var DR_ID = document.getElementById("dr_id").value;
			var COL_NAME = document.getElementById("colName").value;
			if ( $(obj).prop("checked") == true){
				$.ajax({
				type:"POST",
				url:'<%=basePath%>pay/saveRelation.do',
				data:{
					CHECK_ID:CHECK_ID,
					COL_NAME:COL_NAME,
					DR_ID:DR_ID
				},
				success: function(data){
					$(obj).tips({
						side:2,
			            msg:data.result,
			            bg:'#307FC1',
			            time:1
		        	});
				},
 				error:function(data){
 					$(obj).tips({
 						side : 2,
 						msg : '添加失败！',
 						bg : '#307FC1',
 						time : 1
 						});
 					}				
				});
				
			}else{
				$.ajax({
				type:"POST",
				url:'<%=basePath%>pay/deleteRelation.do',
				data:{
					CHECK_ID:CHECK_ID,
					COL_NAME:COL_NAME,
					DR_ID:DR_ID
				},
				success: function(data){
					$(obj).tips({
						side:2,
			            msg:data.result,
			            bg:'#307FC1',
			            time:1
		        	});
				},
 				error:function(data){
 					$(obj).tips({
 						side : 2,
 						msg : '刪除失败！',
 						bg : '#307FC1',
 						time : 1
 					});
 					}
				});
			}
		}
		//检索
		function searchs(){
			top.jzts();
			$("#colForm").submit();
		}
		</script>
</html>
