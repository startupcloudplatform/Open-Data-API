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

<!--   <main class="main_aside"> -->
<main class="main_aside">
  <div class="contentInner">
  
    <div class="tab_btns_wrap">
      <div class="tab_btns">
        <a href="<c:url value="/api" />">표준산업분류</a>
        <a href="<c:url value="/apiProvider" />" class="current">오픈데이터 제공처</a>
      </div>
    </div>
    
    <div class="tab_sub_btns">
      <a href="#" class="current" id="provider1">국토교통부</a>
      <a href="#" id="provider2">소상공인시장진흥공단</a>
      <a href="#" id="provider3">부산시 스마트시티데이터</a>
    </div>

    <ul class="api_detailIist">
    </ul>

	<div id="page_btn" class="btn_paging" align="center">
	</div>
    
    <div class="btm_btn">
      <button type="button" class="btn_confirm" id="btn_bookmark_add">즐겨찾기 추가</button>
    </div>

          
    <c:if test="${SESSION_USER.userId ne null && SESSION_USER.userId ne ''}">      
    <aside>
      <section>
        <h3>내 검색어</h3>
        <ol class="popula_list">
        </ol>
      </section>
    </aside>
    </c:if>           

    
  </div>
  <!-- //contentInner --> 
  
  </main>

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

  <div class="popup" id="popup_bookmark">
    <h3>알림</h3>
    <div class="pop_cont_wrap">
      <div class="pop_cont">
        <div class="pop_cont_inner">
          <p>선택한 오픈데이터를 보관할 즐겨찾기 이름을 선택해주세요.</p>
          <select id="pop_bookmarklist">
          <!-- 
            <option value="0">즐겨찾기1</option>
            <option value="1">즐겨찾기2</option>
            <option value="2">즐겨찾기3</option>
            <option value="3">즐겨찾기4</option>  
          -->
          </select>
        </div>
      </div>
      <div class="pop_btns">
        <button type="button" id="btn_bookmark_cancel" class="btn_pop_cancel">취소</button>
        <button type="button" id="btn_bookmark_submit" class="btn_pop_submit">확인</button>
      </div>
    </div>
  </div>
  
  <script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.script.js"/>"></script>
  <script src="<c:url value="/resources/js/apiSearch.js"/>"></script>
  <script src="<c:url value="/resources/js/view/keywordView.js"/>"></script>
  

  <script text="text/javascript">

//##########[구성요소 출력 함수]##########

    var currentProvider = "국토교통부";
    var printPagingButton = function(currentPageGroupNum) {
      $("#page_btn button").remove();

      $.ajax({
        type : 'get',
        dataType : 'json',
        url : '<c:url value="/openapiPageGroupList"/>',
        data : {
          openapiProvider : currentProvider,
          currentPageGroupMove : currentPageGroupNum
        },
        beforeSend : function(xhr){
          xhr.setRequestHeader('Content-Type', 'application/json');
        },
        complete : function(){
        },
        success : function(serverData){
          var html = '';
          html += '<button id="btn_firstPage">\<\<</button>';
          html += '<button id="btn_prevPageGroup">\<</button>';
          $("#page_btn").append(html);

          $("#btn_firstPage").on("click", function(event) {
            printPagingButton(3);
            $("button[class='current']").attr('class', '');
            $("#page1").attr('class', 'current');
          });

          $("#btn_prevPageGroup").on("click", function(event) {
            printPagingButton(2);
          });

          var openapiPageList = serverData.openapiGroupPageList
          var openapiPageLast = serverData.openapiPageLast;
          var openapiDirection = serverData.openapiDirection;

		  var total = $(openapiPageList).length;
          $(openapiPageList).each(function(openapiPageIdx) {
            html = '';
            
        	if('${sessionScope.SESSION_USER_CURRENT_OPENAPI_PAGE}' == openapiPageList[openapiPageIdx]) {
        	  html += '<button class="current" id="page'+openapiPageList[openapiPageIdx]+'">'+openapiPageList[openapiPageIdx]+'</button>';
            }
        	else{
        	  html += '<button id="page'+openapiPageList[openapiPageIdx]+'">'+openapiPageList[openapiPageIdx]+'</button>';
        	}

        	$("#page_btn").append(html);
        	
  			$("#page"+openapiPageList[openapiPageIdx]).on("click", function(event) {
    		  
    		  $("button[class='current']").attr('class', '');
    		  $("#page"+openapiPageList[openapiPageIdx]).attr('class', 'current');
    		  printApiListByProvider(currentProvider, openapiPageList[openapiPageIdx]);
    	    });
  			
        	if(openapiDirection==1 && openapiPageIdx==0) {
      		  $("button[class='current']").attr('class', '');
    		  $("#page"+openapiPageList[openapiPageIdx]).attr('class', 'current');
    		  printApiListByProvider(currentProvider, openapiPageList[openapiPageIdx]);
            }
        	else if(openapiDirection==2 && openapiPageIdx==total-1) {
        	  $("button[class='current']").attr('class', '');
      		  $("#page"+openapiPageList[openapiPageIdx]).attr('class', 'current');
      		  printApiListByProvider(currentProvider, openapiPageList[openapiPageIdx]);
            }
        	
          }); // of $(openapiPageList).each()
          
          html = '';
          html += '<button id="btn_nextPageGroup">\></button>';
          html += '<button id="btn_lastPage">\>\></button>';
          $("#page_btn").append(html);

          $("#btn_nextPageGroup").on("click", function(event) {
        	printPagingButton(1);
          });
          
          $("#btn_lastPage").on("click", function(event) {
            printPagingButton(4);
          });
        },
        error : function(jqXHR, textStatus, errorThrown){
        }
      });
    } // of printPagingButton()

    var bookmarkList = Array();
    var printBookmark = function(userNo){
        $.ajax({
          type : 'get',
          dataType : 'json',
          url : '<c:url value="/bookmarkList"/>',
  	    data : {
  		  "userNo" : userNo
  	    },
  		async: false,
  	    beforeSend : function(xhr){
  	      xhr.setRequestHeader('Content-Type', 'application/json');
  	    },
  	    complete : function(){
  	    },
  	    success : function(serverData){
  		  bookmarkList = serverData.bookmarkList;

  		  $(bookmarkList).each(function(apiIndx){
  		    var html = "";	
  		    html +='<option value="'+bookmarkList[apiIndx].bookmarkNo+'">'+bookmarkList[apiIndx].bookmarkName+'</option>';
  		    $("#pop_bookmarklist").append(html);
  		    
  	  	  });
  	    },
  	    error : function(jqXHR, textStatus, errorThrown){
  	    }
  	  });
  	} // of printBookmark()

    var insertOpenapi = function(openapiNo, bookmarkNo){
      $.ajax({
        type : 'get',
        dataType : 'json',
        url : '<c:url value="/bookmarkOpenapiCreate"/>',
        data : {
          "openapiNo" : openapiNo,
          "bookmarkNo" : bookmarkNo
    	},
        beforeSend : function(xhr){
          xhr.setRequestHeader('Content-Type', 'application/json');
        },
        complete : function(){
        },
        success : function(serverData){
          var reault = openapiCreateResult;          
          if(result == 1){
            //alert("openapi 즐겨찾기에 추가 성공");
          }
          else if(result == 2){
            //alert("openapi 즐겨찾기에 추가 실패");
          }
    	},
        error : function(jqXHR, textStatus, errorThrown){
        }
      }); // of $(ajax)
  	} // of insertOpenapi()

    var apiListByProvider = Array();
    var printApiListByProvider = function(searchText, currentOpenapiGroupNum){

    	  $(".api_detailIist li").remove();

          $.ajax({
              type : 'get',
              dataType : "json",
              url : '<c:url value="/openapiGroupList"/>',
              //             url : '<c:url value="/apiInfos"/>',
              data : {
                openapiProvider : searchText,
                currentOpenapiGroupNum : currentOpenapiGroupNum
              },
        	  async: false,
              beforeSend : function(xhr) {
                xhr.setRequestHeader("Content-Type", "application/json");
              },
              complete : function() {
              },
              success : function(serverData) {
            	
                console.log(serverData);
                apiListByProvider = serverData.openapiInfos;
                
                $(apiListByProvider).each(function(apiIndx) {
                  var api = apiListByProvider[apiIndx];
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
                    setClickEventUse("button[id=" + api.openapiNo + "]", api, 1, api.openapiJoinUrl);
                  }
                }); // of each
                
                //$(".api_detailIist").append("<li>더보기</li>");
                
              },
              error : function(jqXHR, textStatus, errorThrown) {
              }
            }); // $.ajax
      } // printApiListByProvider()

