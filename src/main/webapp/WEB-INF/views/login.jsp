<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/login.css" rel="stylesheet">
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
	check{
		width:15px;
	}
</style>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
		   <header>
        <button class="gnb_menu"></button>
    </header>
    <div class="login">
      <div class="tit">LOGIN</div>
<!--<div class="tit_desc">회원님의 이름과 휴대폰번호를 정확하게 입력하세요.</div>-->
      <form action="loginView2.do">
        <input type="text" class="id" name="id" placeholder="아이디"/>
        <input type="password" class="phone" name="pw" placeholder="비밀번호"/>
            <a href="#" class="first">아이디 저장</a>  
        <button>로그인</button>
        <div class="option">
          <div class="autocheck">
              <input type="checkbox" id="check_test">
          </div>
          <div class="find">
            <a href="loginView1.do" class="first">아이디 찾기</a>  
            <a href="#">비밀번호 찾기</a>
          </div>
        </div>
        <div class="member">
          <div class="text">아직 회원이 아니신가요?</div>
          <a class="btn_memjoin" href="#">회원가입</a>
        </div>
      </form>
    </div>
    <footer>
          <div class="inside">
            <a href="#">개인정보처리방침</a>
            <a href="#">이용약관</a>
            <a href="#">이메일 수집거부</a>
          </div>
    </footer>
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>