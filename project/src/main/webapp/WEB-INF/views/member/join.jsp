<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<link rel="stylesheet" type="text/css" href="./resources/css/join.css" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">
<script src="./resources/js/jquery.js"></script>
<script>
 function join_check(){
	 if($.trim($("#mem_id").val())==""){
		 alert(" 아이디를 입력하세요!");
		 $("#mem_id").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_pwd").val())==""){
		 alert("비번을 입력하세요!");
		 $("#mem_pwd").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_pwd2").val())==""){
		 alert("비번을 확인을 입력하세요!");
		 $("#mem_pwd2").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_name").val())==""){
		 alert("회원 이름을 입력하세요!");
		 $("#mem_name").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_age").val())==""){
		 alert("회원 나이를 입력하세요!");
		 $("#mem_age").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_addr").val())==""){
		 alert("회원 주소를 입력하세요!");
		 $("#mem_addr").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_email").val())==""){
		 alert("회원 이메일 주소를 입력하세요!");
		 $("#mem_email").val("").focus();
		 return false;
	 }
	 
 }
 function id_check(){
	 
 }
</script>
</head>
<body>

<div id="aMain_cont">

		<h3>회원가입</h3>
		<form name="m" method="post" action="member_join_ok" onsubmit="return join_check();">

			<hr />

			<div class="form-group has-feedback left">
				<input type="text" name="mem_id" id="mem_id" size="14" tabindex="1" class="form-control" placeholder="아이디" /> <i class="fa fa-user form-control-feedback"></i>
				<input type="button" value="아이디중복검색"  onclick="id_check();"/>
			</div>
			
			<div class="form-group has-feedback left">
				<input type="password" name="mem_pwd" id="mem_pwd" size="14" tabindex="1" class="form-control" placeholder="비밀번호" /> <i class="fa fa-envelope-o form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="password" name="mem_pwd2" id="mem_pwd2" size="14" tabindex="1" class="form-control" placeholder="비밀번호 확인" /> <i class="fa fa-envelope-o form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="text" name="mem_name" id="mem_name" size="14" tabindex="1" class="form-control" placeholder="회원이름" /> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="text" name="mem_age" id="mem_age" size="14" tabindex="1" class="form-control" placeholder="회원나이" /> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="text" name="mem_addr" id="mem_addr" size="14" tabindex="1" class="form-control" placeholder="회원주소" /> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="email" name="mem_email" id="mem_email" size="14" class="form-control" placeholder="이메일주소"><i class="fa fa-envelope-o form-control-feedback"></i>
			</div>
		 

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-primary btn-lg center" type="submit" value="가입" />
			<input class="btn btn-primary btn-lg right" type="button" value="취소"  onclick="location='admin_index';" /> 
	
		</form>
</div>

</body>
</html>












