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
<title>가입회원 목록 관리창</title>
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
</head>
<script>
function checkBox_check(){

	 if($('input:checkbox[name="select_box"]').is(":checked")){
		 
	 }else{
		 alert('정보를 변경하고자 하는 회원의 체크박스를 체크해주세요.');
		 return false;
	 }
}
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
					
							<h2>가입회원 목록</h2>
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
    	
		<form method="post" action="member_admin_member_Disable" onsubmit="return checkBox_check();">

		<table class="table table-striped table-hover">
		<tr><td colspan="12" align="right">회원 : ${listcount}명</td></tr>
		<tr>
		<td>&nbsp;&nbsp;<td/>
	
		<td>아이디</td>
		<td>비번</td>
		<td>이름</td>
		<td>나이</td>
		<td>주소</td>
		<td>이메일</td>
		<td>방문수</td>
		<td>회원정보 수정</td>
		<td>가입날짜</td>
		<td>계정 활성화</td>
		</tr>
	
		<c:if test="${!empty mlist}">
		<c:forEach var="b" items="${mlist}">
		 
		<tr>
		<td><input type="checkbox" id="select_box"  name="select_box"  value="${b.mem_id }" /><td/>
		
		<td>${b.mem_id }</td>
		<td>${b.mem_pwd }</td>
		<td>${b.mem_name }</td>
		<td>${b.mem_age }</td>
		<td>${b.mem_addr }</td>
		<td>${b.mem_email }</td>
		<td>${b.mem_hit }</td>
		<td>${b.mem_edit }</td>
		<td>${b.mem_date }</td>
		<td>${b.member_Activation }</td>
		</tr>
		
		</c:forEach>
		</c:if>
		<c:if test="${empty mlist}">
 		<tr>
  		<th colspan="12">목록이 없습니다!</th>
 		</tr>
		</c:if>	
		</table>
	
	<%--페이징 즉 쪽나누기 추가 --%>
 	<div id="bList_paging">
   		<%-- 검색전 페이징 --%>
		<c:if test="${(empty find_field) && (empty find_name)}">    
		   	<c:if test="${page<=1}">[이전]&nbsp;</c:if>
		    <c:if test="${page>1}"><a href="member_admin_list?page=${page-1}">[이전]</a>&nbsp;</c:if>  
		    <%--현재 쪽번호 출력--%>
		    <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
		    	<c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%><${a}></c:if>
		    	<c:if test="${a != page}"><%--현재 페이지가 선택되지 않았다면 --%><a href="member_admin_list?page=${a}">[${a}]</a>&nbsp;</c:if>
		    </c:forEach>
		    <c:if test="${page >= maxpage}">[다음]</c:if>
		    <c:if test="${page<maxpage}"><a href="member_admin_list?page=${page+1}">[다음]</a></c:if>
		</c:if>

		<%-- 검색후 페이징 --%>
		<c:if test="${(!empty find_field) && (!empty find_name)}">    
		    <c:if test="${page<=1}">[이전]&nbsp;</c:if>
    		<c:if test="${page>1}"><a href="member_admin_list?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;</c:if>
    		<%--현재 쪽번호 출력--%>
    		<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
				<c:if test="${a == page}"><%--현재 페이지가 선택되었다면--%><${a}></c:if>
     			<c:if test="${a != page}"><%--현재 페이지가 선택되지 않았다면 --%><a href="member_admin_list?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;</c:if>
   			</c:forEach>
   		    <c:if test="${page >= maxpage}">[다음]</c:if>
   			<c:if test="${page<maxpage}"><a href="member_admin_list?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a></c:if>
	    </c:if>   
   </div>
	
		<div id="btnins" style= text-align:center;>
        <button class="btn btn-default btn-lg" type="submit">블랙리스트 지정</button>
        <button class="btn btn-default btn-lg" type="button"  onclick="location='member_admin_member_Disable_list?member_Activation=NO';">블랙리스트 회원목록</button>
        </div>
		</form>

		</div>
		</div>
		</div>
		
		<div class="article">
			<div class="row">
				<div class="col-md-12">
					<div class="col-sm-11 col-xs-10">
						<div class="preview">
							<div class="quote">가입된 회원정보를 볼수 있습니다.
							<br/>방문수 : 회원이 로그인 성공한 횟수
							<br/>회원정보 수정 : 회원이 마이페이지/정보수정 횟수
							<br/>계정 활성화란? : 해당 값 기준으로 비활성화 회원 로그인을 방지
							</div>
						</div>
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