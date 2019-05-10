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
						<h2>고객게시판</h2>
					</div>
				  <div class="col-md-6">
                  <ol class="breadcrumb">
                     <li><a href="custom">메인</a></li>
                     <li><a href="custom_board">회원전용 게시판</a></li>
                     <li class="active"><a href="gongji_list">공지사항</a></li>
                  </ol>
               </div>
				</div>
			</div>
		</section>

		<section id="blog">
		<div class="container">
		<div class="row">
   
      	<div class="article">
      	<div class="row">
      	<div class="col-md-12">
     	 <div class="col-sm-11 col-xs-10">
			 <form method="get" action="custom_board">
             <div class="side-block search">
					<p>
                	<select name="find_field">
						<option value="bbs_name"
							<c:if test="${find_field == 'bbs_name'}">${'selected'}</c:if>>작성자</option>
						<option value="bbs_title"
							<c:if test="${find_field == 'bbs_title'}">${'selected'}</c:if>>제목</option>
						<option value="bbs_cont"
							<c:if test="${find_field == 'bbs_cont'}">${'selected'}</c:if>>내용</option>
					</select>&nbsp;&nbsp;
					<span style="font-size: 14pt; font-weight: bold;">검색</span>
					</p>
					
                <div class="form-group has-feedback">
                		<input type="text" class="form-control" name="find_name" placeholder="Search here..." value="${find_name}">
                		<button type="submit"> <i class="fa fa-search form-control-feedback"></i></button>
                </div>
             </div>
				<table class="table table-striped table-hover">
				<tr><td colspan="9" align="right">글개수: ${listcount}&nbsp;개</td></tr>
				<tr>
					<td align="center">번호</td>
					<td align="center">제목</td>
					<td align="center">작성자</td>
					<td align="center">작성일</td>
					<td align="center">조회수</td>
				</tr>
		
				<c:if test="${!empty blist}">
				<c:forEach var="b" items="${blist}">
		
				<tr>
					<td align="center">
						<c:if test="${b.bbs_step ==0}"> <%--원본글일때만 실행 --%>
       					${b.bbs_ref}
      					</c:if>
      				</td>
					<td align="left">	
						<c:if test="${b.bbs_step != 0}">
						<%--답변글일때 실행 --%>
						<c:forEach begin="1" end="${b.bbs_step}" step="1"> 
						&nbsp;<%--답변글 들여쓰기 --%>
						</c:forEach>
								<img src="./resources/img/reply.gif" />
									<%--답변글 이미지 --%>
							</c:if> <a href="bbs_cont?bbs_no=${b.bbs_no}&state=cont&page=${page}">
						${b.bbs_title}</a>
					</td>
					<td align="center">${b.bbs_name}</td>
					<td align="center">${b.bbs_date}</td>
					<td align="center">${b.bbs_hit}</td>
		    	</tr>

				</c:forEach>
			</c:if>
			
			<c:if test="${empty blist}">
				<tr>
					<th colspan="5">자료실 목록이 없습니다.</th>
				</tr>
			</c:if>
		</table>
		
			<div id="bList_paging">
						<%--검색전 페이징 --%>
						<c:if test="${(empty find_field)&&(empty find_name)}">
						<c:if test="${page <=1}">[이전]&nbsp;
   						</c:if>
						<c:if test="${page >1}">
							<a href="custom_board?page=${page-1}">[이전]</a>&nbsp;
   						</c:if>

						<%--쪽번호 출력부분 --%>
						<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>
						
						<c:if test="${a != page}">
							<a href="custom_board?page=${a}">[${a}]</a>&nbsp;
    					</c:if>
						</c:forEach>

						<c:if test="${page>=maxpage}">[다음]</c:if>
						<c:if test="${page<maxpage}">
							<a href="custom_board?page=${page+1}">[다음]</a>
						</c:if>
						</c:if>

						<%--검색후 페이징 --%>
							<c:if test="${(!empty find_field)&&(!empty find_name)}">
							<c:if test="${page <=1}">[이전]&nbsp;
   							</c:if>
							<c:if test="${page >1}">
								<a href="custom_board?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   							</c:if>

							<%--쪽번호 출력부분 --%>
							<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
								<c:if test="${a == page}"><${a}></c:if>

								<c:if test="${a != page}">
									<a href="custom_board?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
    							</c:if>
							</c:forEach>

							<c:if test="${page>=maxpage}">[다음]</c:if>
							<c:if test="${page<maxpage}">
								<a
									href="custom_board?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
							</c:if>
							</c:if>
					</div>
		       		</form>
		
		<form method="post" action="bbs_write">
		<div id="btnins" style= text-align:center;>
		
        <button class="btn btn-default btn-lg" type="submit">글쓰기</button>
        
        </div>
		
		</form>
		</div>
		</div>
		</div>
		</div>
		</div>
	</div>
</section>

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