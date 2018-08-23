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
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/admin.css" />" />

<!--[if lt IE 9]>
        <script src="lib/js/html5shiv.min.js"></script>
        <![endif]-->
</head>

<body>
  <header>
    <div class="contentInner">
      <h1><a href="../"><img src="<c:url value="/resources/images/logo_admin.png" />" alt="ODAG Admin"></a></h1>
            
      <nav class="header_nav">
        <a href="<c:url value="/adminUser" />" class="current">사용자 관리</a>
        <a href="<c:url value="/adminOpenapi" />">오픈데이터 관리</a>
        <a href="<c:url value="/adminService" />">서비스 현황</a>
      </nav>      
    </div>
  </header>

  <main class="main_admin">
    <div class="contentInner">
      <div class="side-title"><h2>사용자 관리</h2></div>
      <div class="btn-group_top clearfix">
        <div class="btn_select btn_add">
          <button type="button" id="btn_add"><span>ADD</span></button>
        </div>
        <div class="btn_select search_option">
          <button type="button"><span>ACTION</span></button>
          <ul>
            <li><input type="radio" id="option1" name="option-group" value="a"><label for="option1">상세정보</label></li>
            <li><input type="radio" id="option2" name="option-group" value="b"><label for="option2">제거</label></li>
            <li><input type="radio" id="option3" name="option-group" value="c"><label for="option3">수정</label></li>
          </ul>
        </div>
      </div><!-- //btn-group_top -->

      <div class="wrap_table">
        <table class="tb_list_admin">
          <thead>
            <tr>
              <th>번호</th>
              <th>아이디</th>
              <th>사용자 이름</th>
              <th>사용자 유형</th>
              <th>즐겨찾기 이용 수</th>
              <th>토큰 등록 수</th>
              <th>활성화</th>
              <th>마지막 로그인</th>
            </tr>
          </thead>
          <tbody id="tbody_user_list">                    
          </tbody>
        </table>
      </div>
    </div><!-- //contentInner -->
  </main>
  <footer>
    <div class="contentInner">
      <h1><img src="<c:url value="/resources/images/logo_footer.png" />" alt="Cloudit Knowledge Base"></h1>
      <address>
        <p>서울시 서초구 강남대로 623, 10층  ( 서울시 서초구 잠원동 12-5, 우일빌딩 )</p>
        <p>TEL : 02. 516. 5990<span>/</span>FAX : 02. 516. 5997</p>
        <p class="copyright">COPYRIGHT  2018 innogrid. All right reserved.</p>
      </address>
    </div>
  </footer>

  <div class="wpopup" style="display:block" id="pop_create">
    <h3>사용자 생성</h3>
    <button type="button" id="" class="btn_pop_close">닫기</button>
    <div class="pop_cont_wrap">
      <form method="post" action="/userCreate" name="user_create_form">
        <table class="pop_table" id="pop_table_create">
          <colgroup>
            <col style="width: 160px">
            <col style="width: 340px">
            <col style="width: 160px">
            <col style="width: 340px">
          </colgroup>
          <thead>
          <tr>
            <th>아이디</th>
            <td><input name="userId" type="text" id="userIdForm"></td>
            <th>사용자 이름</th>
            <td><input name="userName" type="text" id=""></td>
          </tr>
          <tr>
            <th>비밀번호</th>
            <td><input name="userPw" type="password" id=""></td>
            <th>비밀번호 확인</th>
            <td><input name="" type="password" id=""></td>
          </tr>
          <tr>
            <th>사용자 유형</th>
            <td colspan="3">
              <input type="radio" name="userType" id="userTypeRadio1" value="1" checked="checked"><label for="userTypeRadio1">창업자</label>
              <input type="radio" name="userType" id="userTypeRadio2" value="2"><label for="userTypeRadio2">오픈데이터 제공처 관리자</label>
              <input type="radio" name="userType" id="userTypeRadio3" value="3"><label for="userTypeRadio3">일반 사용자</label>
            </td>
          </tr>
          </thead>
