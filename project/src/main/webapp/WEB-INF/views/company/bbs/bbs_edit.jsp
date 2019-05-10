<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
<link rel="stylesheet" type="text/css" href="./resources/css/bbs.css" />
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">
<script src="./resources/js/jquery.js"></script>
<script>
 function bbs_check(){
	 if($.trim($("#bbs_name").val())==""){
		 alert("이름을 입력하세요!");
		 $("#bbs_name").val("").focus();
		 return false;
	 }
	 if($.trim($("#bbs_title").val())==""){
		 alert("제목을 입력하세요!");
		 $("#bbs_title").val("").focus();
		 return false;
	 }
	 if($.trim($("#bbs_pwd").val())==""){
		 alert("비밀번호를 입력하세요!");
		 $("#bbs_pwd").val("").focus();
		 return false;
	 }
	 if($.trim($("#bbs_cont").val())==""){
		 alert("내용를 입력하세요!");
		 $("#bbs_cont").val("").focus();
		 return false;
	 }
	 
 }
 function id_check(){
	 
 }
</script>
</head>
<body>

<jsp:include page="../../include/header.jsp"/>


<div id="aMain_cont">

		<h3>게시판 수정</h3>
		<form method="post" action="bbs_edit_ok" onsubmit="return bbs_check();" enctype="multipart/form-data">
			<input type="hidden" name="bbs_no" value="${b.bbs_no}" />
			<input type="hidden" name="page" value="${page}" />

			<hr />

			<div class="form-group has-feedback left">
				<input type="text" name="bbs_name" id="bbs_name" size="14" tabindex="1" class="form-control" placeholder="이름" value="${b.bbs_name}"/> 
				<i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="text" name="bbs_title" id="bbs_title" size="14" tabindex="1" class="form-control" placeholder="제목" value="${b.bbs_title}"/> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="password" name="bbs_pwd" id="bbs_pwd" size="14" tabindex="1" class="form-control" placeholder="비밀번호" /> <i class="fa fa-envelope-o form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<textarea name="bbs_cont" id="bbs_cont" rows="14" cols="30" tabindex="1" class="form-control">${b.bbs_cont}</textarea>
			</div>
			<div class="form-group has-feedback left">
				<input type="file" name="bbs_file" value="${b.bbs_file}" />
			</div>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;
			<input class="btn btn-default btn-lg center" type="submit" value="수정" />
			<input class="btn btn-default btn-lg right" type="button" value="취소"  onclick="location='custom_board';" /> 
	
		</form>
</div>

</body>
</html>


