<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>관리자 로그인</title>
<!--  <link rel="stylesheet" type="text/css" href="./resources/css/admin.css" />-->
<link rel="stylesheet" type="text/css" href="./resources/css/login.css" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">
<script src="./resources/js/jquery.js"></script>
<script>
 function admin_check(){
	 if($.trim($("#admin_id").val())==""){
		 alert("관리자 아이디를 입력하세요!");
		 $("#admin_id").val("").focus();
		 return false;
	 }
	 if($.trim($("#admin_pwd").val())==""){
		 alert("관리자 비번을 입력하세요!");
		 $("#admin_pwd").val("").focus();
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

		<h3>관리자 로그인</h3>
		<form method="post" action="admin_login_ok"
			onsubmit="return admin_check();">

			<hr />


			<div class="form-group has-feedback left">
				<input type="text" name="admin_id" id="admin_id" size="14" tabindex="1" class="form-control" placeholder="관리자 아이디" /> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="password" name="admin_pwd" id="admin_pwd" size="14" tabindex="1" class="form-control" placeholder="관리자 비밀번호" /> <i class="fa fa-envelope-o form-control-feedback"></i>
			</div>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
		
		
			<input class="btn btn-primary btn-lg right" type="button" value="취소"  onclick="location='indexx';" />
			<input class="btn btn-primary btn-lg center" type="submit" value="로그인" />
			
			
		</form>






	</div>


</body>
</html>


