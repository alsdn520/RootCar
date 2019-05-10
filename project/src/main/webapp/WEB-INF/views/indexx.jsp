<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<!--[if lt IE 7]><html lang="en" class="no-js ie6"><![endif]-->
<!--[if IE 7]><html lang="en" class="no-js ie7"><![endif]-->
<!--[if IE 8]><html lang="en" class="no-js ie8"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en" class="no-js">

<head>
    <meta charset="UTF-8">
    <title>첫시작창</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="./resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="./resources/css/animate.css">
    <link rel="stylesheet" href="./resources/css/font-awesome.min.css">
    <link rel="stylesheet" href="./resources/css/jquery.easy-pie-chart.css">
    <link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">
    

    <script language="Javascript">
	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ todayDate.toGMTString() + ";"
	}
	function closeWin() {
		if (document.notice_form.chkbox.checked) {
			setCookie("maindiv", "done", 1);
		}
		document.all['divpop'].style.visibility = "hidden";
	}	
</script>



    <!-- REVOLUTION BANNER CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="./resources/rs-plugin/css/settings.css" media="screen" />

    <script src="./resources/js/modernizr.custom.32033.js"></script>
    

	  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="./resources/js/bootstrap.min.js"></script>
    <script src="./resources/js/stellar.js"></script>
    <script src="./resources/js/isotope.pkgd.min.js"></script>
    <script src="./resources/js/jquery.easypiechart.min.js"></script>

    <!-- jQuery REVOLUTION Slider  -->
    <script type="text/javascript" src="./resources/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
    <script type="text/javascript" src="./resources/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

    <script src="./resources/js/waypoints.min.js"></script>
	<script type="text/javascript"src="http://maps.google.com/maps/api/js?sensor=false&language=ko"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&sensor=false"></script>
    <script src="./resources/js/script.js"></script>
    
    
   
   <script type="text/javascript"
	src="./resources/js/jquery.min.1.7.1.js"></script>
<script type="text/javascript"
	src="./resources/js/turn.js"></script>

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
    
    <style type="text/css">
body {
	background: white;
}

#magazine {
	width: 1000px;
	height:660px;
	background-size: 100% 100%;
	
}

#magazine .turn-page {
	background-color:#EAEAEA;
	background-size: 100% 100%;
}
</style>

</head>

<body>

<!-- POPUP -->
	<div id="divpop"
		style="position: absolute; left: 0px; top: 0px; z-index: 200; visibility: hidden;">
		<table width=1024 height=700 cellpadding=2 cellspacing=0>

			<tr>
				<td style="border: 2px #22222 solid" height=700 align=center
					bgcolor=#757575>
					 <!-- 잡지 플립효과 -->
					<div id="magazine">
						<div>
							<img src="./resources/img/a1.jpg" width="500" height="650" alt="1" />
						</div>

						<div>
							<img src="./resources/img/a2.jpg" width="500" height="650" alt="2" />
						</div>
						<div>
							<img src="./resources/img/a3.jpg" width="500" height="650" alt="3" />
						</div>
						<div>
							<img src="./resources/img/a4.jpg" width="500" height="650" alt="4" />
						</div>
						<div>
							<img src="./resources/img/a5.jpg" width="500" height="650" alt="5" />
						</div>
						<div>
							<img src="./resources/img/a6.jpg" width="500" height="650" alt="6" />
						</div>
						<div>
							<img src="./resources/img/a7.jpg" width="500" height="650" alt="6" />
						</div>


					</div> <script type="text/javascript">
						$(window).ready(function() {
							$('#magazine').turn({
								display : 'double',
								acceleration : true,
								gradients : !$.isTouch,
								elevation : 50,
								when : {
									turned : function(e, page) {
										/*console.log('Current view: ', $(this).turn('view'));*/
									}
								}
							});
						});
						$(window).bind('keydown', function(e) {
							if (e.keyCode == 37)
								$('#magazine').turn('previous');
							else if (e.keyCode == 39)
								$('#magazine').turn('next');
						});
					</script>
				</td>
			</tr>
			<!-- 팝업 아래부분 -->
			<tr>
				<form name="notice_form">

					<td align="left" bgcolor=White height=40>
					<span id="btn" align=left> 
					<a href="http://www.carlife.net/index.php" onclick="location='#'"><img src="./resources/img/carlo.png" width="100" height="40" alt="subscribe"></a>
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				
					</span><input type="checkbox" name="chkbox" value="checkbox">오늘 하루 이 창을 <a href="javascript:closeWin();"><B>닫기</B></a></td>
			</tr>
			</form>
			
		</table>
	</div>
	</div>
	
	<script language="Javascript">
		cookiedata = document.cookie;
		if (cookiedata.indexOf("maindiv=done") < 0) {
			document.all['divpop'].style.visibility = "visible";
		} else {
			document.all['divpop'].style.visibility = "hidden";
		}
	</script>

