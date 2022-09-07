<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/register.css" rel="stylesheet">
<link href="resources/css/reset.css" rel="stylesheet"/>
<link href="resources/css/global.css" rel="stylesheet"/>   
<title>회원가입</title>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
 <section class="sub-contents">
      <div class="inner memberjoin">
        <h3 class="inner memberjoin">회원가입</h3>
        <div class="text_warning">※ 이름, 생년월일, 성별은 수정할 수 없습니다. 다른 이름으로 가입 하시려면 관리자에게 전화 주십시오.</div>
        <div class="table_res">
          <dl>
            <dt>아이디</dt>
            <dd>
              <p class="flex-row">
              <input type="text"><button class="btn type2">중복확인</button>
              </p>
              <p class="desc">6~12자 이하 영문, 숫자조합</p>
            </dd>
          </dl>
          <dl>
            <dt>이름</dt>
            <dd><input type="text"></dd>
          </dl>
          <dl>
            <dt>생년월일</dt>
            <dd class="birth">
              <p class="flex-row">
                <select>
                  <option>1996</option>
                  <option>1997</option>
                  <option>1998</option>
                  <option>1999</option>
                </select>
                년
                <select>
                  <option>01</option>
                  <option>02</option>
                  <option>03</option>
                  <option>04</option>
                  <option>05</option>
                  <option>06</option>
                  <option>07</option>
                  <option>08</option>
                  <option>09</option>
                  <option>10</option>
                  <option>11</option>
                  <option>12</option>
                </select>
                월
                <select>
                  <option>01</option>
                  <option>02</option>
                  <option>03</option>
                  <option>04</option>
                  <option>05</option>
                  <option>06</option>
                  <option>07</option>
                  <option>08</option>
                  <option>09</option>
                  <option>10</option>
                  <option>11</option>
                  <option>12</option>
                </select>
                일
              </p>
            </dd>
          </dl>
          <dl>
            <dt>성별</dt>
            <dd class="gender-radio">
              <label><input type="radio" name="gender">남</label>
              <label><input type="radio" name="gender">여</label>
            </dd>
          </dl>
          <dl>
            <dt>비밀번호</dt>
            <dd>
              <input type="text">
              <p class="desc">10~20자 이하 영문자, 숫자, 특수문자의 조합</p>
            </dd>
          </dl>
          <dl>
            <dt>비밀번호 확인</dt>
            <dd>
              <input type="text">
              <p class="desc">확인을 위해 다시한번 입력해 주세요</p>
            </dd>
          </dl>
          <dl>
            <dt>전화번호</dt>
            <dd class="input-tel">
              <p class="flex-row">
                <input type="text"><span>-</span>
                <input type="text"><span>-</span>
                <input type="text">
              </p>
            </dd>
          </dl>
          <dl>
            <dt>휴대폰</dt>
            <dd class="input-tel">
              <p class="flex-row">
                <input type="text"><span>-</span>
                <input type="text"><span>-</span>
                <input type="text">
              </p>
            </dd>
          </dl>
          <dl>
            <dt>이메일</dt>
            <dd class="input-email">
              <p class="flex-row">
                <input type="text">
                <span>@</span>
                <input type="text">
                <select>
                  <option>직접입력</option>
                  <option>gmail.com</option>
                  <option>naver.com</option>
                  <option>hanmail.net</option>
                </select>
              </p>
            </dd>
          </dl>
          <dl>
            <dt>주소</dt>
            <dd class="input-addr">
              <p class="flex-row">
                <input class="zipcode" type="text"><button class="btn type2">주소검색</button>
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
      </div>
    </section>	
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>