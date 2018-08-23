<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false"%>

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
      <section class="section_signup">
        <table class="tb_signup">
          <tr><th>사용자 정보가 성공적으로 수정되었습니다.</th></tr>
          <tr height="200px">
            <td>
            <button class="btn_confirm" id="btn_main">메인 페이지로 이동</button>
            </td>
          </tr>
        </table>
    </section>

  <!-- 
    <form method="post" action="/userCreate">
    
      <section class="section_signup">
      
        <table class="tb_signup">
          <tr>
            <th>아이디</th>
            <td>
              <div class="wrap_inputBtn">
                <input name="userId" type="text" id="userIdForm">
                <button type="button" id="btn_redundantInspection" disabled="disabled">중복검사</button>
              </div>
            </td>
          </tr>
          <tr>
            <th>패스워드</th>
            <td>
              <div class="wrap_inputPw">
                <input name="userPw" type="password" id="">
                <p>비밀번호 안정성 분석 결과</p>
              </div>
            </td>
          </tr>
          <tr>
            <th>패스워드 확인</th>
            <td><input type="password" id=""></td>
          </tr>
          <tr>
            <th>사용자 이름</th>
            <td><input name="userName" type="text" id=""></td>
          </tr>
          <tr>
            <th>사용자 유형</th>
            <td>
              <input type="radio" name="userType" id="userTypeRadio1" value="1"><label for="userTypeRadio1">창업자</label>
              <input type="radio" name="userType" id="userTypeRadio2" value="2"><label for="userTypeRadio2">오픈데이터 제공처 관리자</label>
              <input type="radio" name="userType" id="userTypeRadio3" value="3"><label for="userTypeRadio3">일반 사용자</label>
            </td>
          </tr>
        </table>

      </section>
      <div class="membership_btns">
        <button type="submit" id="" class="btn_confirm" disabled="disabled">가입 완료</button>
      </div>
    </form>
  -->
  
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
      html += '        <td><input type="text" name="companyName" id=""></td>';
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
      html += '          <td><div class="wrap_textarea"><textarea name="companyIntroduce"  id=""></textarea></div></td>';
      html += '        </tr>';
      html += '      <tr>';
      html += '        <th>관심 키워드</th>';
      html += '        <td><input type="text" name="keyword" id=""></td>';
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
      html += '        <td><input type="text" name="companyName" id=""></td>';
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
      html += '        <td><div class="wrap_textarea"><textarea id="" name="companyIntroduce"></textarea></div></td>';
      html += '      </tr>';
      html += '      <tr>';
      html += '        <th>관심 키워드</th>';
      html += '        <td><input type="text" name="keyword" id=""></td>';
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
      html += '        <td><input type="text" name="companyName" id=""></td>';
      html += '      </tr>';
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
      html += '        <td><input type="text" name="keyword" id=""></td>';
      html += '      </tr>';
      html += '    </table>';
      html += '  </div>';
      html += '  <p class="txt_notice"> *가표시된 항목은 필수 입력사항 입니다.</p>';
      html += '</div>';
      
      $(".section_signup").append(html);
    } // of addDetailForm3
  
    var redundantInspection = function() {  	
      var userIdForm = $("#userIdForm").val();

      $.ajax({
        type : 'get',
        dataType : 'json',
        url : '<c:url value="/userInfo"/>',
        data : {
        	userId : userIdForm
        },
        beforeSend : function(xhr){
          xhr.setRequestHeader('Content-Type', 'application/json');
        },
        complete : function(){
        },
        success : function(serverData){
        	
        	var result = serverData.user;

        	if(result == null){
          	  alert(userIdForm+"은(는) 사용 가능합니다. 계속 진행해주세요.");
              $(".btn_confirm").css("background-color", "#8148de");
              $(".btn_confirm").removeAttr('disabled');
        	}
        	else{
          	  alert(userIdForm+"은(는) 중복된 아이디가 있습니다. 다시 입력해주세요.");
          	  $(".btn_confirm").css("background-color", "#c7d0d8");
          	  $(".btn_confirm").attr('disabled', 'disabled');
        	}
        },
        error : function(jqXHR, textStatus, errorThrown){
        	
        	alert("error");
        }
      });
    } // of redundantInspection
  
    
    $("#btn_main").on('click', function(event){
    	
    	location.href = "<c:url value="/" />";
    	
    });
    
    $(document).ready(function() {
    	
      //$("#btn_main").css("backgroundColor", "#c7d0d8");
     
      
      $('input:text[id="userIdForm"]').change(function(){
        if($("#userIdForm").val().charAt(0) == ''){
          $("#btn_redundantInspection").attr('disabled', 'disabled');
      	  $(".btn_confirm").css("background-color", "#c7d0d8");
      	  $(".btn_confirm").attr('disabled', 'disabled');
        }
        else{
          $("#btn_redundantInspection").removeAttr('disabled');
        }
      });
      
      $("#btn_redundantInspection").on("click", function(event){
        redundantInspection();
      });
      
      $('input:radio[name="userType"]').change(function(){
        if ($('input:radio[id="userTypeRadio1"]:checked').val() == '1') {
          $('.section_signup div[class="wrap_memberType"]').remove();
          addDetailForm1();          
          printCategoryList(); // 산업분류 출력
        }
        else if($('input:radio[id="userTypeRadio2"]:checked').val() == '2'){
          $('.section_signup div[class="wrap_memberType"]').remove();        	
          addDetailForm2();
        }
        else if($('input:radio[id="userTypeRadio3"]:checked').val() == '3'){
          $('.section_signup div[class="wrap_memberType"]').remove();
          addDetailForm3();
          
          printCategoryList(); // 산업분류 출력
        }
      });
    }); // of $(document).ready()
    
  </script>
</body>
</html>