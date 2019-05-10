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
<title>블랙리스트 회원목록 관리창</title>
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

	 if($('input:checkbox[name="mem_id"]').is(":checked")){
		 
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
					
							<h2>블랙리스트 목록</h2>
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
		<div class="col-sm-11 col-xs-10"> 
		<form method="post" action="member_admin_member_Disable_delete" onsubmit="return checkBox_check();">
		<table class="table table-striped table-hover">
		<tr><td colspan="11" align="right">&nbsp;</td></tr>
		<tr>
		<td>&nbsp;<td/>
		<td>아이디</td>
		<td>이름</td>
		<td>나이</td>
		<td>주소</td>
		<td>이메일</td>
		<td>방문수</td>
		<td>블랙리스트  | 탈퇴 사유</td>
		<td>계정활성화</td>
		</tr>
		
		<c:if test="${!empty dlist}">
		<c:forEach var="d" items="${dlist}">
		 
		<tr>
		<td><input type="checkbox" id="select_box"  name="mem_id"  value="${d.mem_id }" /><td/>
		<td>${d.mem_id }</td>
		<td>${d.mem_name }</td>
		<td>${d.mem_age }</td>
		<td>${d.mem_addr }</td>
		<td>${d.mem_email }</td>
		<td>${d.mem_hit }</td>
		<td>${d.delete_reason }</td>
		<td>${d.member_Activation }</td></tr>
		
		</c:forEach>
		</c:if>
		<c:if test="${empty dlist}">
 		<tr>
  		<th colspan="11">목록이 없습니다!</th>
 		</tr>
		</c:if>		
		</table>
	
		<div id="btnins" style= text-align:center;>	
        <button class="btn btn-default btn-lg" type="submit">회원정보 삭제</button>
        <button class="btn btn-default btn-lg"type="button"  onclick="location='member_admin_list';">취소</button>   
        </div>	
		</form>
	
		</div>
		</div>
		
		<div class="article">
			<div class="row">
				<div class="col-md-12">
					<div class="col-sm-11 col-xs-10">
						<div class="preview">
							<div class="quote">블랙시스트 목록 창입니다.
							<br/>계정 활성화 : NO | 블랙리스트 지정된 회원
							<br/>계정 활성화 : NO_DEL | 탈퇴한 회원
							
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