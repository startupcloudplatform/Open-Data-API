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
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/board.css"/>" />

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
          <li><a href="<c:url value="/provider" />">오픈데이터 제공</a></li>
          <li class="current"><a href="<c:url value="/token" />">토큰 관리</a></li>
        </ul>
      </div><!-- //snb -->

      <h2 class="bookmark_title">토큰 관리</h2>      
<!--  <ul class="api_detailIist"></ul>  -->

      <table class="tb_token">
        <colgroup>
          <col style="width:5%">
          <col style="width:20%">
          <col style="width:20%">
          <col style="width:20%">
          <col style="width:20%">
          <col style="width:15%">
        </colgroup>

        <thead> 
          <tr>
            <th scope="col">번호</th>
            <th scope="col">오픈데이터 제공처</th>
            <th scope="col">토큰키</th>
            <th scope="col">오픈데이터</th>
            <th scope="col">파라미터</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
 
        <tbody class="board_row" id="tb_tokenList">

<!-- 
          <tr>
            <td>1</td>
            <td>공공데이터포털</td>
            <td>대기오염</td>
            <td>
              <ul>
                <li>aaaa</li>
                <li>bbbb</li>
              </ul>
            </td>
            <td>
              <ul>
                <li>x=1</li>
                <li>y=2</li>
              </ul>
            </td>
            <td>
              <ul>
                <li><p align="center"><button id="btn_reply_check">유효성 <br />체크</button></p></li>
                <li><p align="center"><button id="btn_reply_delete">삭제</button></p></li>
              </ul>
            </td>
          </tr>
 -->
<!--
          <tr>
            <td></td>
            <td><input type="text"></td>
            <td><input type="text"></td>
            <td>
              <select>
                <option>오픈 API 리스트</option>
              </select>
            </td>
            <td>
              <input type="text">
            </td>
            <td>
              <ul>
                <li><p align="center"><button id="btn_reply_add">토큰키<br />추가</button></p></li>
              </ul>
            </td>
          </tr>
          <tr>
            <td class="td_add"></td>
            <td class="td_add"><button type="button" class="btn_add">+</button></td>
            <td colspan="4" class="td_add"></td>
          </tr>
