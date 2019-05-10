<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<!--[if lt IE 7]><html lang="en" class="no-js ie6"><![endif]-->
<!--[if IE 7]><html lang="en" class="no-js ie7"><![endif]-->
<!--[if IE 8]><html lang="en" class="no-js ie8"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
<meta charset="UTF-8">
<title>고객센터</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle">

<script src="./resources/js/modernizr.custom.32033.js"></script>
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/stellar.js"></script>
<script src="./resources/js/jquery.circliful.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&sensor=false"></script>
<script src="./resources/js/script.js"></script>
<script>
	function reply_check() {
		if($.trim($("#reply_cont").val())=="") {
			alert("댓글 내용을 입력하세요!");
			$("#reply_cont").val("").focus();
			return false;
		}
	}
</script>
</head>

<body>
	<!-- Wrap all page content here -->
	<div id="wrap">
  	<!-- 공통영역 -->
    <jsp:include page="../../include/header.jsp"/>
    	

		<section class="well well-lg">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<form method="post" action="admin_logout">
						<h2>고객게시판</h2>
						</form>
					</div>
					<div class="col-md-6">
						<ol class="breadcrumb">
							<li class="active"><a href="custom">메인</a></li>
							<li class="active"><a href="custom_board">고객게시판</a></li>
							<li class="active"><a href="gongji_list">공지사항</a></li>
						</ol>
					</div>
				</div>
			</div>
		</section>

		<section id="blog">
			<div class="container">
			<div class="row">
			<div class="col-md-9">
			<div class="article">
			<div class="row">
			<div class="col-md-12">	
				<h3>내용보기</h3>
					<c:if test="${empty rv.reply_cont}">
						<form method="post" action="reply_ok" onsubmit="return reply_check();">
					</c:if>
					<c:if test="${!empty rv.reply_cont}">
						<form method="post" action="reply_edit" onsubmit="return reply_check();">
					</c:if>
							<input type="hidden" value="${bbs_id}" name="reply_name" />
							<input type="hidden" name="bbs_no" value="${b.bbs_no}" />
							<input type="hidden" name="page" value="${page}" />
							<input type="hidden" name="bbs_ref" value="${b.bbs_ref}" />
							<c:if test="${!empty rv.reply_cont}">
								<input type="hidden" name="reply_no" value="${rv.reply_no}" />
							</c:if>
				<table class="table table-striped table-hover">
					<tr>
						<td>제목</td>
						<td>${b.bbs_title}</td>
						<td>작성일</td>
						<td>${b.bbs_date}</td>
						<td>조회수</td>
						<td>${b.bbs_hit}</td>
					</tr>
					<c:if test="${!empty b.bbs_file}">
  					<%--첨부파일이 있는 경우 실행 --%>
					<tr>
						<td colsapn="2">첨부파일</td>
						<td colspan="5"><a href="./resources/upload1${b.bbs_file}">${b.bbs_file}</a></td>
					</tr>
					</c:if>
					<tr>
						<td colspan="6">
						<pre>
							<div style="overflow-y:scroll; height:300px; width:800px;">${b.bbs_cont}</div>
						</pre>
						</td>
					</tr>
					<tr>
						<td align="center">댓글</td>
						<c:if test="${empty rv.reply_cont}"> <!-- 댓글 작성 -->
						
						<td colspan="4">
							<textarea name="reply_cont" id="reply_cont" rows="2" cols="88"></textarea>
						</td>
						<td>
							<input class="btn btn-default btn-lg right" type="submit" value="작성" />
						</td>
						</c:if>
						<c:if test="${!empty rv.reply_cont}">
						<td colspan="4">
							<textarea name="reply_cont" id="reply_cont" rows="2" cols="88">${rv.reply_cont}</textarea>
						</td>
						<td>
							<input class="btn btn-default btn-lg right" type="submit" value="수정" />
						</td>
						</c:if>
					</tr>
					</table>
					</form>
					<table class="table table-striped table-hover">
					<c:if test="${!empty r_list}"> <!-- 댓글목록이 있는 경우 -->
						<c:forEach var="r" items="${r_list}">
							<tr>
							<c:if test="${r.reply_name=='관리자'}">
								<td><strong>${r.reply_name}</strong></td>
							</c:if>
							<c:if test="${r.reply_name!='관리자'}">
								<td>${r.reply_name}</td>
							</c:if>
							</tr>
							<tr>
								<td>${r.reply_cont}</td>
							</tr>
							<tr>
								<td colspan="2" style="color:skyblue;">${r.reply_date}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:if test="${user_id==r.reply_name}">
									<a href="bbs_cont?bbs_no=${b.bbs_no}&state=cont&page=${page}&reply_no=${r.reply_no}">[수정]</a>&nbsp;
									<a href="reply_del?bbs_no=${b.bbs_no}&page=${page}&reply_no=${r.reply_no}">[삭제]</a>
								</c:if></td>
							</tr>					
						</c:forEach>
								
					</c:if>
					</table>
					<div id="btnins" style= text-align:center;>
		
        			<input class="btn btn-default btn-lg" type="button" value="목록"
        				onclick="location='custom_board?page=${page}';" />
        			<input class="btn btn-default btn-lg" type="button" value="수정" 
        				onclick="location='bbs_cont?bbs_no=${b.bbs_no}&page=${page}&state=edit';" />
        			<input class="btn btn-default btn-lg" type="button" value="삭제"
        				onclick="location='bbs_cont?bbs_no=${b.bbs_no}&page=${page}&state=del';" />
        			<!-- <input class="btn btn-default btn-lg" type="button" value="답변"
        				onclick="location='bbs_cont?bbs_no=${b.bbs_no}&page=${page}&state=reply';" /> -->
        
       	 			</div>		
			</div>
			</div>
			</div>
			</div>
			</div>
			</div>
		</section>
		
		<section id="map"></section>

		<footer id="site-footer">
			<div class="container">
				<div class="row">
					<span class="divider grey"></span>
					<h4>2018 여기다가 자바코드로 오늘 날짜 넣어보자 <span class="brandy">s</span> Agency.</h4>
					<h5>
						by <a href="#">ScoopThemes</a>
					</h5>
					<a href="#" class="scroll-top"><img
						src="./resources/img/top.png" alt="" class="top"></a>
				</div>
			</div>
		</footer>
	</div>
	<!--/wrap-->


</body>

</html>