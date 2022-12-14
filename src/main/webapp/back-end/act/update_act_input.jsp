<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>

<%
Act_VO actVO = (Act_VO) request.getAttribute("actVO");
int act_status = actVO.getAct_status();
pageContext.setAttribute("act_status", act_status);
%>

<!DOCTYPE html>
<html lang="zh">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>朧醴 LonelyBar【後台】</title>
<!-- base:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back-end/vendors/typicons.font/font/typicons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back-end/vendors/css/vendor.bundle.base.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" />
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back-end/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/back-end/images/favicon.png" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	let path = window.location.pathname.substring(0, window.location.pathname
			.lastIndexOf("/"));
	path = path.substring(0, path.lastIndexOf("/"));
</script>
</head>

<body>
	<!-- 主頁面 -->
	<div class="container-scroller">
		<!-- 引入nav(頂部含廣告) -->
		<script src="<%=request.getContextPath()%>/back-end/js/nav.js"></script>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->
			<!-- 引入浮動視窗 -->
			<script
				src="<%=request.getContextPath()%>/back-end/js/floating_window.js"></script>
			<!-- partial -->
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar"></nav>
			<!-- 引入sidebar 用JQ方式 -->
			<script>
				$(function() {
					$("#sidebar").load(
							window.location.pathname.substring(0,
									window.location.pathname.indexOf('/', 2))
									+ "/back-end/partials/_sidebar.html");
				});
			</script>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-sm-6">
							<h3 class="mb-0 font-weight-bold">活動管理員</h3>
							<p>上次登入：21小時前</p>
						</div>
						<div class="col-sm-6">
							<div class="d-flex align-items-center justify-content-md-end">
								<div class="mb-3 mb-xl-0 pr-1">
									<div class="dropdown">
										<button style="margin-right: 10px;">
											<a href="listAllAct.jsp"><img src="./images/home.png"
												width="30px" height="30px"></a>
										</button>
										<button style="margin-right: 10px;">
											<a href='addAct.jsp'><img src="./images/plus.png"
												width="30px" height="30px"></a>
										</button>

										<button
											class="btn bg-white btn-sm dropdown-toggle btn-icon-text border mr-2"
											type="button" id="dropdownMenu3" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">
											<i class="typcn typcn-calendar-outline mr-2"></i>Last 7 days
										</button>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuSizeButton3"
											data-x-placement="top-start">
											<h6 class="dropdown-header">Last 14 days</h6>
											<a class="dropdown-item" href="#">Last 21 days</a> <a
												class="dropdown-item" href="#">Last 28 days</a>
										</div>
									</div>
								</div>
								<div class="pr-1 mb-3 mr-2 mb-xl-0">
									<button type="button"
										class="btn btn-sm bg-white btn-icon-text border">
										<i class="typcn typcn-arrow-forward-outline mr-2"></i>Export
									</button>
								</div>
								<div class="pr-1 mb-3 mb-xl-0">
									<button type="button"
										class="btn btn-sm bg-white btn-icon-text border">
										<i class="typcn typcn-info-large-outline mr-2"></i>info
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row  mt-3">
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">商品清單管理</h4>
									<div class="table-responsive">
										<%-- 錯誤表列 --%>
										<c:if test="${not empty errorMsgs}">
											<font style="color: red">請修正以下錯誤:</font>
											<ul>
												<c:forEach var="message" items="${errorMsgs}">
													<li style="color: red">${message}</li>
												</c:forEach>
											</ul>
										</c:if>


										<FORM METHOD="post" ACTION="act.do" name="form1">
											<table class="table table-striped">

												<tr>
													<td>活動編號:</td>
													<td><input type="TEXT" name="act_no" size="45"
														value="<%=(actVO == null) ? "" : actVO.getAct_no()%>"
														disabled></td>
												</tr>
												<tr>
													<td>酒吧編號:</td>
													<td><input type="TEXT" name="pub_no" size="45"
														value="<%=(actVO == null) ? "" : actVO.getPub_no()%>" /></td>
												</tr>
												<tr>
													<td>活動名稱:</td>
													<td><input type="TEXT" name="act_name" size="45"
														value="<%=(actVO == null) ? "" : actVO.getAct_name()%>" /></td>
												</tr>
												<tr>
													<td>活動描述:</td>
													<td><textarea name="act_detail" cols="46" rows="10"><%=(actVO == null) ? "" : actVO.getAct_detail()%></textarea></td>
												</tr>


												<tr>
													<td>活動地址:</td>
													<td><input type="TEXT" name="act_loc" size="45"
														value="<%=(actVO == null) ? "" : actVO.getAct_loc()%>" /></td>
												</tr>
												<tr>
													<td>上架時間:</td>
													<td><input name="act_launch_time" id="f_date1"
														type="text"
														value="<%=(actVO == null) ? "" : actVO.getAct_launch_time()%>"></td>
												</tr>
												<tr>
													<td>下架時間:</td>
													<td><input name="act_off_time" id="f_date2"
														type="text"
														value="<%=(actVO == null) ? "" : actVO.getAct_off_time()%>"></td>
												</tr>

												<tr>
													<td>容納人數上限:</td>
													<td><input type="TEXT" name="max_count" size="45"
														value="<%=(actVO == null) ? "" : actVO.getMax_count()%>"></td>
												</tr>
												<tr>
													<td>容納人數下限:</td>
													<td><input type="TEXT" name="min_count" size="45"
														value="<%=(actVO == null) ? "" : actVO.getMin_count()%>"></td>
												</tr>
												<tr>
													<td>報名開始時間:</td>
													<td><input name="sign_up_begin_time" id="f_date3"
														type="text"
														value="<%=(actVO == null) ? "" : actVO.getSign_up_begin_time()%>"></td>
												</tr>
												<tr>
													<td>報名結束時間:</td>
													<td><input name="sign_up_end_time" id="f_date4"
														type="text"
														value="<%=(actVO == null) ? "" : actVO.getSign_up_end_time()%>"></td>
												</tr>
												<tr>
													<td>活動開始時間:</td>
													<td><input name="act_start_time" id="f_date5"
														type="text"
														value="<%=(actVO == null) ? "" : actVO.getAct_start_time()%>"></td>
												</tr>
												<tr>
													<td>活動結束時間:</td>
													<td><input name="act_end_time" id="f_date6"
														type="text"
														value="<%=(actVO == null) ? "" : actVO.getAct_end_time()%>"></td>
												</tr>
												<tr>
													<td>活動狀態:</td>
													<c:set var="act_status" value="${act_status}" />
													<c:choose>
														<c:when test="${act_status == 1}">
															<td><input type="radio" name="act_status" size="45"
																id="on" value=1 checked> <label for="on">上架</label>
																<br> <input type="radio" name="act_status"
																size="45" id="off" value=0> <label for="off"
																style="color: red;">下架</label></td>
														</c:when>
														<c:otherwise>
															<td><input type="radio" name="act_status" size="45"
																id="on" value=1> <label for="on">上架</label> <br>
																<input type="radio" name="act_status" size="45" id="off"
																value=0 checked> <label for="off"
																style="color: red;">下架</label></td>
														</c:otherwise>
													</c:choose>
												</tr>
											</table>

											<br> <input type="hidden" name="current_count"
												value="<%=actVO.getCurrent_count()%>"> <input
												type="hidden" name="action" value="update"> <input
												type="hidden" name="act_no" value="<%=actVO.getAct_no()%>">
											<input type="submit" value="送出修改">
										</FORM>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:partials/_footer.html -->
				<!-- 引入footer 用JQ方式 -->
				<footer class="footer"></footer>
				<script>
					$(function() {
						$(".footer").load(
								window.location.pathname.substring(0,
										window.location.pathname
												.indexOf('/', 2))
										+ "/back-end/partials/_footer.html");
					});
				</script>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- base:js -->
	<script
		src="<%=request.getContextPath()%>/back-end/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page-->
	<!-- End plugin js for this page-->
	<!-- inject:js -->
	<script src="<%=request.getContextPath()%>/back-end/js/off-canvas.js"></script>
	<script
		src="<%=request.getContextPath()%>/back-end/js/hoverable-collapse.js"></script>
	<script src="<%=request.getContextPath()%>/back-end/js/template.js"></script>
	<script src="<%=request.getContextPath()%>/back-end/js/settings.js"></script>
	<script src="<%=request.getContextPath()%>/back-end/js/todolist.js"></script>
	<!-- endinject -->
	<!-- plugin js for this page -->
	<script
		src="<%=request.getContextPath()%>/back-end/vendors/progressbar.js/progressbar.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/back-end/vendors/chart.js/Chart.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- Custom js for this page-->

	<script src="<%=request.getContextPath()%>/back-end/js/dashboard.js"></script>
	<script
		src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
	<!-- End custom js for this page-->
