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
              <a href="<c:url value="/login"/>">
                <button type="button">
                  <span class="btn_user">로그인</span>
<!--                 <span class="btn_user"><a href="<c:url value="/login"/>">로그인</a></span> -->

                </button>
              </a>
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
              <span>검색조건</span>
            </button>
            <ul>
              <li><input type="radio" id="option1" name="option-group"><label for="option1">이름</label></li>
              <li><input type="radio" id="option2" name="option-group"><label for="option2">제공처</label></li>
            </ul>
          </div>
          <input type="text" id="" class="input_search">
          <button type="submit" id="" class="btn_search">
            <span>Search</span>
          </button>
        </div>
        
        <div class="search_hash">
          <div>
            <span>All Open Data</span><strong id="totalApiNum">10</strong>
          </div>
          <div>
            <span>New Open Data</span><strong id="recentApiNum">10</strong>
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
            <a href="<c:url value="/recommendPopular"/>">오픈데이터 추천</a>
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
              표준산업분류 기준 <span>오픈데이터</span> 안내
            </p>
            <p class="cont">
              통계청에서 제공하는 한국표준산업분류의 대분류, 중분류, 소분류를 기준으로 분류된  <br> 오픈데이터를 탐색할 수 있는 인터페이스를 제공합니다. <br> 나에게 맞는 OPEN API를 찾아보세요.
            </p>
            <a href="<c:url value="/api"/>" class="slide_btn">View</a>
          </div>
        </li>

        <li class="swiper-slide">
          <div>
            <p class="tit">
              제공처 기준 <span>오픈데이터</span> 안내
            </p>
            <p class="cont">
              국토교통부, 소상공인시장진흥공단, 부산시 스마트시티데이터 3개 제공처를 <br> 대상으로 오픈데이터 정보를 수집하고 안내합니다. <br> 나에게 맞는 OPEN API를 찾아보세요.
            </p>
            <a href="<c:url value="/apiProvider"/>" class="slide_btn">View</a>
          </div>
        </li>
        
        <li class="swiper-slide">
          <div>
            <p class="tit">
              오픈데이터 API 게이트웨이 소개
            </p>
            <p class="cont">
              본 사이트에 대한 소개와 주요 기능에 대하여 안내합니다.
            </p>
            <a href="<c:url value="/introduce"/>" class="slide_btn">View</a>
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
        <span>공지사항</span><a href="<c:url value="/notice" />"><span class="imgBtn" id="noticeButton">더보기</span></a>
      </h3>
      <ul class="api_list">
        <li><a href="#" id="" ><p id="notice_tit1"></p></a></li>
        <li><a href="#" id="" ><p id="notice_tit2"></p></a></li>
        <li><a href="#" id="" ><p id="notice_tit3"></p></a></li>
        <li><a href="#" id="" ><p id="notice_tit4"></p></a></li>
        <li><a href="#" id="" ><p id="notice_tit5"></p></a></li>
      </ul>
    </div>
    <div class="panel_right">
      <h3 class="clearfix">
        <span>실시간 인기 오픈데이터</span><a href="<c:url value="/recommendPopular" />"><span class="imgBtn">더보기</span></a>
      </h3>
      <ul class="notice_list">
 
        <li><a href="#">건설사업정보(CALS)</a> <span>2018.05.15</span></li>
        <li><a href="#">건물정보 부동산중개업정보(일간)</a> <span>2018.05.01</span></li>
        <li><a href="#">상가(상권)정보 상가업소정보</a> <span>2017.12.23</span></li>
        <li><a href="#">전국 전통시장 지원 현황</a> <span>2017.08.28</span></li>
        <li><a href="#">빗길안전운전 알리미</a> <span>2016.04.02</span></li>
        <li><a href="#">스마트 교통정보안내</a> <span>2017.06.05</span></li>
        <li><a href="#">2016년 스마트파킹 서비스</a> <span>2016.09.03</span></li>

      </ul>
    </div>
    <div class="panel_left">
    
      <h3 class="clearfix">
        <span>커뮤니티</span><a href="<c:url value="/community" />"><span class="imgBtn" id="communityButton">더보기</span></a>
      </h3>
      
      <ul class="api_list">
        <li><a href="#"><p id="community_tit1"></p></a></li>
        <li><a href="#"><p id="community_tit2"></p></a></li>
        <li><a href="#"><p id="community_tit3"></p></a></li>
        <li><a href="#"><p id="community_tit4"></p></a></li>
        <li><a href="#"><p id="community_tit5"></p></a></li>
      </ul>
      
    </div>
    <div class="panel_right">
    
      <h3 class="clearfix">
        <span>실시간 인기 검색어</span> <a href=""></a>
      </h3>
      
      <ol class="popula_list">
        <li><a href="#">도로명주소</a></li>
        <li><a href="#">공기오염</a></li>
        <li><a href="#">상가</a></li>
        <li><a href="#">상권</a></li>
        <li><a href="#">스마트</a></li>
        <li><a href="#">국토부</a></li>
        <li><a href="#">교통</a></li>
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
        <a href="#">개인정보취급방침</a> <a href="#">오시는길</a> <a href="<c:url value="/sitemap" />">사이트맵</a>
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
    
  </script>

  <script text="text/javascript">
  
    var printApiNum = function(){
      $.ajax({
        type : 'get',
        dataType : 'json',
        url : '<c:url value="/apiNumber"/>',
        data : {
        },
        beforeSend : function(xhr){
          xhr.setRequestHeader('Content-Type', 'application/json');
        },
        complete : function(){
        },
        success : function(serverData){
          var openapiNum = serverData.openapiNum;
          
          $("#totalApiNum").text(openapiNum);
        },
        error : function(jqXHR, textStatus, errorThrown){
        }
      });    		
    } // of printApiNum()

    var printRecentApiNum = function(){
        $.ajax({
          type : 'get',
          dataType : 'json',
          url : '<c:url value="/recentApiNumber"/>',
          data : {
          },
          beforeSend : function(xhr){
            xhr.setRequestHeader('Content-Type', 'application/json');
          },
          complete : function(){
          },
          success : function(serverData){
            var recentOpenapiNum = serverData.recentOpenapiNum;
            
            $("#recentApiNum").text(recentOpenapiNum);
          },
          error : function(jqXHR, textStatus, errorThrown){
          }
        });    		
      } // of printRecentApiNum()
    
    var noticeList = Array();  
    var printNoticeList = function() {

      $.ajax({
        type : 'get',
        dataType : 'json',
        url : '<c:url value="/noticeList"/>',
        data : {
        },
        beforeSend : function(xhr){
          xhr.setRequestHeader('Content-Type', 'application/json');
        },
        complete : function(){
        },
        success : function(serverData){

          noticeList = serverData.noticeList;
          $(noticeList).each(function(noticeIdx) {
        	
        	if(noticeIdx < 6){
        	  $("#notice_tit"+(noticeIdx+1)).text(noticeList[noticeIdx].noticeTitle);
        	  
  			  // 게시판 제목 클릭 이벤트 처리 함수
  			  $("#notice"+noticeList[noticeIdx].noticeNo).on("click", function(event) {
  				//alert("");
  			  });
        	}
          });
        },
        error : function(jqXHR, textStatus, errorThrown){
        }
      });
    }

    var communityList = Array();  
    var printCommunityList = function() {

      $.ajax({
        type : 'get',
        dataType : 'json',
        url : '<c:url value="/communityList"/>',
        data : {
        },
        beforeSend : function(xhr){
          xhr.setRequestHeader('Content-Type', 'application/json');
        },
        complete : function(){
        },
        success : function(serverData){

          communityList = serverData.communityList;
          $(communityList).each(function(communityIdx) {
        	
        	if(communityIdx < 6){
        	  $("#community_tit"+(communityIdx+1)).text(communityList[communityIdx].communityTitle);

        	  /*
  			  // 게시판 제목 클릭 이벤트 처리 함수
  			  $("#notice"+communityList[noticeIdx].noticeNo).on("click", function(event) {
  				//alert("");
  			  });
  			  */

        	}
          });
        },
        error : function(jqXHR, textStatus, errorThrown){
        }
      });
    }

    $(document).ready(function(){
      //$("#board_row tr").remove();
      
      printApiNum();
      printRecentApiNum();
      printNoticeList();
      printCommunityList();

      $("#btn_notice_add").on("click", function(event){
        location.href = '<c:url value="/noticeForm" />';
      });
    }); // $(document).ready();
    
  </script>
</body>
</html>