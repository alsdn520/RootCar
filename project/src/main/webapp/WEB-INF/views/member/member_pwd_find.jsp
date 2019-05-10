<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>비밀번호/찾기/이메일발송</title>
<!--  <link rel="stylesheet" type="text/css" href="./resources/css/admin.css" />-->
<link rel="stylesheet" type="text/css" href="./resources/css/login.css" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">
<script src="./resources/js/jquery.js"></script>

<script>
 function member_check(){
	 if($.trim($("#mem_id").val())==""){
		 alert("비번을 검색하고자 하는 회원아이디 입력하세요!");
		 $("#mem_id").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_name").val())==""){
		 alert("비번을 검색하고자 하는 회원이름을 입력하세요!");
		 $("#mem_name").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_email").val())==""){
		 alert("검색하고자 하는 회원아이디 입력하세요!!");
		 $("#mem_email").val("").focus();
		 return false;
	 }
 }
</script>
</head>
<body>          
      <br/>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="indexx"><img src="./resources/img/logo-blue (2).png" alt=""></a>

	<div id="aMain_cont">

		<h3>비밀번호 검색 및 메일발송</h3>
		<form method="post" action="member_pwd_find_ok" onsubmit="return member_check();">

			<hr />
			<div class="form-group has-feedback left">
				<input type="text" name="mem_id" id="mem_id" size="14" tabindex="1" class="form-control" placeholder="회원아이디" /> <i class="fa fa-user  form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="text" name="mem_name" id="mem_name" size="14" tabindex="1" class="form-control" placeholder="회원이름" /> <i class="fa fa-user  form-control-feedback"></i>
			</div>
		
			<div class="form-group has-feedback left">
				<input type="email" name="mem_email" id="mem_email" size="14"  tabindex="1"  class="form-control" placeholder="이메일주소"><i class="fa fa-envelope-o form-control-feedback"></i>
			</div>
	
			<span style="margin: right: ;">
			<a href="member_id_find">아이디 찾기</a>
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
   
			<input class="btn btn-default right" type="submit" value="이메일 발송" /><br/>
			
			</span>
				
		</form>

	</div>

</body>
</html>


