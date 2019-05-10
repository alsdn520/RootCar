<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 삭제</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">
<script src="./resources/js/jquery.js"></script>
<script>
	function del_check() {
		if($.trim($("#del_pwd").val())=="") {
			alert("삭제 비번을 입력하세요!");
			$("#del_pwd").val("").focus();
			return false;
		}
	}
</script>
</head>
<body>
  	<!-- 공통영역 -->
    <jsp:include page="../../include/header.jsp"/>
    	

		<section class="well well-lg">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<%--<form method="post" action="admin_logout">--%>
						<h2>고객게시판</h2>
						<%--</form>--%>
					</div>
					<div class="col-md-6">
						<ol class="breadcrumb">
							<li class="active"><a href="custom">메인</a></li>
							<li class="active"><a href="custom_board">고객게시판</a></li>
							<li class="active"><a href="#">Library</a></li>
						</ol>
					</div>
				</div>
			</div>
		</section>
		
		<section id="blog">
			<div class="container">
			<div class="row">
			<div class="col-md-10">
			<div class="article">
			<div class="row">
			<div class="col-md-10">	
			
			
			<form method="post" action="bbs_del_ok" onsubmit="return del_check();">
				<input type="hidden" name="bbs_step" value="${b.bbs_step}" />
				<input type="hidden" name="bbs_ref" value="${b.bbs_ref}" />
				<input type="hidden" name="bbs_no" value="${b.bbs_no}" />
				<input type="hidden" name="page" value="${page}" />
					<h3 class="bsW_title">자료실 삭제</h3>
					
					<hr/>
					
				<div class="form-group has-feedback left">
					<input type="password" name="del_pwd" id="del_pwd" size="14" tabindex="1" class="form-control" placeholder="비밀번호" /> 
					<i class="fa fa-envelope-o form-control-feedback"></i>
				</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-default btn-lg center" type="submit" value="삭제" />
			<input class="btn btn-default btn-lg right" type="button" value="취소"  onclick="location='custom_board';" /> 
	
			
		</form>
			</div>
			</div>
			</div>
			</div>
			</div>
			</div>
		</section>

</body>
</html>