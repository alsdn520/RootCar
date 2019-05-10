<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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

<script src="./resources/js/modernizr.custom.32033.js"></script>
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/stellar.js"></script>
<script src="./resources/js/jquery.circliful.min.js"></script>
<script src="./resources/js/script.js"></script>
   
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=VwfY07hHAcMv9jWqKrNt"></script>

<!-- REVOLUTION BANNER CSS SETTINGS -->
<link rel="stylesheet" type="text/css" href="./resources/rs-plugin/css/settings.css" media="screen" />


<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />

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

   <div class="pre-loader">
      <div class="load-con">
         <img src="./resources/img/logo-blue.png" class="animated fadeInDown"
            alt="">
         <div class="spinner">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
         </div>
      </div>
   </div>
   
   <!-- Wrap all page content here -->
   <div id="wrap" class="home">



      <!-- 파란거 -->
      <section id="buyNow">
         <div class="container">
                            <c:if test="${empty all_carlist}">                     
                            <h1 style="text-align: center;">예약가능한 상품이 없습니다.</h1>
                            </c:if>
                             <c:if test="${!empty all_carlist}">                     
                            <h1 style="text-align: center;">예약 하기</h1>
                            </c:if>
                     <br>
                     <br>
                <div class="row">
          <div class="col-sm-7">
              <!--  <div class="col-sm-6 scrollpoint sp-effect3">-->
           
 <!-------------------------------------------------------------- 지도시작 -------------------------------------------------------->
 <c:if test="${!empty all_carlist}">   
<div id="map" style="width:650px;height:425px; border-radius: 15px;"></div> 
</c:if>
<!------------------------------------------------------------- 지도끝 ------------------------------------------------- -->


      </div>     
               <div class="row">
                  <!-- 텍스트 폼 -->
                  <div class="col-md-5">
                  
                     <form method="post" action="car_magazine_travel_list" onsubmit="return res_check();">
                    <input type="hidden" value="NO" name="car_Activation">
                    <%--   <input type="hidden" value=${dat1} name="car_End">--%>
                    
                     <c:if test="${!empty all_carlist}">
                        <div class="form-group has-feedback left">
                         <input type="text" name="car_member_name" class="form-control" placeholder="NAME" value="${car_member_name}"> <i class="fa fa-user form-control-feedback"></i>
                        </div>
                        <div class="form-group has-feedback left">
                        <input type="email" name="car_member_email" class="form-control" placeholder="Email" value="${car_member_email}"> <i class="fa fa-envelope-o form-control-feedback"></i>
                        </div>
                        <div class="form-group has-feedback left">
                        <input type="text" name="car_member_phone" class="form-control" placeholder="phone" value="${car_member_phone}"> <i class="fa fa-phone form-control-feedback"></i>
                        </div>
                       
                        
                        <div class="row">
                        <div class="col-xs-6 col-sm-6">
                   <span style="color: white;"><strong>차종 </strong></span>
                        <select class="form-control" name="car_name" id="car_name" tabindex="1">
                    <c:forEach var="p" items="${all_carlist}">
                    <option value="${p.pr_car}">${p.pr_car}</option> 
                    </c:forEach> 
                   </select>                   
                    
                        </div>  
                        <div class="col-xs-6 col-sm-6">
                   <span style="color: white;"><strong>차종 위치</strong></span>
                        <select class="form-control" name="car_location" id="car_location" tabindex="1">
                    <option value="성동구청">성동구청</option> 
                    <option value="왕십리역 2번출구">왕십리역 2번출구</option>
                    <option value="마장역">마장역</option> 
                    <option value="청구역">청구역</option> 
                    <option value="한양대역">한양대역</option>  
                   </select>                   
            
                        </div>  
                    </div>

                        <div class="row">
         
                    <div class="col-xs-6 col-sm-6">
                    <span style="color: white;"><strong>대여일시 </strong></span>
                        <input type="date" name="car_Start" id="car_Start" class="form-control">
                        </div>
                        
                       <div class="col-xs-6 col-sm-6">
                       <span style="color: white;"><strong>대여기간 </strong></span>
                       <%--  <input type="date" name="car_End" id="car_End" class="form-control">--%>
                       <select class="form-control" name="lending_period" id="lending_period" >
                       <c:forEach var="lend" items="${lending_period}">
                       <option value="${lend}">${lend} 일</option>
                       </c:forEach>
                       </select>
                       </div>
                    </div>  
                       <br>
                       <br>
                       <button class="btn btn-primary btn-lg pull-right" type="submit">예약확인</button>
