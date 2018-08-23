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
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/board.css" />" />

  <!--[if lt IE 9]>
  <script src="../lib/js/html5shiv.min.js"></script>
  <![endif]-->

  <c:if test="${sessionScope.SESSION_USER.userId eq null || sessionScope.SESSION_USER.userId eq ''}">
    <script type="text/javascript">
      location.href = '<c:url value="/" />';
    </script>
  </c:if>
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
    </div><!-- //header_logo -->

    <div class="header_nav">
      <div class="contentInner">
        <nav>
          <a href="<c:url value="/api"/>">오픈데이터</a>

            <c:if test="${SESSION_USER.userId ne null && SESSION_USER.userId ne ''}">
            <a href="<c:url value="/recommendPopular"/>">오픈데이터 추천</a>
            <a href="<c:url value="/myapi" />" class="current">마이 오픈데이터</a>
            </c:if>

          <a href="<c:url value="/introduce" />">서비스 안내</a>
        </nav>
      </div>
    </div><!-- //header_nav -->
  </header>

  <main class="main_snb">
    <div class="contentInner">
      <div class="snb">
        <h3>마이 오픈데이터</h3>
        <ul>
          <li><a href="<c:url value="/myapi" />">마이 오픈API</a></li>
          <li><a href="<c:url value="/myapi_bookmark" />">즐겨찾기</a></li>
          
          <c:choose>
          <c:when test="${sessionScope.SESSION_USER.userType eq 0 or sessionScope.SESSION_USER.userType eq 2}">
          <li class="current"><a href="<c:url value="/provider" />">오픈데이터 제공</a></li>
          </c:when>
          </c:choose>          
          
          <!--<li><a href="<c:url value="/token" />">토큰 관리</a></li>-->
        </ul>
      </div><!-- //snb -->

      <h2 class="bookmark_title">${sessionScope.SESSION_USER.userName}'s 오픈데이터</h2>
      
      <ul class="api_form">
      
        <form method="post" action="/openapiUpdate">
          <section class="wrap_tb_signup">
            <table class="tb_signup">
              <tr>
                <th>오픈데이터 이름</th>
                <td>
                  <input name="openapiName" type="text" id="openapiName">
                </td>
              </tr>
              
              <tr>
                <th>오픈데이터 분류</th>
                <td>
                  <ul class="list_selectbox">
                    <li><select id="majorList"><option value="">대분류</option></select></li>
                    <li><select id="middleList"><option value="">중분류</option></select></li>
                    <li><select id="subList" name="openapiCategory"><option value="1">소분류</option></select></li>
                  </ul>
                </td>
              </tr>
              
              <tr>
                <th>활용 유형</th>
                <td>
                  <input type="radio" name="openapiUseType"  id="openapiUseTypeRadio1" value="1" ><label for="openapiUseTypeRadio1">파일 다운로드</label>
                  <input type="radio" name="openapiUseType"  id="openapiUseTypeRadio2" value="2" ><label for="openapiUseTypeRadio2">RESTful</label>
                </td>
              </tr>
              
              <tr>
                <th>결과 유형</th>
                <td>
                  <input type="radio" name="openapiResultType"  id="openapiResultTypeRadio1" value="1" ><label for="openapiResultTypeRadio1">CSV</label>
                  <input type="radio" name="openapiResultType"  id="openapiResultTypeRadio2" value="2" ><label for="openapiResultTypeRadio2">XML</label>
                  <input type="radio" name="openapiResultType"  id="openapiResultTypeRadio3" value="3" ><label for="openapiResultTypeRadio3">JSON</label>
                  <input type="radio" name="openapiResultType"  id="openapiResultTypeRadio4" value="4" ><label for="openapiResultTypeRadio4">ZIP</label>
                </td>
              </tr>
              
              <tr>
                <th>오픈데이터 제공처</th>
                <td>
                  <input name="openapiProvider" type="text" id="openapiProvider" readonly>
                </td>
              </tr>
              
              <tr>
                <th>오픈데이터 설명</th>
                <td>
                  <div class="wrap_textarea"><textarea name="openapiComment"  id="openapiComment"></textarea></div>
                </td>
              </tr>
              
              <tr>
                <th>서비스 이용 URL</th>
                <td>
                  <input name="openapiUseUrl" type="text" id="openapiUseUrl">
                </td>
              </tr>
              
              <tr>
                <th>서비스 신청 URL</th>
                <td>
                  <input name="openapiJoinUrl" type="text" id="openapiJoinUrl">
                </td>
              </tr>
       
              <tr>
                <th>키워드</th>
                <td>
                  <input name="openapiKeyword" type="text" id="openapiKeyword">
                </td>
              </tr>
              
            </table>
          </section>
          
          <div class="btm_btn">
            <button type="submit" class="btn_confirm" id="btn_opendata_add">수정</button><br><br>
          </div>
          
        </form>
      </ul>
      

      
      
    </div><!-- //contentInner -->
  </main>

  <footer>
    <div class="contentInner">
      <h1><img src="<c:url value="/resources/images/logo_footer.png"/>" alt="Cloudit Knowledge Base"></h1>
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
  <script src="<c:url value="/resources/js/view/categoryView.js"/>"></script>

