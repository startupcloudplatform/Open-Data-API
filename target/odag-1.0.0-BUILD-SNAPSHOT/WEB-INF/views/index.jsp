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
        <script src="lib/js/html5shiv.min.js"></script>
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
                <li><a href="#">사용자 설정</a></li>
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

    <div class="header_search">
          <form method="">
            <div class="search_wrap clearfix">
              <div class="search_option">
                <button type="button">
                  <span>ALL</span>
                </button>
                <ul>
                  <li><input type="radio" id="option1" name="option-group"><label for="option1">대분류</label></li>
                  <li><input type="radio" id="option2" name="option-group"><label for="option2">중분류</label></li>
                  <li><input type="radio" id="option3" name="option-group"><label for="option3">소분류</label></li>
                  <li><input type="radio" id="option4" name="option-group"><label for="option4">키워드</label></li>
                </ul>
              </div>
              <input type="text" id="" class="input_search">
              <button type="submit" id="" class="btn_search">
                <span>Search</span>
              </button>

            </div>
            <div class="search_hash">
              <div>
                <span>All Open Data</span><strong>10</strong>
              </div>
              <div>
                <span>New Open Data</span><strong>10</strong>
              </div>
            </div>
          </form>
        </div>
        <!-- //header_search -->

        <div class="header_nav">
          <div class="contentInner">
            <nav>
              <a href="<c:url value="/api"/>">오픈데이터</a>
              <c:if test="${SESSION_USER.userId ne null && SESSION_USER.userId ne ''}">
                <a href="<c:url value="/recommend"/>">오픈데이터 추천</a>
                <a href="<c:url value="/myapi" />">마이 오픈데이터</a>
              </c:if>
              <a href="<c:url value="/introduce" />">서비스 안내</a>

              <!--
              <c:if test="${sessionScope.SESSION_USER.userId ne null && sessionScope.SESSION_USER.userId ne ''}">
                <a href="<c:url value="/myapi" />">내 오픈 데이터 API 관리</a>
              </c:if>
              -->
              
            </nav>
          </div>
      </form>
    </div>
    <!-- //header_search -->
    <!-- //header_nav -->
  </header>

  <div class="slide_banner">
    <div class="swiper-container">
      <ul class="swiper-wrapper">
        <li class="swiper-slide">
          <div>
            <p class="tit">
              산업군 인기 <span>OPEN API</span>
            </p>
            <p class="cont">
              산업군 별 인기 OPEN API를 클릭해 보세요.<br> 산업군 별 어떤 OPEN API가 인기가 있는지 볼 수 있습니다.<br> 나에게 맞는 OPEN API를 찾아보세요.
            </p>
            <a href="#" class="slide_btn">View</a>
          </div>
        </li>
      </ul>
      <div class="slide_btns">
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
      </div>
    </div>
  </div>

  <main class="mainContent">