</body>

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<!-- 參考網站: https://xdsoft.net/jqplugins/datetimepicker/ -->

<link rel="stylesheet" type="text/css"
	href="datetimepicker/jquery.datetimepicker.css" />
<script src="datetimepicker/jquery.js"></script>
<script src="datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
	$.datetimepicker.setLocale('zh'); // kr ko ja en
	$(function() {
		$('#f_date1').datetimepicker({
			format : 'Y-m-d H:i',
			onShow : function() {
				this.setOptions({
					maxDate : $('#f_date2').val() ? $('#f_date2').val() : false
				})
			},
			timepicker : true,
			step : 30
		});

		$('#f_date2').datetimepicker({
			format : 'Y-m-d H:i',
			onShow : function() {
				this.setOptions({
					minDate : $('#f_date1').val() ? $('#f_date1').val() : false
				})
			},
			timepicker : true,
			step : 30
		});

		$('#f_date3').datetimepicker(
				{
					format : 'Y-m-d H:i',
					onShow : function() {
						this.setOptions({
							maxDate : $('#f_date4').val() ? $('#f_date4').val()
									: false,
							minDate : $('#f_date1').val() ? $('#f_date1').val()
									: false
						})
					},
					timepicker : true,
					step : 30
				});

		$('#f_date4').datetimepicker({
			format : 'Y-m-d H:i',
			onShow : function() {
				this.setOptions({
					minDate : $('#f_date3').val() ? $('#f_date3').val() : false
				})
			},
			timepicker : true,
			step : 30
		});
		$('#f_date5').datetimepicker(
				{
					format : 'Y-m-d H:i',
					onShow : function() {
						this.setOptions({
							minDate : $('#f_date4').val() ? $('#f_date4').val()
									: false,
							maxDate : $('#f_date6').val() ? $('#f_date6').val()
									: false
						})
					},
					timepicker : true,
					step : 30
				});
		$('#f_date6').datetimepicker({
			format : 'Y-m-d H:i',
			onShow : function() {
				this.setOptions({
					minDate : $('#f_date5').val() ? $('#f_date5').val() : false
				})
			},
			timepicker : true,
			step : 30
		});
	});
</script>
</html>