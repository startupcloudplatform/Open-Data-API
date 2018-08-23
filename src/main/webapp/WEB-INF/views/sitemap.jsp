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
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/swiper.min.css" />" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />" />


    <!--[if lt IE 9]>
    <script src="../lib/js/html5shiv.min.js"></script>
    <![endif]-->
</head>

<body>
  <header>
    <div class="header_logo">
      <div class="contentInner">

        <h1>
          <a href="<c:url value="/"/>"><img src="<c:url value="/resources/images/logo.png"/>" alt="Open Data API Gateway"></a>
        </h1>
        <c:choose>
          <c:when test="${sessionScope.SESSION_USER.userId ne null && sessionScope.SESSION_USER.userId ne ''}">
          
            <div class="usermenu" style="width:90px;">
              <button type="button">
                <span class="btn_user"><c:out value="${sessionScope.SESSION_USER.userName}" /></span>
              </button>
              <ul>
                <li><a href="<c:url value="/userSetting" />">사용자 설정</a></li>
                
                <c:choose>
                <c:when test="${sessionScope.SESSION_USER.userType eq 0}">
                <li><a href="<c:url value="/adminUser" />">사이트 관리</a></li>
                </c:when>
                </c:choose>
                
                <li><a href="<c:url value="/logout" />">로그아웃</a></li>
              </ul>
            </div> 
          </c:when>
          <c:otherwise>
            <div class="usermenu" style="width:90px;">
              <button type="button">
                <span class="btn_user"><a href="<c:url value="/login"/>">로그인</a></span>
              </button>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
    <!-- //header_logo -->

    <div class="header_nav">
      <div class="contentInner">
        <nav>
          <a href="<c:url value="/api"/>" class="current">오픈데이터</a>
          <c:if test="${SESSION_USER.userId ne null && SESSION_USER.userId ne ''}">
            <a href="<c:url value="/recommendPopular"/>">오픈데이터 추천</a>
            <a href="<c:url value="/myapi" />">마이 오픈데이터</a>
          </c:if>
          <a href="<c:url value="/introduce" />">서비스 안내</a>
        </nav>
      </div>
    </div>
    <!-- //header_nav -->
  </header>

    <main class="main_snb">
        <div class="contentInner">
            <div class="side-title"><h2>사이트맵</h2></div>
            <ul class="sitemap_list">
                <li>
                    <a href="#">오픈데이터</a>
                    <ul>
                        <li><a href="#">표준산업분류</a></li>
                        <li><a href="#">오픈데이터 제공처</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">오픈데이터 추천</a>
                    <ul>
                        <li><a href="#">실시간 인기 오픈데이터</a></li>
                        <li><a href="#">내 산업군 인기 오픈데이터</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">마이 오픈데이터</a>
                    <ul>
                        <li><a href="#">마이 오픈API</a></li>
                        <li><a href="#">즐겨찾기</a></li>
                        <li><a href="#">오픈데이터 제공</a></li>                        
                        <li><a href="#">토큰 관리</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">서비스 안내</a>
                    <ul>
                        <li><a href="#">ODAG 소개</a></li>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">커뮤니티</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- //contentInner -->
    </main>

    <footer>
        <div class="contentInner">
            <h1><img src="../lib/images/logo_footer.png" alt="Cloudit Knowledge Base"></h1>
            <div class="footer_menu">
                <a href="#">개인정보취급방침</a>
                <a href="#">오시는길</a>
                <a href="#">사이트맵</a>
            </div>
            <address>
                <p>서울시 서초구 강남대로 623, 10층  ( 서울시 서초구 잠원동 12-5, 우일빌딩 )</p>
                <p>TEL : 02. 516. 5990<span>/</span>FAX : 02. 516. 5997</p>
                <p class="copyright">COPYRIGHT  2018 innogrid. All right reserved.</p>
            </address>
        </div>
    </footer>

    <script src="../lib/js/jquery-1.9.1.min.js"></script>
    <script src="../lib/js/jquery.script.js"></script>

</body>
</html>