<!-- --------------------------------------------------------------------------------------------------------------- -->
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


<!-- header --><!-- header --><!-- header --><!-- header --><!-- header --><!-- header --><!-- header --><!-- header -->        
<!-- header --><!-- header --><!-- header --><!-- header --><!-- header --><!-- header --><!-- header --><!-- header -->              
        <header class="masthead">
            <div class="slider-container" id="slider">
                <div class="tp-banner-container">
                    <div class="tp-banner">
                        <ul>
                            <li data-transition="slotfade-horizontal" data-slotamount="7" data-masterspeed="500">
                                <!-- MAIN IMAGE -->
                                <img src="./resources/img/aa.jpg" data-lazyload="./resources/img/samples/aa.jpg" alt="slidebg1" data-bgfit="cover" data-bgposition="center center" data-bgrepeat="no-repeat">
                                <!-- LAYERS -->
								 <div class="tp-caption italic large_white_bold sft hidden-xs" data-x="left" data-y="center" data-hoffset="155" data-voffset="-230" data-speed="700" data-start="1300" data-easing="Power4.easeOut">
                                 	<h1 style="color: #282828 ; font-style: normal; ">당신과 함께 여행하는 Root Car</h1>
                                </div>
  								 
                                <div class="tp-caption lfb " data-x="left" data-y="center" data-hoffset="150" data-voffset="-155" data-speed="1000" data-start="1900" data-easing="Power4.easeOut">
                                    <a href="car_magazine_travel" class="btn btn-naked">예약하기&nbsp;&nbsp;<span class="fa fa-angle-right"></span></a>
                                </div>

                            </li>
                            <li data-transition="slotfade-horizontal" data-slotamount="7" data-masterspeed="500">
                                <!-- MAIN IMAGE -->
                                <img src="./resources/img/bb.png" data-lazyload="./resources/img/samples/bb.jpg" alt="slidebg1" data-bgfit="cover" data-bgposition="center center" data-bgrepeat="no-repeat">
                                <!-- LAYERS -->

                                <!-- LAYER NR. 1 -->
                            <!--      <div class="tp-caption sft fadeout" data-x="center" data-y="center" data-hoffset="0" data-voffset="0" data-speed="500" data-start="700" data-easing="Power4.easeOut">
                                    <img src="./resources/img/samples/macbook-bl.png" class="macbook-image" alt="">
                                </div>-->
                                
                                <div class="tp-caption italic large_white_bold sft hidden-xs" data-x="left" data-y="center" data-hoffset="50" data-voffset="-230" data-speed="700" data-start="1300" data-easing="Power4.easeOut">
                                 	<h1 style="color: white ; font-style: normal; ">차를 빌렸는데 갈 곳이 없다면?</h1>
                                </div>
                                <div class="tp-caption italic large_white_bold sft hidden-xs" data-x="left" data-y="center" data-hoffset="50" data-voffset="-160" data-speed="1000" data-start="1500" data-easing="Power4.easeOut">
                                <a href="car_magazine_travel" class="btn btn-naked" >여행지 추천 보러가기 ></a>
                                </div>
                                <div class="tp-caption italic large_white_bold sft hidden-xs" data-x="left" data-y="center" data-hoffset="50" data-voffset="-90" data-speed="700" data-start="1600" data-easing="Power4.easeOut">
                                 	<h1 style="color: white ; font-style: normal; ">자동차 관련잡지를 보고싶다면?</h1>
                                </div>
                                 
                                <div class="tp-caption italic large_white_bold sft hidden-xs" data-x="left" data-y="center" data-hoffset="50" data-voffset="-20" data-speed="1000" data-start="1700" data-easing="Power4.easeOut">
                                <a href="http://www.carlife.net/index.php" class="btn btn-naked">잡지보러가기&nbsp;&nbsp;<span class="fa fa-angle-right"></span></a>
                                </div>
                                
                                
                            </li>
                            <li data-transition="slotfade-horizontal" data-slotamount="7" data-masterspeed="500">
                                <!-- MAIN IMAGE -->
                                <img src="./resources/img/custom.jpg" data-lazyload="./resources/img/samples/custom.jpg" alt="slidebg1" data-bgfit="cover" data-bgposition="center center" data-bgrepeat="no-repeat">
                                <!-- LAYERS -->

                                <!-- LAYER NR. 1 -->
                                <div class="tp-caption lfl fadeout" data-x="left" data-y="center" data-hoffset="0" data-voffset="0" data-speed="500" data-start="700" data-easing="Power4.easeOut">
                                    <img src="./resources/img/samples/iphone.png" alt="">
                                </div>
                                <div class="tp-caption italic large_white_bold sft hidden-xs" data-x="left" data-y="center" data-hoffset="500" data-voffset="-110" data-speed="700" data-start="1300" data-easing="Power4.easeOut">
                                 	<h1 style="color: #282828 ; font-style: normal; ">고객센터</h1>
                                </div>
                                <div class="tp-caption large_white_light sfb" data-x="left" data-y="center" data-hoffset="500" data-voffset="-40" data-speed="1000" data-start="1300" data-easing="Power4.easeOut">
                                    <h2 style="color: #282828 ; font-style: normal; ">무엇을 도와드릴까요?</h2>
                                </div>
                                <div class="tp-caption large_white_light sfb" data-x="left" data-y="center" data-hoffset="500" data-voffset="10" data-speed="1000" data-start="1300" data-easing="Power4.easeOut">
                                     <h2 style="color: #282828 ; font-style: normal; ">How can I help you?</h2>
                                </div>
                                <div class="tp-caption large_white_light sfb" data-x="left" data-y="center" data-hoffset="500" data-voffset="60" data-speed="1000" data-start="1300" data-easing="Power4.easeOut">
                                     <h2 style="color: #282828 ; font-style: normal; ">何ができるか？</h2>
                                </div>
                                <div class="tp-caption sfb hidden-xs" data-x="left" data-y="center" data-hoffset="500" data-voffset="130" data-speed="1000" data-start="1700" data-easing="Power4.easeOut">
                                    <a href="custom" class="btn btn-primary btn-lg">고객센터 바로가기</a>
                                </div>
                            </li>

                        </ul>
                        <div class="tp-bannertimer"></div>
                    </div>
                </div>

            </div>

        <!-- 공통영역 -->
         <jsp:include page="./include/header.jsp"/>
         
         
        </header>
<!-- header --><!-- header --><!-- header --><!-- header --><!-- header --><!-- header --><!-- header --><!-- header -->        
<!-- header --><!-- header --><!-- header --><!-- header --><!-- header --><!-- header --><!-- header --><!-- header -->           
             
    </div>
    <!--/wrap-->

</body>
</html>
