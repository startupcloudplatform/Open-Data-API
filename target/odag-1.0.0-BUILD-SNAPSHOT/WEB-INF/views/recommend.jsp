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
                <li><a href="#">사용자 설정</a></li>
                <li><a href="<c:url value="/logout" />">로그아웃</a></li>
              </ul>
            </div>
          </c:when>
          <c:otherwise>
            <div class="usermenu" style="width:90px;">
              <button type="button">
                <span class="btn_user"><a href="<c:url value="/login"/>"><c:out value="${sessionScope.SESSION_USER.userName}" /></a></span>
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
            <a href="<c:url value="/recommend"/>" class="current">오픈데이터 추천</a>
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
        <li class="current"><a href="#">내 산업군 인기 오픈데이터</a></li>
        <!-- 
        <li><a href="#">키워드 기반 API 추천</a></li>
        <li><a href="#">함께 사용되는 API 추천</a></li>
        <li><a href="#">사용자 행위 기반 API 추천</a></li>
        -->
      </ul>
    </div>
    <!-- //snb -->

    <h2 class="">내 산업군 인기 오픈데이터</h2>
    <ul class="api_detailIist">
<!--  
      <li>
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
      </li>
-->      
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
	var doSearch = function(searchText){
		$.ajax({
			type : 'get',
			dataType : "json",
			url : '<c:url value="/apiList"/>',
			data : {
				"openapiName": searchText.openapiName,
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
				$(apiList).each(function(apiIndx){
					
					//alert("list");
					
					var api = apiList[apiIndx];
					var resultType = "";
					if(api.openapiResultType == 1){
						resultType = "CSV";
					}else if(api.openapiResultType == 2){
						resultType = "XML";
					}else if(api.openapiResultType == 3){
						resultType = "JSON";
					}else if(api.openapiResultType == 4){
						resultType = "ZIP";
					}
					var html = "";
					html +='<li>';  
					html +='  <div class="detailIist_tit">';  
					html +='    <input type="checkbox" id=""><label for="">'+api.openapiName+'</label> <a href="'+api.openapiUrl+'">'+api.openapiUrl.split('?')[0]+'</a>';
					if(api.openapiUseType == 1){
						html += '<div class="btns">';
						html += '<a class="download_link" href="'+api.openapiUrl+'"> <button type="button" id='+api.openapiNo+' class="btn_detail_download">다운로드</button></a>';
						html += '</div>';
					}else{
						if(api.use == true){
							html +='    <div class="btns">';  
							html +='      <span class="">사용신청완료</span>';  
							html +='    </div>';       
						}else{
							html +='    <div class="btns">';
							html +='      <button type="button" id='+api.openapiNo+' class="btn_detail_app">사용신청</button>';  
							html +='    </div>';
						}
					}
					html +='  </div>';  
					html +='  <div class="detailIist_cont">'+api.openapiComment+'</div>';  
					html +='  <div class="detailIist_info">';  
					html +='    <span>활용 :<strong>'+(api.openapiUseType==1?'FILE':'RESTful')+'</strong></span> <span>결과 :<strong>'+resultType+'</strong></span> <span>제공처 :<strong>'+api.openapiProvider+'</strong></span>';  
					html +='  </div>';
					html +='</li>';
					$(".api_detailIist").append(html);
					
					if(api.openapiUseType == 1){
						setClickEventDownload("button[id="+api.openapiNo+"]", api.openapiUrl);
					}
					else{
						setClickEventUse("button[id="+api.openapiNo+"]", api, 1);
					}
					
					//$(".download_link").removeAttr('style');
					//$(".download_link").css("background-color", color);
					
					
				});
			},
			error : function(jqXHR, textStatus, errorThrown) {
			}
		}); // $.ajax
	} // of doSearch
	
	$(document).ready(function() {
		$(".api_detailIist li").remove();
		doSearch({"openapiCategory": '', "openapiName": ''});
	});
	
  </script>
</body>

</html>