</c:if>


                     </form>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- 파란거 -->
   </div>

   <!-- 포토 -->
   <section id="portfolio">
      <div class="container">      
      <h1 style="text-align: center;"><strong>여행지 소개</strong></h1>
      <div class="row">
      <div id="filters" class="button-group">
               <button data-filter="*" class="current">all season</button>
               <button data-filter=".web-design">spring</button>
               <button data-filter=".print">summer</button>
               <button data-filter=".mobile">autumn</button>
               <button data-filter=".logo">winter</button>
      </div>

            <div id="container">
               <div class="item col-sm-3 col-sm-6 web-design">
                  <a href="http://korean.visitkorea.or.kr/kor/bz15/where/festival/festival.jsp?cid=989991">
                     <div class="details">
                        <img src="./resources/img/samples/travel/spring.jpg" alt="" class="img-responsive" />
                        <div class="info-wrapper">
                           <div class="info">
                              <div class="name-tag">
                                 <h5>
                                    아침고요수목원 <br> 봄나들이 봄꽃축제
                                 </h5>
                                 <span class="divider"></span>
                                 <p>Spring</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </a>
               </div>
               
               
               <div class="item col-sm-3 col-sm-6 print">
                  <a href="http://korean.visitkorea.or.kr/kor/bz15/where/festival/festival.jsp?cid=293094">
                     <div class="details">
                        <img src="./resources/img/samples/travel/summer2.jpg" alt="" class="img-responsive">
                        <div class="info-wrapper">
                           <div class="info">
                              <div class="name-tag">
                                 <h5>
                                    물의나라&nbsp;화천<br>쪽배축제
                                 </h5>
                                 <span class="divider"></span>
                                 <p>Summer</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </a>
               </div>
               
               
               <div class="item col-sm-3 col-sm-6 mobile">
                  <a href="http://korean.visitkorea.or.kr/kor/bz15/where/festival/festival.jsp?cid=631268">
                     <div class="details">
                        <img src="./resources/img/samples/travel/autumn.jpg" alt=""
                           class="img-responsive">
                        <div class="info-wrapper">
                           <div class="info">
                              <div class="name-tag">
                                 <h5>서울세계&nbsp;불꽃축제</h5>
                                 <span class="divider"></span>
                                 <p>Autumn</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </a>
               </div>
               
               
               <div class="item col-sm-3 col-sm-6 logo">
                  <a href="http://korean.visitkorea.or.kr/kor/bz15/where/festival/festival.jsp?cid=507599">
                     <div class="details">
                        <img src="./resources/img/samples/travel/winter.jpg" alt=""
                           class="img-responsive">
                        <div class="info-wrapper">
                           <div class="info">
                              <div class="name-tag">
                                 <h5>
                                    얼음나라<br>화천산천어축제
                                 </h5>
                                 <span class="divider"></span>
                                 <p>Winter</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </a>
               </div>
               
               
               <div class="item col-sm-3 col-sm-6 web-design">
                  <a href="http://korean.visitkorea.or.kr/kor/bz15/where/festival/festival.jsp?cid=1556203">
                     <div class="details">
                        <img src="./resources/img/samples/travel/spring2.jpg" alt=""
                           class="img-responsive">
                        <div class="info-wrapper">
                           <div class="info">
                              <div class="name-tag">
                                 <h5>
                                    태안<br>세계튤립축제
                                 </h5>
                                 <span class="divider"></span>
                                 <p>Spring</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </a>
               </div>
               
               
               <div class="item col-sm-3 col-sm-6 logo">
                  <a
                     href="http://korean.visitkorea.or.kr/kor/bz15/where/festival/festival.jsp?cid=1964700">
                     <div class="details">
                        <img src="./resources/img/samples/travel/winter2.jpg" alt=""
                           class="img-responsive">
                        <div class="info-wrapper">
                           <div class="info">
                              <div class="name-tag">
                                 <h5>
                                    강화도&nbsp;<br>빙어,송어&nbsp;축제
                                 </h5>
                                 <span class="divider"></span>
                                 <p>Winter</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </a>
               </div>
               
               
               <div class="item col-sm-3 col-sm-6 print">
                  <a
                     href="http://korean.visitkorea.or.kr/kor/bz15/where/festival/festival.jsp?cid=1316398">
                     <div class="details">
                        <img src="./resources/img/samples/travel/summer3.jpg" alt=""
                           class="img-responsive">
                        <div class="info-wrapper">
                           <div class="info">
                              <div class="name-tag">
                                 <h5>
                                    에버랜드&nbsp;썸머<br>워터&nbsp;펀
                                 </h5>
                                 <span class="divider"></span>
                                 <p>Summer</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </a>
               </div>
               
               
               <div class="item col-sm-3 col-sm-6 mobile">
                  <a href="http://korean.visitkorea.or.kr/kor/bz15/where/festival/festival.jsp?cid=506895">
                     <div class="details">
                        <img src="./resources/img/samples/travel/autumn2.jpg" alt=""
                           class="img-responsive">
                        <div class="info-wrapper">
                           <div class="info">
                              <div class="name-tag">
                                 <h5>정선아리랑제</h5>
                                 <span class="divider"></span>
                                 <p>Autumn</p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
      </div>
      

   </section>
   
   <!-- 포토 -->

   <!-- text박스 -->

   <!--/wrap-->
   <script>
   function res_check() {
      $car_Start=$.trim($("#car_Start").val());
      if($car_Start==""){
         alert("대여일시를 선택하세요.");
         $("#car_Start").val("").focus();
         return false;
      }
   }

   </script>

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
        appMaster.isoTop();
        appMaster.canvasHack();
    });
    </script>
    <script>
