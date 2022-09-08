<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="resources/css/register.css" rel="stylesheet"/>
	<link href="resources/css/global.css" rel="stylesheet"/>  	
  	<link href="resources/css/subpage.css" rel="stylesheet">
	<link href="resources/css/login.css" rel="stylesheet">
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
    <script>
      $(document).ready(function () {
        $(".gnb_menu").on("click", function () {
          $(".gnb").slideToggle();
        });
      });
    </script>
    <title>고강도</title>
  </head>
  <body>
  <jsp:include page="include/header.jsp"></jsp:include>
    <section class="sub-contents">
      <div class="inner memberjoin">
        <h3>이용 약관 동의</h3>
        <div class="agreement">
          <input type="checkbox" id="agreement_all"><label for="agreement_all">전체 이용 약관에 동의합니다.</label>
        </div>
        <h4>이용약관</h4>
        <div class="agree_box">
          <p class="chapter">제1장 총칙</p>
          <p class="article">제1조(목적)</p>
          <p class="arti_desc">1. 본 약관은 고강도(이하 "고강도")의 홈페이지(이하 "고강도 사이트")에서 제공하는 모든 서비스(이하  "서비스")의 이용조건 및 절차, 이용자와 홈페이지(gogangdo.or.kr)의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
        </div>
        <div class="agree_chk">
          <input type="checkbox" id="agreement1"><label for="agreement1">이용 약관에 동의합니다.</label>
        </div>
        <h4>개인정보수집 및 이용에 대한 안내 (필수정보)</h4>
        <div class="agree_box">
          <div class="desc">
            <p>수집하려는 개인정보의 항목</p>
            <p>가. 본 사이트는 회원가입, 원활한  주문상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 개인정보를 수집하고 있습니다.</p>
            <p>▶ 필수정보 : 아이디, 생년월일, 성별, 성명, 비밀번호, 전화번호, 주소, 이메일</p>
            <p>▶ 선택사항 : 메일링수신여부, SMS수신여부</p>
          </div>
          <p class="article">나. 서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.</p>
        </div>
        <div class="agree_chk">
          <input type="checkbox" id="agreement2"><label for="agreement2">이용 약관에 동의합니다.</label>
        </div>
        <h4>개인정보수집 및 이용에 대한 안내 (선택정보)</h4>
        <div class="agree_box">
          <div class="desc">
            <p>고강도 쇼핑몰는 사이트에서 제공하는 등의  서비스를 제공함에 있어 이용자의 편의를 위해 아래와 같이 선택적 정보를 수집 및 이용하고 있습니다. 다만, 이용목적은 수집목적을 벗어나지 않는 범위에서 추가 서비스제공을 위해 확장될 수 있으며 이 경우에는 미리 회원에게 그 사실을 알려 드립니다.</p>
            <p class="article">1. 개인정보의 수집·이용 목적</p>
            <p>고강도 사이트에서 제공하는 서비스는 다음의 목적을 위해 개인정보를 수집·이용합니다.</p>
            <p>&nbsp;&nbsp;&nbsp;수집된 개인정보는 다음의 목적이외의 용도로 이용되지 않습니다.</p>
          </div>
        </div>
        <div class="agree_chk">
          <input type="checkbox" id="agreement3"><label for="agreement3">개인정보수집 및 이용에 동의합니다.</label>
        </div>
        <h4>개인정보수집 및 이용에 대한 안내 (선택정보)</h4>
        <div class="agree_box">
          <div class="desc">
            <p>사이트에서 수집된 개인정보는 아래 기관에 자격기본법 제35조에 의해 제공될 수 있습니다.</p>
            <p></p>
            <p></p>
            <p>성명,이메일, 연락처</p>
            <p></p>
            <p></p>
          </div>
        </div>
        <div class="agree_chk">
          <input type="checkbox" id="agreement4"><label for="agreement4">개인정보 제3자 제공에 동의합니다.</label>
        </div>
        <div class="text_warning">※ 미동의시 고강도 알람을 받을 수 없고 관련된 제반 서비스가 제공되지 않습니다.</div>
        <div class="btn_set">
          <button type="button">  취소</button>
          <button type="button" onclick = "location.href ='registerView2.do'">회원가입</button>
        </div>
      </div>
    </section>
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
  </body>
  <jsp:include page="include/footer.jsp"></jsp:include>
</html>

</body>
</html>