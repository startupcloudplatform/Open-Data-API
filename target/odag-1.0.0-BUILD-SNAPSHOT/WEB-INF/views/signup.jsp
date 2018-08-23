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

    <header><img src="<c:url value="/resources/images/membership_footer_logo.png"/>" alt="nipa 정보통신산업진흥원"></header>

    <main>
        <h1>포털 회원가입</h1>
        <form:form method="post" action="/userCreate">

            <section>
                <table class="tb_signup">
                    <tr>
                        <th>아이디</th>
                        <td>
                            <div class="wrap_inputBtn">
                                <input name="userId" type="text" id="">
                                <button type="button" id="" disabled="disabled">중복검사</button>
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
                            <input type="radio" name="radioGroup" id="radio1" value="type1"><label for="radio1">창업자</label>
                            <input type="radio" name="radioGroup" id="radio2" value="type2"><label for="radio2">오픈데이터 제공처 관리자</label>
                            <input type="radio" name="radioGroup" id="radio3" value="type3"><label for="radio3">일반 사용자</label>
                        </td>
                    </tr>
                </table>

                <div class="wrap_memberType1">
                    <h2>창업자 정보 입력</h2>
                    <div class="wrap_tb_signup">
                        <table class="tb_signup">
                            <tr>
                                <th>사업 상호</th>
                                <td><input type="text" id=""></td>
                            </tr>
                            <tr>
                                <th>사업 산업분류</th>
                                <td>
                                    <ul class="list_selectbox">
                                        <li><select id="">
                                            <option value="">대분류</option>
                                        </select></li>
                                        <li><select id="">
                                            <option value="">중분류</option>
                                        </select></li>
                                        <li><select id="">
                                            <option value="">소분류</option>
                                        </select></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th>회사 규모</th>
                                <td>
                                    <ul class="list_radio">
                                        <li><input type="radio" name="radioGroup2" id="radio11"><label for="radio11">중소기업</label></li>
                                        <li><input type="radio" name="radioGroup2" id="radio12"><label for="radio12">중견기업</label></li>
                                        <li><input type="radio" name="radioGroup2" id="radio13"><label for="radio13">대기업</label></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th>사업 아이템 소개</th>
                                <td><div class="wrap_textarea"><textarea id=""></textarea></div></td>
                            </tr>
                            <tr>
                                <th>관심 키워드</th>
                                <td><input type="text" id=""></td>
                            </tr>
                        </table>
                    </div><!-- //wrap_tb_sighup -->
                    <p class="txt_notice">'*'가표시된 항목은 필수 입력사항 입니다.</p>
                </div><!-- //wrap_memberType -->

               <div class="wrap_memberType2">
                    <h2>오픈데이터 제공처 관리자 정보 입력</h2>
                    <div class="wrap_tb_signup">
                        <table class="tb_signup">
                            <tr>
                                <th>오픈데이터 제공처 기관명</th>
                                <td><input type="text" id=""></td>
                            </tr>
                            <tr>
                                <th>오픈데이터 제공처 유형</th>
                                <td>
                                    <ul class="list_radio">
                                        <li><input type="radio" name="radioGroup2" id="radio11"><label for="radio11">공공기관</label></li>
                                        <li><input type="radio" name="radioGroup2" id="radio12"><label for="radio12">지자체</label></li>
                                        <li><input type="radio" name="radioGroup2" id="radio13"><label for="radio13">민간기업</label></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th>오픈데이터 제공처 소개(100자 이내)</th>
                                <td><div class="wrap_textarea"><textarea id=""></textarea></div></td>
                            </tr>
                            <tr>
                                <th>관심 키워드</th>
                                <td><input type="text" id=""></td>
                            </tr>
                        </table>
                    </div><!-- //wrap_tb_sighup -->
                    <p class="txt_notice">'*'가표시된 항목은 필수 입력사항 입니다.</p>
                </div><!-- //wrap_memberType -->

               <div class="wrap_memberType3">
                    <h2>일반 사용자 정보 입력</h2>
                    <div class="wrap_tb_signup">
                        <table class="tb_signup">
                            <tr>
                                <th>직업</th>
                                <td><input type="text" id=""></td>
                            </tr>
                            <tr>
                                <th>소속회사 산업분류</th>
                                <td>
                                    <ul class="list_selectbox">
                                        <li><select id="">
                                            <option value="">대분류</option>
                                        </select></li>
                                        <li><select id="">
                                            <option value="">중분류</option>
                                        </select></li>
                                        <li><select id="">
                                            <option value="">소분류</option>
                                        </select></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th>회사 규모</th>
                                <td>
                                    <ul class="list_radio">
                                        <li><input type="radio" name="radioGroup2" id="radio11"><label for="radio11">중소기업</label></li>
                                        <li><input type="radio" name="radioGroup2" id="radio12"><label for="radio12">중견기업</label></li>
                                        <li><input type="radio" name="radioGroup2" id="radio13"><label for="radio13">대기업</label></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th>관심 키워드</th>
                                <td><input type="text" id=""></td>
                            </tr>
                        </table>
                    </div><!-- //wrap_tb_sighup -->
                    <p class="txt_notice">'*'가표시된 항목은 필수 입력사항 입니다.</p>
                </div><!-- //wrap_memberType -->

            </section>
            <div class="membership_btns">
                <button type="submit" id="" class="btn_confirm">가입 완료</button>
            </div>
        </form:form>
    </main>

    <script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.script.js"/>"></script>

	<script text="text/javascript">
	  $(document).ready(function() {

		  $(".wrap_memberType1").hide();
		  $(".wrap_memberType2").hide();
		  $(".wrap_memberType3").hide();

		  $('input:radio[name="radioGroup"]').change(function(){

			  if ($('input:radio[name="radioGroup"]:checked').val() == 'type1') {
				  $(".wrap_memberType2").hide();
				  $(".wrap_memberType3").hide();				  
				  $(".wrap_memberType1").show();
			  }
			  else if($('input:radio[name="radioGroup"]:checked').val() == 'type2'){
				  $(".wrap_memberType1").hide();
				  $(".wrap_memberType3").hide();				  
				  $(".wrap_memberType2").show();
			  }
			  else if($('input:radio[name="radioGroup"]:checked').val() == 'type3'){
				  $(".wrap_memberType1").hide();
				  $(".wrap_memberType2").hide();				  
				  $(".wrap_memberType3").show();
			  }
		  });
	  });
	</script>
</body>

</html>