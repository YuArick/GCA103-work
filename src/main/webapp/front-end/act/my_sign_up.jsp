<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.act_pic.model.*"%>
<%@ page import="com.act_sign_up.model.*"%>


<%
Object Objuser = session.getAttribute("user");
Mem_VO user = (Mem_VO) Objuser;

Act_sign_up_Service act_sign_upSvc = new Act_sign_up_Service();
List<Act_sign_up_VO> my_sign_upList = act_sign_upSvc.getMy_act_sign_up(user.getMem_no());
pageContext.setAttribute("my_sign_upList", my_sign_upList);

String url = request.getRequestURL().toString() + "?" + request.getQueryString();
session.setAttribute("url", url);

%>

<!DOCTYPE html>
<html lang="zh-Hant">
<!-- Basic(head都不用動) -->

<head>
<meta charset="utf-8">

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Site Metas -->
<title>朧醴 LonelyBar</title>
<meta name="keywords" content="LonelyBar Index">
<meta name="description" content="This is template from Theme Wagon.">
<meta name="author" content="Theme Wagon">

<!-- Site Icons -->
<link rel="shortcut icon" href="../images/favicon.ico"
	type="image/x-icon">
<link rel="lonelybar-icon" href="../images/Logo2.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="../css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="../css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="../css/custom.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
.btn {
	width: auto;
	height: auto;
}
</style>

</head>

<body>
	<div id=top_nav_mainTop>
		<%@ include file="/front-end/partials/_mainTop.jsp"%>
	</div>

	<!-- !!!!!! 從以下開始修改到Start Instagram Feed" !!!!!!-->

	<!-- Start All Title Box -->
	<div class="all-title-box">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2>我的報名</h2>

				</div>
			</div>
		</div>
	</div>
	<!-- End All Title Box -->

	<!-- Start Cart  -->
	<div class="cart-box-main">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="table-main table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>圖片</th>
									<th>活動名稱</th>
									<th>攜伴人數</th>
									<th>報名時間</th>
									<th>取消報名</th>
									<th>查看問卷</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="act_sign_upVO" items="${my_sign_upList}">
									<tr>
										<td class="thumbnail-img"><img
												src="<%=request.getContextPath()%>/Show_Act_pic_Servlet?act_pic_no=${act_sign_upVO.actVO.act_picVO.act_pic_no}"
												alt="" width="100" height="100" />
										</td>
										<td class="act_name"><a
											href="<%=request.getContextPath()%>/front-end/act/act-detail.jsp?${act_sign_upVO.act_no}">${act_sign_upVO.actVO.act_name}</a></td>
										<td class="accompany_count"><p>${act_sign_upVO.accompany_count}</p></td>
										<td class="sign_up_time"><p>${act_sign_upVO.sign_up_time}</p></td>
										<td class="delete">
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/front-end/act/my_sign_up.do"
												style="margin-bottom: 0px;">
												<input type="submit" value="取消"> <input
													type="hidden" name="sign_up_no"
													value="${act_sign_upVO.sign_up_no}"> <input
													type="hidden" name="action" value="delete">
											</FORM>
										</td>
								
                                     <td class="survey">
                                     
                                     
                                     <input type="button" value="查看" onclick="location.href='<%=request.getContextPath()%>/front-end/act/survey.jsp?${act_sign_upVO.act_no}'">
                                     </td>
                                     
                                 
                                     
                                      
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
		
			<!-- !!!!!!此行以下都不要修改!!!!!!-->
	<!-- Start Instagram Feed  -->
	<!-- End Instagram Feed  -->
	<!-- Start Footer  -->
	<footer>
		<%@ include file="/front-end/partials/_footer.jsp"%>
	</footer>
	<!-- End Footer  -->

	<!-- Start copyright  -->
	<div class="footer-copyright">
		<p class="footer-company">
			All Rights Reserved. &copy; 2022 <a href="#">LonelyBar</a> Design By
			: <a href="https://html.design/">CGA103G5</a>
		</p>
	</div>
	<!-- End copyright  -->

	<a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<!-- ALL JS FILES -->
	<script src="<%=request.getContextPath()%>/front-end/js/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script
		src="<%=request.getContextPath()%>/front-end/js/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/form-validator.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/js/bootsnav.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/baguetteBox.min.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/js/inewsticker.js"></script>
	<script src="<%=request.getContextPath()%>/front-end/js/isotope.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/jquery.superslides.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/bootstrap-select.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/images-loded.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/front-end/js/contact-form-script.js"></script>
	<!-- 該文件需部屬較慢 -->
	<script id="customjs"
		src="<%=request.getContextPath()%>/front-end/js/custom.js"></script>
</body>

</html>