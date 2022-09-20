<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
	<link href="resources/css/login.css" rel="stylesheet"> 
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

</script>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	 <div class="login find id"><!-- 아이디 찾기에서 find id를 붙여주세요. -->
      <div class="tit">아이디 찾기</div>
      <div class="tit_desc">회원님의 이름과 휴대폰번호를 정확하게 입력하세요.</div>
      <form>
        <input type="text" class="id" placeholder="아이디"/>
        <input type="text" class="name" placeholder="이름"/>
        <input type="text" class="phone" placeholder="휴대폰 번호"/>
        <button>확인</button>
        <div class="option">
          <div class="find">
            <a href="#">비밀번호 찾기</a>
          </div>
        </div>
        <div class="member">
          <div class="text">아직 회원이 아니신가요?</div>
          <a class="btn_memjoin" href="registerView3.do">회원가입</a>
        </div>
      </form>
    </div>
    <footer>
      <div class="link">
        <div class="inner">
          <div class="inside">
            <a href="#">개인정보처리방침</a>
            <a href="#">이용약관</a>
            <a href="#">이메일 수집거부</a>        
            </div>
      </div>
    </footer>
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>