<!-- 
          <tr>
            <th>사업 상호</th>
            <td><input type="text" name="companyName" id=""></td>
            <th>사업 산업분류</th>
            <td>
              <select id="majorList"><option value="">대분류</option></select>
              <select id="middleList"><option value="">중분류</option></select>
              <select id="subList" name="companyCategory"><option value="">소분류</option></select>
            </td>
          </tr>
          <tr>
            <th>회사 규모</th>
            <td>
              <input type="radio" name="companyType" id="companyTypeRadio1" value="1"><label for="companyTypeRadio1">중소기업</label>
              <input type="radio" name="companyType" id="companyTypeRadio2" value="2"><label for="companyTypeRadio2">중견기업</label>
              <input type="radio" name="companyType" id="companyTypeRadio3" value="3"><label for="companyTypeRadio3">대기업</label>
            </td>
            <th rowspan="2">사업 아이템 소개</th>
            <td rowspan="2"><div class="wrap_textarea"><textarea name="companyIntroduce"  id=""></textarea></div></td>
          </tr>
          <tr>
            <th>관심 키워드</th>
            <td><input type="text" name="keyword" id=""></td>  
          </tr>
          <tr>
            <td colspan="4" align="center"><button type="submit">사용자 생성</button></td>
          </tr>         
 -->
 
 <!--
           <tr>
            <th>오픈데이터 제공처 기관명</th>
            <td><input type="text" name="companyName" id=""></td>
            <th>오픈데이터 제공처 유형</th>
            <td>
              <input type="radio" name="companyType" id="companyTypeRadio1" value="1"><label for="companyTypeRadio1">중소기업</label>
              <input type="radio" name="companyType" id="companyTypeRadio2" value="2"><label for="companyTypeRadio2">중견기업</label>
              <input type="radio" name="companyType" id="companyTypeRadio3" value="3"><label for="companyTypeRadio3">대기업</label>
            </td>
          </tr>
          <tr>
            <th rowspan="2">사업 아이템 소개</th>
            <td rowspan="2"><div class="wrap_textarea"><textarea name="companyIntroduce"  id=""></textarea></div></td>
            <th>관심 키워드</th>
            <td><input type="text" name="keyword" id=""></td> 
          </tr>            
          <tr>
            <td colspan="2" align="center"><button type="submit">사용자 생성</button></td>
          </tr> 
