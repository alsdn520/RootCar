<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<link rel="stylesheet" type="text/css" href="./resources/css/member_join.css" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/member_join.js"></script>
<script>


</script>
</head>
<body>
 	  <br/>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="indexx"><img src="./resources/img/logo-blue (2).png" alt=""></a>
     
<div id="aMain_cont">

		<h3>회원가입</h3>
		<form name="m" method="post" action="member_join_ok" onsubmit="return join_check();">
			
			
			<input type="hidden" name="delete_reason" value="x"/>
			<hr />
			<div class="row">
			<div class="col-xs-6 col-sm-9">
			<div class="form-group has-feedback left">
				<input type="text" name="mem_id" id="mem_id" size="14" tabindex="1" class="form-control" placeholder="아이디" /> <i class="fa fa-user form-control-feedback"></i>
			</div>
			</div>
			<div class="col-xs-6 col-sm-3">
				<input class="btn btn-default btn-lg" type="button" value="중복검색"  onclick="id_check();" />
			</div>
			</div>
				<span id="idcheck"></span>
			
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
			<div class="row">
			
  			<div class="col-xs-6 col-sm-4">
    		<select class="form-control" name="mem_phone" id="mem_phone">
      		<option value="010">010</option>
      		<option value="011">011</option>
     		<option value="019">019</option>
    		</select>
  			</div>
  			
  			<div class="col-xs-6 col-sm-4"><input type="text" name="mem_phone02" id="mem_phone02" size="5" tabindex="1" class="form-control" placeholder="*   *   *   *  " /></div>
  			<div class="col-xs-6 col-sm-4"><input type="text" name="mem_phone03" id="mem_phone03" size="5" tabindex="1" class="form-control" placeholder="*   *   *   *  " /></div>
			</div>
			<br/>
			
			<div class="form-group has-feedback left">
				<input type="text" name="mem_addr" id="mem_addr" size="14" tabindex="1" class="form-control" placeholder="회원주소" /> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="email" name="mem_email" id="mem_email" size="14"  tabindex="1"  class="form-control" placeholder="이메일주소"><i class="fa fa-envelope-o form-control-feedback"></i>
			</div>
		 	<div class="article">
			<div class="row">
				<div class="col-md-12">
					
							
							<input type="checkbox" id="member_Activation" name="member_Activation" value="YES"> 가입을 동의 합니다
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

							<input class="btn btn-default btn-lg center" type="submit" value="가입" />
							<input class="btn btn-default btn-lg center" type="button" value="취소"  onclick="location='member_login';" /> 
						
					
				</div>
			</div>
			</div>
			
		
		</form>
</div>

</body>
</html>