var map = new naver.maps.Map('map', {center: new naver.maps.LatLng(37.562251, 127.035146), zoom: 10});//지도 실행 시 중간지점
var marker = new naver.maps.Marker({position: new naver.maps.LatLng(37.561586, 127.035414), map: map});//마커가 찍히는 위치
var marker1 = new naver.maps.Marker({position: new naver.maps.LatLng(37.565293, 127.036759),map: map});//마커가 찍히는 위치
var marker2 = new naver.maps.Marker({position: new naver.maps.LatLng(37.566348, 127.042965),map: map});//마커가 찍히는 위치
var marker3 = new naver.maps.Marker({position: new naver.maps.LatLng(37.557632, 127.029605),map: map});//마커가 찍히는 위치
var marker4 = new naver.maps.Marker({position: new naver.maps.LatLng(37.555728,127.043683),map: map});//마커가 찍히는 위치


var contentString = [
  
   '<div class="iw_inner">',
   '<h3>왕십리역 2번출구</h3>',
   '<p>',
   
   <c:forEach var='p' items='${imgList}'>
   <c:if test="${p.pr_location=='왕십리역 2번출구'}"> 
   "<h3 style='display:none;'>왕십리역 2번출구</h3>",  
    "<img src='./resources/upload${p.pr_file}' width='200' height='200'  />",
  </c:if>
    </c:forEach>
    '</p>',
    '</div>'
].join('');