//##########[버튼 이벤트 함수]##########

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
    } // of setClickEventDownload()

    // 시용신청 버튼 이벤트 적용 함수
    var setClickEventUse = function(useButtonId, api, userNo, joinUrl) {

      <c:choose>
      <%--로그인이 되었을 경우 --%>
      <c:when test="${sessionScope.SESSION_USER ne null}">

      $(useButtonId).on("click", function(event) {
        window.open(joinUrl);
        	
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

            $(".main_aside").append(html);

            $(".btn_pop_submit").on("click", function(event) {
              $("#use_popup").remove();
            });
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
    } // of setClickEventUse()
    
    $("#provider1").on('click', function(event){
      currentProvider = "국토교통부";  
      printPagingButton(5);  
      $("#provider1").attr('class', 'current');
      $("#provider2").removeAttr('class');
      $("#provider3").removeAttr('class');
    });

    $("#provider2").on('click', function(event){
      currentProvider = "소상공인시장진흥공단";
      printPagingButton(5);
      $("#provider2").attr('class', 'current');
      $("#provider1").removeAttr('class');
      $("#provider3").removeAttr('class');
    });

    $("#provider3").on('click', function(event){
      currentProvider = "부산시 스마트시티데이터";    	  
      printPagingButton(5);
      $("#provider3").attr('class', 'current');
      $("#provider1").removeAttr('class');
      $("#provider2").removeAttr('class');
    });

    $("#btn_bookmark_add").on("click", function(event) {
      $("#pop_bookmarklist option").remove();
      printBookmark("${sessionScope.SESSION_USER.userNo}");
      $("#popup_bookmark").show();
    });

    $("#btn_bookmark_cancel").on("click", function(event) {
      $("#popup_bookmark").hide();
    });

    $("#btn_bookmark_submit").on("click", function(event) {
      $("#popup_bookmark").hide();
      $('input:checkbox[name="checkbox_api"]').each(function(checkboxIdx) {
        var checkState = $("#checkbox"+apiListByProvider[checkboxIdx].openapiNo).is(":checked");
        var openapiNo = apiListByProvider[checkboxIdx].openapiNo;
        var bookmarkNo = $("#pop_bookmarklist option:selected").val();
          
        if(checkState){	
          insertOpenapi(openapiNo, bookmarkNo);
        }
      });   
    });

//##########[문서 로딩 이벤트 함수]##########

    $(document).ready(function() {
      printPagingButton(0);
    }); // of $(document).ready

  </script>
</body>
</html>