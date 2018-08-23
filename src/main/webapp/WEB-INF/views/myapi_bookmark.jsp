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
            <a href="<c:url value="/recommendPopular"/>">오픈데이터 추천</a>
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
        <li><a href="myapi.html">마이 오픈API</a></li>
        <li>
          <div>
            <span>즐겨찾기</span>
            <button type="button" class="btn_add">+</button>
          </div>
          <ul class="bookmark_list">
          </ul>
        </li>
        
        <c:choose>
        <c:when test="${sessionScope.SESSION_USER.userType eq 0 or sessionScope.SESSION_USER.userType eq 2}">
        <li><a href="<c:url value="/provider" />">오픈데이터 제공</a></li>
        </c:when>
        </c:choose>
        
        <!--<li><a href="<c:url value="/token" />">토큰 관리</a></li>-->
      </ul>
    </div>
    <!-- //snb -->

    <h2 class="bookmark_title"></h2>
    <ul class="api_detailIist"></ul>

    <div class="btm_btn">
      <button type="button" class="btn_confirm" id="btn_category_change">분류이동</button>
      <button type="button" class="btn_cancel" id="btn_openapi_delete">삭제</button>
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
        <button type="submit" id="btn_bookmark_add_confirm" class="btn_pop_submit">확인</button>
      </div>
    </div>
  </div>

  <div class="popup" id="pop_bookmark_edit">
    <h3>이름 바꾸기</h3>
    <div class="pop_cont_wrap">
      <div class="pop_cont">
        <div class="pop_cont_inner">
          <p>이름을 입력해 주세요.</p>
          <input type="text" id="bookmark_edit_form" placeholder="이름을 입력해 주세요." value="">
        </div>
      </div>
      <div class="pop_btns">
        <button type="button" id="" class="btn_pop_cancel">취소</button>
        <button type="submit" id="btn_bookmark_edit_confirm" class="btn_pop_submit">확인</button>
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

  <div class="popup" id="popup_bookmark_change">
    <h3>분류이동</h3>
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
        <button type="button" id="btn_bookmark_change_cancel" class="btn_pop_cancel">취소</button>
        <button type="button" id="btn_bookmark_change_submit" class="btn_pop_submit">확인</button>
      </div>
    </div>
  </div>

  <script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.script.js"/>"></script>

  <script text="text/javascript">

    var bookmarkApiList = Array();
    var printBookmarkApi = function(bookmarkName, bookmarkNo){
    	
    	$(".api_detailIist li").remove();
    	
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
    			//$(".api_detailIist li").remove();
    	    	printApi(bookmarkApiList[apiIndx].openapiNo);
    	    	
    	    });
	      },
	      error : function(jqXHR, textStatus, errorThrown){
	      }
	    });

    } // of printBookmarkApi

    var deleteBookmarkApi = function(bookmarkOpenapiNo){
    	
    	//alert("deleteBookmarkApi : " + bookmarkOpenapiNo);
    	
        $.ajax({
            type : 'get',
            dataType : 'json',
            url : '<c:url value="/bookmarkOpenapiDelete"/>',
      	  data : {
      	  "bookmarkOpenapiNo" : bookmarkOpenapiNo
      	  },
      	  beforeSend : function(xhr){
      	    xhr.setRequestHeader('Content-Type', 'application/json');
      	  },
      	  complete : function(){
      	  },
      	  success : function(serverData){
      		  
      		printBookmarkApi(currentBookmarkName, currentBookmarkNo);

  	      },
  	      error : function(jqXHR, textStatus, errorThrown){
  	      }
  	    });
    } // deleteBookmarkApi

	var currentBookmarkName;
	var currentBookmarkNo;
    var printApi = function(openapiNo){
      $.ajax({
        type : 'get',
        dataType : "json",
        url : '<c:url value="/apiInfo"/>',
        data : {
          "openapiNo" : openapiNo
        },
  		async: false,
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
		  html +='    <input type="checkbox" name="checkbox_api" id="checkbox'+api.openapiNo+'"><label for="">'+api.openapiName+'</label> <a href="'+api.openapiUseUrl+'">'+api.openapiUseUrl.split('?')[0]+'</a>';
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
          
          //setClickEventURL("button[id="+api.openapiNo+"]", api.openapiUseUrl);
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
							//alert(checkboxIdx);
						}
					});
				}); // $(".btn_confirm")
				/*
				$(".btn_cancel").on("click", function(event){
					$('input:checkbox[name="checkbox_api"]').each(function(checkboxIdx) {
						
						var checkState = $("#checkbox"+api.openapiNo).is(":checked");
						
						if(checkState){
							alert(api.openapiNo);
						}
						
						
						if(this.checked){//checked 처리된 항목의 값
							// 오픈데이터 정보를 즐겨찾기에서 제거작업
							//alert(checkboxIdx);
						}
					});
				}); // $(".btn_cancel")
                */
          },
          error : function(jqXHR, textStatus, errorThrown) {
          }
      }); // $.ajax
    } // of printApi

    var bookmarkEdit;
    var bookmarkList = Array();
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
		    if(apiIndx == 0){
		    	html +='<li class="current">';		    	
		    	printBookmarkApi(bookmarkList[0].bookmarkName, bookmarkList[0].bookmarkNo);
		    }
		    else{
		    	html +='<li>';
		    }
		    
		    html +='  <a href="#" class="bookmark_link" id="link_bookmark'+bookmarkList[apiIndx].bookmarkNo+'">' + bookmarkList[apiIndx].bookmarkName + '</a>';
		    html +='  <button type="button" class="btn_edit" id="btn_edit'+bookmarkList[apiIndx].bookmarkNo+'">test</button>';
		    html +='  <div class="snb_pop" id="snb_pop'+bookmarkList[apiIndx].bookmarkNo+'">';
		    html +='    <button type="button" class="btn_bookmark_edit" id="btn_bookmark_edit'+bookmarkList[apiIndx].bookmarkNo+'">이름바꾸기</button>';
		    html +='    <button type="button" class="btn_bookmark_del" id="btn_bookmark_del'+bookmarkList[apiIndx].bookmarkNo+'">삭제</button>';
		    html +='  </div>';
		    html +='</li>';
		    $(".bookmark_list").append(html);

			$("#link_bookmark"+bookmarkList[apiIndx].bookmarkNo).on("click", function(event) {
				
				currentBookmarkName = bookmarkList[apiIndx].bookmarkName;
				currentBookmarkNo = bookmarkList[apiIndx].bookmarkNo;
				
				printBookmarkApi(currentBookmarkName, currentBookmarkNo);
				
				//printBookmarkApi(bookmarkList[apiIndx].bookmarkName, bookmarkList[apiIndx].bookmarkNo);
				
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
				  bookmarkEdit = bookmarkList[apiIndx].bookmarkNo;
			});
			
			$("#btn_bookmark_del"+bookmarkList[apiIndx].bookmarkNo).on("click", function(event) {
				$("#snb_pop"+bookmarkList[apiIndx].bookmarkNo).hide();
				
				//alert("bookmark menu delete");
				
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
	

    var printBookmarkPopup = function(){
		
	  $("#pop_bookmarklist option").remove();
	  
	  $(bookmarkList).each(function(apiIndx){
	    var html = "";	
	  	html +='<option value="'+bookmarkList[apiIndx].bookmarkNo+'">'+bookmarkList[apiIndx].bookmarkName+'</option>';
	  	$("#pop_bookmarklist").append(html);	    
	  });
	} // of printBookmarkPopup
	
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
			success : function(){
				
			  //$(".bookmark_list li").remove();
			  
			  //alert("test");
			  /*
			  if(serverData.bookmarkDeleteResult == 1){
			    //alert("success");
			  }
			  else if(serverData.bookmarkDeleteResult == 0){
			    //alert("fail");
			  }
			  */

			  //printBookmarkMenu("${sessionScope.SESSION_USER.userNo}");
			  
			},
			error : function(jqXHR, textStatus, errorThrown){
	        }
		  });
	} // of deleteBookmarkMenu

	var updateBookmarkMenu = function(bookmarkNo, bookmarkName){
		  $.ajax({
		    type : 'get',
		    dataType : 'json',
	        url : '<c:url value="/bookmarkUpdate"/>',
	        data : {
	        	"bookmarkNo" : bookmarkNo,
	        	"bookmarkName" : bookmarkName
			},
			beforeSend : function(xhr){
			  xhr.setRequestHeader('Content-Type', 'application/json');
			},
			complete : function(){
	        },
			success : function(serverData){
				//printBookmarkApi(currentBookmarkName, currentBookmarkNo);
				$(".bookmark_list li").remove();
				printBookmarkMenu("${sessionScope.SESSION_USER.userNo}");
			},
			error : function(jqXHR, textStatus, errorThrown){
	        }
		  });
    } // of updateBookmarkMenu

    var updateBookmarkApi = function(bookmarkApiNo, bookmarkNo){
	  $.ajax({
        type : 'get',
        dataType : 'json',
        url : '<c:url value="/bookmarkOpenapiUpdate"/>',
        data : {
          "bookmarkOpenapiNo" : bookmarkApiNo,
          "bookmarkNo" : bookmarkNo
        },
        beforeSend : function(xhr){
          xhr.setRequestHeader('Content-Type', 'application/json');
        },
        complete : function(){
        },
        success : function(serverData){
          printBookmarkApi(currentBookmarkName, currentBookmarkNo);
        },
        error : function(jqXHR, textStatus, errorThrown){
        }
      });
    } // of updateBookmarkApi
    
    
    $(document).ready(function(){
    
      $(".btn_confirm").css("background-color", "#c7d0d8");
      $(".btn_cancel").css("background-color", "#c7d0d8");  
    	
      printBookmarkMenu("${sessionScope.SESSION_USER.userNo}");
      
      $(".btn_add").on("click", function(event) {
        $("#pop_bookmark_add").show();
      });

      $(".btn_pop_cancel").on("click", function(event) {
        $("#pop_bookmark_edit").hide();
        $("#pop_bookmark_add").hide();		  
      });

      // 즐겨찾기 카테고리 메뉴 생성 - btn_bookmark_add_confirm
      $("#btn_bookmark_add_confirm").on("click", function(event) {
        var bookmarkName = $("#bookmark_name").val();
        createBookmarkMenu(bookmarkName, "${sessionScope.SESSION_USER.userNo}");

        $("#pop_bookmark_add").hide();
        $(".bookmark_list li").remove();
        printBookmarkMenu("${sessionScope.SESSION_USER.userNo}");
      });

      // 즐겨찾기 카테고리 메뉴 이름 바꾸기- btn_bookmark_edit_confirm
      $("#btn_bookmark_edit_confirm").on("click", function(event) {
    	  
    	var bookmarkName = $("#bookmark_edit_form").val();
    	
        //alert("bookmarkName"+bookmarkName);

        updateBookmarkMenu(bookmarkEdit, bookmarkName);

        $("#pop_bookmark_edit").hide();

      });

      // 즐겨찾기 내 오픈api 관리
      $("#btn_category_change").on("click", function(event) {
    	printBookmarkPopup();
    	$("#popup_bookmark_change").show();
      });

      $("#btn_bookmark_change_submit").on("click", function(event) {
    	  $("#popup_bookmark_change").hide();
    	  
    	  $('input:checkbox[name="checkbox_api"]').each(function(checkboxIdx) {    	  
          var checkState = $("#checkbox"+bookmarkApiList[checkboxIdx].openapiNo).is(":checked");  
          var openapiNo = bookmarkApiList[checkboxIdx].openapiNo;
          var bookmarkApiNo = bookmarkApiList[checkboxIdx].bookmarkOpenapiNo; 
          var bookmarkNo = $("#pop_bookmarklist option:selected").val();
          
          if(checkState){
            //alert("bookmarkApiNo" + bookmarkApiNo);
            updateBookmarkApi(bookmarkApiNo, bookmarkNo);
          }
        });
      });

      $("#btn_openapi_delete").on("click", function(event) {

        $('input:checkbox[name="checkbox_api"]').each(function(checkboxIdx) {

          var checkState = $("#checkbox"+bookmarkApiList[checkboxIdx].openapiNo).is(":checked");
          var openapiNo = bookmarkApiList[checkboxIdx].openapiNo;
          var bookmarkApiNo = bookmarkApiList[checkboxIdx].bookmarkOpenapiNo;
          
          if(checkState){
        	//alert("bookmarkApiNo" + bookmarkApiNo);
            deleteBookmarkApi(bookmarkApiNo);
          }
   
        });
      });
    }); // of $(document).ready()
  </script>

</body>

</html>