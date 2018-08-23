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
        <h1>클라우드 기반 창업플랫폼</h1>
        <form:form method="post" action="/login"> 
            <section>
                <div class="membership_login">
                    <input type="text" id="userId" name="userId" placeholder="USER ID">
                    <input type="password" id="userPw" name="userPw" placeholder="PASSWORD">
                </div>
            </section>
            <div class="membership_btns">
                <button type="submit" id="" class="btn_confirm">LOG IN</button>
                <div class="membership_menu">
                    <a href="<c:url value="/signup"/>">회원가입</a>
                    <a href="findid.html">아이디찾기</a>
                    <a href="findpw.html">비밀번호찾기</a>
                </div>
            </div>
        </form:form>
    </main>

  <script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.script.js"/>"></script>

</body>

</html>