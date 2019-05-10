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
<title>공지사항</title>
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
</head>

<body>
	<!-- Wrap all page content here -->
	<div id="wrap">
  	<!-- 공통영역 -->
    <jsp:include page="../include/admin_header.jsp"/>
    	

		<section class="well well-lg">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<form method="post" action="admin_logout">
						<h2>공지 관리</h2>
						</form>
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
				<h3>공지내용</h3>
					<input type="hidden" name="gongji_no" value="${g.gongji_no}" />
					<input type="hidden" name="page" value="${page}" />
				<table class="table table-striped table-hover">
					<tr>
						<td>제목</td>
						<td>${g.gongji_title}</td>
						<td>작성일</td>
						<td>${g.gongji_date}</td>
						<td>조회수</td>
						<td>${g.gongji_hit}</td>
					</tr>
					<tr>
						<td colspan="6">
						<pre>
							<div style="overflow-y:scroll; height:300px; width:800px;">${g.gongji_cont}</div>
						</pre>
						</td>
					</tr>
					</table>
					<div id="btnins" style= text-align:center;>
		
        			<input class="btn btn-default btn-lg" type="button" value="목록"
        				onclick="location='admin_gongji_list?page=${page}';" />
        			<input class="btn btn-default btn-lg" type="button" value="수정" 
        				onclick="location='admin_gongji_cont?gongji_no=${g.gongji_no}&page=${page}&state=edit';" />
        			<input class="btn btn-default btn-lg" type="button" value="삭제"
        				onclick="location='admin_gongji_cont?gongji_no=${g.gongji_no}&page=${page}&state=del';" />
        
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