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
<title>공지사항 내용보기</title>
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
			<h2>공지사항 내용보기</h2><hr/><!-- <h3><input type="submit" value="로그아웃"/></h3> 로그아웃 위치 옮길것 -->
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
			<div class="col-sm-11 col-xs-10">
			
		<h3><a href="관리자 공지사항"></a></h3>
		<%-- 공자시항 내용보기 테이블--%>
			<form method="post"  action="admin_ab_edit" >
				<input type="hidden" name="admin_name" value="${admin_name}"/>
				<input type="hidden" name="admin_pwd" value="${admin_pwd}"/>
				<input type="hidden" name="admin_no" value="${ab.admin_no}"/>
				
				
   	<table class="table table-striped table-hover">  				
     <tr><th>관리자 아이디</th><td><input type="hidden"  name="admin_id" id="admin_id" value="${admin_id}"  size="35" />${ab.admin_id }</td></tr>
	 <c:if test="${!empty ab}">
      
    <tr><th>제목</th><td><input type="hidden" value="${ab.admin_title}" name="admin_title" id="admin_title"  size="35" readonly />${ab.admin_title }</td></tr>
    <tr><th>내용</th><td><textarea  style="background-color:#FAFAFA;" name="admin_cont" id="admin_cont" rows="9" cols="70" readonly>${ab.admin_cont}</textarea></td></tr>
   	</c:if>
     </table>
     
     <!-- ----------------------------하위 버튼부분------------------------------------------- -->
      <div id="btnins" style= text-align:center;>
      
       <input type="button"  class="btn btn-primary btn-lg" value="목록" onclick="location='admin_main';" />
        <button class="btn btn-primary btn-lg" type="submit">수정/삭제</button>
            </div>
   <!-- -------------------------------------------------------------------------------------- -->         
      		  </form>
									</div>
								</div>
							</div>
						</div>

						<div class="article">
							<div class="row">
								<!--<div class="col-md-12">
								
									<div class="col-sm-11 col-xs-10">
										<div class="preview">
											<div class="quote">이부분은 관리자 메인 창입니다.</div>
										</div>
									
									</div>-->
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