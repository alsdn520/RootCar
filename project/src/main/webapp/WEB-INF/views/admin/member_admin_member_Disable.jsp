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
<title>블랙리스트 지정 관리창</title>
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
	 if($.trim($("#delete_reason").val())=="x"){
		 alert("계정 비활성화 처리 사유를 입력해주세요");
		 $("#delete_reason").val("").focus();
		 return false;
	 }
	
	 if($('input:checkbox[name="member_Activation"]').is(":checked")){
		 alert('회원 블랙처리가 완료되었습니다.');
		 
	 }else{
		 alert('회원 비활성화 처리를위해 체크박스를 체크해주세요.');
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
							<h2>회원 블랙리스트 지정</h2>
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

		<form method="post" action="member_admin_member_Disable_ok" onsubmit="return checkBox_check(); " >

		<table class="table table-striped table-hover">
		<tr><td colspan="10" align="right">&nbsp;</td></tr>
		<tr>
		<td align="center">아이디</td>
		<td align="center">비번</td>
		<td align="center">이름</td>
		<td align="center">나이</td>
		<td align="center">주소</td>
		<td align="center">사유</td>
		<td align="center">방문수</td>
		<td align="center">가입날짜</td>
		<td align="center">계정활성화(NO)</td></tr>
		
		<c:if test="${!empty editList}">
		
		<input type="hidden" name="mem_no" value="${editList.mem_no }">
		<tr>
		<td align="center">${editList.mem_id }</td>
		<td align="center">${editList.mem_pwd }</td>
		<td align="center">${editList.mem_name }</td>
		<td align="center">${editList.mem_age }</td>
		<td align="center">${editList.mem_addr }</td>
		<td align="center"><input type="text" size="18" id="delete_reason" name="delete_reason" value="${editList.delete_reason }"></td>   <!-- 이부분 값을 delete_reason담아서 컨트롤러 로 전달  -->
		<td align="center">${editList.mem_hit }</td>
		<td align="center">${editList.mem_date }</td>
		<td align="center"><input type="checkbox" id="member_Activation" name="member_Activation" value=NO></td> <!-- 이부분 값을 member_Activation담아서 컨트롤러 로 전달  -->
		</tr>
		
		</c:if>
		</table>
	
		<div id="btnins" style= text-align:center;>
        <button class="btn btn-default btn-lg" type="submit">블랙리스트 지정</button>
        </div>
		
		</form>
		
		</div>
		</div>
		</div>
		</div>
		<br/>
		<br/>
		<br/>
		<br/>
		
		<div class="article">
			<div class="row">
				<div class="col-md-12">
					<div class="col-sm-11 col-xs-10">
						<div class="preview">
							<div class="quote">관리자는 사용자가 홈페이지에서 비도덕적 행위를 할경우 제제를 할수있습니다.</div>
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