--> 
          <tbody>
          <tr>
            <th>직업</th>
            <td><input type="text" name="companyName" id=""></td>
            <th>소속회사 산업분류</th>
            <td>
              <select id="majorList"><option value="">대분류</option></select>
              <select id="middleList"><option value="">중분류</option></select>
              <select id="subList" name="companyCategory"><option value="">소분류</option></select>
            </td>
          </tr>
          <tr>
            <th>회사 규모</th>
            <td>
              <input type="radio" name="companyType" id="companyTypeRadio1" value="1"><label for="companyTypeRadio1">중소기업</label>
              <input type="radio" name="companyType" id="companyTypeRadio2" value="2"><label for="companyTypeRadio2">중견기업</label>
              <input type="radio" name="companyType" id="companyTypeRadio3" value="3"><label for="companyTypeRadio3">대기업</label>
            </td>
            <th>관심 키워드</th>
            <td><input type="text" name="keyword" id=""></td>  
          </tr>
          <tr>
            <td colspan="4" align="center"><button type="submit">사용자 생성</button></td>
          </tr>
          </tbody>
        </table>
      </form>
    </div>
  </div>


  <div class="wpopup" style="display:block" id="pop_edit">
    <h3>사용자 정보 수정</h3>
    <button type="button" id="" class="btn_pop_close">닫기</button>
    <div class="pop_cont_wrap">
      <form method="post" action="/userUpdate">
      <table class="pop_table" id="pop_table_edit">
        <colgroup>
          <col style="width: 160px">
          <col style="width: 340px">
          <col style="width: 160px">
          <col style="width: 340px">
        </colgroup>
        <thead>
          <tr>
            <th>아이디</th>
            <td><input name="userId" type="text" id="userIdForm_edit"></td>
            <th>사용자 이름</th>
            <td><input name="userName" type="text" id="userNameForm_edit"></td>
          </tr>
          <tr>
            <th>비밀번호</th>
            <td><input name="userPw" type="password" id="userPwForm_edit"></td>
            <th>비밀번호 확인</th>
            <td><input name="" type="password" id=""></td>
          </tr>
          <tr>
            <th>사용자 유형</th>
            <td colspan="3">
              <input type="radio" name="userType" id="userTypeRadio1_edit" value="1"><label for="userTypeRadio1">창업자</label>
              <input type="radio" name="userType" id="userTypeRadio2_edit" value="2"><label for="userTypeRadio2">오픈데이터 제공처 관리자</label>
              <input type="radio" name="userType" id="userTypeRadio3_edit" value="3"><label for="userTypeRadio3">일반 사용자</label>
            </td>
          </tr>
        </thead>
      </table>
      </form>
    </div>
  </div>


    <div class="wpopup" style="display:block" id="pop_detail">
        <h3>사용자 정보 상세보기</h3>
        <button type="button" id="" class="btn_pop_close">닫기</button>
        <div class="pop_cont_wrap">
            <table class="pop_table">
              <colgroup>
                <col style="width: 200px">
                <col>
                <col style="width: 200px">
                <col>
              </colgroup>
              <tr>
                <th id="tit_userId">아이디</th>
                <td id="userId">아이디</td>
                <th id="tit_companyName">사업 상호</th>
                <td id="companyName">사업 상호</td>
              </tr>
              <tr>
                <th id="tit_userName">사용자 이름</th>
                <td id="userName">사용자 이름</td>
                <th id="tit_companyCategory">사업 산업분류</th>
                <td id="companyCategory">사업 산업분류</td>
              </tr>
              <tr>
                <th id="tit_userType">사용자 유형</th>
                <td id="userType">사용자 유형</td>
                <th id="tit_companyType">회사 규모</th>
                <td id="companyType">회사 규모</td>
              </tr>
              <tr>
                <th id="tit_createTime">가입일자</th>
                <td id="createTime">가입일자</td>
                <th id="tit_companyIntroduce">사업 아이템 소개</th>
                <td id="companyIntroduce">사업 아이템 소개</td>
              </tr>
              <tr>
                <th id="tit_lastLoginTime">마지막 로그인</th>
                <td id="lastLoginTime">마지막 로그인</td>
                <th id="tit_keyword">관심 키워드</th>
                <td id="keyword">관심 키워드</td>
              </tr>
            </table>
        </div>
    </div>
 
  <script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.script.js"/>"></script>
  <script src="<c:url value="/resources/js/view/categoryView.js"/>"></script>


  <script text="text/javascript">

  var printUserTypeForm1 =function(target){

	if(target == 1) 
	  $("#pop_table_create tbody").remove();
	else if(target == 2)
	  $("#pop_table_edit tbody").remove();

    var html ='';
    html += '<tbody>';
    html += '  <tr>';
    html += '    <th>사업 상호</th>';
    html += '    <td><input type="text" name="companyName" id="companyNameForm"></td>';
    html += '    <th>회사 규모</th>';
    html += '    <td>';
    html += '      <input type="radio" name="companyType" id="companyTypeRadio1" value="1"><label for="companyTypeRadio1">중소기업</label>';
    html += '      <input type="radio" name="companyType" id="companyTypeRadio2" value="2"><label for="companyTypeRadio2">중견기업</label>';
    html += '      <input type="radio" name="companyType" id="companyTypeRadio3" value="3"><label for="companyTypeRadio3">대기업</label>';
    html += '    </td>';
    html += '  </tr>';
    html += '  <tr>';
    html += '    <th>사업 산업분류</th>';
    html += '    <td colspan="3">';
    html += '      <select id="majorList"><option value="">대분류</option></select>';
    html += '      <select id="middleList"><option value="">중분류</option></select>';
    html += '      <select id="subList" name="companyCategory"><option value="">소분류</option></select>';
    html += '    </td>';
    html += '  </tr>';
    html += '  <tr>';
    html += '    <th>관심 키워드</th>';
    html += '    <td colspan="3"><input type="text" name="keyword" id="keywordForm"></td>';
    html += '  </tr>';
    html += '  <tr>';
    html += '    <th >사업 아이템 소개</th>';
    html += '    <td colspan="3"><div><textarea name="companyIntroduce"  id="companyIntroduceForm"></textarea></div></td>';
    html += '  </tr>';
    html += '  <tr>';
    
    if(target==1)
        html += '      <td colspan="4" align="center"><button type="submit">사용자 생성</button></td>';
    else if(target==2)
        html += '      <td colspan="4" align="center"><button type="submit">수정 완료</button></td>';

    html += '  </tr>';
    html += '</tbody>';
    
    if(target==1)
      $("#pop_table_create").append(html);
    else if(target==2)
      $("#pop_table_edit").append(html);
    
  } // of printUserTypeForm1()

  var printUserTypeForm2 =function(target){
	  
	if(target == 1) 
      $("#pop_table_create tbody").remove();
    else if(target == 2)
      $("#pop_table_edit tbody").remove();
	
    var html ='';
    html += '<tbody>';
    html += '  <tr>';
    html += '    <th>오픈데이터 제공처 기관명</th>';
    html += '    <td><input type="text" name="companyName" id=""></td>';
    html += '    <th>오픈데이터 제공처 유형</th>';
    html += '    <td>';
    html += '      <input type="radio" name="companyType" id="companyTypeRadio1" value="1"><label for="companyTypeRadio1">중소기업</label>';
    html += '      <input type="radio" name="companyType" id="companyTypeRadio2" value="2"><label for="companyTypeRadio2">중견기업</label>';
    html += '      <input type="radio" name="companyType" id="companyTypeRadio3" value="3"><label for="companyTypeRadio3">대기업</label>';
    html += '    </td>';
    html += '  </tr>';
    
    html += '  <tr>';    
    html += '    <th>관심 키워드</th>';
    html += '    <td colspan="3"><input type="text" name="keyword" id=""></td>';
    html += '  </tr>';
    
    html += '  <tr>';
    html += '    <th>사업 아이템 소개</th>';
    html += '    <td colspan="3"><div class="wrap_textarea"><textarea name="companyIntroduce"  id=""></textarea></div></td>';
    html += '  </tr>';

    html += '  <tr>';

    if(target==1)
      html += '      <td colspan="4" align="center"><button type="submit">사용자 생성</button></td>';
    else if(target==2)
      html += '      <td colspan="4" align="center"><button type="submit">수정 완료</button></td>';

    html += '  </tr>';
    html += '</tbody>';
    
    if(target==1)
      $("#pop_table_create").append(html);
    else if(target==2)
      $("#pop_table_edit").append(html);

  } // of printUserTypeForm2()
  
  var printUserTypeForm3 =function(target){

	if(target == 1) 
	  $("#pop_table_create tbody").remove();
	else if(target == 2)
	  $("#pop_table_edit tbody").remove();
		
	var html ='';
    html += '<tbody>';
    
    html += '    <tr>';
    
    html += '      <th>직업</th>';
    html += '      <td><input type="text" name="companyName" id=""></td>';
    html += '      <th>회사 규모</th>';
    html += '      <td>';
    html += '        <input type="radio" name="companyType" id="companyTypeRadio1" value="1"><label for="companyTypeRadio1">중소기업</label>';
    html += '        <input type="radio" name="companyType" id="companyTypeRadio2" value="2"><label for="companyTypeRadio2">중견기업</label>';
    html += '        <input type="radio" name="companyType" id="companyTypeRadio3" value="3"><label for="companyTypeRadio3">대기업</label>';
    html += '      </td>';
    html += '    </tr>';
    
    html += '    <tr>';
    html += '      <th>소속회사 산업분류</th>';
    html += '      <td colspan="3">';
    html += '        <select id="majorList"><option value="">대분류</option></select>';
    html += '        <select id="middleList"><option value="">중분류</option></select>';
    html += '        <select id="subList" name="companyCategory"><option value="">소분류</option></select>';
    html += '      </td>';
    html += '    </tr>';
    
    html += '    <tr>';
    html += '      <th>관심 키워드</th>';
    html += '      <td colspan="3"><input type="text" name="keyword" id=""></td>';
    html += '    </tr>';
    html += '    <tr>';

    if(target==1)
      html += '      <td colspan="4" align="center"><button type="submit">사용자 생성</button></td>';
    else if(target==2)
      html += '      <td colspan="4" align="center"><button type="submit">수정 완료</button></td>';

    html += '    </tr>';
    html += '</tbody>';
    
    if(target==1)
      $("#pop_table_create").append(html);
    else if(target==2)
      $("#pop_table_edit").append(html);

  } // of printUserTypeForm3()

  var selectedUser;
  var selectedUserNo;
  var selectedUserType;
  
  var userList = Array();
  var printUserList = function(){
	$("#tbody_user_list tr").remove();
    $.ajax({
      type : 'get',
      dataType : "json",
      url : '<c:url value="/userList"/>',
      data : {},
      beforeSend : function(xhr) {
        xhr.setRequestHeader("Content-Type", "application/json");
      },
      complete : function() {
      },
      success : function(serverData) {
        userList = serverData.userList;

        $(userList).each(function(userIdx) {
          var html='';
          var userType = userList[userIdx].userType;

          html += '<tr id="user'+userList[userIdx].userNo+'">';
          html += '  <td>'+userList[userIdx].userNo+'</td>';
          html += '  <td>'+userList[userIdx].userId+'</td>';
          html += '  <td>'+userList[userIdx].userName+'</td>';

          if(userType==0){
            html += '  <td>관리자</td>';
          }
          else if(userType==1){
            html += '  <td>창업자</td>';            
          }
          else if(userType==2){
              html += '  <td>오픈데이터제공처 관리자</td>';            
          }
          else if(userType==3){
              html += '  <td>일반사용자</td>';            
          }

          html += '  <td>'+userList[userIdx].userCntBookmark+'</td>';
          html += '  <td>'+userList[userIdx].userCntToken+'</td>';
          
          if(userList[userIdx].userEnable == 1){
            html += '  <td>Enabled</td>';
          }
          else if(userList[userIdx].userEnable == 1){
            html += '  <td>Disabled</td>';        	  
          }
          html += '  <td>'+userList[userIdx].lastLoginTime+'</td>';
          html += '</tr>';
          
          $("#tbody_user_list").append(html);

          $("#user"+userList[userIdx].userNo).on('click', function(){
        	$(selectedUser).css('backgroundColor', '#ffffff');
        	selectedUser = "#user"+userList[userIdx].userNo;
        	selectedUserNo = userList[userIdx].userNo;
        	selectedUserType = userList[userIdx].userType;
        	
            $(selectedUser).css('backgroundColor', '#f4eeff'); // .children('td')
          });
        }); // of each function()        
      },
      error : function(jqXHR, textStatus, errorThrown) {      
      }
    }); // of $.ajax 
  } // of printUserList()
  
  var deleteUser = function(userNo){
	  
	  //alert("deleteUser");
	  //alert("userNo : " + userNo);
		  $.ajax({
		    type : 'post',
		    dataType : 'json',
	        url : '<c:url value="/adminUserDelete"/>',
	        data : {
	        	"userNo" : userNo
			},
			complete : function(){
				printUserList();
	        },
			success : function(serverData){
			},
			error : function(jqXHR, textStatus, errorThrown){
	        }
		  });
		  
  } // of deleteUser

  var userInfo;
  var printUserDetail = function(userNo){
		
      $.ajax({
        type : 'get',
        dataType : 'json',
        url : '<c:url value="/userInfo"/>',
        data : {
        	"userNo" : userNo
        },
        beforeSend : function(xhr){
          xhr.setRequestHeader('Content-Type', 'application/json');
        },
        complete : function(){
        },
        success : function(serverData){
          userInfo = serverData.user;

          //alert("userName : " + userInfo.userName);
          
          $("#userId").text(userInfo.userId);
          
          $("#userName").text(userInfo.userName);
          
          if(userInfo.userType == 1){
            $("#userType").text("창업자");
            
            $("#tit_companyName").text("사업 상호");
            $("#tit_companyCategory").text("사업 산업분류");
            $("#tit_companyType").text("회사 규모");
            $("#tit_companyIntroduce").text("사업 아이템 소개");       
            
            if(userInfo.companyType == 1){
            	$("#companyType").text("중소기업");
            }
            else if(userInfo.companyType == 2){
            	$("#companyType").text("중견기업");
            }
            else if(userInfo.companyType == 3){
            	$("#companyType").text("대기업");
            }
            
            $("#companyIntroduce").text(userInfo.companyIntroduce);            
            $("#companyCategory").text(userInfo.companyCategory);
            $("#companyName").text(userInfo.companyName);
            $("#keyword").text(userInfo.keyword);
          }
          else if(userInfo.userType == 2){
          	$("#userType").text("오픈데이터제공처 관리자");

            $("#tit_companyName").text("오픈데이터 제공처 기관명");
            $("#tit_companyCategory").text(" ");
            $("#tit_companyType").text("오픈데이터 제공처 유형");
            $("#tit_companyIntroduce").text("오픈데이터 제공처 소개");
          	
            if(userInfo.companyType == 1){
            	$("#companyType").text("공공기관");
            }
            else if(userInfo.companyType == 2){
            	$("#companyType").text("지자체");
            }
            else if(userInfo.companyType == 3){
            	$("#companyType").text("민간기업");
            }
            
            $("#companyCategory").text(" ");
            $("#companyIntroduce").text(userInfo.companyIntroduce);
            $("#companyName").text(userInfo.companyName);
            $("#keyword").text(userInfo.keyword);
          }
          else if(userInfo.userType == 3){
            $("#userType").text("일반사용자");

            $("#tit_companyName").text("직업");
            $("#tit_companyCategory").text("소속회사 산업분류");
            $("#tit_companyType").text("회사 규모");
            $("#tit_companyIntroduce").text(" ");
            
            if(userInfo.companyType == 1){
            	$("#companyType").text("중소기업");
            }
            else if(userInfo.companyType == 2){
            	$("#companyType").text("중견기업");
            }
            else if(userInfo.companyType == 3){
            	$("#companyType").text("대기업");
            }
            
            $("companyIntroduce").text(" ");
            $("#companyCategory").text(userInfo.companyCategory);
            $("#companyName").text(userInfo.companyName);
            $("#keyword").text(userInfo.keyword);
          }       	  
          else if(userInfo.userType == 0){
          	$("#userType").text("관리자");     	  
            $("#tit_companyName").text(" ");
            $("#tit_companyCategory").text(" ");
            $("#tit_companyType").text(" ");
            $("#tit_companyIntroduce").text(" ");
            $("#tit_keyword").text(" ");
          }

          $("#createTime").text(userInfo.createTime);
          $("#lastLoginTime").text(userInfo.lastLoginTime);

          /*
          apiInfo = serverData.openapiInfo;
          
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
          */

        },
        error : function(jqXHR, textStatus, errorThrown){
        }
      });      
  } // of getUserInfo()

  var printUserEdit = function(userNo){

      $.ajax({
        type : 'get',
        dataType : 'json',
        url : '<c:url value="/userInfo"/>',
        data : {
        	"userNo" : userNo
        },
        beforeSend : function(xhr){
          xhr.setRequestHeader('Content-Type', 'application/json');
        },
        complete : function(){
        },
        success : function(serverData){

          userInfo = serverData.user;
          $("#userIdForm_edit").attr("value", userInfo.userId);
          $("#userNameForm_edit").attr("value", userInfo.userName);
          $("#userPwForm_edit").attr("value", userInfo.userPw);

          if(userInfo.userType == 1){
        	  $("#userTypeRadio1_edit").attr('checked', true);
          }
          else if(userInfo.userType == 2){
        	  $("#userTypeRadio2_edit").attr('checked', true);
          }
          else if(userInfo.userType == 3){
        	  $("#userTypeRadio3_edit").attr('checked', true);
          }

          $("#companyNameForm").attr("value", userInfo.companyName);
          $("#keywordForm").attr("value", userInfo.keyword);
          
          //alert("intro : " + userInfo.companyIntroduce);
          
          $("#companyIntroduceForm").text(userInfo.companyIntroduce);

          if(userInfo.companyType == 1){
        	$("#companyTypeRadio1").attr('checked', true);
          }
          else if(userInfo.companyType == 2){
          	$("#companyTypeRadio2").attr('checked', true);            
          }
          else if(userInfo.companyType == 3){
          	$("#companyTypeRadio3").attr('checked', true);            
          }
        	  
          
          
          initCategoryEdit(userInfo.companyCategory);
          
          //userInfo.companyType();
          
          //alert("userName : " + userInfo.userName);
           /*         
          $("#userId").text(userInfo.userId);
          $("#userName").text(userInfo.userName);
          
          apiInfo = serverData.openapiInfo;
          
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
          */

        },
        error : function(jqXHR, textStatus, errorThrown){
        }
      });      
  } // of getUserEdit()

  $('input:radio[name="option-group"]').change(function(){
      if($('input:radio[name="option-group"]:checked').val() == 'b'){
    	//alert("b!!!");
    	//deleteUser(selectedUserNo);
      }   
  });

  $("#userTypeRadio1").on('click', function(){
	printUserTypeForm1(1);
	printCategoryList();
  });
  $("#userTypeRadio2").on('click', function(){
    printUserTypeForm2(1);
    printCategoryList();
  });
  $("#userTypeRadio3").on('click', function(){
    printUserTypeForm3(1);
    printCategoryList();
  });

  $("#userTypeRadio1_edit").on('click', function(){
    printUserTypeForm1(2);
  });

  $("#userTypeRadio2_edit").on('click', function(){
    printUserTypeForm2(2);
  });

  $("#userTypeRadio3_edit").on('click', function(){
    printUserTypeForm3(2);
  });
  
  $("#option1").on('click', function(){
      if(selectedUserNo != null){
        $("#pop_detail").show();
        printUserDetail(selectedUserNo);
      }
  });
  
  $("#option2").on('click', function(){
      if(selectedUserNo != null){
        deleteUser(selectedUserNo);
      }
  });
  
  $("#option3").on('click', function(){
    if(selectedUserNo != null){

      //alert("userType" + selectedUserType);
    
      $("#pop_edit").show();
      printUserEdit(selectedUserNo);
      
      if(selectedUserType != 0){
    	if(selectedUserType == 1)
          printUserTypeForm1(2);
    	else if(selectedUserType == 2)
            printUserTypeForm2(2);
    	else if(selectedUserType == 3)
            printUserTypeForm3(2);
      }
      
    }
  });
  
  $('.btn_pop_close').on('click', function(){
    $('.popup').hide();
    $('.wpopup').hide();
  });

  $('.btn_add').on('click', function(){
	
    $("#pop_create").show();
    $("#pop_table_create tbody").remove();
    printUserTypeForm1(1);
    printCategoryList();

    $("form[name='user_create_form']")[0].reset();

    //$("form")[0].reset();
    //$("form[name='user_create_form']").reset();

  });

// 팝업 유형 > 생성(입력폼), 상세정보(테이블), 제거(메시지 박스), 수정(입력폼) > pop_create pop_detail pop_delete pop_edit

  $(document).ready(function() {
  
	$("#pop_table_create tbody").remove();
	$("#pop_table_edit tbody").remove();
	$('.popup').hide();
    $('.wpopup').hide();

	printUserList();

  });

  </script>
</body>
</html>