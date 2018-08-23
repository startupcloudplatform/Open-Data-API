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
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/membership.css"/>" />

  <!--[if lt IE 9]>
  <script src="../lib/js/html5shiv.min.js"></script>
  <![endif]-->

</head>
<body class="body_membership">
  <header>
    <img src="<c:url value="/resources/images/membership_footer_logo.png"/>" alt="nipa 정보통신산업진흥원">
  </header>
  <main>
    <h1>사용자 설정</h1>
    <form method="post" action="/userUpdate">
      <section class="section_signup">
        <table class="tb_signup">
        
          <tr>
            <th>아이디</th>
            <td>
              <div class="wrap_inputBtn">
              <c:out value="${sessionScope.SESSION_USER.userId}" />
              </div>
            </td>
          </tr>

          <tr>
            <th>패스워드</th>
            <td>
              <div class="wrap_inputPw">
                <input name="userPw" type="password" id="userPwForm">
              </div>
            </td>
          </tr>
          <tr>
            <th>사용자 이름</th>
            <td><input name="userName" type="text" id="userNameForm"></td>
          </tr>
          <tr>
            <th>사용자 유형</th>
            <td id="userTypeTd"></td>
          </tr>
        </table>
      </section>
      
      <div class="wrap_settingBtn">
        <button type="submit" id="btn_edit">회원정보 수정</button>
        <button type="button" id="btn_withdraw">탈퇴</button>
      </div>
    </form>
  </main>

  <script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.script.js"/>"></script>
  <script src="<c:url value="/resources/js/view/categoryView.js"/>"></script>

  <script text="text/javascript">

  // 창업자 상세 폼 출력
  var addDetailForm1 = function(type){
    var html = '';  
    html += '<div class="wrap_memberType">';
    html += '  <h2>창업자 정보 입력</h2>';
    html += '  <div class="wrap_tb_signup">';
    html += '    <table class="tb_signup">';
    html += '      <tr>';
    html += '        <th>사업 상호</th>';
    html += '        <td><input type="text" name="companyName" id="companyNameForm"></td>';
    html += '      </tr>';
    html += '      <tr>';
    html += '        <th>사업 산업분류</th>';
    html += '        <td>';
    html += '          <ul class="list_selectbox">';
    html += '            <li><select id="majorList"><option value="">대분류</option></select></li>';
    html += '            <li><select id="middleList"><option value="">중분류</option></select></li>';
    html += '            <li><select id="subList" name="companyCategory"><option value="">소분류</option></select></li>';
    html += '          </ul>';
    html += '        </td>';
    html += '      </tr>';
    html += '      <tr>';
    html += '        <th>회사 규모</th>';
    html += '        <td>';
    html += '          <ul class="list_radio">';
    html += '            <li><input type="radio" name="companyType" id="companyTypeRadio1" value="1"><label for="companyTypeRadio1">중소기업</label></li>';
    html += '            <li><input type="radio" name="companyType" id="companyTypeRadio2" value="2"><label for="companyTypeRadio2">중견기업</label></li>';
    html += '            <li><input type="radio" name="companyType" id="companyTypeRadio3" value="3"><label for="companyTypeRadio3">대기업</label></li>';
    html += '          </ul>';
    html += '        </td>';
    html += '      </tr>';
    html += '      <tr>';
    html += '        <th>사업 아이템 소개</th>';
    html += '          <td><div class="wrap_textarea"><textarea name="companyIntroduce"  id="companyIntroduceForm"></textarea></div></td>';
    html += '        </tr>';
    html += '      <tr>';
    html += '        <th>관심 키워드</th>';
    html += '        <td><input type="text" name="keyword" id="keywordForm"></td>';
    html += '      </tr>';
    html += '    </table>';
    html += '  </div>';
    html += '  <p class="txt_notice"> *가표시된 항목은 필수 입력사항 입니다.</p>';
    html += '</div>';
    
    $(".section_signup").append(html);
  } // of addDetailForm1

  // 오픈데이터 제공처 관리자 상세 폼 출력    
  var addDetailForm2 = function(type){
    var html = ''; 
    html += '<div class="wrap_memberType">';
    html += '  <h2>오픈데이터 제공처 관리자 정보 입력</h2>';
    html += '  <div class="wrap_tb_signup">';
    html += '    <table class="tb_signup">';
    html += '      <tr>';
    html += '        <th>오픈데이터 제공처 기관명</th>';
    html += '        <td><input type="text" name="companyName" id="companyNameForm"></td>';
    html += '      </tr>';
    html += '      <tr>';
    html += '        <th>오픈데이터 제공처 유형</th>';
    html += '        <td>';
    html += '          <ul class="list_radio">';
    html += '            <li><input type="radio" name="companyType" id="companyTypeRadio1" value="1"><label for="companyTypeRadio1">공공기관</label></li>';
    html += '            <li><input type="radio" name="companyType" id="companyTypeRadio2" value="2"><label for="companyTypeRadio2">지자체</label></li>';
    html += '            <li><input type="radio" name="companyType" id="companyTypeRadio3" value="3"><label for="companyTypeRadio3">민간기업</label></li>';
    html += '          </ul>';
    html += '        </td>';
    html += '      </tr>';
    html += '      <tr>';
    html += '        <th>오픈데이터 제공처 소개(100자 이내)</th>';
    html += '        <td><div class="wrap_textarea"><textarea name="companyIntroduce" id="companyIntroduceForm"></textarea></div></td>';
    html += '      </tr>';
    html += '      <tr>';
    html += '        <th>관심 키워드</th>';
    html += '        <td><input type="text" name="keyword" id="keywordForm" ></td>';
    html += '      </tr>';
    html += '    </table>';
    html += '  </div>';
    html += '  <p class="txt_notice"> *가표시된 항목은 필수 입력사항 입니다.</p>';
    html += '</div>';

    $(".section_signup").append(html);
  } // of addDetailForm2

  // 일반 사용자 상세 폼 출력       
  var addDetailForm3 = function(type){
    var html = '';   
    html += '<div class="wrap_memberType">';
    html += '  <h2>일반 사용자 정보 입력</h2>';
    html += '  <div class="wrap_tb_signup">';
    html += '    <table class="tb_signup">';
    html += '      <tr>';
    html += '        <th>직업</th>';
    html += '        <td><input type="text" name="companyName" id="companyNameForm"></td>';
    html += '      </tr>';
    /*
    html += '      <tr>';
    html += '        <th>소속회사 산업분류</th>';
    html += '        <td>';
    html += '          <ul class="list_selectbox">';
    html += '            <li><select id="majorList"><option value="">대분류</option></select></li>';
    html += '            <li><select id="middleList"><option value="">중분류</option></select></li>';
    html += '            <li><select id="subList" name="companyCategory"><option value="">소분류</option></select></li>';
    html += '           </ul>';
    html += '        </td>';
    html += '      </tr>';
    */
    html += '      <tr>';
    html += '        <th>회사 규모</th>';
    html += '        <td>';
    html += '          <ul class="list_radio">';
    html += '            <li><input type="radio" name="companyType" id="companyTypeRadio1" value="1"><label for="companyTypeRadio1">중소기업</label></li>';
    html += '            <li><input type="radio" name="companyType" id="companyTypeRadio2" value="2"><label for="companyTypeRadio2">중견기업</label></li>';
    html += '            <li><input type="radio" name="companyType" id="companyTypeRadio3" value="3"><label for="companyTypeRadio3">대기업</label></li>';
    html += '          </ul>';
    html += '        </td>';
    html += '      </tr>';
    html += '      <tr>';
    html += '        <th>관심 키워드</th>';
    html += '        <td><input type="text" name="keyword" id="keywordForm"></td>';
    html += '      </tr>';
    html += '    </table>';
    html += '  </div>';
    html += '  <p class="txt_notice"> *가표시된 항목은 필수 입력사항 입니다.</p>';
    html += '</div>';
    
    $(".section_signup").append(html);
  } // of addDetailForm3

    $(document).ready(function() {

      var userName = '${sessionScope.SESSION_USER.userName}';
      var userType = '${sessionScope.SESSION_USER.userType}';
      var companyName = '${sessionScope.SESSION_USER.companyName}';
      var companyCategory = '${sessionScope.SESSION_USER.companyCategory}';
      var companyType = '${sessionScope.SESSION_USER.companyType}';
      var companyIntroduce = '${sessionScope.SESSION_USER.companyIntroduce}';
      var keyword = '${sessionScope.SESSION_USER.keyword}';

      printCategoryList();
      initCategoryEdit(companyCategory);
      
      $("#userNameForm").val(userName);

      if(userType == 0){
        $("#userTypeTd").text("관리자");
      }
      else if(userType == 1){
        $("#userTypeTd").text("창업자");  
        addDetailForm1();
        $("#companyNameForm").val(companyName);       
		if(companyType == 1){
			$("#companyTypeRadio1").attr('checked', true);
		}
		else if(companyType == 2){
			$("#companyTypeRadio2").attr('checked', true);			
		}
		else if(companyType == 3){
			$("#companyTypeRadio3").attr('checked', true);			
		}
		
        $("#companyIntroduceForm").text(companyIntroduce);  
        $("#keywordForm").val(keyword);
      }
      else if(userType == 2){
        $("#userTypeTd").text("오픈데이터 제공처 관리자");
        addDetailForm2();
        $("#companyNameForm").val(companyName);
		if(companyType == 1){
			$("#companyTypeRadio1").attr('checked', true);
		}
		else if(companyType == 2){
			$("#companyTypeRadio2").attr('checked', true);			
		}
		else if(companyType == 3){
			$("#companyTypeRadio3").attr('checked', true);			
		}
        $("#companyIntroduceForm").text(companyIntroduce);
        $("#keywordForm").val(keyword);
      }
      else if(userType == 3){
        $("#userTypeTd").text("일반 사용자");
        addDetailForm3();
        $("#companyNameForm").val(companyName);        
		if(companyType == 1){
			$("#companyTypeRadio1").attr('checked', true);
		}
		else if(companyType == 2){
			$("#companyTypeRadio2").attr('checked', true);			
		}
		else if(companyType == 3){
			$("#companyTypeRadio3").attr('checked', true);			
		}        
        $("#keywordForm").val(keyword);        
      }
    }); // of $(document).ready()

  </script>
</body>
</html>