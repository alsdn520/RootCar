<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>


<!DOCTYPE html>

<!--[if lt IE 7]><html lang="en" class="no-js ie6"><![endif]-->
<!--[if IE 7]><html lang="en" class="no-js ie7"><![endif]-->
<!--[if IE 8]><html lang="en" class="no-js ie8"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
<meta charset="UTF-8">
<title>상품관리</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">



<script src="./resources/js/modernizr.custom.32033.js"></script>
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/stellar.js"></script>
<script src="./resources/js/jquery.circliful.min.js"></script>
<script src="./resources/js/script.js"></script>
   
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=VwfY07hHAcMv9jWqKrNt"></script>
 <style>
        .btn-file{
            position: relative;
            overflow: hidden;
        }
        .btn-file input[type=file] {
            position: absolute;
            top: 0;
                right: 0;
            min-width: 100%;
            min-height: 100%;
            font-size: 100px;
            text-align: right;
            filter: alpha(opacity=0);
            opacity: 0;
            outline: none;
            background: white;
            cursor: inherit;
            display: block;
        }
    </style>
</head>

<body>
   <!-- Wrap all page content here -->
   <div id="wrap">
     <!-- 공통영역 -->
    <jsp:include page="../include/admin_header.jsp"/>
       

      <section class="well well-lg">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                     <h2>차량 등록</h2>
               <hr/>   
               </div>
            </div>
         </div>
      </section>

     <!--   <section id="blog"> -->
         <div class="container">
       <!-- <div class="row">  --> 
       <!--  <div class="col-md-9">  --> 
        <!--   <div class="article">  --> 
        <!--  <div class="row">  --> 
       <!--   <div class="col-md-12">      -->   
       <!--   <div class="col-sm-11 col-xs-10">  --> 
                               
<!-------------------------------------------------------------- 지도시작 -------------------------------------------------------->
<div id="map" style="width:1140px;height:400px;"></div> 

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
<!------------------------------------------------------------- 지도끝 ------------------------------------------------- -->


<!------------------------------------------------------------------- 사지인 -------------------------------------------------->
<!-------------------------------------------------------------- 상품등록 -----------------------------------------------  -->
<br />
<script>
 function pr_check(){
    if($.trim($("#imgInp").val())==""){
          alert("파일을 첨부하세요!");         
          return false;
     }
       if($.trim($("#pr_name").val())==""){
             alert("이름을 첨부하세요!");
             $("#pr_name").val("").focus();
             return false;
        }else{
       if($.trim($("#pr_name").val())==$("#pr_name").val()){
                alert("중복 확인해주세요");
                $("#pr_name").val("").focus();
                return false;
        }
    if($.trim($("#pr_location").val())==""){
       alert("위치를 입력하세요!");
       $("#pr_location").val("").focus();
       return false;
    }
    if($.trim($("#pr_car").val())==""){
       alert("차종을 입력하세요!");
       $("#pr_car").val("").focus();
       return false;
    }
    if($.trim($("#pr_price").val())==""){
       alert("가격을 입력하세요!");
       $("#pr_price").val("").focus();
       return false;
    }
    if($.trim($("#pr_cont").val())==""){
       alert("내용을 입력하세요!");
       $("#pr_cont").val("").focus();
       return false;
    }    
 }      
</script>

<!------------------------------------------------------------------- 사지인 -------------------------------------------------->
<br/>
<h3>사진 미리보기</h3>
<!-- -------------------------사진 미리보기 --> 
<form  method="post"  action="car_pr_ok" onsubmit="return pr_check();" enctype="multipart/form-data">

<label class="btn btn-primary btn-file" >
    
        파일추가<input type="file" name="pr_file" id="imgInp" style="display: none;" id="imgInp" >
       

   </label>
   
   
   
   <br/>
   
   
    <p style="text-align: center;">
   <img id="foo"/>
   </p>
   
   <script type="text/javascript">

        function readURL(input) {

          if (input.files && input.files[0]) {

            var reader = new FileReader();

            reader.onload = function(e) {

              $('#foo').attr('src', e.target.result);

            }

            reader.readAsDataURL(input.files[0]);

          }

        }


        $("#imgInp").change(function() {
          readURL(this);
        });
</script>
        
<div id="aMain_cont">
<div class="form-group has-feedback left">
            <input type="text" name="pr_name" id="pr_name" size="14" tabindex="1" class="form-control" placeholder="이름"><i class="fa fa-list form-control-feedback"></i>
         </div>
         <div class="form-group has-feedback left">
            <input type="text" name="pr_location" id="pr_location" size="14" tabindex="1" class="form-control" placeholder="위치" /> <i class="fa fa-map-marker form-control-feedback"></i>
         </div>
         <div class="form-group has-feedback left">
            <input type="text" name="pr_car" id="pr_car" size="14" tabindex="1" class="form-control" placeholder="차종" /> <i class="fa fa-automobile form-control-feedback"></i>
         </div>
         
         <div class="form-group has-feedback left">
            <input type="number" min="0" max="100000000" name="pr_price" id="pr_price" size="14" tabindex="1" class="form-control" placeholder="가격" /> <i class="fa fa-dollar form-control-feedback"></i>
         </div>
         <div class="form-group has-feedback left">
            <input type="text" name="pr_cont" id="pr_cont" size="14" tabindex="1" class="form-control" placeholder="설명"><i class="fa fa-list form-control-feedback"></i>
         </div>
         <div class="form-group has-feedback left">
            <input type="hidden" name="pr_car_Activation" id="pr_car_Activation" value="yes" size="14" tabindex="1" class="form-control" placeholder="설명">
         </div>
         
         </div>
      
         

<!--------------------------------------------------------------- 상품등록 끝----------------------------------------------- -->        
                           </div>
                        </div>
                      
                  
                         
                         
                         
                         
                         
                         
                         <div id="btnins" style= text-align:center;>
                         <button class="btn btn-primary btn-lg" type="submit">저장</button>&nbsp;&nbsp;&nbsp;
                         <input type="button"  class="btn btn-primary btn-lg" value="목록" 
                     onclick="location='admin_prlist';" />
                         </div>
                         <br/>
                         <br/>
       </form>                                  
              <br/>
              <br/>
           <!--  </div> -->
       <!--   </div> -->
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
 <!--   </div> -->
   <!--/wrap-->
  

</body>

</html>