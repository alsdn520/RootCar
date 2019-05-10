<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<!--[if lt IE 7]><html lang="en" class="no-js ie6"><![endif]-->
<!--[if IE 7]><html lang="en" class="no-js ie7"><![endif]-->
<!--[if IE 8]><html lang="en" class="no-js ie8"><![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />    
<!-- 
meta http-equiv="X-UA-Compatible" content="IE=edge"
렌더링 모드 적용
호환성 보기 버튼을 클릭함으로써, 웹표준을 지키지 않던 브라우저의 렌더링 방식(관용모드)으로 작동하게 됩니다. 시간은 흘러, 현재의 웹표준을 지키는 브라우저들을 기준으로 제작된 웹페이지들은 이 호환성 보기 버튼이 굳이 필요하지 않고, 해당 브라우저의 최신 렌더링 모드로 작동하게 강제할 필요가 생겼습니다. 아래와 같이 <meta> 태그를 사용해서 어떤 렌더링 엔진을 사용할 것인지 전달할 수 있습니다.

위의 content 값에 지정할수 있는 값은 아래와 같습니다.
IE=5 : 관용모드(quirks mode)로 지정된 DOCTYPE에 상관없이 IE5 렌더링 방식이 사용됩니다.
IE=7 : IE7 표준모드로 지정된 DOCTYPE에 상관없이 IE7 표준 모드 렌더링 방식이 사용됩니다.
IE=EmulateIE7 : IE7 에뮬레이션 모드로 지정된 DOCTYPE에 따라 IE7 표준모드나 관용모드로 렌더링됩니다.
IE=8 : IE8 표준모드로 지정된 DOCTYPE에 상관없이 IE8 표준모드로 렌더링됩니다 .
IE=EmulateIE8 : IE8 에뮬레이션 모드로 지정된 DOCTYPE에 따라 IE8 표준모드나 관용모드로 렌더링됩니다.
IE=edge : 최신모드로 지정된 DOCTYPE에 상관없이 IE8 이상 버전에서 항상 최신 표준 모드로 렌더링됩니다.
마이크로소프트는 실험적인 프로젝트가 아닌 이상 IE=edge 모드를 지정할 것을 권장합니다. 구식 콘텐츠를 위한 특정 렌더링 엔진을 사용하려면 앞서 나열한 content 속성의 다양한 값 중 하나를 지정하면 됩니다. 만약 X-UA-Compatible이 지정된 meta 태그가 없다면 사용자가 호환성 보기를 선택했는지, 개발자의 사이트가 마이크로소프트 호환성 정보 관리 사이트 목록에 있는지(트래픽이 많은 사이트만 해당)등의 요인에 따라 달라집니다.
 -->
    
    
    <link rel="shortcut icon" href="favicon.ico">

	<link rel="stylesheet" href="./resources/css/bootstrap.min.css">    <!-- 부트스트렙 라이브러리 파일  -->
    <link rel="stylesheet" href="./resources/css/animate.css">			<!-- 움직이는 동작들 처리해주는 라이브러리 파일 -->
    <link rel="stylesheet" href="./resources/css/font-awesome.min.css"> <!-- 폰트를 설정하는 라이브러리 파일 -->
    <link rel="stylesheet" href="./resources/css/jquery.easy-pie-chart.css">  <!-- 차트기능 설정 -->
    <link rel="stylesheet" href="./resources/css/styles.css" title="mainStyle"> <!-- 전체적인 css스타일  -->

   
<!-- header 공통영역 -->
           <!-- Fixed navbar -->
            <div class="navbar navbar-static-top" id="nav" role="navigation">
            
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <i class="fa fa-align-justify"></i>
                        </button>
                        <a class="navbar-brand" href="indexx">
                            <img src="./resources/img/logo-blue.png" alt="">
                        </a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active">
                            <a href="member_login_ok_index">홈</a>
                            <li>
                            <a href="member_login_ok_car_magazine_travel">렌트/여행/메거진</a>
                            </li>
                            <li>
                            <a href="member_login_ok_custom">고객센터</a>
                            </li>
                            <li>
                            <a href="mem_logout">로그아웃</a>
                            </li>
                        
                            <li class="social-nav visible-lg">
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-google-plus"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!--/.container -->
            </div>
            <!--/.navbar -->

<!-- header 공통영역-->

          
 


