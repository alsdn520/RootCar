<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
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

		<h3>글쓰기</h3>
		<form name="m" method="post" action="bbs_write_ok" onsubmit="return bbs_check();" enctype="multipart/form-data">
			<input type="hidden" name="bbs_id" value="${bbs_id}">
			<hr />

			<div class="form-group has-feedback left">
				<input type="text" name="bbs_name" id="bbs_name" size="14" tabindex="1" class="form-control" placeholder="이름" value="${bbs_name}"/> 
				<i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="text" name="bbs_title" id="bbs_title" size="14" tabindex="1" class="form-control" placeholder="제목" /> <i class="fa fa-user form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<input type="password" name="bbs_pwd" id="bbs_pwd" size="14" tabindex="1" class="form-control" placeholder="비밀번호" /> <i class="fa fa-envelope-o form-control-feedback"></i>
			</div>
			<div class="form-group has-feedback left">
				<textarea name="bbs_cont" id="bbs_cont" rows="14" cols="30" tabindex="1" class="form-control"></textarea>
			</div>
			<div class="form-group has-feedback left">
				<input type="file" name="bbs_file" />
			</div>

			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;
			<input class="btn btn-default btn-lg center" type="submit" value="저장" />
			<input class="btn btn-default btn-lg right" type="button" value="취소"  onclick="location='custom_board';" /> 
	
		</form>
</div>

</body>
</html>


