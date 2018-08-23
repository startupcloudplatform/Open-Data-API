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
        <a href="<c:url value="/"/>"><img src="<c:url value="/resources/images/logo.png"/>" alt="Open Data API Gateway"></a>
        <c:if test="${SESSION_USER.userId ne null && SESSION_USER.userId ne ''}">
          <div class="usermenu" style="width:90px;">
            <button type="button">
              <span class="btn_user"><c:out value="${SESSION_USER.userName}" /></span>
            </button>
            <ul>
              <li><a href="#">사용자 설정</a></li>
              <li><a href="#">로그아웃</a></li>
            </ul>
          </div>
        </c:if>
      </div>
    </div>
    <!-- //header_logo -->

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
    </div>
    <!-- //header_nav -->
  </header>

  <main class="main_snb">
  <div class="contentInner">
    <div class="snb">
      <h3>마이 오픈데이터</h3>
      <ul>
        <li><a href="myapi.html">MY OPEN API</a></li>
        <li>
          <div>
            <span>즐겨찾기</span>
            <button type="button" class="btn_add">+</button>
          </div>
          <ul class="bookmark_list">
<!-- 
            <li class="current"><a href="myapi_bookmark.html">나의 즐겨찾기 1</a>
              <button type="button" class="btn_edit">X</button>
              <div class="snb_pop">
                <button type="button" class="btn_bookmark_edit">이름바꾸기</button>
                <button type="button" class="btn_bookmark_del">삭제</button>
              </div></li>
            <li><a href="myapi_bookmark.html">나의 즐겨찾기 2</a>
              <button type="button" class="btn_edit">X</button>
            
              <div class="snb_pop">
                <button type="button" class="btn_bookmark_edit">이름바꾸기</button>
                <button type="button" class="btn_bookmark_del">삭제</button>
              </div></li>              
