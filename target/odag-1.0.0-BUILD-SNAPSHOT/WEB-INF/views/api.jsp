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
          <a href="<c:url value="/"/>"><img src="<c:url value="/resources/images/logo.png"/>" alt="Open Data API Gateway" width="200px"></a>
        </h1>

        <c:choose>
          <%--로그인이 되었을 경우 --%>
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
          <%--//로그인이 되었을 경우 --%>
          
          <%--로그인이 안되어있을 경우 --%>
          <c:otherwise>
            <div class="usermenu" style="width:90px;">
              <button type="button">
                <span class="btn_user"><a href="<c:url value="/login"/>">로그인</a></span>
              </button>
            </div>
          </c:otherwise>
          
          <%--//로그인이 안되어있을 경우 --%>
        </c:choose>
      </div>
    </div>
    <!-- //header_logo -->

    <div class="header_nav">
      <div class="contentInner">
        <nav>
          <a href="<c:url value="/api"/>" class="current">오픈데이터</a>
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
    </div>
    <!-- //header_nav -->
  </header>

  <main class="main_aside">
  <div class="contentInner">
    <div class="api_search">
      <form method="">
        <div class="api_search_option">
          <div>
            <select id="majorList">
              <c:forEach var="movie" items="${majorList}">
                <option value="">${movie.categoryText}</option>
              </c:forEach>
            </select>
          </div>
          <div>
            <select id="middleList">
              <c:forEach var="movie" items="${middleList}">
                <option value="">${movie.categoryText}</option>
              </c:forEach>
            </select>
          </div>
          <div>
            <select id="subList">
              <c:forEach var="movie" items="${subList}">
                <option value="">${movie.categoryText}</option>
              </c:forEach>
            </select>
          </div>
        </div>
        <div class="api_search_input">
          <div class="search_category">
            <a href="#" class="cetegory_all">전체</a> <a href="#" class="cetegory_mid">중분류</a> <a href="#" class="cetegory_sub">소분류</a>
          </div>
          <div class="search_input">
            <input type="text" class="search_keyword" placeholder="검색어를 입력하세요.">
            <button type="button" id="" class="search_button">
                <!-- //api_search -->
              <span>Search</span>
            </button>
          </div>
        </div>
      </form>
    </div>
    <!-- //api_search -->

    <ul class="api_detailIist">
      <!--       <li>
        <div class="detailIist_tit">
          <input type="checkbox" id=""> <label for="">도로명주소조회서비스</label> <a href="#">http://taas.koroad.or.kr/gis/mcm/mcl/initMap.do</a>
          <div class="btns">
            <span class="">사용신청완료</span>
          </div>
        </div>
        <div class="detailIist_cont">우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부 에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.</div>
        <div class="detailIist_info">
          <span>활용 :<strong>FILE</strong></span> <span>결과 :<strong>TEXT</strong></span> <span>제공처 :<strong>공공데이터포털</strong></span>
        </div>
      </li>
      <li>
        <div class="detailIist_tit">
          <input type="checkbox" id=""> <label for="">도로명주소조회서비스</label> <a href="#">http://taas.koroad.or.kr/gis/mcm/mcl/initMap.do</a>
          <div class="btns">
            <button type="button" class="btn_detail_download">다운로드</button>
          </div>
        </div>
        <div class="detailIist_cont">우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부 에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.</div>
        <div class="detailIist_info">
          <span>활용 :<strong>FILE</strong></span> <span>결과 :<strong>TEXT</strong></span> <span>제공처 :<strong>공공데이터포털</strong></span>
        </div>
      </li>
      <li>
        <div class="detailIist_tit">
          <input type="checkbox" id=""> <label for="">도로명주소조회서비스</label> <a href="#">http://taas.koroad.or.kr/gis/mcm/mcl/initMap.do</a>
          <div class="btns">
            <button type="button" class="btn_detail_app">사용신청</button>
          </div>
        </div>
        <div class="detailIist_cont">우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부 에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.</div>
        <div class="detailIist_info">
          <span>활용 :<strong>FILE</strong></span> <span>결과 :<strong>TEXT</strong></span> <span>제공처 :<strong>공공데이터포털</strong></span>
        </div>
      </li>
      <li>
        <div class="detailIist_tit">
          <input type="checkbox" id=""> <label for="">도로명주소조회서비스</label> <a href="#">http://taas.koroad.or.kr/gis/mcm/mcl/initMap.do</a>
          <div class="btns">
            <button type="button" class="btn_detail_app">사용신청</button>
          </div>
        </div>
        <div class="detailIist_cont">우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부 에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.</div>
        <div class="detailIist_info">
          <span>활용 :<strong>FILE</strong></span> <span>결과 :<strong>TEXT</strong></span> <span>제공처 :<strong>공공데이터포털</strong></span>
        </div>
      </li> -->
    </ul>
    <div class="btm_btn">
      <button type="button" class="btn_confirm">즐겨찾기 추가</button>
    </div>

    <aside>
      <section>
        <h3>내 검색어</h3>
        <ol class="popula_list">
        <!-- 
          <li><a href="#">도로명주소 조회 서비스</a></li>
          <li><a href="#">도로명주소조회</a></li>
          <li><a href="#">상가(상권)정보</a></li>
          <li><a href="#">도로명주소 조회 서비스</a></li>
          <li><a href="#">도로명주소조회</a></li>
        -->
        </ol>
      </section>
    </aside>
  </div>
  <!-- //contentInner --> </main>

  <footer>
    <div class="contentInner">
      <h1>
        <img src="<c:url value="/resources/images/logo_footer.png" />" alt="Cloudit Knowledge Base">
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

  <div class="popup">
    <h3>알림</h3>
    <div class="pop_cont_wrap">
      <div class="pop_cont">
        <div class="pop_cont_inner">
          <p>선택된 Open API를 보관할 분류를 선택해 주세요.</p>
          <select id="">
            <option value="">openAPI 분류 N</option>
          </select>
        </div>
      </div>
      <div class="pop_btns">
        <button type="button" id="" class="btn_pop_cancel">취소</button>
        <button type="submit" id="" class="btn_pop_submit">확인</button>
      </div>
    </div>
  </div>
  <script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.script.js"/>"></script>
  <script src="<c:url value="/resources/js/apiSearch.js"/>"></script>
  <script src="<c:url value="/resources/js/view/keywordView.js"/>"></script>
  

  <script text="text/javascript">
      
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

      // api 리스트 출력 함수
      var doSearch = function(searchText) {
        $.ajax({
          type : 'get',
          dataType : "json",
          url : '<c:url value="/apiList"/>',
          data : {
            "openapiName" : searchText.openapiName,
            "openapiCategory" : searchText.openapiCategory
          },
          beforeSend : function(xhr) {
            xhr.setRequestHeader("Content-Type", "application/json");
          },
          complete : function() {
          },
          success : function(serverData) {
            console.log(serverData);
            var apiList = serverData.openapiList;
            $(apiList).each(function(apiIndx) {
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
              html += '    <input type="checkbox" id=""><label for="">'
                  + api.openapiName
                  + '</label> <a href="'+api.openapiUrl+'">'
                  + api.openapiUrl.split('?')[0] + '</a>';

              <c:choose>
              <%--로그인이 되었을 경우 --%>
              <c:when test="${sessionScope.SESSION_USER ne null }">
              if (api.openapiUseType == 1) {
                html += '<div class="btns">';
                html += '<a class="download_link" href="'+api.openapiUrl+'"> <button type="button" id='+api.openapiNo+' class="btn_detail_download">다운로드</button></a>';
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
                setClickEventDownload("button[id=" + api.openapiNo + "]", api.openapiUrl);
              } else {
                setClickEventUse("button[id=" + api.openapiNo + "]", api, 1);
              }
            });
          },
          error : function(jqXHR, textStatus, errorThrown) {
          }
        }); // $.ajax
      } // of doSearch

      // 중분류 하위 카테고리 리스트 검색
      childList = Array();
      var serchChild = function(categoryNo) {
        $.ajax({
          type : 'get',
          dataType : "json",
          url : '<c:url value="/categoryChildList"/>',
          data : {
            "categoryParents" : categoryNo
          },
          beforeSend : function(xhr) {
            xhr.setRequestHeader("Content-Type", "application/json");
          },
          complete : function() {
          },
          success : function(serverData) {

            childList = serverData.categoryList;

            var subCategoryList = childList;

            $("#subList option").remove();
            $("#subList").append("<option value=''>전체</option>");

            $(subCategoryList).each(function(subCategoryIdx) {
              $("#subList").append("<option value='"+subCategoryList[subCategoryIdx].categoryNo+"'>" + subCategoryList[subCategoryIdx].categoryText + "</option>");
            });
          },
          error : function(jqXHR, textStatus, errorThrown) {
          }
        });
      } // serchChild

      
      $(document).on('keyup keypress', 'form input[type="text"]', function(e) {
    	  if(e.keyCode == 13) {
    	    e.preventDefault();
    	    return false;
    	  }
      });
      

      // 페이지 열람과 동시에 실행
      $(document).ready(function() {
    	
    	myKeywordSearch('<c:url value="/keywordList"/>', "${sessionScope.SESSION_USER.userNo}");
    	
      	// ENTER 키 이벤트 처리      	 
        $(window).keydown(function(event) {
          if(event.keyCode == 13){
            $(".api_detailIist li").remove();
            var searchText = $(".search_keyword").val();
            var url = '<c:url value="/apiSearch"/>';
            doSearchAPI(url, searchText, "${sessionScope.SESSION_USER.userNo}");
          }
    	});      
  
    	// 검색버튼 클릭 이벤트 처리
    	$(".search_button").on("click", function(event) {
    		$(".api_detailIist li").remove();
    		
    		var searchText = $(".search_keyword").val();
    		var url = '<c:url value="/apiSearch"/>';
    		
    		doSearchAPI(url, searchText, "${sessionScope.SESSION_USER.userNo}");
        });

        $(".cetegory_all").hide();
        $(".cetegory_mid").hide();
        $(".cetegory_sub").hide();

        $(".cetegory_all").on("click", function(event) {
          $(".cetegory_all").hide();
          $(".cetegory_mid").hide();
          $(".cetegory_sub").hide();
        });
        $(".cetegory_mid").on("click", function(event) {
          $(".cetegory_mid").hide();
          $(".cetegory_sub").hide();
        });
        $(".cetegory_sub").on("click", function(event) {
          $(".cetegory_sub").hide();
        });
        /*
        $(".btn_confirm").on("click", function(event){
          $(".popup").show();
        });
         */

        categoryList = Array();
        $(".api_detailIist li").remove();
        
        doSearch({
          "openapiCategory" : '',
          "openapiName" : ''
        });

        $.ajax({
          type : 'get',
          dataType : "json",
          url : '<c:url value="/categoryRecursiveList"/>',
          data : {},
          beforeSend : function(xhr) {
            xhr.setRequestHeader("Content-Type", "application/json");
          },
          complete : function() {
          },
          success : function(serverData) {
            categoryList = serverData.categoryList;
            $("#majorList option").remove();
            $("#majorList").prepend("<option value=''>전체</option>");

            $(categoryList).each(function(categoryIdx) {

              if (categoryIdx == 0) {
                $("#middleList option").remove();
                $("#middleList").append("<option value=''>전체</option>");
                $("#subList option").remove();
                $("#subList").append("<option value=''>전체</option>");
              }
              $("#majorList").append("<option value='"+categoryList[categoryIdx].categoryNo+"'>"+ categoryList[categoryIdx].categoryText + "</option>");

            });
          },
          error : function(jqXHR, textStatus, errorThrown) {

          }
        }); // of $.ajax

        majorSelectedIdx = 0;
        middleCategoryList = Array();
        /**
         * 1st Depth 변경할 경우 동작
         */
        $("#majorList").change(function() {
          
          var majorCategoryNo = $("#majorList option:selected").val();
          var majorCategoryText = $("#majorList option:selected").text();
          $(".cetegory_all").show();
          $(".cetegory_all").text(majorCategoryText);

          if (majorCategoryNo == '' || majorCategoryNo == null || majorCategoryNo == undefined) {
            $("#middleList option").remove();
            $("#middleList").append("<option value=''>전체</option>");
            $("#subList option").remove();
            $("#subList").append("<option value=''>전체</option>");
            $(".cetegory_all").hide();
            $(".cetegory_mid").hide();
            $(".cetegory_sub").hide();
          }

          majorSelectedIdx = majorCategoryNo;

          $(".api_detailIist li").remove();
          doSearch({
            "openapiCategory" : majorCategoryNo,
            "openapiName" : ''
          });

          $(categoryList).each(function(categoryIdx) {
            if (categoryList[categoryIdx].categoryNo == majorCategoryNo) {

              $("#middleList option").remove();
              $("#middleList").append("<option value=''>전체</option>");

              middleCategoryList = categoryList[categoryIdx].categoryList;

              $(middleCategoryList).each(function(middleCategoryIdx) {
                if (middleCategoryIdx == 0) {
                  $("#subList option").remove();
                  $("#subList").append("<option value=''>전체</option>");
                }
                $("#middleList").append("<option value='"+middleCategoryList[middleCategoryIdx].categoryNo+"'>"+ middleCategoryList[middleCategoryIdx].categoryText+ "</option>");
              });
            }
          });
        }); // $("#majorList").chang

        /**
         * 2nd Depth 변경할 경우 동작
         */
        $("#middleList").change(function() {

          var middleCategoryNo = $("#middleList option:selected").val();
          var middleCategoryText = $("#middleList option:selected").text();
          $(".cetegory_mid").show();
          $(".cetegory_mid").text(middleCategoryText);

          if (middleCategoryNo == '' || middleCategoryNo == null
              || middleCategoryNo == undefined) {
            $("#subList option").remove();
            $("#subList").append("<option value=''>전체</option>");

            $(".cetegory_mid").hide();
            $(".cetegory_sub").hide();
          }

          $(".api_detailIist li").remove();
          doSearch({"openapiCategory" : middleCategoryNo, "openapiName" : ''});

          serchChild(middleCategoryNo);

        }); // $("#middleList").change
        
        /**
         * 3rd Depth 변경할 경우 동작
         */
         
        $("#subList").change(function(){

          var subCategoryNo = $("#subList option:selected").val();
          var subCategoryText = $("#subList option:selected").text();
          $(".cetegory_sub").show();
          $(".cetegory_sub").text(subCategoryText);

          if (subCategoryNo == '' || subCategoryNo == null
              || subCategoryNo == undefined) {
            $(".cetegory_sub").hide();
            //$("#subList option").remove();
            //$("#subList").append("<option value=''>전체</option>");
          }

          $(".api_detailIist li").remove();

          doSearch({
            "openapiCategory" : subCategoryNo,
            "openapiName" : ''
          });

        }); // $("#subList").change
      
      }); // of $(document).ready
    </script>
</body>

</html>