-->        
        </tbody>
      </table>


 <!--     
      <div class="membership_board">
      <form method="post" action="communityReplyInsert">
      <table class="tb_notice_reply_write" border="1">
        <colgroup>
          <col style="width:21%">
          <col style="width:22%">
          <col style="width:21%">
          <col style="width:21%">
          <col style="width:15%">
        </colgroup>
        
        <thead> 
          <tr>
            <th scope="col">오픈데이터 제공처</th>
            <th scope="col">오픈 API</th>
            <th scope="col">토큰키</th>
            <th scope="col">파라미터</th>
            <th scope="col"> </th>
          </tr>
        </thead>
        
        <tbody class="board_row">
          <tr>
            <td scope="col">
              <select>
                <option>공공데이터포털</option>
                <option>스마트시티데이터</option>
                <option>네이버 오픈API</option>   
              </select>
            </td>
            <td scope="col">
              <select>
                <option>대기오염</option>
                <option>실시간교통정보</option>
                <option>지도정보</option>                
              </select>
            </td>
            <td scope="col">
            


              <table>
                <tr>
                  <td><input type="text" name=""></td><td>=</td><td><input type="text" name=""></td>
                </tr>
                <tr>
                  <td><input type="text" name=""></td><td>=</td><td><input type="text" name=""></td>
                </tr>
              </table>
            
            </td>
            <td scope="col">
              
              <table>
                <tr>
                  <td><input type="text" name=""></td><td>=</td><td><input type="text" name=""></td>
                </tr>
                <tr>
                  <td><input type="text" name=""></td><td>=</td><td><input type="text" name=""></td>
                </tr>
              </table>
              
            </td>
            <td scope="col">
              <ul>
                <li><p align="center"><button id="btn_reply_add">토큰키<br />추가</button></p></li>
              </ul>
            </td>
          </tr>

        </tbody>
      </table>
      </form>
      </div>
  -->
      <table class="tb_token">
        <colgroup>
          <col style="width:10%">
          <col style="width:90%">
        </colgroup>
 
        <thead> 
          <tr>
            <th scope="col" colspan="2">유효성 체크 결과</th>
          </tr>
        </thead>

        <tbody class="board_row">
          <tr>
            <td>
            URL
            </td>
            <td>
            www.naver.com?a=1,b=2
            </td>
          </tr>
          <tr>
            <td>
            RESULT
            </td>
            <td>
            xml
            </td>
          </tr>
        </tbody>
      </table>

      <!--
      <div class="btm_btn">
        <button type="button" class="btn_confirm" id="btn_opendata_add">등록</button> <button type="button" class="btn_confirm" id="btn_opendata_delete">제거</button>
      </div>
      -->

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
    var insertToken = function(tokenKey, provider, openapiNo, parameter, userNo){
        $.ajax({
            type : 'get',
            dataType : "json",
            url : '<c:url value="/tokenList"/>',
            data : {
              "tokenKey": tokenKey,
              "provider": provider,
              "openapiNo": openapiNo,
              "parameter": parameter,
              "userNo": userNo
            },
            complete : function(){
            },
            success : function(serverData){
            },
    		error : function(){
    		}
          });
    } // of insertToken()
    
    
    var tokenFormNum = 1;
    var printTokenForm = function(){
      var html ='';

      html += ' <tr>';
      html += '   <td></td>';
      html += '   <td><input type="text"></td>';
      html += '   <td><input type="text"></td>';
      html += '   <td>';
      html += '     <select>';
      html += '       <option>오픈 API 리스트</option>';
      html += '     </select>';
      html += '   </td>';
      html += '   <td>';
      html += '     <input type="text">';
      html += '   </td>';
      html += '   <td>';
      html += '     <ul>';
      html += '       <li><p align="center"><button class="btn_reply_add" id="btn_reply_add'+tokenFormNum+'">토큰키<br />추가</button></p></li>';
      html += '     </ul>';
      html += '   </td>';
      html += ' </tr>';
      $("#tb_tokenList").append(html);

	  $("#btn_reply_add"+tokenFormNum).on("click", function(event){
	    //alert("test");
	    $("#tb_tokenList tr").remove();
        printTokenList();
	  });

	  tokenFormNum++;
	  
    } // of printTokenForm
    
    var printTokenList = function(userNo){
    	
      $.ajax({
        type : 'get',
        dataType : "json",
        url : '<c:url value="/tokenList"/>',
        data : {
          "userNo": userNo
        },
        complete : function(){
        },
        success : function(serverData) {
          var tokenList = serverData.tokenList;

          $(tokenList).each(function(tokenIndx){
            var html ='';
            html += '      <tr>';
            html += '        <td scope="col">'+tokenList[tokenIndx].tokenNo+'</td>';
            html += '        <td scope="col">'+tokenList[tokenIndx].provider+'</td>';

//            html += '        <td scope="col"> </td>';

            html += '        <td scope="col"><span>'+tokenList[tokenIndx].tokenKey+'</span></td>';

            html += '        <td scope="col">'+tokenList[tokenIndx].openapiNo+'</td>';
            html += '        <td scope="col">'+tokenList[tokenIndx].parameter+'</td>';
            html += '        <td scope="col">';
            html += '          <ul>';
            
            //html += '            <li><p align="center"><button id="btn_reply_check">유효성 <br />체크</button></p></li>';
            
            html += '            <li><p align="center"><button id="btn_reply_delete">삭제</button></p></li>';
            html += '          </ul>';
            html += '        </td>';
            html += '      </tr>';
            
            $("#tb_tokenList").append(html);
            
          }); // of $(tokenList).each()

          var html_bottom = '';
          html_bottom += ' <tr>';
          html_bottom += '   <td class="td_add"></td>';
          html_bottom += '   <td class="td_add"><button type="button" class="btn_add">+</button></td>';
          html_bottom += '   <td colspan="4" class="td_add"></td>';
          html_bottom += ' </tr>';

          $("#tb_tokenList").append(html_bottom);
  	      $(".btn_add").on("click", function(event){
	        printTokenForm();
	      });
        },
		error : function(){	
		}
      });
	} // of printTokenList()

	$(document).ready(function(){

		printTokenList("${sessionScope.SESSION_USER.userNo}");

		$("#btn_opendata_add").on("click", function(event){
			alert("등록");
			location.href = '<c:url value="/providerForm" />';
		});

		$("#btn_opendata_edit").on("click", function(event){
			alert("수정");
		});

		$("#btn_opendata_delete").on("click", function(event){
			alert("삭제");
		});

		$(".btn_bookmark_del").on("click", function(event){
			$(".snb_pop").hide();
		});

	});

	</script>
</body>
</html>