-->  
          </ul>
        </li>
      </ul>
    </div>
    <!-- //snb -->

    <h2 class="bookmark_title">
    </h2>
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
      <button type="button" class="btn_confirm">분류이동</button>
      <button type="button" class="btn_cancel">삭제</button>
    </div>
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

  <div class="popup" id="pop_bookmark_add">
    <h3>즐겨찾기 추가</h3>
    <div class="pop_cont_wrap">
      <div class="pop_cont">
        <div class="pop_cont_inner">
          <p>즐겨찾기 이름을 입력해 주세요.</p>
          <input type="text" id="bookmark_name" placeholder="이름을 입력해 주세요." value="">
        </div>
      </div>
      <div class="pop_btns">
        <button type="button" id="" class="btn_pop_cancel">취소</button>
        <button type="submit" id="" class="btn_pop_submit">확인</button>
      </div>
    </div>
  </div>

  <div class="popup" id="pop_bookmark_edit">
    <h3>이름 바꾸기</h3>
    <div class="pop_cont_wrap">
      <div class="pop_cont">
        <div class="pop_cont_inner">
          <p>이름을 입력해 주세요.</p>
          <input type="text" id="" placeholder="이름을 입력해 주세요." value="나의 즐겨찾기 1">
        </div>
      </div>
      <div class="pop_btns">
        <button type="button" id="" class="btn_pop_cancel">취소</button>
        <button type="submit" id="" class="btn_pop_submit">확인</button>
      </div>
    </div>
  </div>

  <div class="popup" id="pop_bookmark_del">
    <h3>삭제</h3>
    <div class="pop_cont_wrap">
      <div class="pop_cont">
        <div class="pop_cont_inner">
          <p>
            <strong>나의 즐겨찾기</strong>를 삭제하시겠습니까?
          </p>
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

  <script text="text/javascript">

    var printBookmarkApi = function(bookmarkName, bookmarkNo){
    	
    	//alert("printBookmarkApi : "+ bookmarkName);
    	$(".bookmark_title").text('');
    	$(".bookmark_title").append(bookmarkName);

        $.ajax({
          type : 'get',
          dataType : 'json',
          url : '<c:url value="/bookmarkOpenapiList"/>',
    	  data : {
    	  "bookmarkNo" : bookmarkNo
    	  },
    	  async: false,
    	  beforeSend : function(xhr){
    	    xhr.setRequestHeader('Content-Type', 'application/json');
    	  },
    	  complete : function(){
    	  },
    	  success : function(serverData){
    		bookmarkApiList = serverData.bookmarkOpenapiList;
    		
    	    $(bookmarkApiList).each(function(apiIndx){
    	    	
    	    	//alert("openapiNo" + bookmarkApiList[apiIndx].openapiNo);
    			$(".api_detailIist li").remove();
    	    	printApi(bookmarkApiList[apiIndx].openapiNo);
    	    	
    	    });
	      },
	      error : function(jqXHR, textStatus, errorThrown){
	      }
	    });

    } // of printBookmarkApi
    
    var printApi = function(openapiNo){
      $.ajax({
        type : 'get',
        dataType : "json",
        url : '<c:url value="/apiInfo"/>',
        data : {
          "openapiNo" : openapiNo
        },
        beforeSend : function(xhr) {
          xhr.setRequestHeader("Content-Type", "application/json");
        },
        complete : function() {
        },
        success : function(serverData) {
          console.log(serverData);
          var api = serverData.openapiInfo;
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
          
          //setClickEventURL("button[id="+api.openapiNo+"]", api.openapiUrl);
          //setClickEventToken("button[id=token"+api.openapiNo+"]", api.openapiNo);
          
				$(':checkbox[name="checkbox_api"]').on({
					click: function(e){
					},
					change: function(e){
						if($('input:checkbox[name="checkbox_api"]').is(":checked")){
							$(".btn_confirm").css("background-color", "#8148de");
							$(".btn_cancel").css("background-color", "#8148de");
						}
						else{
							$(".btn_confirm").css("background-color", "#c7d0d8");
							$(".btn_cancel").css("background-color", "#c7d0d8");
						}
					}
				}); // checkbox event
				
				$(".btn_confirm").on("click", function(event){
					$('input:checkbox[name="checkbox_api"]').each(function(checkboxIdx) {
						if(this.checked){//checked 처리된 항목의 값
							// 분류이동 작업
							alert(checkboxIdx);
						}
					});
				}); // $(".btn_confirm")
				
				$(".btn_cancel").on("click", function(event){
					$('input:checkbox[name="checkbox_api"]').each(function(checkboxIdx) {
						if(this.checked){//checked 처리된 항목의 값
							// 오픈데이터 정보를 즐겨찾기에서 제거작업
							alert(checkboxIdx);
						}
					});
				}); // $(".btn_cancel")
          
          },
          error : function(jqXHR, textStatus, errorThrown) {
          }
      }); // $.ajax    		
    } // of printApi

    bookmarkList = Array();
    var printBookmarkMenu = function(userNo){
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
			
			//alert("apiIndx > " + apiIndx);
			  
		    var html = "";
		    if(apiIndx == 0)
		    	html +='<li class="current">';
		    else
		    	html +='<li>';
		    	
		    html +='  <a href="#" class="bookmark_link" id="link_bookmark'+bookmarkList[apiIndx].bookmarkNo+'">' + bookmarkList[apiIndx].bookmarkName + '</a>';
		    html +='  <button type="button" class="btn_edit" id="btn_edit'+bookmarkList[apiIndx].bookmarkNo+'">test</button>';
		    html +='  <div class="snb_pop" id="snb_pop'+bookmarkList[apiIndx].bookmarkNo+'">';
		    html +='    <button type="button" class="btn_bookmark_edit" id="btn_bookmark_edit'+bookmarkList[apiIndx].bookmarkNo+'">이름바꾸기</button>';
		    html +='    <button type="button" class="btn_bookmark_del" id="btn_bookmark_del'+bookmarkList[apiIndx].bookmarkNo+'">삭제</button>';
		    html +='  </div>';
		    html +='</li>';
		    $(".bookmark_list").append(html);

			$("#link_bookmark"+bookmarkList[apiIndx].bookmarkNo).on("click", function(event) {
				//alert(bookmarkList[apiIndx].bookmarkName);
				//alert("#link_bookmark"+bookmarkList[apiIndx].bookmarkNo);
				printBookmarkApi(bookmarkList[apiIndx].bookmarkName, bookmarkList[apiIndx].bookmarkNo);
				
				// 즐겨찾기 메뉴 선택 표시
				$("li[class='current']").attr('class', '');
				$("#link_bookmark"+bookmarkList[apiIndx].bookmarkNo).parent().attr('class', 'current');
			});


			$("#btn_edit"+bookmarkList[apiIndx].bookmarkNo).on("click", function(event) {
				$("#snb_pop"+bookmarkList[apiIndx].bookmarkNo).show();
			});

			$("#btn_bookmark_edit"+bookmarkList[apiIndx].bookmarkNo).on("click", function(event) {
				$("#snb_pop"+bookmarkList[apiIndx].bookmarkNo).hide();
				
				  $("#pop_bookmark_edit").show();
				
			});
			
			$("#btn_bookmark_del"+bookmarkList[apiIndx].bookmarkNo).on("click", function(event) {
				$("#snb_pop"+bookmarkList[apiIndx].bookmarkNo).hide();
				
				deleteBookmarkMenu(bookmarkList[apiIndx].bookmarkNo);
				
				$(".bookmark_list li").remove();
				printBookmarkMenu("${sessionScope.SESSION_USER.userNo}");

			});
			
	  	  });
	    },
	    error : function(jqXHR, textStatus, errorThrown){
	    }
	  });
	} // of printBookmarkMenu
	
	
	
	var createBookmarkMenu = function(bookmarkName, userNo){
	
	  $.ajax({
	    type : 'get',
	    dataType : 'json',
        url : '<c:url value="/bookmarkCreate"/>',
        data : {
        	"bookmarkName" : bookmarkName,
        	"userNo" : userNo
		},
		beforeSend : function(xhr){
		  xhr.setRequestHeader('Content-Type', 'application/json');
		},
		complete : function(){
        },
		success : function(serverData){
		  if(serverData.bookmarkCreateResult == 1){
		    //alert("success");
		  }
		  else if(serverData.bookmarkCreateResult == 0){
		    //alert("fail");	
		  }
		},
		error : function(jqXHR, textStatus, errorThrown){
        }
	  });
	} // of createBookmarkMenu
	
	var deleteBookmarkMenu = function(bookmarkNo){
		  $.ajax({
		    type : 'get',
		    dataType : 'json',
	        url : '<c:url value="/bookmarkDelete"/>',
	        data : {
	        	"bookmarkNo" : bookmarkNo
			},
			async: false,
			beforeSend : function(xhr){
			  xhr.setRequestHeader('Content-Type', 'application/json');
			},
			complete : function(){
	        },
			success : function(serverData){
			  if(serverData.bookmarkDeleteResult == 1){
			    //alert("success");
			  }
			  else if(serverData.bookmarkDeleteResult == 0){
			    //alert("fail");
			  }
			},
			error : function(jqXHR, textStatus, errorThrown){
	        }
		  });
	} // of deleteBookmarkMenu
	
	$(document).ready(function(){
		
		printBookmarkMenu("${sessionScope.SESSION_USER.userNo}")

		$(".btn_add").on("click", function(event) {
		  $("#pop_bookmark_add").show();
		});
		
		$(".btn_pop_cancel").on("click", function(event) {
			
		  $("#pop_bookmark_edit").hide();
		  $("#pop_bookmark_add").hide();
		  
		});
		
		$(".btn_pop_submit").on("click", function(event) {
			
			var bookmarkName = $("#bookmark_name").val();
			
			createBookmarkMenu(bookmarkName, "${sessionScope.SESSION_USER.userNo}");
			$("#pop_bookmark_add").hide();
			
			$(".bookmark_list li").remove();
			printBookmarkMenu("${sessionScope.SESSION_USER.userNo}");
		});		
	});
  </script>

</body>

</html>