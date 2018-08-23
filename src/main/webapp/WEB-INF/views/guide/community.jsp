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
                      <a href="<c:url value="/myapi" />">마이 오픈데이터</a>
                    </c:if>
                    <a href="<c:url value="/introduce" />" class="current">서비스 안내</a>
                </nav>
            </div>
    </div><!-- //header_nav -->
  </header>

  <main class="main_snb">
    <div class="contentInner">
      <div class="snb">
        <h3>서비스 안내</h3>
          <ul> 
            <li ><a href="<c:url value="/introduce" />" >ODAG 소개</a></li>
            <li><a href="<c:url value="/notice" />" >공지사항</a></li>
            <li class="current"><a href="<c:url value="/community" />" >커뮤니티</a></li>  
          </ul>
      </div><!-- //snb -->

      <table class="tb_notice">
        <colgroup>
          <col style="width:10%">
          <col>
          <col style="width:12%">
          <col style="width:12%">
          <col style="width:13%">
        </colgroup>
        <thead>
          <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">조회수</th>
            <th scope="col">등록자</th>
            <th scope="col">등록일</th>
          </tr>
        </thead>
        <tbody class="board_row">
        </tbody>
      </table>
      
	  <div id="page_btn" class="btn_paging" align="center">
	  </div>
	  
      <div class="btm_btn">
        <button type="button" class="btn_confirm" id="btn_community_add">글작성</button>
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

  <script text="text/javascript">

  var printPagingButton = function(currentPageGroupNum) {
    $("#page_btn button").remove();
      
    $.ajax({
      type : 'get',
      dataType : 'json',
      url : '<c:url value="/communityPageGroupList"/>',
      data : {
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
  
        var communityPageList = serverData.communityGroupPageList
        var communityPageLast = serverData.communityPageLast;
        var communityDirection = serverData.communityDirection;

		var total = $(communityPageList).length;        
        $(communityPageList).each(function(communityPageIdx) {
          html = '';
          
          if('${sessionScope.SESSION_USER_CURRENT_COMMUNITY_PAGE}' == communityPageList[communityPageIdx]) {
            html += '<button class="current" id="page'+communityPageList[communityPageIdx]+'">'+communityPageList[communityPageIdx]+'</button>';
          }
          else{
            html += '<button id="page'+communityPageList[communityPageIdx]+'">'+communityPageList[communityPageIdx]+'</button>';
          }

          $("#page_btn").append(html);
        	
  	  	  $("#page"+communityPageList[communityPageIdx]).on("click", function(event) {  
    	    $("button[class='current']").attr('class', '');
    	    $("#page"+communityPageList[communityPageIdx]).attr('class', 'current');
   		    printCommunityGroupList(communityPageList[communityPageIdx]);
   	      });
  			
          if(communityDirection==1 && communityPageIdx==0) {
      	    $("button[class='current']").attr('class', '');
    	    $("#page"+communityPageList[communityPageIdx]).attr('class', 'current');
    	    printCommunityGroupList(communityPageList[communityPageIdx]);
          }
          else if(communityDirection==2 && communityPageIdx==total-1){
        	$("button[class='current']").attr('class', '');
        	$("#page"+communityPageList[communityPageIdx]).attr('class', 'current');
        	printCommunityGroupList(communityPageList[communityPageIdx]);
          }
  			
        }); // of $(communityPageList).each()

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
  
  communityList = Array();  
  var printCommunityList = function() {
	  
      //alert("printBoard");
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
            var html = "";
            html += '<tr>';
            html += '  <td scope="col" align="center">';
            html += '    <div>'+communityList[communityIdx].communityNo+'</div>';
            html += '  </td>';
            html += '  <td scope="col">';
            html += '    <div><a href="/communityDetail?communityNo='+communityList[communityIdx].communityNo+'" id="community'+communityList[communityIdx].communityNo+'">'+communityList[communityIdx].communityTitle+'</a></div>';
            html += '  </td>';
            html += '  <td scope="col" align="center">';
            html += '    <div>'+communityList[communityIdx].count+'</div>';
            html += '  </td>';
            html += '  <td scope="col" align="center">';
            html += '    <div>'+communityList[communityIdx].createUserNo+'</div>';
            html += '  </td>';
            html += '  <td scope="col" align="center">';
            html += '    <div>'+communityList[communityIdx].createTime+'</div>';
            html += '  </td>';
            html += '</tr>';
            //$("#board_row tr").remove();            
            $(".board_row").append(html);

			// 게시판 제목 클릭 이벤트 처리 함수
			$("#communiry"+communityList[communityIdx].communiryNo).on("click", function(event) {
				//alert("");
			});

          });	
        },
        error : function(jqXHR, textStatus, errorThrown){
        }
      });
    }

  var printCommunityGroupList = function(currentCommunityGroupNum) {
      $(".board_row tr").remove();
      
      $.ajax({
        type : 'get',
        dataType : 'json',
        url : '<c:url value="/communityGroupList"/>',
        data : {
        	currentCommunityGroupNum : currentCommunityGroupNum
        },
        beforeSend : function(xhr){
          xhr.setRequestHeader('Content-Type', 'application/json');
        },
        complete : function(){
        },
        success : function(serverData){
          communityList = serverData.communityGroupList;
          $(communityList).each(function(communityIdx) {
            var html = "";
            html += '<tr>';
            html += '  <td scope="col" align="center">';
            html += '    <div>'+communityList[communityIdx].communityNo+'</div>';
            html += '  </td>';
            html += '  <td scope="col">';
            html += '    <div><a href="/communityDetail?communityNo='+communityList[communityIdx].communityNo+'" id="community'+communityList[communityIdx].communityNo+'">'+communityList[communityIdx].communityTitle+'</a></div>';
            html += '  </td>';
            html += '  <td scope="col" align="center">';
            html += '    <div>'+communityList[communityIdx].count+'</div>';
            html += '  </td>';
            html += '  <td scope="col" align="center">';
            html += '    <div>'+communityList[communityIdx].createUserNo+'</div>';
            html += '  </td>';
            html += '  <td scope="col" align="center">';
            html += '    <div>'+communityList[communityIdx].createTime+'</div>';
            html += '  </td>';
            html += '</tr>';

            //$("#board_row tr").remove();            
            $(".board_row").append(html);
              
  			// 게시판 제목 클릭 이벤트 처리 함수
  			$("#community"+communityList[communityIdx].communityNo).on("click", function(event) {
  		      //alert("");
  	        });
  			
          });
        },
        error : function(jqXHR, textStatus, errorThrown){
        }
      });
    } // of printCommunityList()

  
    $(document).ready(function(){

      //printCommunityList();
      printPagingButton(0);
      $("#btn_community_add").on("click", function(event){
        location.href = '<c:url value="/communityForm" />';
      });
    });
  </script>
</body>
</html>