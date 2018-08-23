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
            <li><a href="<c:url value="/introduce" />" >ODAG 소개</a></li>
            <li class="current"><a href="<c:url value="/notice" />" >공지사항</a></li>
            <li><a href="<c:url value="/community" />" >커뮤니티</a></li>  
          </ul>
        </div><!-- //snb -->

        <h2 class="bookmark_title">공지사항</h2>

        <div class="membership_board">

          <form method="post" action="noticeInsert">
            <table width="100%" border="1">
              <colgroup>
                <col style="width: 10%">
                <col style="width: 67%">
                <col style="width: 10%">
                <col style="width: 13%">
              </colgroup>
              <tbody>
                <tr>
                  <th scope="row">제목</th>
                  <td colspan="3"><input name="noticeTitle" type="text" id=""></td>
                </tr>

                <tr>
                  <th scope="row">공지 대상</th>
                    <td>
                        <label for=""><input type="checkbox" />오픈데이터제공처 관리자</label>&nbsp;
                        <label for=""><input type="checkbox" />창업자</label>&nbsp;
                        <label for=""><input type="checkbox" />일반사용자</label>&nbsp;
                    </td>
                    <th scope="row">공개 기간</th>
                    <td><div class="notice_period"><input type="text"/>일</div></td>
                </tr>


                <tr>
                  <td colspan="4" height="500px"><textarea name="noticeContents" id="noticeContents"></textarea></td>
                </tr>

              </tbody>
            </table>
            
            <div class="btm_btn">
                <button type="submit" class="btn_confirm">작성 완료</button>
            </div>           

	      </form>
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

  <script type="text/javascript">
    $(document).ready(function(){
      $(".btn_confirm").on("click", function(event){
    	  
        //var str = $("#noticeContents").val();
        //str.replace(/a/gi, 'b');
        //alert(str);

        // str.replace(/#/gi, ""); 
        //contents.replace('a', 'b');
       // alert(contents);
        
       // $(".noticeContents").text(str);
      });
    });	
  </script>

</body>
</html>