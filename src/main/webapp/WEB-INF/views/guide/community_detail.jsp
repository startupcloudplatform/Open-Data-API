<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/normalize.css" />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/font.css" />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/swiper.min.css" />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/style.css" />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/board.css"/>" />
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
					<a href="<c:url value="/api"/>">오픈데이터</a>
					<c:if
						test="${SESSION_USER.userId ne null && SESSION_USER.userId ne ''}">
						<a href="<c:url value="/recommendPopular"/>">오픈데이터 추천</a>
						<a href="<c:url value="/myapi" />">마이 오픈데이터</a>
					</c:if>
					<a href="<c:url value="/introduce" />" class="current">서비스 안내</a>
				</nav>
			</div>
		</div>
		<!-- //header_nav -->
	</header>

  <main class="main_snb">
    <div class="contentInner">
      <div class="snb">
        <h3>서비스 안내</h3>
        <ul>
          <li><a href="<c:url value="/introduce" />">ODAG 소개</a></li>
          <li><a href="<c:url value="/notice" />">공지사항</a></li>
          <li class="current"><a href="<c:url value="/community" />">커뮤니티</a></li>
        </ul>
      </div>
      <!-- //snb -->
		
		<!-- 카뮤니티 상세 출력 테이블 -->

      <table class="tb_notice_read">
        <colgroup>
          <col style="width: 10%">
          <col style="width: 67%">
          <col style="width: 10%">
          <col style="width: 15%">
        </colgroup>
        <tbody>
		  <tr class="tr_tit">
		    <th scope="row">제목</th>
		    <td id="communityTitle">제목 글</td>
		    <th scope="row" >등록일</th>
		    <td id="createTime">등록일 내용</td>
		  </tr>
		  <tr class="tr_body">
		    <td colspan="4" id="communityContents">본문 글</td>
		  </tr>
		  <tr>
		    <th scope="row">이전글</th>
		  <td colspan="3">이전글 제목</td>
		  </tr>
		  <tr>
		  <th scope="row">다음글</th>
		    <td colspan="3">다음글 제목</td>
		  </tr>
		</tbody>	
      </table>

      <!-- 댓글 리스트 출력 테이블 -->
      <table class="tb_notice_reply_list">
        <colgroup>
          <col style="width: 10%">
          <col style="width: 67%">
          <col style="width: 10%">
          <col style="width: 13%">
        </colgroup>
        <tbody class="communityReplyListTable">
        </tbody>
      </table>
		
      <!-- 댓글 추가 폼 테이블 -->
      <div class="membership_board">
        <form method="post" action="communityReplyInsert">
          <table class="tb_notice_reply_write">
            <colgroup>
              <col style="width: 10%">
              <col style="width: 67%">
              <col style="width: 10%">
              <col style="width: 13%">
            </colgroup>
            <tbody>
              <tr>
                <td>${sessionScope.SESSION_USER.userName}</td>
                <td colspan="2" height="100px"><textarea id="communityReplyContents"></textarea></td>
                <td><button type="button" id="btn_reply_add">댓글 추가</button></td>
              </tr>  
            </tbody>
          </table>
        </form>
      </div>
      
      <div class="btm_btn">
        <button type="button" class="btn_confirm" id="btn_list">목록</button>
        <button type="button" class="btn_confirm" id="btn_edit">수정</button>
        <button type="button" class="btn_confirm" id="btn_delete">삭제</button>
      </div>
    </div>
	<!-- //contentInner --> </main>

	<footer>
		<div class="contentInner">
			<h1>
				<img src="<c:url value="/resources/images/logo_footer.png"/>"
					alt="Cloudit Knowledge Base">
			</h1>
			<div class="footer_menu">
				<a href="#">개인정보취급방침</a> <a href="#">오시는길</a> <a href="#">사이트맵</a>
			</div>
			<address>
				<p>서울시 서초구 강남대로 623, 10층 ( 서울시 서초구 잠원동 12-5, 우일빌딩 )</p>
				<p>
					TEL : 02. 516. 5990<span>/</span>FAX : 02. 516. 5997
				</p>
				<p class="copyright">COPYRIGHT 2018 innogrid. All right
					reserved.</p>
			</address>
		</div>
	</footer>

	<script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
	<script src="<c:url value="/resources/js/jquery.script.js"/>"></script>

	<script text="text/javascript">
	
	    var communityInfo;
		var printCommunityDetail = function() {

			$.ajax({
				type : 'get',
				dataType : 'json',
				url : '<c:url value="/communityInfo"/>',
				data : {},
				beforeSend : function(xhr) {
					xhr.setRequestHeader('Content-Type', 'application/json');
				},
				complete : function() {
				},
				success : function(serverData) {
					communityInfo = serverData.communityInfo;

					$("#communityTitle").text(communityInfo.communityTitle);
					$("#communityContents").html(communityInfo.communityContents.replace(/\n/g, '<br>'));
					$("#createTime").text(communityInfo.createTime);
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
		}
		
        var communityReplyList = new Array();
	    var printCommunityReply = function() {
	    	
			$.ajax({
				type : 'get',
				dataType : 'json',
				url : '<c:url value="/communityReplyList"/>',
				data : {
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader('Content-Type', 'application/json');
				},
				complete : function() {
				},
				success : function(serverData) {
					communityReplyList = serverData.communityReplyList;
					
		            $(communityReplyList).each(function(categoryReplyIdx) {

		            	var html = "";
		            	html += '<tr>';		            	
		            	html += '  <td id="creteUserNo" >'+communityReplyList[categoryReplyIdx].createUserName+'</td>';
		            	html += '  <td id="communityTitle" colspan="2">'+communityReplyList[categoryReplyIdx].communityReplyContents+'</td>';
				        html += '  <td id="createTime">'+communityReplyList[categoryReplyIdx].createTime+'<br><button type="button">수정</button><button type="button">제거</button></td>';
		            	html += '</tr>';
		            	
		            	$(".communityReplyListTable").append(html);
		            });
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
	
	    }
	    
	    
	    var createCommunityReply = function(){
	    	
	    	//alert("createCommunityReply");
	    	
	    	var contents = $("#communityReplyContents").val();
	    	//alert("contents : " + contents);
	    	
	    	//communityReplyInsert
			$.ajax({
				type : 'get',
				dataType : 'json',
				url : '<c:url value="/communityReplyInsert"/>',
				data : {
					communityReplyContents : contents,
					createUserNo : "${sessionScope.SESSION_USER.userNo}",
					createUserName : "${sessionScope.SESSION_USER.userName}"
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader('Content-Type', 'application/json');
				},
				complete : function() {
				},
				success : function(serverData) {

				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});
	    }
	    
		var deleteCommunityDetail = function(){
			
			$.ajax({
				type : 'get',
				dataType : 'json',
				url : '<c:url value="/communityDelete"/>',
				data : {
					communityNo : communityInfo.communityNo
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader('Content-Type', 'application/json');
				},
				complete : function() {
				},
				success : function(serverData) {
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});			
		}

		var updateCommunityDetail = function(){
			$.ajax({
				type : 'get',
				dataType : 'json',
				url : '<c:url value="/communityEdit"/>',
				data : {
					communityNo : communityInfo.communityNo
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader('Content-Type', 'application/json');
				},
				complete : function() {
				},
				success : function(serverData) {
				},
				error : function(jqXHR, textStatus, errorThrown) {
				}
			});		
		}
		
		$(document).ready(function() {

			printCommunityDetail();
			printCommunityReply();

			$("#btn_list").on("click", function(event) {
				location.href = '<c:url value="/community" />';
			});
			
			$("#btn_delete").on("click", function(event) {
				deleteCommunityDetail();
				location.href = '<c:url value="/community" />';
			});

			$("#btn_edit").on("click", function(event) {
				//updateNoticeDetail();
				location.href = '<c:url value="/communityEdit" />';
			});
			
			$("#btn_reply_add").on("click", function(event) {
				createCommunityReply();
				$(".communityReplyListTable tr").remove();
				printCommunityReply();
			});
			
		});
	</script>
</body>
</html>