<!-- 스크립트 기능 - 신청된 오픈 API 출력, URL 복사 기능, 인증키 복사 기능, 3계층 분류, 검색 기능 -->

	<script text="text/javascript">
	
	function copyEvent(value){
		var tempInputToken = window.document.createElement("textarea");
		tempInputToken.style = "position: absolute; left: -1000px; top: -1000px";
        tempInputToken.value = value;
        window.document.body.appendChild(tempInputToken);
		tempInputToken.select();
		window.document.execCommand("copy");
		window.document.body.removeChild(tempInputToken);
	};

	var setClickEventToken = function(tokenButtonId, apiNo){	

		$(tokenButtonId).on("click", function(event){
			
			$.ajax({
				type : 'get',
				dataType : "json",
				url : '<c:url value="/tokenList"/>',
				data : {
					"userOpenapiNo": apiNo
				},
				complete : function(){
				},
				success : function(serverData) {

					tokenList = serverData.tokenList;	
					copyEvent(tokenList[0].tokenKey);
//					alert("token : " + tokenList[0].tokenKey);
					var html = "";
					html +='  <div class="popup" id="use_popup">';
					html +='    <h3>알림</h3> ';
					html +='    <div class="pop_cont_wrap">';
					html +='      <div class="pop_cont">';
					html +='        <div class="pop_cont_inner">';
					html +='          <p>인증키가 복사되었습니다.</p>';
					html +='        </div>';
					html +='      </div>';
					html +='      <div class="pop_btns">';
					html +='        <button type="submit" id="" class="btn_pop_submit">확인</button>';
					html +='	  </div>';
					html +='	</div>';
					html +='  </div>';

					$(".main_snb").append(html);
					
					$("#use_popup").show();
					$(".btn_pop_submit").on("click", function(event){
						$("#use_popup").remove();
					});
				    
				},
				error : function(){}
			});
		});
	}
	
	var setClickEventURL = function(useButtonId, url){
		$(useButtonId).on("click", function(event){
			
			copyEvent(url);
			var html = "";
			html +='  <div class="popup" id="use_popup">';
			html +='    <h3>알림</h3> ';
			html +='    <div class="pop_cont_wrap">';
			html +='      <div class="pop_cont">';
			html +='        <div class="pop_cont_inner">';
			html +='          <p>URL이 복사되었습니다.</p>';
			html +='        </div>';
			html +='      </div>';
			html +='      <div class="pop_btns">';
			html +='        <button type="submit" id="" class="btn_pop_submit">확인</button>';
			html +='	  </div>';
			html +='	</div>';
			html +='  </div>';
			
			$(".main_snb").append(html);
			$("#use_popup").show();
			$(".btn_pop_submit").on("click", function(event){
				$("#use_popup").remove();
			});
		});
	}

	var deleteUserOpenapi = function(userOpenapiNo){
		$.ajax({
			type : 'get',
			dataType : "json",
			url : '<c:url value="/userOpenapiDelete"/>',
			data : {
				"userOpenapiNo": userOpenapiNo
			},
			complete : function(){
			},
			success : function(){
				$(".api_detailIist li").remove();
				
				getUserOpenapiList(1);
				
				doSearch({"openapiCategory":'', "openapiName":''});	
			},
			error : function(){}
		});
	} // of deleteUserOpenapi

	//userOpenapiList = Array();
	
	var apiInfo;
    var currentApiInfo = function(){
		
      $.ajax({
        type : 'get',
        dataType : 'json',
        url : '<c:url value="/currentApiInfo"/>',
        data : {
        },
        beforeSend : function(xhr){
          xhr.setRequestHeader('Content-Type', 'application/json');
        },
        complete : function(){
        },
        
        success : function(serverData){
        
          //alert("test1234");
          apiInfo = serverData.openapiInfo;
          //alert("openapiInfo" + apiInfo.openapiName);
          
          $("#openapiName").attr("value", apiInfo.openapiName);
          
          if(apiInfo.openapiUseType == 1)
        	  $("#openapiUseTypeRadio1").attr('checked', true);
          else if(apiInfo.openapiUseType == 2)
        	  $("#openapiUseTypeRadio2").attr('checked', true);
          
          if(apiInfo.openapiResultType == 1)
        	  $("#openapiResultTypeRadio1").attr('checked', true);       	  
          else if(apiInfo.openapiResultType == 2)
        	  $("#openapiResultTypeRadio2").attr('checked', true);        	  
          else if(apiInfo.openapiResultType == 3)
        	  $("#openapiResultTypeRadio3").attr('checked', true);        	  
          else if(apiInfo.openapiResultType == 4)
        	  $("#openapiResultTypeRadio4").attr('checked', true);
          
          $("#openapiProvider").attr("value", apiInfo.openapiProvider);
          $("#openapiComment").text(apiInfo.openapiComment);
          $("#openapiUseUrl").attr("value", apiInfo.openapiUseUrl);
          $("#openapiJoinUrl").attr("value", apiInfo.openapiJoinUrl);
          $("#openapiKeyword").attr("value", apiInfo.openapiKeyword);
          
          //alert("test1234");
          initCategoryEdit(apiInfo.openapiCategory);
        },
        error : function(jqXHR, textStatus, errorThrown){
        }
      });      
	} // of currentApiInfo()
	
	
	
	

	$(document).ready(function(){
	  printCategoryList();
	  //printCategoryChildList();

	  currentApiInfo();
	});

	</script>
</body>
</html>