<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.*"%>

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
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-sm-6">
							<h3 class="mb-0 font-weight-bold">商品管理員</h3>
						</div>
						<div class="col-sm-6">
							<div class="d-flex align-items-center justify-content-md-end">
								<div class="mb-3 mb-xl-0 pr-1">
									<div class="dropdown">
										<button style="margin-right:10px;">
										<a href="listAllProd.jsp"><img src="./images/home.png" width="30px" height="30px"></a>
										</button>
										<button style="margin-right:10px;">
										<a href='addProd.jsp'><img src="./images/plus.png" width="30px" height="30px"></a>
										</button>
										<button style="margin-right:10px;">
										<a href="selectProd.jsp"><img src="./images/search2.png" width="30px" height="30px"></a>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row  mt-3">
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">商品搜尋</h4>
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

										<jsp:useBean id="prodSvc" scope="page" class="com.prod.model.Prod_Service" />
										<jsp:useBean id="prod_typeSvc" scope="page" class="com.prod_type.model.Prod_type_Service" />

											<FORM METHOD="post" ACTION="prod.do">
												<b>選擇商品編號:</b> <select size="1" name="prod_no">
													<c:forEach var="prodVO" items="${prodSvc.all}">
														<option value="${prodVO.prod_no}">${prodVO.prod_no}
													</c:forEach>
												</select> <input type="hidden" name="action"
													value="getOne_For_Display"> <input type="submit"
													value="送出">
											</FORM>

											<FORM METHOD="post" ACTION="prod.do">
												<b>選擇商品類別:</b> <select size="1" name="prod_type_no">
													<c:forEach var="prod_typeVO" items="${prod_typeSvc.all}">
														<option value="${prod_typeVO.prod_type_no}">${prod_typeVO.prod_type_name}
													</c:forEach>
												</select> <input type="hidden" name="action"
													value="listProds_ByProd_type"> <input type="submit"
													value="送出">
											</FORM>
										
											<FORM METHOD="post" ACTION="prod.do">
												<b>選擇商品名稱:</b> <select size="1" name="prod_no">
													<c:forEach var="prodVO" items="${prodSvc.all}">
														<option value="${prodVO.prod_no}">${prodVO.prod_name}
													</c:forEach>
												</select> <input type="hidden" name="action"
													value="getOne_For_Display"> <input type="submit"
													value="送出">
											</FORM>
											
											<FORM METHOD="post" ACTION="prod.do">
												<b>選擇商品單價:</b> <select size="1" name="prod_no">
													<c:forEach var="prodVO" items="${prodSvc.all}">
														<option value="${prodVO.prod_no}">${prodVO.prod_price}
													</c:forEach>
												</select> <input type="hidden" name="action"
													value="getOne_For_Display"> <input type="submit"
													value="送出">
											</FORM>
											
<!-- 											商品狀態選擇待修正 -->
<!-- 											<FORM METHOD="post" ACTION="prod.do" >												 -->
<!-- 												<b>選擇商品狀態:</b>  -->
<!-- 												<select size="1" name="prod_no"> -->
<!-- 													<option value=1>已上架 -->
<!-- 													<option value=0>已下架 -->
<!-- 												</select> -->
<!-- 												<input type="hidden" name="action" value="getOne_For_Display"> -->
<!-- 												<input type="submit" value="送出"> -->
<!-- 											</FORM> -->
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

</html>