<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<!--[if lt IE 7]><html lang="en" class="no-js ie6"><![endif]-->
<!--[if IE 7]><html lang="en" class="no-js ie7"><![endif]-->
<!--[if IE 8]><html lang="en" class="no-js ie8"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
<meta charset="UTF-8">
<title>고객센터</title>
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
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&sensor=false"></script>
<script src="./resources/js/script.js"></script>
</head>

<body>
   <!-- Wrap all page content here -->
   <div id="wrap">
     <!-- 공통영역 -->
    <jsp:include page="../include/header.jsp"/>
       

      <section class="well well-lg">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <form method="post" action="mem_logout">
                  <h2>고객센터</h2><hr/>
                  </form>
               </div>
               <div class="col-md-6">
                  <ol class="breadcrumb">
                     <li><a href="custom">메인</a></li>
                     <li><a href="custom_board">회원전용 게시판</a></li>
                     <li class="active"><a href="gongji_list">공지사항</a></li>
                  </ol>
               </div>
            </div>
         </div>
      </section>

      <section id="blog">
         <div class="container">
         <div class="row">
         <div class="col-md-9">
         <div class="article">
         <div class="row">
         <div class="col-md-12">      
                           <img src="./resources/img/use.png" />
                        </div>
                     </div>
                  </div>

                  <div class="article">
                     <div class="row">
                        <div class="col-md-12">
                        </div>
                     </div>
                  </div>
                  
               </div>
               
            </div>
         </div>
      </section>


      
<!-- ---------------------------------------------하단부분---------------------------------------------------------------------- -->
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
   </div>
   <!--/wrap-->


</body>

</html>