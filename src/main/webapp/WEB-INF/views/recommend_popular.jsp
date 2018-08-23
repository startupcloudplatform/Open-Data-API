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

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/normalize.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/font.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/swiper.min.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>" />

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

          <a href="<c:url value="/api"/>">오픈데이터</a>
          <c:if test="${SESSION_USER.userId ne null && SESSION_USER.userId ne ''}">
            <a href="<c:url value="/recommendPopular"/>" class="current">오픈데이터 추천</a>
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
    <div class="snb">
      <h3>오픈데이터 추천</h3>
      <ul>
        <li class="current"><a href="<c:url value="/recommendPopular" />">실시간 인기 오픈데이터</a></li>
        <li><a href="<c:url value="/recommendMycategory" />">내 산업군 인기 오픈데이터</a></li>
        <!-- 
        <li><a href="#">키워드 기반 API 추천</a></li>
        <li><a href="#">함께 사용되는 API 추천</a></li>
        <li><a href="#">사용자 행위 기반 API 추천</a></li>
        -->
      </ul>
    </div>
    <!-- //snb -->

    <h2 class="">실시간 인기 오픈데이터</h2>


    <div class="tab_sub_btns">
      <a href="#" class="current" id="provider1">실시간 인기 사용신청</a>
      <a href="#" id="provider2">실시간 인기 다운로드</a>
      <a href="#" id="provider3">실시간 인기 즐겨찾기 추가</a>
    </div>

    <ul class="api_detailIist">
    </ul>
    
    <div class="btm_btn">
      <button type="button" class="btn_confirm">즐겨찾기 추가</button>
    </div>

  </div>
  <!-- //contentInner --> </main>

  <footer>
    <div class="contentInner">
      <h1>
        <img src="<c:url value="/resources/images/logo_footer.png"/>" alt="Cloudit Knowledge Base">
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
  
  <script text="text/javascript">

  var apiList = Array();
  var printPopularApiList = function(popularType){

	  $(".api_detailIist li").remove();

	  var popularUrl;
	  
	  if(popularType == 1)
		  popularUrl = '<c:url value="/popularUseApiInfos"/>';
	  else if(popularType == 2)
		  popularUrl = '<c:url value="/popularDownloadApiInfos"/>';		  
      else if(popularType == 3)
		  popularUrl = '<c:url value="/popularBookmarkApiInfos"/>';

      //alert(popularUrl);
  
      $.ajax({
          type : 'get',
          dataType : "json",
          url : popularUrl,
          data : {
          },
    	  async: false,
          beforeSend : function(xhr) {
            xhr.setRequestHeader("Content-Type", "application/json");
          },
          complete : function() {
          },
          success : function(serverData) {
			
            if(popularType == 1)
            	apiList = serverData.popularUseOpenapiInfos;
        	else if(popularType == 2)
        		apiList = serverData.popularDownloadOpenapiInfos;
            else if(popularType == 3)
            	apiList = serverData.popularBookmarkOpenapiInfos;

            //apiList = serverData.popularOpenapiInfos;

            $(apiList).each(function(apiIndx) {

              //alert(apiList[apiIndx].openapiCategory);

              var api = apiList[apiIndx];
              
              var resultType = "";
              if (api.openapiResultType == 1) {
                resultType = "CSV";
              } else if (api.openapiResultType == 2) {
                resultType = "XML";
              } else if (api.openapiResultType == 3) {
                resultType = "JSON";
              } else if (api.openapiResultType == 4) {
                resultType = "ZIP";
              }
              var html = "";
              html += '<li>';
              html += '  <div class="detailIist_tit">';
              html += '    <input type="checkbox" id="checkbox'+api.openapiNo+'" name="checkbox_api" ><label for="">'
                  + api.openapiName
                  + '</label> <a href="'+api.openapiUseUrl+'">'
                  + api.openapiUseUrl.split('?')[0] + '</a>';

              <c:choose>
              <%--로그인이 되었을 경우 --%>
              <c:when test="${sessionScope.SESSION_USER ne null }">
              if (api.openapiUseType == 1) {
                html += '<div class="btns">';
                html += '<a class="download_link" href="'+api.openapiUseUrl+'"> <button type="button" id='+api.openapiNo+' class="btn_detail_download">다운로드</button></a>';
                html += '</div>';
              } else {
                if (api.use == true) {
                  html += '    <div class="btns">';
                  html += '      <span class="">사용신청완료</span>';
                  html += '    </div>';
                } else {
                  html += '    <div class="btns">';
                  html += '      <button type="button" id='+api.openapiNo+' class="btn_detail_app">사용신청</button>';
                  html += '    </div>';
                }
              }
              </c:when>
              <%--//로그인이 되었을 경우 --%>
              <%--로그인이 안되어있을 경우 --%>
              <c:otherwise>
              if (api.openapiUseType == 1) {
                html += '<div class="btns">';
                html += '<a class="download_link" href="#"> <button type="button" id='+api.openapiNo+' class="btn_detail_download">다운로드</button></a>';
                html += '</div>';
              } else {
                if (api.use == true) {
                  html += '    <div class="btns">';
                  html += '      <span class="">사용신청완료</span>';
                  html += '    </div>';
                } else {
                  html += '    <div class="btns">';
                  html += '      <button type="button" id='+api.openapiNo+' class="btn_detail_app">사용신청</button>';
                  html += '    </div>';
                }
              }
              </c:otherwise>
              
              <%--//로그인이 안되어있을 경우 --%>
              </c:choose>

              html += '  </div>';
              html += '  <div class="detailIist_cont">'
                  + api.openapiComment + '</div>';
              html += '  <div class="detailIist_info">';
              html += '    <span>활용 :<strong>'
                  + (api.openapiUseType == 1 ? 'FILE' : 'RESTful')
                  + '</strong></span> <span>결과 :<strong>'
                  + resultType
                  + '</strong></span> <span>제공처 :<strong>'
                  + api.openapiProvider + '</strong></span>';
              html += '  </div>';
              html += '</li>';
              $(".api_detailIist").append(html);

              if (api.openapiUseType == 1) {
                setClickEventDownload("button[id=" + api.openapiNo + "]", api.openapiUseUrl);
              } else {
                setClickEventUse("button[id=" + api.openapiNo + "]", api, 1);
              }
            });
          },
          error : function(jqXHR, textStatus, errorThrown) {
          }
        }); // $.ajax
  } // 

  // 다운로드 버튼 이벤트 적용 함수
  var setClickEventDownload = function(buttonId, downloadUrl) {
    <c:choose>
    <%--로그인이 되었을 경우 --%>
    <c:when test="${sessionScope.SESSION_USER ne null}">
    
    $(buttonId).on("click", function(event) {

      var tempInput = document.createElement("input");
      tempInput.style = "position: absolute; left: -1000px; top: -1000px";
      tempInput.value = downloadUrl;
      document.body.appendChild(tempInput);
      tempInput.select();
      document.execCommand("copy");
      document.body.removeChild(tempInput);

      $.ajax({
        type : 'get',
        url : downloadUrl,
        data : {},
        complete : function() {
        },
        success : function() {
        },
        error : function() {
        }
      });
    });
    
    </c:when>
    <%--//로그인이 되었을 경우 --%>
    <%--로그인이 안되어있을 경우 --%>
    <c:otherwise>
    
    $(buttonId).on("click", function(event) {
      var html = "";
      html += '  <div class="popup" id="use_popup">';
      html += '    <h3>알림</h3> ';
      html += '    <div class="pop_cont_wrap">';
      html += '      <div class="pop_cont">';
      html += '        <div class="pop_cont_inner">';
      html += '          <p>공공데이터포털 사용을 위하여 로그인이 필요합니다.</p>';
      html += '          <p>로그인 화면으로 이동합니다.</p>';
      html += '        </div>';
      html += '      </div>';
      html += '      <div class="pop_btns">';
      html += '        <button type="submit" id="" class="btn_pop_submit">확인</button>';
      html += '    </div>';
      html += '  </div>';
      html += '  </div>';

      $(".main_aside").append(html);
      $("#use_popup").show();

      $(".btn_pop_submit").on("click", function(event) {
        $("#use_popup").remove();
        location.href = '<c:url value="/login" />';
      });
    });

    </c:otherwise>
    <%--//로그인이 안되어있을 경우 --%>
    </c:choose>
  }

  // 시용신청 버튼 이벤트 적용 함수
  var setClickEventUse = function(useButtonId, api, userNo) {

    <c:choose>
    <%--로그인이 되었을 경우 --%>
    <c:when test="${sessionScope.SESSION_USER ne null}">

    $(useButtonId).on("click", function(event) {
      $.ajax({
        type : 'get',
        url : '<c:url value="/userOpenapiInsert"/>',
        
        data : {
          "openapiNo" : api.openapiNo,
          "userNo" : userNo
        },
        complete : function() {
        },
        success : function() {

          var html = "";
          html += '  <div class="popup" id="use_popup">';
          html += '    <h3>알림</h3> ';
          html += '    <div class="pop_cont_wrap">';
          html += '      <div class="pop_cont">';
          html += '        <div class="pop_cont_inner">';
          html += '          <p>공공데이터포털에 대한 OAuth 인증이 수행되었습니다.</p>';
          html += '        </div>';
          html += '      </div>';
          html += '      <div class="pop_btns">';
          html += '        <button type="submit" id="" class="btn_pop_submit">확인</button>';
          html += '    </div>';
          html += '  </div>';
          html += '  </div>';

          /*
           var html2 = "";
           html +='  <div class="popup" id="use_popup">';
           html +='    <h3>알림</h3> ';
           html +='    <div class="pop_cont_wrap">';
           html +='      <div class="pop_cont">';
           html +='        <div class="pop_cont_inner">';
           html +='          <p>오픈 데이터 API가 신청되었습니다.</p>';
           html +='          <p>내 오픈 데이터 API 관리 메뉴에서 확인 가능합니다.</p>';
           html +='        </div>';
           html +='      </div>';
           html +='      <div class="pop_btns">';
           html +='        <button type="submit" id="" class="btn_pop_submit2">확인</button>';
           html +='    </div>';
           html +='  </div>';
           html +='  </div>';
           */

          $(".main_aside").append(html);
          $("#use_popup").show();

          $(".btn_pop_submit").on("click", function(event) {
            $("#use_popup").remove();
            //$(".main_aside").append(html2);
          });

          /*
          $(".btn_pop_submit2").on("click", function(event){
            $("#use_popup").hide();
          });  
           */

        },
        error : function() {
        }
      });
    });

    </c:when>
    <%--//로그인이 되었을 경우 --%>
    <%--로그인이 안되어있을 경우 --%>
    <c:otherwise>

    $(useButtonId).on("click", function(event) {

      var html = "";
      html += '  <div class="popup" id="use_popup">';
      html += '    <h3>알림</h3> ';
      html += '    <div class="pop_cont_wrap">';
      html += '      <div class="pop_cont">';
      html += '        <div class="pop_cont_inner">';
      html += '          <p>공공데이터포털 사용을 위하여 로그인이 필요합니다.</p>';
      html += '          <p>로그인 화면으로 이동합니다.</p>';
      html += '        </div>';
      html += '      </div>';
      html += '      <div class="pop_btns">';
      html += '        <button type="submit" id="" class="btn_pop_submit">확인</button>';
      html += '    </div>';
      html += '  </div>';
      html += '  </div>';

      $(".main_aside").append(html);
      $("#use_popup").show();

      $(".btn_pop_submit").on("click", function(event) {
        $("#use_popup").remove();
        location.href = '<c:url value="/login" />';
      });
    });
    </c:otherwise>
    <%--//로그인이 안되어있을 경우 --%>
    </c:choose>
  }

  $("#provider1").on('click', function(event){
	  //alert("provider1");
	  $("#provider1").attr('class', 'current');
	  $("#provider2").removeAttr('class');
	  $("#provider3").removeAttr('class');
	  printPopularApiList(1);
  });

  $("#provider2").on('click', function(event){
	  //alert("provider2");
	  $("#provider2").attr('class', 'current');
	  $("#provider1").removeAttr('class');
	  $("#provider3").removeAttr('class');
	  printPopularApiList(2);
  });

  $("#provider3").on('click', function(event){
	  //alert("provider3");
	  $("#provider3").attr('class', 'current');
	  $("#provider1").removeAttr('class');
	  $("#provider2").removeAttr('class');
	  printPopularApiList(3);
  });

  
	$(document).ready(function() {
        //alert("${sessionScope.SESSION_USER.companyCategory}");
		printPopularApiList(1);

	});
	
  </script>
</body>

</html>