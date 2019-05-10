<%@ page contentType="text/html; charset=UTF-8"%>
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

<script>
 function member_check(){
	 if($.trim($("#mem_id").val())==""){
		 alert("아이디를 입력하세요!");
		 $("#mem_id").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_pwd").val())==""){
		 alert("비번을 입력하세요!");
		 $("#mem_pwd").val("").focus();
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

		<h3>회원 로그인</h3>
		<form method="post" action="member_login_ok" onsubmit="return member_check();">

			<hr />
			<div class="form-group has-feedback left">
				<input type="text" name="mem_id" id="mem_id" size="14" tabindex="1" class="form-control" placeholder="아이디" /> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="password" name="mem_pwd" id="mem_pwd" size="14" tabindex="1" class="form-control" placeholder="비밀번호" /> <i class="fa fa-envelope-o form-control-feedback"></i>
			</div>
			
	
			<span style="margin: right: ;">
			<a href="member_id_find">아이디</a>&middot;
			<a href="member_pwd_find">비밀번호 찾기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-default right" type="submit" value="로그인" /><br/>
			<a href="member_join" >회원가입</a>
			</span>
	
			
		
			
		</form>






	</div>


</body>
</html>


