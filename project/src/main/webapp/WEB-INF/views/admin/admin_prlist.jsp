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
<title>상품목록</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css"
   title="mainStyle">

<script src="./resources/js/modernizr.custom.32033.js"></script>
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/stellar.js"></script>
<script src="./resources/js/jquery.circliful.min.js"></script>
<script type="text/javascript"
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&sensor=false"></script>
<script src="./resources/js/script.js"></script>
<script>
function checkBox_check(){

    if($('input:checkbox[name="select_box"]').is(":checked")){
       
    }else{
       alert('정보를 변경하고자 하는 목록의 체크박스를 체크해주세요.');
       return false;
    }
}
</script>
</head>
<script>
 
</script>
<body>
   <!-- Wrap all page content here -->
   <div id="wrap">
      <!-- 공통영역 -->
      <jsp:include page="../include/admin_header.jsp" />
      <section class="well well-lg">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
               
                     <h2>차량등록목록</h2>
                     <hr/>   
               </div>
            </div>
         </div>
      </section>

<section id="blog">
<div class="container">
<div class="row">

      <div class="article">
      <div class="row">
      <div class="col-md-12">
      <div class="col-sm-11 col-xs-10">

<form method="post" action="admin_prlist" >
<input type="hidden" name="find_field" value="pr_location" />
      <div class="side-block search">
              
                <div class="form-group has-feedback">
                <input type="text" class="form-control" name="find_name" placeholder="위치기준 검색">
                <button type="submit"> <i class="fa fa-search form-control-feedback"></i>
                </button>
                </div>
             </div>
      </form>
<form method="post"  action="admin_prlist_edit"  onsubmit="return checkBox_check();">
      <table class="table table-striped table-hover">
      
      <tr><td>&nbsp;&nbsp;</td><td>이름</td><td>위치</td><td>차종</td><td>가격</td><td>설명</td><td>작성일</td><td>사진</td><td>예약가능</td></tr>
      
      <c:if test="${!empty plist}">
       <c:forEach var="p" items="${plist}"> 
       
      <tr><td><input type="checkbox" name="select_box"  value="${p.pr_no }" /></td>
      <td>${p.pr_name }</td>
      <td>${p.pr_location }</td>
      <td>${p.pr_car }</td>
      <td>${p.pr_price }</td>
      <td>${p.pr_cont }</td>
      <td>${p.pr_date}</td>
      <td>${p.pr_file }</td>
      <td>${p.pr_car_Activation }</td></tr>
      
      </c:forEach> 
      </c:if>
      </table>
   
        <%--페이징(쪽나누기)--%>
  <div id="bList_paging">
  <%--검색전 페이징 --%>
<c:if test="${(empty find_field)&&(empty find_name)}">  
   <c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
   <c:if test="${page >1}">
    <a href="admin_prlist?page=${page-1}">[이전]</a>&nbsp;
   </c:if>
   
   <%--쪽번호 출력부분 --%>
   <c:forEach var="a" begin="${startpage}" end="${endpage}"
   step="1">
    <c:if test="${a == page}"><${a}></c:if>
    
    <c:if test="${a != page}">
     <a href="admin_prlist?page=${a}">[${a}]</a>&nbsp;
    </c:if>
   </c:forEach>
   
   <c:if test="${page>=maxpage}">[다음]</c:if>
   <c:if test="${page<maxpage}">
   <a href="admin_prlist?page=${page+1}">[다음]</a>
   </c:if>
</c:if>   

 <%--검색후 페이징 --%>
 <c:if test="${(!empty find_field)&&(!empty find_name)}">  
   <c:if test="${page <=1}">
   [이전]&nbsp;
   </c:if>
   <c:if test="${page >1}">
    <a href="admin_prlist?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   </c:if>
   
   <%--쪽번호 출력부분 --%>
   <c:forEach var="a" begin="${startpage}" end="${endpage}"
   step="1">
    <c:if test="${a == page}"><${a}></c:if>
    
    <c:if test="${a != page}">
     <a href="admin_prlist?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
    </c:if>
   </c:forEach>
   
   <c:if test="${page>=maxpage}">[다음]</c:if>
   <c:if test="${page<maxpage}">
   <a href="admin_prlist?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
   </c:if>
</c:if>   
 
  </div>
      <div id="btnins" style= text-align:center;>
      
        <input type="button"  class="btn btn-primary btn-lg" value="차량등록" onclick="location='admin_pr';" />
        <button class="btn btn-primary btn-lg" type="submit">차량목록 수정/삭제</button>
            </div>
      
    
        </form>
        
      </div>
      </div>
      </div>
      </div>
      
      <div class="article">
         <div class="row">
            <div class="col-md-12">
               <div class="col-sm-11 col-xs-10">
                  <div class="preview">
                     <div class="quote">등록된 차량 목록창입니다.</div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   
 
</div>
</div>
</section>

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