var contentString1 = [
   '<div class="iw_inner">',
   '<h3>성동구청</h3>',
   '<p>',
   
   <c:forEach var='p' items='${imgList}'>
   <c:if test="${p.pr_location=='성동구청'}"> 
   "<h3 style='display:none;'>성동구청</h3>",  
    "<img src='./resources/upload${p.pr_file}' width='200' height='200'  />",
    
  </c:if>
    </c:forEach>
    '</p>',
    '</div>'
].join('');

var contentString2 = [
     
      '<div class="iw_inner">',
      '<h3>마장역</h3>',
      '<p>',
      
      <c:forEach var='p' items='${imgList}'>
      <c:if test="${p.pr_location=='마장역'}"> 
      "<h3 style='display:none;'>마장역</h3>",  
       "<img src='./resources/upload${p.pr_file}' width='200' height='200'  />",
     </c:if>
       </c:forEach>
       '</p>',
       '</div>'
   ].join('');
   
var contentString3 = [
     
      '<div class="iw_inner">',
      '<h3>행당역</h3>',
      '<p>',
      
      <c:forEach var='p' items='${imgList}'>
      <c:if test="${p.pr_location=='행당역'}"> 
      "<h3 style='display:none;'>행당역</h3>",  
       "<img src='./resources/upload${p.pr_file}' width='200' height='200'  />",
     </c:if>
       </c:forEach>
       '</p>',
       '</div>'
   ].join('');
   
var contentString4 = [
     
      '<div class="iw_inner">',
      '<h3>한양대역</h3>',
      '<p>',
      
      <c:forEach var='p' items='${imgList}'>
      <c:if test="${p.pr_location=='한양대역'}"> 
      "<h3 style='display:none;'>한양대역</h3>",  
       "<img src='./resources/upload${p.pr_file}' width='200' height='200'  />",
     </c:if>
       </c:forEach>
       '</p>',
       '</div>'
   ].join('');

var infowindow = new naver.maps.InfoWindow({content: contentString});
var infowindow1 = new naver.maps.InfoWindow({content: contentString1});
var infowindow2 = new naver.maps.InfoWindow({content: contentString2});
var infowindow3 = new naver.maps.InfoWindow({content: contentString3});
var infowindow4 = new naver.maps.InfoWindow({content: contentString4});

naver.maps.Event.addListener(marker, "click", function(e) {
   
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});

naver.maps.Event.addListener(marker1, "click", function(e) {
      
    if (infowindow1.getMap()) {
        infowindow1.close();
    } else {
        infowindow1.open(map, marker1);
    }
});

naver.maps.Event.addListener(marker2, "click", function(e) {
      
    if (infowindow2.getMap()) {
        infowindow2.close();
    } else {
        infowindow2.open(map, marker2);
    }
});

naver.maps.Event.addListener(marker3, "click", function(e) {
      
    if (infowindow3.getMap()) {
        infowindow3.close();
    } else {
        infowindow3.open(map, marker3);
    }
});

naver.maps.Event.addListener(marker4, "click", function(e) {
      
    if (infowindow4.getMap()) {
        infowindow4.close();
    } else {
        infowindow4.open(map, marker4);
    }
});

//var map = new naver.maps.Map('map', mapOptions);

</script>  
    
    <!-- 추가 -->
    <%--
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>--%>

   	<footer id="site-footer" style="background-color: blalk; z-index: 1111">		
		<div class="footer-layer2">
		<h1><a href="/" title="ROOT_CAR">ROOT_CAR</a>
		</h1>
		<div class="footer-content">
		<address>
		Root(주) | 대표이사 : 김미정<br /> 서울시 성동구 무학로2길 54 신방빌딩 4층<br /> 사업자 등록번호 : 120-88-00000 <br /> 통신판매업신고 : 2018-서울성동-0000<br />
		</address>
		</div>
		</div>
		</footer>
</body>

</html>