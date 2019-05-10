<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<!--[if lt IE 7]><html lang="en" class="no-js ie6"><![endif]-->
<!--[if IE 7]><html lang="en" class="no-js ie7"><![endif]-->
<!--[if IE 8]><html lang="en" class="no-js ie8"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->


<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/animate.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">

<!-- REVOLUTION BANNER CSS SETTINGS -->
<link rel="stylesheet" type="text/css"
	href="./resources/rs-plugin/css/settings.css" media="screen" />

<script src="./resources/js/modernizr.custom.32033.js"></script>

<!--[if IE]><script type="text/javascript" src="js/excanvas.compiled.js"></script><![endif]-->

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<!-- 공통영역 -->
	<jsp:include page="../../include/header.jsp" />

	<div class="pre-loader">
		<div class="load-con">
			<img src="./resources/img/logo-blue.png" class="animated fadeInDown" alt="">
			<div class="spinner">
				<div class="bounce1"></div>
				<div class="bounce2"></div>
				<div class="bounce3"></div>
			</div>
		</div>
	</div>

	<!-- Wrap all page content here -->
	<div id="wrap" class="home">
		<section class="well well-lg">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
							<div class="container">
								<div class="row">
									<div class="col-md-8 col-md-push-2 clearfix">
										<div class="section-heading scrollpoint sp-effect3">
											<h2 style="color: white; font-weight: bold;">My Page</h2>
											<h4 style="color: white; font-weight: bold;">
												In this page you can management all things<br>Please
												choose what you want,And Change your information and
												reservation-information
											</h4>
											<span class="divider"></span>
										</div>
									</div>
								</div>
								<hr />
								<div class="col-md-4 col-sm-6">
									<div class="row">
										<div class="member scrollpoint sp-effect5">
											<div class="member-image">
												<a href="my_page_member_edit"><img src="./resources/img/samples/mypage/1.png" alt="" class="img-responsive img-center"></a>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4 col-sm-6">
									<div class="row">
										<div class="member scrollpoint sp-effect5">
											<div class="member-image">
												<a href="#"><img src="./resources/img/samples/mypage/2.png" alt="" class="img-responsive img-center"></a>								
											</div>

										</div>
									</div>
								</div>

								<div class="col-md-4 col-sm-6">
									<div class="row">
										<div class="member scrollpoint sp-effect5">
											<div class="member-image">
												<a href="my_page_member_delete"><img src="./resources/img/samples/mypage/4.png" alt="" class="img-responsive img-center"></a>									
											</div>
										</div>
									</div>
								</div>




							</div>


					</div>
				</div>
			</div>
			<br/>
			<br/>
							<footer id="site-footer" style="background-color: blalk; z-index: 1111">
								<div class="footer-layer1">
									<a href="#" target="_blank" style="color: white;" >인재채용</a> <a href="#">입점 / 제휴문의</a>
									<a href="#">공지사항</a> <a href="#">고객의 소리</a> <a href="#">이용약관</a>
									<a href="#"><b>개인정보 처리방침</b></a> <a href="#">신뢰관리센터</a>
								</div>
								<div class="footer-layer2">
									<h1>
										<a href="/" title="ROOT_CAR">ROOT_CAR</a>
									</h1>
									<div class="footer-content">
										<address>
											Root(주) | 대표이사 : 김미정<br /> 서울시 성동구 무학로2길 54 신방빌딩 4층<br /> 사업자 등록번호 :
											120-88-00000 <br /> 통신판매업신고 : 2018-서울성동-0000<br />
										</address>
									</div>
								</div>
							</footer>
		</section>



	</div>
	<!--/wrap-->

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/stellar.js"></script>
	<script src="./resources/js/isotope.pkgd.min.js"></script>
	<script src="./resources/js/jquery.easypiechart.min.js"></script>

	<!-- jQuery REVOLUTION Slider  -->
	<script type="text/javascript"
		src="./resources/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
	<script type="text/javascript"
		src="./resources/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

	<script src="./resources/js/waypoints.min.js"></script>
	<script type="text/javascript"
		src="http://maps.google.com/maps/api/js?sensor=false&language=ko"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&sensor=false"></script>
	<script src="./resources/js/script.js"></script>

	<script>
    $(document).ready(function() {
        appMaster.preLoader();
        appMaster.smoothScroll();
        appMaster.animateScript();
        appMaster.navSpy();
        appMaster.revSlider();
        appMaster.stellar();
        appMaster.skillsChart();
        appMaster.maps();
        appMaster.isoTop();
        appMaster.canvasHack();
    });
    
 
    </script>

</body>

</html>
