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
<title>관리자창</title>
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
                  <h2>${admin_name}&nbsp;님 로그인을 환영합니다.</h2><hr/><!-- <h3><input type="submit" value="로그아웃"/></h3> 로그아웃 위치 옮길것 -->
                  </form>
               </div>
               
            </div>
         </div>
      </section>
<!-- --------------------------관리자 공지사항--------------------------------------- -->
      <section id="blog">
         <div class="container">
         <div class="row">
         <div class="col-md-9">
         <div class="article">
         <div class="row">
         <div class="col-md-12">      
         <div class="col-sm-11 col-xs-10">
      
         <h3><a href="관리자 메인"></a></h3>
                           
         <p class="article-data"><h3><관리자 공지사항></h3></p>
                              
         <form method="post"  action="admin_ab_write" >
                               
         <div class="preview">
         <div class="quote">휴가일정,해야할 일 등 공유할 내용을 공지사항에 남겨주세요</div>
         </div>                     
                              
                              
      <table class="table table-striped table-hover">
      
      <tr><td>관리자</td><td>제목</td><td>작성일</td></tr>
      
      <c:if test="${!empty ablist}">
      <c:forEach var="ab" items="${ablist}"> 
      <input type="hidden" name="admin_no" value="${ab.admin_no}"/>
   <!-- ------------------------------------공지사항 테이블------------------------------------------------------- -->    
       <tr>  
       <td>${ab.admin_id }</td>
       <td><a href="admin_ab_cont?admin_no=${ab.admin_no }">${ab.admin_title }</a></td>
       <td>${ab.admin_date }</td>
          </tr>
      </c:forEach> 
      </c:if>
      </table>
   
   <%----------------------------------------페이징(쪽나누기)-------------------------------------------------------%>
  <div id="bList_paging">
  <%--검색전 페이징 --%>
<c:if test="${(empty find_field)&&(empty find_name)}">  
   <c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
   <c:if test="${page >1}">
    <a href="admin_main?page=${page-1}">[이전]</a>&nbsp;
   </c:if>
   
   <%--쪽번호 출력부분 --%>
   <c:forEach var="a" begin="${startpage}" end="${endpage}"
   step="1">
    <c:if test="${a == page}"><${a}></c:if>
    
    <c:if test="${a != page}">
     <a href="admin_main?page=${a}">[${a}]</a>&nbsp;
    </c:if>
   </c:forEach>
   
   <c:if test="${page>=maxpage}">[다음]</c:if>
   <c:if test="${page<maxpage}">
   <a href="admin_main?page=${page+1}">[다음]</a>
   </c:if>
</c:if>   

 <%--검색후 페이징 --%>
 <c:if test="${(!empty find_field)&&(!empty find_name)}">  
   <c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
   <c:if test="${page >1}">
   <a href="admin_main?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   </c:if>
   
   <%--쪽번호 출력부분 --%>
   <c:forEach var="a" begin="${startpage}" end="${endpage}"
   step="1">
   <c:if test="${a == page}"><${a}></c:if>
    
   <c:if test="${a != page}">
   <a href="admin_main?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
   </c:if>
   </c:forEach>
   
   <c:if test="${page>=maxpage}">[다음]</c:if>
   <c:if test="${page<maxpage}">
   <a href="admin_main?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
   </c:if>
</c:if>   
 
</div>
<!-- ----------------------------글쓰기 버튼--------------------------------------------------------------------------- -->
      <div id="btnins" style= text-align:center;>
      
        <button class="btn btn-primary btn-lg" type="submit">글쓰기</button>
       
            </div>
        </form>
        
                           </div>
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
<!-- ------------------------------검색 폼----------------------------------------------- -->               
               <div class="col-md-3">
            <form method="post" action="admin_main" >
            
                  <div class="side-block search">
                     <h4>검색</h4>
                     <div class="form-group has-feedback">
                     <input type="hidden" name="find_field" value="admin_id" /> 
                     <input type="text" class="form-control" name="find_name" placeholder="관리자ID를 검색하세요">
                        
                     <button type="submit"> <i class="fa fa-search form-control-feedback"></i></button>   
                     </div>
                     </div>
                  
                     </form>
               </div>
<!-- ---------------------------------------------------------------------------------------------- -->               
            </div>
         </div>
      </section>
      
      
<!-------------------------------------------------------    하단 footer ----------------------------------------------->
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