<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>로그인</title>
<!--  <link rel="stylesheet" type="text/css" href="./resources/css/admin.css" />-->
<link rel="stylesheet" type="text/css" href="./resources/css/login.css" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">
<script src="./resources/js/jquery.js"></script>


</head>
<body>          
     <br/>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="indexx"><img src="./resources/img/logo-blue (2).png" alt=""></a>

	<div id="aMain_cont">

		<h3>아이디 검색완료</h3>
		<form method="post" action="member_login">
			<c:if test="${!empty db_id_find}">
			<c:forEach var="p" items="${db_id_find}" >
			<hr />
			<div class="form-group has-feedback left">
				<input type="text" name="mem_id" id="mem_id" value="${p.mem_id }"  size="14" tabindex="1" class="form-control" placeholder="존재하지 않는 회원입니다." readonly/> <i class="fa fa-user  form-control-feedback"></i>
			</div>
			</c:forEach>
			</c:if>
			<c:if test="${empty db_id_find}">
			<hr />
			<div class="form-group has-feedback left">
				<input type="text" name="mem_id" id="mem_id"  readonly  size="14" tabindex="1" class="form-control" placeholder="존재하지 않는 회원입니다." /> <i class="fa fa-user  form-control-feedback"></i>
			</div>
			</c:if>
			
			<span style="margin: right: ;">
			<a href="member_id_find">아이디</a>&middot;
			<a href="member_pwd_find">비밀번호 찾기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<input class="btn btn-default right" type="submit" value="로그인페이지로 이동" /><br/>
			<a href="member_join" >회원가입</a>
			</span>
	
			
		
			
		</form>






	</div>


</body>
</html>


