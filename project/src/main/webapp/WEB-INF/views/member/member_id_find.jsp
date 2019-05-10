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

<script>
 function member_check(){
	 if($.trim($("#mem_name").val())==""){
		 alert("검색하고자 하는 회원 이름을 입력하세요!");
		 $("#mem_name").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_phone").val())=="* * * *"){
		 alert("가입시 등록한 휴대번호 앞 자리를 선택해주세요!");
		 $("#mem_phone").val("* * * *").focus();
		 return false;
	 }
	 if($.trim($("#mem_phone02").val())==""){
		 alert("가입시 등록한 휴대번호 중간 자리를 선택해주세요!");
		 $("#mem_phone02").val("").focus();
		 return false;
	 }
	 if($.trim($("#mem_phone03").val())==""){
		 alert("가입시 등록한 휴대번호 뒷 자리를 선택해주세요!");
		 $("#mem_phone03").val("").focus();
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

		<h3>아이디 검색</h3>
		<form method="post" action="member_id_find_ok" onsubmit="return member_check();">

			<hr />
			<div class="form-group has-feedback left">
				<input type="text" name="mem_name" id="mem_name" size="14" tabindex="1" class="form-control" placeholder="회원이름" /> <i class="fa fa-user  form-control-feedback"></i>
			</div>
			
			<div class="row">
  			<div class="col-xs-6 col-sm-4">
    		<select class="form-control" name="mem_phone" id="mem_phone" tabindex="1">
  			<c:forEach var="p" items="${phone}">
  			<option value="${p}"<c:if test="${p==login_ok_member.mem_phone}">${'selected'}</c:if>>${p}</option> 
  			</c:forEach>
    		</select>
  			</div>
  			<div class="col-xs-6 col-sm-4"><input type="text" name="mem_phone02" id="mem_phone02" value="${login_ok_member.mem_phone02 }"    size="5" tabindex="1" class="form-control" placeholder="*   *   *   *  " /></div>
  			<div class="col-xs-6 col-sm-4"><input type="text" name="mem_phone03" id="mem_phone03" value="${login_ok_member.mem_phone03 }"    size="5" tabindex="1" class="form-control" placeholder="*   *   *   *  " /></div>
			</div>
			<br/>
	
			<span style="margin: right: ;">
			
			<a href="member_pwd_find">비밀번호 찾기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<input class="btn btn-default right" type="submit" value="아이디 검색" /><br/>
			
			</span>
	
			
		
			
		</form>






	</div>


</body>
</html>


