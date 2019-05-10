<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<!--[if lt IE 7]><html lang="en" class="no-js ie6"><![endif]-->
<!--[if IE 7]><html lang="en" class="no-js ie7"><![endif]-->
<!--[if IE 8]><html lang="en" class="no-js ie8"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
<meta charset="UTF-8">
<title>상품예약 관리</title>
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
     <!--------------------        헤더공통영역     ---------------------------------  -->
    <jsp:include page="../include/admin_header.jsp"/>
    
   <!-- ------------------------------------ 공지사항  테이블 폼 윗부분---------------------------------------------------------------- -->

      <section class="well well-lg">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <form method="post" action="admin_logout">
                  <h2>차량 예약관리</h2><hr/>
                  </form>
               </div>
               
            </div>
         </div>
      </section>
<!-- --------------------------관리자 공지사항--------------------------------------- -->
      <section id="blog">
         <div class="container">
         <div class="row">
         <div class="article">
         <div class="row">
         <div class="col-md-12">      
         <div class="col-sm-11 col-xs-10">
      
      <form method="get" action="member_admin_list">
		<input type="hidden" name="find_field" value="mem_id">
             <div class="side-block search">
	             <h4>검색</h4>
	             <div class="form-group has-feedback">
	             <input type="text" class="form-control" name="Search_id" placeholder="Search here..." value="${find_name}">
	             <button type="submit"> <i class="fa fa-search form-control-feedback"></i>
	             </button>
	             </div>
             </div>
    	</form>
                           
       
                              
      <form method="post"  action="#" >                        
      <table class="table table-striped table-hover">
      
      <tr><td>이름</td><td>이메일</td><td>차 위치</td><td>차종</td><td>차 대여일</td><td>차 반납일</td><td>가격</td><td>데이터 등록일</td><td></td></tr>
     
		 
      <c:if test="${!empty total_CarList1}">
      <c:forEach var="s" items="${total_CarList1}"> 
   
   <%-- ------------------------------------공지사항 테이블------------------------------------------------------- --%>    
       <tr>
       <td>${s.car_member_name }</td>
       <td>${s.car_member_email }</td>
       <td>${s.car_location }</td>
       <td>${s.car_name }</td>  
       <td>${s.car_Start }</td>
       <td>${s.car_End }</td>
       <td>${s.rent_price }</td>
       <td>${s.car_date }</td>
       <td><button class="btn btn-default" type="submit">예약 취소</button></td>
          </tr>
      </c:forEach> 
      </c:if>
      </table>
 <div class="preview">
         <div class="quote">고객님의 예약정보를 확인가능합니다 </br>
            고객 요청 시 예약정보를 확인하고 예약취소를 해주세요.</div>
         </div>     
        </form>
        
                           </div>
                        </div>
                     </div>
                  </div>
                  
               </div>
           
            </div>

      </section>
      
      
<!-------------------------------------------------------    하단 footer ---------------------------------------->
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