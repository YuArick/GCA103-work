<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>

<%
Act_Service actSvc = new Act_Service();
List<Act_VO> list = actSvc.getAll();
pageContext.setAttribute("list", list);
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
<style>
.horizontal_style {
	display: block;
	overflow-x: auto;
}
</style>



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
					<!--你要寫的頁面  -->
					<div class="horizontal_style">
						<table id="dataTables" class="stripe" style="width: 149%">
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
											<button style="margin-right: 10px;">
												<a href="selectAct.jsp"><img src="./images/search2.png"
													width="30px" height="30px"></a>
											</button>

										</div>
									</div>
								</div>
							</div>
							<thead>
								<tr>
									<th>活動編號</th>
									<th>酒吧編號</th>
									<th>活動名稱</th>
									<th>活動描述</th>
									<th>活動地址</th>
									<th>上架時間</th>
									<th>下架時間</th>
									<th>當前報名人數</th>
									<th>容納人數上限</th>
									<th>容納人數下限</th>
									<th>報名開始時間</th>
									<th>報名結束時間</th>
									<th>活動開始時間</th>
									<th>活動結束時間</th>
									<th>活動狀態</th>
									<th>修改時間</th>
									<th>修改</th>
									<th>刪除</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="actVO" items="${list}">
									<tr>
										<td>${actVO.act_no}</td>
										<td>${actVO.pub_no}</td>
										<td>${actVO.act_name}</td>
										<td>${actVO.act_detail}</td>
										<td>${actVO.act_loc}</td>
										<td>${actVO.act_launch_time}</td>
										<td>${actVO.act_off_time}</td>
										<td>${actVO.current_count}</td>
										<td>${actVO.max_count}</td>
										<td>${actVO.min_count}</td>
										<td>${actVO.sign_up_begin_time}</td>
										<td>${actVO.sign_up_end_time}</td>
										<td>${actVO.act_start_time}</td>
										<td>${actVO.act_end_time}</td>
										<c:choose>
											<c:when test="${actVO.act_status == 0}">
												<td style="color: red;">下架中</td>
											</c:when>
											<c:otherwise>
												<td>上架中</td>
											</c:otherwise>
										</c:choose>
										<td>${actVO.revise_time}</td>
										<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/back-end/act/act.do"
												style="margin-bottom: 0px;">
												<input type="submit" value="修改"> <input
													type="hidden" name="act_no" value="${actVO.act_no}">
												<input type="hidden" name="action" value="getOne_For_Update">
											</FORM>
										</td>
										<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/back-end/act/act.do"
												style="margin-bottom: 0px;">
												<input type="submit" value="刪除"> <input
													type="hidden" name="act_no" value="${actVO.act_no}">
												<input type="hidden" name="action" value="delete">
											</FORM>
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<th>活動編號</th>
									<th>酒吧編號</th>
									<th>活動名稱</th>
									<th>活動描述</th>
									<th>活動地址</th>
									<th>上架時間</th>
									<th>下架時間</th>
									<th>當前報名人數</th>
									<th>容納人數上限</th>
									<th>容納人數下限</th>
									<th>報名開始時間</th>
									<th>報名結束時間</th>
									<th>活動開始時間</th>
									<th>活動結束時間</th>
									<th>活動狀態</th>
									<th>修改時間</th>
									<th>修改</th>
									<th>刪除</th>
								</tr>
							</tfoot>
						</table>
					</div>

					<script>
						$(document).ready(function() {
							$('#dataTables').DataTable();
						});
					</script>
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

</html>