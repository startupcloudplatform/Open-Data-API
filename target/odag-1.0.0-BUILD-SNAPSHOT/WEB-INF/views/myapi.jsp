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
        </div><!-- //header_logo -->

        <div class="header_nav">
            <div class="contentInner">
                <nav>
                    <a href="<c:url value="/api"/>">오픈데이터</a>
                    <c:if test="${SESSION_USER.userId ne null && SESSION_USER.userId ne ''}">
                      <a href="<c:url value="/recommend"/>">오픈데이터 추천</a>
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
                    <li class="current"><a href="<c:url value="/myapi" />">MY OPEN API</a></li>
                    <li><a href="<c:url value="/myapi_bookmark" />">즐겨찾기</a></li>
                </ul>
            </div><!-- //snb -->

            <div class="api_search">
                <form method="">
                    <div class="api_search_option">
                        <div><select id="">
                            <option value="">전체</option>
                        </select></div>
                        <div><select id="">
                            <option value="">중분류</option>
                        </select></div>
                        <div><select id="">
                            <option value="">소분류</option>
                        </select></div>
                    </div>
                    <div class="api_search_input">
                        <div class="search_category">
                            <a href="#" class="cetegory_all">전체</a>
                            <a href="#" class="cetegory_mid">중분류</a>
                            <a href="#" class="cetegory_sub">소분류</a>
                        </div>
                        <div class="search_input">
                            <input type="text" id="" placeholder="검색어를 입력하세요.">
                            <button type="submit" id=""><span>Search</span></button>
                        </div>
                    </div>
                </form>
            </div><!-- //api_search -->

            <ul class="api_detailIist">
                <li>
                    <div class="detailIist_tit">
                        <input type="checkbox" id="">
                        <label for="">도로명주소조회서비스</label>
                        <a href="#">http://taas.koroad.or.kr/gis/mcm/mcl/initMap.do</a>
                        <div class="btns">
                            <button type="button">URL 복사</button>
                            <button type="button" class="btn_detail_copy">인증키 복사</button>
                        </div>
                    </div>
                    <div class="detailIist_cont">
                        우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부
                        에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.
                    </div>
                    <div class="detailIist_info">
                        <span>활용 :<strong>FILE</strong></span>
                        <span>결과 :<strong>TEXT</strong></span>
                        <span>제공처 :<strong>공공데이터포털</strong></span>
                    </div>
                </li>
                <li>
                    <div class="detailIist_tit">
                        <input type="checkbox" id="">
                        <label for="">도로명주소조회서비스</label>
                        <a href="#">http://taas.koroad.or.kr/gis/mcm/mcl/initMap.do</a>
                        <div class="btns">
                            <button type="button">URL 복사</button>
                            <button type="button" class="btn_detail_copy">인증키 복사</button>
                        </div>
                    </div>
                    <div class="detailIist_cont">
                        우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부
                        에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.
                    </div>
                    <div class="detailIist_info">
                        <span>활용 :<strong>FILE</strong></span>
                        <span>결과 :<strong>TEXT</strong></span>
                        <span>제공처 :<strong>공공데이터포털</strong></span>
                    </div>
                </li>
                <li>
                    <div class="detailIist_tit">
                        <input type="checkbox" id="">
                        <label for="">도로명주소조회서비스</label>
                        <a href="#">http://taas.koroad.or.kr/gis/mcm/mcl/initMap.do</a>
                        <div class="btns">
                            <button type="button">URL 복사</button>
                            <button type="button" class="btn_detail_copy">인증키 복사</button>
                        </div>
                    </div>
                    <div class="detailIist_cont">
                        우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부
                        에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.
                    </div>
                    <div class="detailIist_info">
                        <span>활용 :<strong>FILE</strong></span>
                        <span>결과 :<strong>TEXT</strong></span>
                        <span>제공처 :<strong>공공데이터포털</strong></span>
                    </div>
                </li>
                <li>
                    <div class="detailIist_tit">
                        <input type="checkbox" id="">
                        <label for="">도로명주소조회서비스</label>
                        <a href="#">http://taas.koroad.or.kr/gis/mcm/mcl/initMap.do</a>
                        <div class="btns">
                            <button type="button">URL 복사</button>
                            <button type="button" class="btn_detail_copy">인증키 복사</button>
                        </div>
                    </div>
                    <div class="detailIist_cont">
                        우정사업본부에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다. 우정사업본부
                        에서는 도로명주소 체계로 변경되는 새우편번호 및 기존 우편번호 정보를 조회하는 기능의 오픈API입니다.
                    </div>
                    <div class="detailIist_info">
                        <span>활용 :<strong>FILE</strong></span>
                        <span>결과 :<strong>TEXT</strong></span>
                        <span>제공처 :<strong>공공데이터포털</strong></span>
                    </div>
                </li>
            </ul>
            <div class="btm_btn">
                <button type="button" class="btn_cancel">사용해제</button>
            </div>
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

	userOpenapiList = Array();
	var getUserOpenapiList = function(userNo){
		$.ajax({
			type : 'get',
			dataType : "json",
			url : '<c:url value="/userOpenapiList"/>',
			data : {
				"userNo": userNo
			},
			async: false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Content-Type", "application/json");
			},
			complete : function() {
			},
			success : function(serverData) {
				userOpenapiList = serverData.userOpenapiList;
			},
			error : function(jqXHR, textStatus, errorThrown) {
			}
		});
	}
	
	apiList = Array();
	var doSearch = function(searchText){
		$.ajax({
	
			type : 'get',
			dataType : "json",
			url : '<c:url value="/apiList"/>',
			data : {
				"openapiName": searchText.openapiName,
				"openapiCategory" : searchText.openapiCategory
			},
			async: false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Content-Type", "application/json");
			},
			complete : function() {
			},
			success : function(serverData) {
				console.log(serverData);
				apiList = serverData.openapiList;

				$(apiList).each(function(apiIndx){
				
					var printState = 0;
					
					$(userOpenapiList).each(function(userOpenapiIndx){
						if(userOpenapiList[userOpenapiIndx].openapiNo == apiList[apiIndx].openapiNo){
							printState = 1;
						}
					});

					if(printState)
					{
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
						html +='    <input type="checkbox" name="checkbox_api" id=""><label for="">'+api.openapiName+'</label> <a href="'+api.openapiUrl+'">'+api.openapiUrl.split('?')[0]+'</a>';
						if(api.openapiUseType == 1){
							html += '<div class="btns">';
							html += '  <button type="button" class="btn_detail_download_'+api.openapiNo+'">다운로드</button>';
							html += '</div>';
						}else{
							if(api.use == true){
								html +='    <div class="btns">';  
								html +='      <span class="">사용신청완료</span>';
								html +='    </div>';                    
							}else{
								html +='    <div class="btns">';
								html +='      <button type="button" class="btn_detail_copy_url" id='+api.openapiNo+' >URL 복사</button>';  
								html +='      <button type="button" class="btn_detail_copy"  id=token'+api.openapiNo+' >인증키 복사</button>';
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

						setClickEventURL("button[id="+api.openapiNo+"]", api.openapiUrl);
						setClickEventToken("button[id=token"+api.openapiNo+"]", api.openapiNo);
					}
					
					//setClickEventURL("button[id="+api.openapiNo+"]", api.openapiUrl);
				});

				$(':checkbox[name="checkbox_api"]').on({
					click: function(e){
						//alert("checkbox click!");
					},
					change: function(e){
						if($('input:checkbox[name="checkbox_api"]').is(":checked")){
							//alert("checkbox on");
							$(".btn_cancel").css("background-color", "#8148de");
						}
						else{
							//alert("checkbox off");
							$(".btn_cancel").css("background-color", "#c7d0d8");
						}
					}
				}); // checkbox event
				
				$(".btn_cancel").on("click", function(event){
					//alert("사용해제");
					$('input:checkbox[name="checkbox_api"]').each(function(checkboxIdx) {
						//this.checked = true; //checked 처리
						if(this.checked){//checked 처리된 항목의 값
							alert(checkboxIdx);
							deleteUserOpenapi(userOpenapiList[checkboxIdx].userOpenapiNo);
							$(".api_detailIist li").remove();
							getUserOpenapiList(1);
						}
					});
				}); // $(".btn_cancel")
				
				
			},
			error : function(jqXHR, textStatus, errorThrown) {
			}
		}); // $.ajax
	} // of doSearch

	bookmarkList = Array();
	var printBookmarkMenu = function(userNo){
	  $.ajax({
	    type : 'get',
	    dataType : 'json',
	    url : '<c:url value="/bookmarkList"/>',
	    data : {
		"userNo" : userNo
	    },
	    beforeSend : function(xhr){
	      xhr.setRequestHeader('Content-Type', 'application/json');
	    },
	    complete : function(){
	    },
	    success : function(serverData){
		  bookmarkList = serverData.bookmarkList;

		  $(bookmarkList).each(function(apiIndx){
		    var html = "";
		    html +='<li>';
		    html +='  <a href="<c:url value="/myapi_bookmark" />" class="bookmark_link">' + bookmarkList[apiIndx].bookmarkName + '</a>';
		    html +='  <button type="button" class="btn_edit">X</button>';
		    html +='  <div class="snb_pop">';
		    html +='    <button type="button" class="btn_bookmark_edit">이름바꾸기</button>';
		    html +='    <button type="button" class="btn_bookmark_del">삭제</button>';
		    html +='  </div>';
		    html +='</li>';
		    
			$(".bookmark_list").append(html);
	  	  });
		  
		  
	    },
	    error : function(jqXHR, textStatus, errorThrown){
	    }
	  });
	} // of printBookmarkMenu
	
	
	
	
	
	
	$(document).ready(function(){
		//alert("${sessionScope.SESSION_USER.userNo}");
		
		
		$(".btn_edit").on("click", function(event){
			$(".snb_pop").show();
		});
		
		$(".btn_bookmark_edit").on("click", function(event){
			$(".snb_pop").hide();
		});
		
		$(".btn_bookmark_del").on("click", function(event){
			$(".snb_pop").hide();
		});	
		
		$(".api_detailIist li").remove();
		getUserOpenapiList(1);
		
		doSearch({"openapiCategory":'', "openapiName":''});
		
	});
	
	</script>
</body>
</html>