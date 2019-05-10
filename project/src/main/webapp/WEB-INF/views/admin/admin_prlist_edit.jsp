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
<title>상품정보 수정/삭제</title>
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/styles.css"
   title="mainStyle">

<script src="./resources/js/modernizr.custom.32033.js"></script>
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/stellar.js"></script>
<script src="./resources/js/jquery.circliful.min.js"></script>
<script type="text/javascript"
   src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&sensor=false"></script>
<script src="./resources/js/script.js"></script>
</head>
<script type="text/javascript">
function checkBox_check(){
    if($.trim($("#pr_name").val())==""){
       alert("이름을 넣어주세요");
       $("#pr_name").val("").focus();
       return false;
    } 
    if($.trim($("#pr_location").val())==""){
       alert("위치를 넣어주세요");
       $("#pr_location").val("").focus();
       return false;
    }
    if($.trim($("#pr_car").val())==""){
        alert("차종을 넣어주세요");
        $("#pr_car").val("").focus();
        return false;
     }
    if($.trim($("#pr_price").val())==""){
        alert("가격을 넣어주세요");
        $("#pr_price").val("").focus();
        return false;
     }
    if($.trim($("#pr_cont").val())==""){
        alert("설명을 넣어주세요");
        $("#pr_cont").val("").focus();
        return false;
     }
   }



</script>
<body>
   <!-- Wrap all page content here -->
   <div id="wrap">
      <!-- 공통영역 -->
      <jsp:include page="../include/admin_header.jsp" />
      <section class="well well-lg">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
               
                     <h2>차량 수정/삭제</h2>
                     <hr/>   
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

      
      <form method="post" action="admin_prlist_edit_ok" onsubmit="return checkBox_check();" enctype="multipart/form-data"  >
      <input type="hidden" name="pr_no" value="${car_editList.pr_no}" />
      <table class="table table-striped table-hover">
      <tr><td colspan="8" align="right" height="50"></td></tr>
      <tr><td>이름</td><td>위치</td><td>차종</td><td>가격</td><td>설명</td><td>작성일</td><td>사진</td>
      
      
     
      <tr>
      <td align="center"><input type="text" size="18" id="pr_name"  name="pr_name" value="${car_editList.pr_name }"></td>
      <td align="center"><input type="text" size="18" id="pr_location"  name="pr_location" value="${car_editList.pr_location }"></td>
      <td align="center"><input type="text" size="18" id="pr_car"  name="pr_car" value="${car_editList.pr_car }"></td>
      <td align="center"><input type="text" size="18" id="pr_price"  name="pr_price" value="${car_editList.pr_price }"></td>
      <td align="center"><input type="text" size="18" id="pr_cont"  name="pr_cont" value="${car_editList.pr_cont }"></td>
      <td align="center">${car_editList.pr_date }</td>
      <td align="center"><input type="file" id="imgInp" name="pr_file" >
      <br/>${car_editList.pr_file }</td>
      </tr>     
      </table>

      
      <div id="btnins" style= text-align:center;>
      
        <button class="btn btn-primary btn-lg" type="submit">수정완료</button>
        <button class="btn btn-primary btn-lg" type="button" onclick="if(confirm('정말로 삭제할까요?')==true)
        {location='admin_prlist_del?pr_no=${car_editList.pr_no }';   
        }else{
        return;
        }"   >삭제</button>
        </div>
      
      </form>
      
      </div>
      </div>
      </div>
      </div>
      
      <div class="article">
         <div class="row">
            <div class="col-md-12">
               <div class="col-sm-11 col-xs-10">
                  <div class="preview">
                     <div class="quote">차량정보 수정/삭제 창입니다.</div>
                  </div>
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