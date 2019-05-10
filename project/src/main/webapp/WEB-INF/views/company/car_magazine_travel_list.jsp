<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<!--[if lt IE 7]><html lang="en" class="no-js ie6"><![endif]-->
<!--[if IE 7]><html lang="en" class="no-js ie7"><![endif]-->
<!--[if IE 8]><html lang="en" class="no-js ie8"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->


<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>TEAM</title>
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/animate.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/jquery.easy-pie-chart.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">

<!-- REVOLUTION BANNER CSS SETTINGS -->
<link rel="stylesheet" type="text/css" href="./resources/rs-plugin/css/settings.css" media="screen" />

<!-- 추가 
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />-->

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
   <jsp:include page="../include/header.jsp" />

   <div id="wrap" class="home">
   		
	<div class="footer-layer2" style="background-color: white;">

	
	<h1>&nbsp;&nbsp;&nbsp;<a href="#" title="Root_Car">Root_Car</a></h1>
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원이름<br />
	    
	<br/>
	</div>
      <!-- 파란거 -->
      <section id="buyNow">
      <div class="container">
      <h1 style="text-align: center;">예약 확인</h1>
      <br>
      <br>
      <br>
      

      <div class="row">
      <div class="col-sm-6 scrollpoint sp-effect2">
      <img src="./resources/img/samples/macbook-bl.png" alt="" class="img-responsive macbook-image img-center">
      </div>         
               <div class="row">
                  <!-- 텍스트 폼 -->
                  <div class="col-md-12">
                  
                     <form method="post" action="car_magazine_travel_ok" onsubmit="return res_check();">
            		  <input type="hidden" value="NO" name="car_Activation">
            		   <input type="hidden" value=2 name="car_common">
                        <span style="color: white;"><strong>회원 이름</strong></span>
                        <div class="form-group has-feedback left">
                   		<input type="text" name="car_member_name" class="form-control" placeholder="NAME" value="${car_member_name}" readonly> <i class="fa fa-user form-control-feedback"></i>
                        </div>
                        <span style="color: white;"><strong>회원 이메일</strong></span>
                        <div class="form-group has-feedback left">
                        <input type="email" name="car_member_email" class="form-control" placeholder="Email" value="${car_member_email}" readonly> <i class="fa fa-envelope-o form-control-feedback"></i>
                        </div>
                        <span style="color: white;"><strong>회원 번호</strong></span>
                        <div class="form-group has-feedback left">
                        <input type="text" name="car_member_phone" class="form-control" placeholder="phone" value="${car_member_phone}" readonly> <i class="fa fa-phone form-control-feedback"></i>
                        </div>
                       
                        <div class="row">
                        
                        <div class="col-xs-6 col-sm-5">
    					<span style="color: white;"><strong>차종 </strong></span>    			
                        <input type="text" name="car_name" class="form-control" placeholder="차종" value="${car_name}" readonly/>
                        </div>  
                        
                        <div class="col-xs-6 col-sm-5">
    					<span style="color: white;"><strong>차종 위치</strong></span>
                        <input type="text" name="car_location" class="form-control" placeholder="차종 위치" value="${car_location}" readonly/> 
                        </div>  
                        
                        <div class="col-xs-6 col-sm-2">
                        <span style="color: white;"><strong>대여요금</strong></span>
                        <input type="text" name="rent_price"class="form-control" value="${rent_price}원" readonly/>
                        </div>
                        
  						</div>
                         <br/>
                        <div class="row">
			
  						<div class="col-xs-6 col-sm-5">
    					<span style="color: white;"><strong>대여일시</strong></span>
                        <input type="text" name="car_Start" id="car_Start"  class="form-control" value="${car_Start}" readonly/>
                        </div>
                        
                        <div class="col-xs-6 col-sm-5">
                        <span style="color: white;"><strong>반납일시</strong></span>
                        <input type="text" name="car_End" id="car_End" class="form-control" value="${car_End}" readonly/>
                        </div>
                        
                        <div class="col-xs-6 col-sm-2">
                        <span style="color: white;"><strong>대여기간</strong></span>
                        <input type="text" name="lending_period" id="lending_period" class="form-control" value="${lending_period}일" readonly/>
                        </div>
                        

  						</div>
  					    <br/>
  					    
  			  			<br/>
  			  			<br/>
                        <div id="btnins" style= text-align:center;>	
                        <button class="btn btn-primary btn-lg pull-right" type="submit" onclick="if(confirm('정말로 예약하시겠습니까?')==true){alert('예약정보를 고객님의 메일로 발송하였습니다.') }else{ return;}">예약하기</button>
               
              			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;
                        &nbsp;&nbsp;
                        
                        <button class="btn btn-primary btn-lg center" type="button"  
                        onclick="if(confirm('취소하시겠습니까?')==true){alert('예약취소 되었습니다.');location='car_magazine_travel' }else{ return;}">취소</button>  
                        </div>


                     </form>
                  </div>
                  <!-- 텍스트 폼 -->
               </div>
            </div>
         </div>
      </section>
      <!-- 파란거 -->

   </div>
   

   

   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
    <!-- 추가 -->
    <%--
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>--%>


</body>

</html>