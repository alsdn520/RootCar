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
<title>게시판 관리페이지</title>
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
<script>
	function admin_del_check() {
		if($('input:checkbox[name="cbx"]').is(":checked")) {
			for(var i=0;i<list.length;i++) {
				if(list[i].checked) { //체크되면
					cbx[i].value="1"; //1를 넣어라
				}else {
					cbx[i].value="0"; //아니면 0
				}
			}
		}else {
			alert('삭제할 게시글을 선택하세요!');
			return false;
		}
		
	}
	
	if($('input:checkbox[name="cbx2"]').is(":checked")) {
		for(var i=0;i<list.length;i++) {
			if(list[i].checked) { //체크되면
				cbx2[i].value="1"; //1를 넣어라
			}else {
				cbx2[i].value="0"; //아니면 0
				}
			}
		}else {
			alert('삭제할 게시글을 선택하세요!');
			return false;
	}
</script>
<body>
	<!-- Wrap all page content here -->
	<div id="wrap">
  	<!-- 공통영역 -->
    <jsp:include page="../../include/admin_header.jsp"/>
    	

		<section class="well well-lg">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<form method="post" action="admin_logout">
						<h2>게시판 관리 페이지</h2><hr/>
						</form>
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
			 <form method="get" action="admin_custom">
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
             </form>
		<form method="get" action="admin_bbs_del_ok" onsubmit="return admin_del_check();">
		
				
			
				<input type="hidden" name="page" value="${page}" />
				
				<table class="table table-striped table-hover">
				<tr><td colspan="9" align="right">글개수: ${listcount}&nbsp;개</td></tr>
				<tr>
					<td width="1"></td>
					<td align="center" width="50">번호</td>
					<td align="center">제목</td>
					<td align="center">작성자</td>
					<td align="center">작성일</td>
					<td align="center">조회수</td>
				</tr>
		
				<c:if test="${!empty blist}">
				<c:forEach var="b" items="${blist}">
		
				 <tr>
				 <td align="center"></td>
				 <td align="center">${b.bbs_no}</td>
					<td align="center"><a href="admin_bbs_cont?bbs_no=${b.bbs_no}&state=cont&page=${page}">${b.bbs_title}</a></td>
					<td align="center">${b.bbs_name}</td>
					<td align="center">${b.bbs_date}</td>
					<td align="center">${b.bbs_hit}</td>
		    	</tr>

				</c:forEach>
			</c:if>
			
			<c:if test="${empty blist}">
				<tr>
					<th colspan="5">게시판 글 목록이 없습니다.</th>
				</tr>
			</c:if>
		</table>
		
			<div id="bList_paging">
						<%--검색전 페이징 --%>
						<c:if test="${(empty find_field)&&(empty find_name)}">
						<c:if test="${page <=1}">[이전]&nbsp;
   						</c:if>
						<c:if test="${page >1}">
							<a href="admin_custom?page=${page-1}">[이전]</a>&nbsp;
   						</c:if>

						<%--쪽번호 출력부분 --%>
						<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
						<c:if test="${a == page}"><${a}></c:if>
						
						<c:if test="${a != page}">
							<a href="admin_custom?page=${a}">[${a}]</a>&nbsp;
    					</c:if>
						</c:forEach>

						<c:if test="${page>=maxpage}">[다음]</c:if>
						<c:if test="${page<maxpage}">
							<a href="admin_custom?page=${page+1}">[다음]</a>
						</c:if>
						</c:if>

						<%--검색후 페이징 --%>
							<c:if test="${(!empty find_field)&&(!empty find_name)}">
							<c:if test="${page <=1}">[이전]&nbsp;
   							</c:if>
							<c:if test="${page >1}">
								<a href="admin_custom?page=${page-1}&find_field=${find_field}&find_name=${find_name}">[이전]</a>&nbsp;
   							</c:if>

							<%--쪽번호 출력부분 --%>
							<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
								<c:if test="${a == page}"><${a}></c:if>

								<c:if test="${a != page}">
									<a href="admin_custom?page=${a}&find_field=${find_field}&find_name=${find_name}">[${a}]</a>&nbsp;
    							</c:if>
							</c:forEach>

							<c:if test="${page>=maxpage}">[다음]</c:if>
							<c:if test="${page<maxpage}">
								<a
									href="admin_custom?page=${page+1}&find_field=${find_field}&find_name=${find_name}">[다음]</a>
							</c:if>
							</c:if>
					</div>
		<br/>
	<div class="preview">
			<div class="quote">글/댓글 삭제는 해당 제목을 눌러주세요.</div>
			</div>	
		
		</form>
		</div>
		</div>
		</div>
		</div>
		</div>
	</div>
</section>

		<footer id="site-footer" style="background-color: blalk; z-index: 1111">		
		<div class="footer-layer2">
		<h1><a href="/" title="ROOT_CAR">ROOT_CAR</a>
		</h1>
		<div class="footer-content">
		<address>
		Root(주) | 대표이사 : 김미정<br /> 서울시 성동구 무학로2길 54 신방빌딩 4층<br /> 사업자 등록번호 : 120-88-00000 <br /> 통신판매업신고 : 2018-서울성동-0000<br />
		</address>
		</div>
		</div>
		</footer>
	</div>
	<!--/wrap-->


</body>

</html>

