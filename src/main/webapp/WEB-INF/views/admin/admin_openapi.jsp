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
                <a href="<c:url value="/adminUser" />">사용자 관리</a>
                <a href="<c:url value="/adminOpenapi" />" class="current">오픈데이터 관리</a>
                <a href="<c:url value="/adminService" />">서비스 현황</a>
            </nav>
            
        </div>
    </header>

    <main class="main_admin">
        <div class="contentInner">
            <div class="side-title"><h2>오픈데이터 관리</h2></div>
            <div class="btn-group_top clearfix">
                <div class="btn_select btn_add">
                    <button type="button"><span>ADD</span></button>
                </div>
                <div class="btn_select search_option">
                    <button type="button"><span>ACTION</span></button>
                    <ul>
                        <li><input type="radio" id="option1" name="option-group"><label for="option1">사용자 추가</label></li>
                        <li><input type="radio" id="option2" name="option-group"><label for="option2">사용자 제거</label></li>
                        <li><input type="radio" id="option3" name="option-group"><label for="option3">사용자 권한 변경</label></li>
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
                    <tbody>
                    <tr>
                        <td></td>
                        <td>아이디</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
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

    <div class="popup" style="display:block">
        <h3>상세보기</h3>
        <button type="button" id="" class="btn_pop_close">닫기</button>
        <div class="pop_cont_wrap">
            <table class="pop_table">
                <colgroup>
                    <col style="width: 125px">
                    <col>
                    <col style="width: 125px">
                    <col>
                </colgroup>
                <tr>
                    <th>아이디</th>
                    <td>아이디</td>
                    <th>사업 상호</th>
                    <td>사업 상호</td>
                </tr>
                <tr>
                    <th>사용자 이름</th>
                    <td>사용자 이름</td>
                    <th>사업 산업분류</th>
                    <td>사업 산업분류</td>
                </tr>
                <tr>
                    <th>사용자 유형</th>
                    <td>사용자 유형</td>
                    <th>회사 규모</th>
                    <td>회사 규모</td>
                </tr>
                <tr>
                    <th>가입일자</th>
                    <td>가입일자</td>
                    <th>사업 아이템 소개</th>
                    <td>사업 아이템 소개</td>
                </tr>
                <tr>
                    <th>마지막 로그인</th>
                    <td>마지막 로그인</td>
                    <th>관심 키워드</th>
                    <td>관심 키워드</td>
                </tr>
            </table>
        </div>
    </div>

  <script src="<c:url value="/resources/js/jquery-1.9.1.min.js"/>"></script>
  <script src="<c:url value="/resources/js/jquery.script.js"/>"></script>

    <script>
        $('.btn_pop_close').on('click', function(){
            $('.popup').hide();
        });
        
        $(document).ready(function() {
          	
        });

    </script>
</body>
</html>