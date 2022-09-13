<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/register2.css" rel="stylesheet">
<link href="resources/css/register.css" rel="stylesheet"/>
<link href="resources/css/global.css" rel="stylesheet"/>
  
  <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script> 


   
<title>회원가입</title>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
 <section class="sub-contents">
      <div class="inner memberjoin">
       <form action="registerView3.do">
        <h3 class="inner memberjoin">회원가입</h3>
        <div class="text_warning">※ 이름, 생년월일은 수정할 수 없습니다. 다른 이름으로 가입 하시려면 관리자에게 전화 주십시오.</div>
        <div class="table_res">
       		<input type="hidden" name="user_no" value="232">
       		<input type="hidden" name="user_grade" value="2"> 
          <dl>
            <dt>아이디</dt>
            <dd>
              <p class="flex-row">
              <input type="text" name="id"><button class="btn type2">확인</button>
              </p>
            </dd>
          </dl>
          <dl>
            <dt>비밀번호</dt>
            <dd>
              <input type="text" name="pw">
            </dd>
          </dl>          
          <dl>
            <dt>이름</dt>
            <dd><input type="text" name="user_name"></dd>
          </dl>
          <dl>
            <dt>휴대폰</dt>
            <dd class="input-tel">
              <p class="flex-row">
                <input type="text" name="tel">
              </p>
            </dd>
          </dl>
          <dl>
            <dt>이메일</dt>
            <dd class="input-email">
              <p class="flex-row">
                <input type="text" name="email">
              </p>
            </dd>
          </dl>
          <dl>
            <dt>주소</dt>
            <dd class="input-addr">
              <p class="flex-row">
                <input class="zipcode" name="address" type="text"><button class="btn type2">주소검색</button>
              </p>
              <p class="addr1"><input type="text" placeholder="주소"></p>
              <p class="addr2"><input type="text" placeholder="상세주소"></p>
            </dd>
          </dl>        
          <dl>
            <dt>정보수신동의</dt>
            <dd class="agree-check">
              <p class="flex-row">
                <label><input type="checkbox">문자수신동의</label>
                <label><input type="checkbox">이메일수신동의</label>
              </p>
            </dd>
          </dl>
        </div>
        <div class="btn_set">
          <button class="btn type1 cancel">취소</button>
          <button class="btn type1 ok">회원가입</button>
        </div>
        </form>
      </div>
    </section>	
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>