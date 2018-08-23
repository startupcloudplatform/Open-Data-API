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
    <h1>포털 회원가입</h1>
      <section class="section_signup">
        <table class="tb_signup">
          <tr><th>Open Data API Gateway(ODAG)의 회원이 되신것을 환영합니다.</th></tr>
          <tr height="200px">
            <td>
            <button class="btn_confirm" id="btn_login">로그인 페이지로 이동</button>&nbsp;<button class="btn_confirm" id="btn_main">메인 페이지로 이동</button>
            </td>
          </tr>
        </table>
    </section>
  </main>

  <script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.script.js"/>"></script>
  <script src="<c:url value="/resources/js/view/categoryView.js"/>"></script>

  <script text="text/javascript">

    $("#btn_login").on('click', function(event){
    	location.href = "<c:url value="/login" />";
    });
    
    $("#btn_main").on('click', function(event){
    	location.href = "<c:url value="/" />";
    });
    
    $(document).ready(function() {
    }); // of $(document).ready()
    
  </script>
</body>
</html>