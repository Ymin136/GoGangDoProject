<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/register2.css" rel="stylesheet">
<link href="resources/css/register.css" rel="stylesheet"/>
 <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script> 
<script type="text/javascript">
	$(function(){
		$('.type2').click(function(){
			var d = 'id='+$('.id_chk').val();
			$.ajax({
				url:'idCheck.do',
				data : d,
				success : function(r){
					if(r==1){
						id_chk_flag = true;
					}else {
						id_chk_flag = false;
						var id_p = $('.id_chk_p');
						id_p.css('color','red');
						id_p.html('아이디가 중복됩니다.');
					}
				}
			})
		})
		$('.pw').keyup(function(){
			let pass1 = $("#password_1").val();
			let pass2 = $("#password_2").val();
			
			if(pass1 != "" || pass2 != ""){
				if(pass1 == pass2){
					$("#checkPw").html('일치');
					$("#checkPw").attr('color','green');
				}else {
					$("#checkPw").html('불일치');
					$("#checkPw").attr('color','red');
				}
			}
		})
})

</script>   
<title>회원가입</title>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
 <section class="sub-contents">
      <div class="inner memberjoin">
       <form action="registerView3.do">
        <h3 class="inner memberjoin">회원가입</h3>
        <div class="text_warning">※ 이름은 수정할 수 없습니다. 다른 이름으로 가입 하시려면 관리자에게 전화 주십시오.</div>
        <div class="table_res">
       		<input type="hidden" name="user_no" value="232">
       		<input type="hidden" name="user_grade" value="2"> 
          <dl>
            <dt>아이디</dt>
            <dd>
              <p class="flex-row">
              <input type="text" name="id" class="id_chk"><button class="btn type2" type="button">아이디 확인</button>
              <div class="id_chk_p"></div>
              </p>
            </dd>
          </dl>
          <dl>
            <dt>비밀번호</dt>
            <dd>
              <input type="text" name="pw" class = "pw" id = "password_1">
              <input type="text" name = "pw2" class = "pw"  id="password_2">
              <font id = "checkPw" size = "2"></font>  
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
                <input type="text" id="sample4_postcode" placeholder="우편번호">
                <input type="button" class="btn type2" onclick="sample4_execDaumPostcode()" value="주소검색"><br>
				<input type="text" id="sample4_roadAddress" name=addess placeholder="도로명주소">
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소">
				<input type="text" id="sample4_extraAddress" placeholder="참고항목">
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
              </p>
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