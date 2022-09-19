<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.act.model.*"%>
<%@ page import="com.act_pic.model.*"%>
<%@ page import="com.act_sign_up.model.*"%>

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
									<th>單價</th>
									<th>數量</th>
									<th>總價</th>
									<th>取消報名</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="thumbnail-img"><a href="#"> <img
											class="img-fluid" src="images/img-pro-01.jpg" alt="" />
									</a></td>
									<td class="name-pr"><a href="#"> Lorem ipsum dolor sit
											amet </a></td>
									<td class="price-pr">
										<p>$ 80.0</p>
									</td>
									<td class="quantity-box"><input type="number" size="4"
										value="1" min="0" step="1" class="c-input-text qty text"></td>
									<td class="total-pr">
										<p>$ 80.0</p>
									</td>
									<td class="remove-pr"><a href="#"> <i
											class="fas fa-times"></i>
									</a></td>
								</tr>
								<tr>
									<td class="thumbnail-img"><a href="#"> <img
											class="img-fluid" src="images/img-pro-02.jpg" alt="" />
									</a></td>
									<td class="name-pr"><a href="#"> Lorem ipsum dolor sit
											amet </a></td>
									<td class="price-pr">
										<p>$ 60.0</p>
									</td>
									<td class="quantity-box"><input type="number" size="4"
										value="1" min="0" step="1" class="c-input-text qty text"></td>
									<td class="total-pr">
										<p>$ 80.0</p>
									</td>
									<td class="remove-pr"><a href="#"> <i
											class="fas fa-times"></i>
									</a></td>
								</tr>
								<tr>
									<td class="thumbnail-img"><a href="#"> <img
											class="img-fluid" src="images/img-pro-03.jpg" alt="" />
									</a></td>
									<td class="name-pr"><a href="#"> Lorem ipsum dolor sit
											amet </a></td>
									<td class="price-pr">
										<p>$ 30.0</p>
									</td>
									<td class="quantity-box"><input type="number" size="4"
										value="1" min="0" step="1" class="c-input-text qty text"></td>
									<td class="total-pr">
										<p>$ 80.0</p>
									</td>
									<td class="remove-pr"><a href="#"> <i
											class="fas fa-times"></i>
									</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="row my-5">
				<div class="col-lg-6 col-sm-6">
					<div class="coupon-box">
						<div class="input-group input-group-sm">
							<input class="form-control" placeholder="輸入優惠碼"
								aria-label="Coupon code" type="text">
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-sm-6">
					<div class="update-box">
						<input value="確定" type="submit">
					</div>
				</div>
			</div>

			<div class="row my-5">
				<div class="col-lg-8 col-sm-12"></div>
				<div class="col-lg-4 col-sm-12">
					<div class="order-box">
						<h3>購物車內容</h3>
						<div class="d-flex">
							<h4>消費金額</h4>
							<div class="ml-auto font-weight-bold">$ 130</div>
						</div>
						<hr class="my-1">
						<div class="d-flex">
							<h4>優惠碼折抵</h4>
							<div class="ml-auto font-weight-bold">$ 10</div>
						</div>
						<div class="d-flex">
							<h4>運費</h4>
							<div class="ml-auto font-weight-bold">Free</div>
						</div>
						<hr>
						<div class="d-flex gr-total">
							<h5>訂單總金額</h5>
							<div class="ml-auto h5">$ 388</div>
						</div>
						<hr>
					</div>
				</div>
				<div class="col-12 d-flex shopping-box">
					<a href="checkout.jsp" class="ml-auto btn hvr-hover">結帳</a>
				</div>
			</div>

		</div>
	</div>
	<!-- End Cart -->

	<!-- !!!!!!此行以下都不要修改!!!!!!-->
	<!-- Start Instagram Feed  -->
	<div class="instagram-box">
		<div class="main-instagram owl-carousel owl-theme" style="padding: 0;">

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=1"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=2"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=3"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=4"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=5"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=6"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=7"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=8"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=9"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=10"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=11"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=12"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=13"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=14"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

			<div class="item">
				<div class="ins-inner-box">

					<img src="/CGA103G5ALL
			/ShowProd_picForProd?prod_no=15"
						width=280px height=200px>

					<div class="hov-in">
						<a href="#"><i class="fab fa-instagram"></i></a>
					</div>
				</div>
			</div>

		</div>

	</div>
	<!-- End Instagram Feed  -->
	<!-- Start Footer  -->
	<footer>


		<div class="footer-main">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>營業時間</h3>
							<ul class="list-time">
								<li>Monday - Friday: 08.00am to 05.00pm</li>
								<li>Saturday: 10.00am to 08.00pm</li>
								<li>Sunday: <span>Closed</span></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>訂閱電子報</h3>
							<form class="newsletter-box">
								<div class="form-group">
									<input class="" type="email" name="Email"
										placeholder="Email Address*" /> <i class="fa fa-envelope"></i>
								</div>
								<button class="btn hvr-hover" type="submit"
									style="font-size: 14px;">訂閱</button>
							</form>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>社群媒體</h3>
							<p>點擊關注我們(非真實連結，僅供展示用)</p>
							<ul>
								<li><a href="#"><i class="fab fa-facebook"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fab fa-twitter"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fab fa-linkedin"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fab fa-google-plus"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fab fa-pinterest-p"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fab fa-whatsapp"
										aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-widget">
							<h4>關於朧醴 LonelyBar</h4>
							<p>因近期疫情影響，酒吧/餐酒館營運受到極大的挑戰，再加上居家防疫風氣的興起，室內派對逐漸成為潮流。</p>
							<p>為提振品酒行業的景氣，同時讓人在家也能享受調酒體驗，朧醴LonelyBar「線上酒吧」的概念順勢而生。</p>
							<p style="color: brown; font-size: 14px; font-weight: bold;">【此網站僅供軟體專案成果展示使用，並非真實公司】</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-link">
							<h4>Information</h4>
							<ul>
								<li><a href="about.html">● 關 於 我 們</a></li>
								<li><a href="#">● 客 服 連 結</a></li>
								<li><a href="#">● 網 站 規 劃 資 訊</a></li>
								<li><a href="https://github.com/roysherst0737/CGA103G5.git">●
										G i t H u b 連 結</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-link-contact">
							<h4>聯絡我們</h4>
							<ul>
								<li>
									<p>
										<i class="fas fa-map-marker-alt" style="position: sticky;"></i>
										桃園市中壢區復興路46號9樓
									</p>
								</li>
								<li>
									<p>
										<i class="fas fa-phone-square" style="position: sticky;"></i>
										連絡電話: <a href="tel:+1-888705770">+886 912 123 456</a>
									</p>
								</li>
								<li>
									<p>
										<i class="fas fa-envelope" style="position: sticky;"></i>
										Email: <a href="mailto:contactinfo@gmail.com">roysherst@gmail.com</a>
									</p>
								</li>
								<li>
									<p style="color: brown; font-size: 14px; font-weight: bold;">【以上資訊純屬虛構，並非真實聯繫方式】</p>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>


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
	<script src="/CGA103G5ALL/front-end/js/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<!-- ALL PLUGINS -->
	<script src="/CGA103G5ALL/front-end/js/owl.carousel.min.js"></script>
	<script src="/CGA103G5ALL/front-end/js/form-validator.min.js"></script>
	<script src="/CGA103G5ALL/front-end/js/bootsnav.js"></script>
	<script src="/CGA103G5ALL/front-end/js/baguetteBox.min.js"></script>
	<script src="/CGA103G5ALL/front-end/js/inewsticker.js"></script>
	<script src="/CGA103G5ALL/front-end/js/isotope.min.js"></script>
	<script src="/CGA103G5ALL/front-end/js/jquery.superslides.min.js"></script>
	<script src="/CGA103G5ALL/front-end/js/bootstrap-select.js"></script>
	<script src="/CGA103G5ALL/front-end/js/images-loded.min.js"></script>
	<script src="/CGA103G5ALL/front-end/js/contact-form-script.js"></script>
	<!-- 該文件需部屬較慢 -->
	<script id="customjs" src="/CGA103G5ALL/front-end/js/custom.js"></script>
</body>

</html>