<!-- //contentInner -->
  <div class="contentInner">
    <div class="panel_left">
      <h3 class="clearfix">
        <span>공지사항</span> <a href="#"><span class="imgBtn" id="noticeButton">더보기</span></a>
      </h3>
      <ul class="api_list">
        <li><a href="#">
            <p class="tit">도로명주소조회서비스</p>
            <p>우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.</p>
        </a></li>
        <li><a href="#">
            <p class="tit">도로명주소조회서비스</p>
            <p>우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.</p>
        </a></li>
        <li><a href="#">
            <p class="tit">도로명주소조회서비스</p>
            <p>우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.</p>
        </a></li>
        <li><a href="#">
            <p class="tit">도로명주소조회서비스</p>
            <p>우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.</p>
        </a></li>
      </ul>
    </div>
    <div class="panel_right">
      <h3 class="clearfix">
        <span>실시간 인기 오픈데이터</span> <a href=""><span class="imgBtn">더보기</span></a>
      </h3>
      <ul class="notice_list">
        <li><a href="#">도로명주소 조회 서비스</a> <span>2017.09.03</span></li>
        <li><a href="#">도로명주소조회</a> <span>2017.09.03</span></li>
        <li><a href="#">상가(상권)정보</a> <span>2017.09.03</span></li>
        <li><a href="#">도로명주소 조회 서비스</a> <span>2017.09.03</span></li>
        <li><a href="#">도로명주소조회</a> <span>2017.09.03</span></li>
        <li><a href="#">상가(상권)정보</a> <span>2017.09.03</span></li>
        <li><a href="#">도로명주소 조회 서비스</a> <span>2017.09.03</span></li>
      </ul>
    </div>
    <div class="panel_left">
      <h3 class="clearfix">
        <span>커뮤니티</span> <a href="#"> <span class="imgBtn" id="communityButton">더보기</span>
        </a>
      </h3>
      <ul class="api_list">
        <li><a href="#">
            <p class="tit">도로명주소조회서비스</p>
            <p>우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.</p>
        </a></li>
        <li><a href="#">
            <p class="tit">도로명주소조회서비스</p>
            <p>우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.</p>
        </a></li>
        <li><a href="#">
            <p class="tit">도로명주소조회서비스</p>
            <p>우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.</p>
        </a></li>
        <li><a href="#">
            <p class="tit">도로명주소조회서비스</p>
            <p>우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.</p>
        </a></li>
      </ul>
    </div>
    <div class="panel_right">
      <h3 class="clearfix">
        <span>실시간 인기 검색어</span> <a href=""><span class="imgBtn">더보기</span></a>
      </h3>
      <ol class="popula_list">
        <li><a href="#">도로명주소 조회 서비스</a></li>
        <li><a href="#">도로명주소조회</a></li>
        <li><a href="#">상가(상권)정보</a></li>
        <li><a href="#">도로명주소 조회 서비스</a></li>
        <li><a href="#">도로명주소조회</a></li>
        <li><a href="#">상가(상권)정보</a></li>
        <li><a href="#">도로명주소 조회 서비스</a></li>
      </ol>
    </div>
  </div>
  <!-- //contentInner --> </main>

  <footer>
    <div class="contentInner"> 
      <h1>
        <img src="<c:url value="/resources/images/logo_footer.png"/>" alt="Cloudit Knowledge Base" />
      </h1>
      <div class="footer_menu">
        <a href="#">개인정보취급방침</a> <a href="#">오시는길</a> <a href="#">사이트맵</a>
      </div>
      <address>
        <p>서울시 서초구 강남대로 623, 10층 ( 서울시 서초구 잠원동 12-5, 우일빌딩 )</p>
        <p>
          TEL : 02. 516. 5990<span>/</span>FAX : 02. 516. 5997
        </p>
        <p class="copyright">COPYRIGHT 2018 innogrid. All right reserved.</p>
      </address>
    </div>
  </footer>
  <script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.script.js"/>"></script>
  <script src="<c:url value="/resources/js/swiper.min.js"/>"></script>

  <script text="text/javascript">
    var swiper = new Swiper('.swiper-container', {
      centeredSlides : true,
      loop : true,
      autoplay : {
        delay : 4500,
        disableOnInteraction : false
      },
      navigation : {
        nextEl : '.swiper-button-next',
        prevEl : '.swiper-button-prev'
      },
    });
    
    $.ajax({
      type : 'get',
      dataType : "json",
      url : "/odag/userlist",
      data : {
      },
      beforeSend : function(xhr) {
        xhr.setRequestHeader("Content-Type", "application/json");
      },
      complete : function() {
      },
      success : function(serverData) {
        console.log(serverData)
      },
      error : function(jqXHR, textStatus, errorThrown) {
      }
    });
  </script>
	
  <script text="text/javascript">
    $(document).ready(function(){
      $("#noticeButton").on("click", function(event){
        location.href = '<c:url value="/notice" />';
      });
      $("#communityButton").on("click", function(event){
        location.href = '<c:url value="/community" />';
      });
    });
  </script>
  
</body>
</html>