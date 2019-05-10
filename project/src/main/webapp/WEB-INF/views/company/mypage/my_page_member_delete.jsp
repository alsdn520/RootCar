<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의정보 탈퇴</title>
<link rel="stylesheet" type="text/css" href="./resources/css/my_member_delete.css" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/my_page_delete.js"></script>
<script>


</script>
</head>
<body>
 	 &nbsp;&nbsp;
     <a href="indexx"><img src="./resources/img/logo-blue (2).png" alt=""></a>
	 <section id="buyNow1">						
	 <div id="aMain_cont">

		<h1>회원 탈퇴</h1>
		<form name="m" method="post" action="my_page_member_delete_ok" onsubmit="return my_page_delete_check();">
			<input type="hidden" name="mem_no" value="${login_ok_member.mem_no }" />
			
			<input type="hidden" name="delete_reason" value="x"/>
			<hr />
			<c:if test="${!empty login_ok_member}">
			
			<div class="form-group has-feedback left">
				<input type="hidden" name="mem_id" value="${login_ok_member.mem_id }" />
				<input type="text" value="${login_ok_member.mem_id }" class="form-control" readonly /> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="password" name="mem_pwd" id="mem_pwd" size="14" tabindex="1" class="form-control" placeholder="탈퇴 비밀번호" /> <i class="fa fa-pencil form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="password" name="mem_pwd2" id="mem_pwd2"  size="14" tabindex="1" class="form-control" placeholder="탈퇴  비밀번호 확인" /> <i class="fa fa-pencil form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<textarea cols="68" rows="13" placeholder="탈퇴 사유" class="form-control" name="delete_reason" id="delete_reason"></textarea> <i class="fa fa-pencil form-control-feedback"></i>
			</div>
		
			</c:if>
			
		 	<div class="article">
			<div class="row">
				<div class="col-md-12">
					
							
							<input type="checkbox" id="member_Activation" name="member_Activation" value="NO_DEL" > <a>탈퇴 동의 합니다</a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

							<input class="btn btn-default btn-lg center" type="submit" value="탈퇴" />
							<input class="btn btn-default btn-lg center" type="button" value="취소"  onclick="location='my_page';" /> 
						
					
				</div>
			</div>
			</div>
		</form>	
</div>
</section>
	
</body>
</html>












