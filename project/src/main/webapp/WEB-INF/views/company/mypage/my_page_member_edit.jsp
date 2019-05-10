<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의정보 수정</title>
<link rel="stylesheet" type="text/css" href="./resources/css/my_member_edit.css" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/my_page_edit.js"></script>
<script>


</script>
</head>
<body>
     &nbsp;&nbsp;
     <a href="indexx"><img src="./resources/img/logo-blue (2).png" alt=""></a>
	  <section id="buyNow1">				
	  <div id="aMain_cont">
	
		<h1>회원정보 수정</h1>
		<form name="m" method="post" action="my_page_member_edit_ok" onsubmit="return my_page_edit_check();">
			
			
			<input type="hidden" name="delete_reason" value="x"/>
			<hr />
			<c:if test="${!empty login_ok_member}">
			
			<div class="form-group has-feedback left">
				<input type="text" name="mem_id" id="mem_id" value="${login_ok_member.mem_id }" class="form-control" readonly /> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="password" name="mem_pwd" id="mem_pwd" size="14" tabindex="1" class="form-control" placeholder="비밀번호" /> <i class="fa fa-pencil form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="password" name="mem_pwd2" id="mem_pwd2"  size="14" tabindex="1" class="form-control" placeholder="비밀번호 확인" /> <i class="fa fa-pencil form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="text" name="mem_name" id="mem_name" value="회원 이름 : ${login_ok_member.mem_name }"  size="14" tabindex="1" class="form-control" readonly/> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="text" name="mem_age" id="mem_age" value="회원 나이 : ${login_ok_member.mem_age }" size="14" tabindex="1" class="form-control" readonly /> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="row">
			
  			<div class="col-xs-6 col-sm-4">
    		<select class="form-control" name="mem_phone" id="mem_phone" >
  			<c:forEach var="p" items="${phone}">
  			<option value="${p}"<c:if test="${p==login_ok_member.mem_phone}">${'selected'}</c:if>>${p}</option> 
  			</c:forEach>
    		</select>
  			</div>
  			
  			<div class="col-xs-6 col-sm-4"><input type="text" name="mem_phone02" id="mem_phone02" value="${login_ok_member.mem_phone02 }"    size="5" tabindex="1" class="form-control" placeholder="*   *   *   *  " /></div>
  			<div class="col-xs-6 col-sm-4"><input type="text" name="mem_phone03" id="mem_phone03" value="${login_ok_member.mem_phone03 }"    size="5" tabindex="1" class="form-control" placeholder="*   *   *   *  " /></div>
			</div>
			<br/>
			
			<div class="form-group has-feedback left">
				<input type="text" name="mem_addr" id="mem_addr"  value="${login_ok_member.mem_addr }" size="14" tabindex="1" class="form-control" placeholder="회원주소" /> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="email" name="mem_email" id="mem_email"value="회원 이메일 : ${login_ok_member.mem_email }"  size="14"  tabindex="1"  class="form-control"  readonly/><i class="fa fa-envelope-o form-control-feedback"></i>
			</div>
			</c:if>
			
		 	<div class="article">
			<div class="row">
				<div class="col-md-12">
					
							
							<input type="checkbox" id="member_Activation" name="member_Activation" value="YES" > <a>수정 동의 합니다</a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

							<input class="btn btn-default btn-lg center" type="submit" value="수정" />
							<input class="btn btn-default btn-lg center" type="button" value="취소"  onclick="location='my_page';" /> 
						
					
				</div>
			</div>
			</div>
		</form>	
</div>
</section>
	
</body>
</html>












  			