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
      
      <ul class="api_detailIist"></ul>
      
      <div class="btm_btn">
        <button type="button" class="btn_confirm" id="btn_opendata_add">등록</button> <button type="button" class="btn_confirm" id="btn_opendata_delete">제거</button>
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
	
	var apiList = Array();
	var doSearch = function(searchText){
		var userNo;
		
		if(searchText.userNo == 0)
		  userNo = -1;
		else
		  userNo = searchText.userNo;
		
		//alert("userNo : " + userNo);
		
		$.ajax({
			type : 'get',
			dataType : "json",
			url : '<c:url value="/apiList"/>',
			data : {
				"openapiName": searchText.openapiName,
				"openapiCategory" : searchText.openapiCategory,
				"userNo" : userNo
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
				html +='    <input type="checkbox" name="checkbox_api" id="checkbox'+api.openapiNo+'"><label for="">'+api.openapiName+'</label> <a href="'+api.openapiUseUrl+'">'+api.openapiUseUrl.split('?')[0]+'</a>';
				html +='    <div class="btns">';
				html +='      <a href="<c:url value="/providerEdit" />">';
				html +='      <button type="button" class="btn_detail_copy"  id="apiEdit'+api.openapiNo+'">수정</button>';
				html +='      </a>';
				html +='    </div>';
				html +='  </div>';  
				html +='  <div class="detailIist_cont">'+api.openapiComment+'</div>';  
				html +='  <div class="detailIist_info">';  
				html +='    <span>활용 :<strong>'+(api.openapiUseType==1?'FILE':'RESTful')+'</strong></span> <span>결과 :<strong>'+resultType+'</strong></span> <span>제공처 :<strong>'+api.openapiProvider+'</strong></span>';  
				html +='  </div>';
				html +='</li>';
				$(".api_detailIist").append(html);

				//setClickEventURL("button[id="+api.openapiNo+"]", api.openapiUseUrl);
				//setClickEventToken("button[id=token"+api.openapiNo+"]", api.openapiNo);

				$("#apiEdit"+api.openapiNo).on('click', function(event){
                  $.ajax({
                    type : 'get',
                    dataType : 'json',
                    url : '<c:url value="/providerEdit" />',
                    data : {
                      "openapiNo" : api.openapiNo
                    },
                    beforeSend : function(xhr){
                      xhr.setRequestHeader('Content-Type', 'application/json');
                    },
                    complete : function(){
                    },
                    success : function(serverData){
                    },
                    error : function(jqXHR, textStatus, errorThrown){
                    }
                  });
				}); // on('click', function(){});
		      }); // of $(apiList).each

				$(':checkbox[name="checkbox_api"]').on({
					click: function(e){
					},
					change: function(e){
						if($('input:checkbox[name="checkbox_api"]').is(":checked")){
							$("#btn_opendata_delete").css("background-color", "#8148de");

						}
						else{
							$("#btn_opendata_delete").css("background-color", "#c7d0d8");
						}
					}
				}); // checkbox event
				
			    $(".btn_cancel").on("click", function(event){
					//alert("사용해제");
					$('input:checkbox[name="checkbox_api"]').each(function(checkboxIdx) {
						//this.checked = true; //checked 처리
						if(this.checked){//checked 처리된 항목의 값
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

	var deleteOpenapi = function(openapiNo){
		
      alert("deleteOpenapi : " + openapiNo);
      
	  $.ajax({
	    type : 'get',
	    dataType : 'json',
	    url : '<c:url value="/openapiDelete"/>',
	    data : {
	      "openapiNo" : openapiNo
	    },
	    beforeSend : function(xhr){
		  xhr.setRequestHeader('Content-Type', 'application/json');
		},
		complete : function(){
		},
		success : function(serverData){
			
		  $(".api_detailIist li").remove();
		  doSearch({"openapiCategory":'', "openapiName":'', "userNo":"${sessionScope.SESSION_USER.userNo}"});
		  
        },
		error : function(jqXHR, textStatus, errorThrown){
		}
	  });	
	} // of deleteOpenapi

	$(document).ready(function(){
		//alert("${sessionScope.SESSION_USER.userNo}");
      $("#btn_opendata_delete").css("background-color", "#c7d0d8");
      
		$("#btn_opendata_add").on("click", function(event){
			//alert("등록");
			location.href = '<c:url value="/providerForm" />';
		});
		
		$("#btn_opendata_edit").on("click", function(event){
			alert("수정");
		});
		
		$("#btn_opendata_delete").on("click", function(event){
			alert("삭제");
	        $('input:checkbox[name="checkbox_api"]').each(function(checkboxIdx) {
	        	
	        	//alert("test " + checkboxIdx);
	        	var checkState = $("#checkbox"+apiList[checkboxIdx].openapiNo).is(":checked");
	        	var openapiNo = apiList[checkboxIdx].openapiNo;
	        	
	        	if(checkState){
	            	alert("openapiNo : " + openapiNo);
	                deleteOpenapi(openapiNo);
	            }
	        	
	        	/*
	            var checkState = $("#checkbox"+bookmarkApiList[checkboxIdx].openapiNo).is(":checked");  
	            var openapiNo = bookmarkApiList[checkboxIdx].openapiNo;
	            var bookmarkApiNo = bookmarkApiList[checkboxIdx].bookmarkOpenapiNo; 
	            
	            if(checkState){
	            	alert("bookmarkApiNo" + bookmarkApiNo);
	              //  deleteBookmarkApi(bookmarkApiNo);
	            }
	            */
	        });
			
		});

/*		
		$(".btn_edit").on("click", function(event){
			$(".snb_pop").show();
		});
*/

		$(".btn_bookmark_del").on("click", function(event){
			$(".snb_pop").hide();
		});
		
		//$(".api_detailIist li").remove();
		//getUserOpenapiList(1);
		
		doSearch({"openapiCategory":'', "openapiName":'', "userNo":"${sessionScope.SESSION_USER.userNo}"});
	});

	</script>
</body>
</html>