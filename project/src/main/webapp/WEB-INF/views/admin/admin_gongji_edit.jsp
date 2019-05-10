<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="./resources/css/bbs.css" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">
<script src="./resources/js/jquery.js"></script>
<script>
 function gongji_check(){
	 if($.trim($("#gongji_title").val())==""){
		 alert("제목을 입력하세요!");
		 $("#gongji_title").val("").focus();
		 return false;
	 }
	 if($.trim($("#gongji_pwd").val())==""){
		 alert("비밀번호를 입력하세요!");
		 $("#gongji_pwd").val("").focus();
		 return false;
	 }
	 if($.trim($("#gongji_cont").val())==""){
		 alert("내용을 입력하세요!");
		 $("#gongji_cont").val("").focus();
		 return false;
	 }
	 
 }
</script>
</head>
<body>

<jsp:include page="../include/admin_header.jsp"/>


<div id="aMain_cont">

		<h3>공지사항 수정</h3>
		<form method="post" action="admin_gongji_edit_ok" onsubmit="return gongji_check();" >
			<input type="hidden" name="gongji_no" value="${g.gongji_no}" />
			<input type="hidden" name="page" value="${page}" />
	
			<hr />

			<div class="form-group has-feedback left">
				<input type="text" name="gongji_name" id="gongji_name" size="14" tabindex="1" class="form-control" placeholder="이름" 
					value="${admin_name}"/> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="text" name="gongji_title" id="gongji_title" size="14" tabindex="1" class="form-control" placeholder="제목" value="${g.gongji_title}" /> 
				<i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="password" name="gongji_pwd" id="gongji_pwd" size="14" tabindex="1" class="form-control" placeholder="비밀번호" /> 
				<i class="fa fa-envelope-o form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<textarea name="gongji_cont" id="gongji_cont" rows="14" cols="30" tabindex="1" class="form-control">${g.gongji_cont}</textarea>
			</div>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;
			<input class="btn btn-default btn-lg center" type="submit" value="수정" />
			<input class="btn btn-default btn-lg right" type="button" value="취소"  onclick="location='admin_gongji_list';" /> 
	
		</form>
</div>

</body>
</html>


