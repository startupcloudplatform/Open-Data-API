<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
  <title></title>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <meta http-equiv="Content-Script-Type" content="text/javascript">
  <meta http-equiv="Content-Style-Type" content="text/css">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1">
  
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/normalize.css" />" />
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/font.css" />" />
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/admin.css" />" />
  
<!--[if lt IE 9]>
        <script src="lib/js/html5shiv.min.js"></script>
        <![endif]-->
</head>

<body>
    <header>
        <div class="contentInner">
            <h1><a href="../"><img src="<c:url value="/resources/images/logo_admin.png" />" alt="ODAG Admin"></a></h1>
            
            <nav class="header_nav">
                <a href="<c:url value="/adminUser" />">사용자 관리</a>
                <a href="<c:url value="/adminOpenapi" />">오픈데이터 관리</a>
                <a href="<c:url value="/adminService" />" class="current">서비스 현황</a>
            </nav>
            
        </div>
    </header>

    <main class="main_admin">
        <div class="contentInner">
            <div class="side-title"><h2>서비스 현황</h2></div>
            <div class="btn-group_top clearfix">
                <div class="btn_select search_option">
                    <button type="button"><span>표시기준</span></button>
                    <ul>
                        <li><input type="radio" id="option1" name="option-group"><label for="option1">월 단위</label></li>
                        <li><input type="radio" id="option2" name="option-group"><label for="option2">주 단위</label></li>
                        <li><input type="radio" id="option3" name="option-group"><label for="option3">일 단위</label></li>
                    </ul>
                </div>
            </div><!-- //btn-group_top -->
            <div class="wrap_state clearfix">
                <div class="wrap_state-box"><div class="inner">
                    <div class="tit">서비스 가입 현황</div>
                    <div class="cont"></div>
                </div></div>
                <div class="wrap_state-box"><div class="inner">
                    <div class="tit">서비스 가입 현황</div>
                    <div class="cont"></div>
                </div></div>
                <div class="wrap_state-box"><div class="inner">
                    <div class="tit">서비스 가입 현황</div>
                    <div class="cont"></div>
                </div></div>
                <div class="wrap_state-box"><div class="inner">
                    <div class="tit">서비스 가입 현황</div>
                    <div class="cont"></div>
                </div></div>
            </div>
        </div><!-- //contentInner -->
    </main>

    <footer>
        <div class="contentInner">
            <h1><img src="<c:url value="/resources/images/logo_footer.png" />" alt="Cloudit Knowledge Base"></h1>
            <address>
                <p>서울시 서초구 강남대로 623, 10층  ( 서울시 서초구 잠원동 12-5, 우일빌딩 )</p>
                <p>TEL : 02. 516. 5990<span>/</span>FAX : 02. 516. 5997</p>
                <p class="copyright">COPYRIGHT  2018 innogrid. All right reserved.</p>
            </address>
        </div>
    </footer>

  <script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.script.js"/>"></script>

</body>
</html>