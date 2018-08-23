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
                <h1><a href="../"><img src="<c:url value="/resources/images/logo.png"/>" alt="Open Data API Gateway"></a></h1>
                
                
                
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
        </div><!-- //header_logo -->

        <div class="header_nav">
          <div class="contentInner">
          
          
          
            <nav>
              <a href="<c:url value="/api"/>">오픈데이터</a>
            <c:if test="${SESSION_USER.userId ne null && SESSION_USER.userId ne ''}">
              <a href="<c:url value="/recommendPopular"/>">오픈데이터 추천</a>
              <a href="<c:url value="/myapi" />">마이 오픈데이터</a>
            </c:if>
            <a href="<c:url value="/introduce" />" class="current">서비스 안내</a>
            </nav>
            
        </div>
    </div>
    </header>

    <main class="main_snb">
        <div class="contentInner">
            <div class="snb">
                <h3>서비스 안내</h3>
                <ul>
                    <li class="current"><a href="<c:url value="/introcude" />">ODAG 소개</a></li>
                    <li><a href="<c:url value="/notice" />">공지사항</a></li>
                    <li><a href="<c:url value="/community" />">커뮤니티</a></li>
                </ul>
            </div><!-- //snb -->
            <div class="service_section">
                <h2>서비스 개요</h2>
                <h3>Open Data API Gateway</h3>
                <div>Open Data API Gateway(ODAG)는 다양한 기관에서 독립적으로 제공하는 오픈데이터 정보를 통합 및 분류하고 개인화된 추천 서비스를 제공합니다. ODAG를 통해 원하는 오픈데이터를 찾기 위해 다수의 사이트를 방문해야 하는 번거로움이 줄어듭니다. 또한 S/W 창업자에 최적화된 분류체계를 제공하면서 오픈데이터 정보의 접근성을 높입니다.</div>
            </div>

            <div class="service_section">
                <h2>주요기능</h2>
                <h3>오픈데이터 통합</h3>
                <div class="service_section_txt">정부기관, 지자체, 민간기업에서 제공하는 방대한 오픈데이터 정보들을 수집하고 이질적 형태의 정보들을 정형화된 포맷으로 정렬하여 사용자에게 안내합니다. 또한 단일 포털 내에서 다양한 기관의 오픈데이터 정보를 수집하여 제공합니다.</div>
                <h3>오픈데이터 분류</h3>
                <div class="service_section_txt">다양한 산업군에 속한 S/W 창업자를 대상으로 필요한 오픈데이터에 손쉽게 접근할 수 있는 분류 체계를 제공합니다. 이를 통해 방대한 양의 오픈데이터 정보에 대한 체계적인 탐색을 가능하게 합니다.</div>
                <h3>오픈데이터 추천</h3>
                <div class="service_section_txt">사용자가 설정한 개인정보와 서비스 이용 패턴을 기반으로 오픈데이터를 추천하는 기능을 제공합니다. 이를 통해 방대한 양의 오픈데이터 정보 중 가치 있는 정보를 선별하여 제공하게 되고 오픈데이터 활용률을 높입니다.</div>
            </div>

            <div class="service_section">
                <h2>시스템 구성</h2>
                <div class="service_imgbox">
                    <h3>오픈 데이터 API Gateway 시스템 구조</h3>
                    <img src="<c:url value="/resources/images/service_img.png"/>" alt="오픈 데이터 API Gateway 시스템 구조도">
                </div>
            </div>
        </div><!-- //contentInner -->
    </main>

    <footer>
        <div class="contentInner">
            <h1><img src="<c:url value="/resources/images/logo_footer.png" />" alt="Cloudit Knowledge Base"></h1>
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

  <script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.script.js"/>"></script>


</body>
</html>