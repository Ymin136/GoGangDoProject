<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/all.css" rel="stylesheet">
<link href="resources/css/getinfo.css" rel="stylesheet">
</head>
<body>
<c:if test="${sessionScope.login == null || sessionScope.login == false  }">
		<script>
			alert("로그인을 하셔야 이용할수 있습니다.");
			location.href="loginView.do";
		</script>
	</c:if>
<jsp:include page="include/header.jsp"></jsp:include>
	<div id="main_container">
		
		<div id="first_header2">
		<table class="first_t">
			<tr>
				<th><h2>회원정보 변경</h2></th>
			</tr>
		</table>
		</div>
		
		<div id="second_header">
			<h3>기본정보</h3>
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			
			<h6>*표시는 반드시 입력하셔야 하는 항목 입니다.</h6>
			</div>
			
			<form action="userUpdate.do">
			<div id="first_header">
			<table class="info_table">
			<tr>
				<td class="j">*아이디</td>
				<td class="j"><input type="text" id="pname" name="id" value="dadd"></td>
				<td class="j">&nbsp</td>
			</tr>
			<tr>
				<td class="j">*비밀번호</td>
				<td class="j">
					<input type="password" id="pname" name="pw" placeholder="8자리 이상입력">
				</td>
				<td class="j"></td>
			</tr>
			<tr>
				<td class="j">*이름</td>
				<td class="j">
					<input type="text" id="pname" name="user_name" value="이준택">
				</td>
				<td class="j"></td>
			</tr>
			<tr>
				<td rowspan='2' class="j">*이메일</td>
				<td >
					<form>
  						<input type="text" id="pname" class="mail" name="email" value="jun@">
					<select id="pname" mutiple>
					<option value="">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmail.com.com">hanmail.com</option>
					<option value="outlook.com">outlook.com</option>
					</select>
					</form>
				</td>
				<td></td>
			</tr>
			<tr>
				
				<td class="f"><input type="checkbox" id="pname" value="메일 수신">정보/이벤트 메일 수신에 동의합니다.</td>
				<td class="f"></td>
			</tr>
			<tr>
				<td rowspan='2' class="j">*휴대폰 번호</td>
				<td >
  						<input type="text" id="pname" name="tel" value="01077479832">

					
				</td>
				<td></td>
			</tr>
			<tr>
				
				<td class="f"><input type="checkbox" id="pname" name="항목" value="메일 수신">정보/이벤트 메일 수신에 동의합니다.</td>
				<td class="f"> </td>
			</tr>
			<tr class="adress">
				<td rowspan='3' class="j">*주소</td>
				<td><input type="text" id="pname" name="address"><button type="button" id="bu" onclick="location.href='https://www.epost.go.kr/search.RetrieveIntegrationNewZipCdList.comm' " style='cursor:pointer;'>우편번호검색</button></td>
				<td></td>
			</tr>
			<tr>
				
				<td><input type="text" id="pname" placeholder="도/시"><input type="text" id="pname" placeholder="도시"></td>
				<td></td>
			</tr>
			<tr class="adress2">
				
				<td><input type="text" id="pname" size="80px" placeholder="상세주소"></td>
				<td></td>
			</tr>
			
			</table>
			</div>
			
			<!-- <div id="first_header3">
		<table class="first_t2">
			<tr>
				<th ><h3>부가정보</h3></th>
			</tr>
		</table>
		</div> -->
		
		<!-- <div id="plustable">
		<table class="plus" >
		<tr>
			<td id="left"	>반려동물 이름</td>
			<td><input type="text" id="pname" name="이름" placeholder="이름을 입력해주세요"></td>
		</tr>
		<tr>
		<td id="left">생일</td>
			<td id="right">	
					<select id="yearselect" mutiple >
					<option value="2022">년</option>
					<option value="2022">2022</option>
					<option value="2021">2021</option>
					<option value="2020">2020</option>
					<option value="2019">2019</option>
					<option value="2018">2018</option>
					<option value="2017">2017</option>
					</select>
			</td>
			<td id="right">	
					<select id="monthselect" mutiple>
					<option value="12">월</option>
					<option value="12">12</option>
					<option value="11">11</option>
					<option value="10">10</option>
					<option value="9">9</option>
					<option value="8">8</option>
					<option value="7">7</option>
					<option value="6">6</option>
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
					</select>
			</td>
			<td id="right">	
					<select id="dayselect" mutiple>
					<option value="31">일</option>
					<option value="31">31</option>
					<option value="30">30</option>
					<option value="29">29</option>
					<option value="28">28</option>
					<option value="27">27</option>
					<option value="26">26</option>
					<option value="25">25</option>
					<option value="24">24</option>
					<option value="23">23</option>
					<option value="22">22</option>
					<option value="21">21</option>
					<option value="20">20</option>
					<option value="19">19</option>
					<option value="18">18</option>
					<option value="17">17</option>
					<option value="16">16</option>
					<option value="15">15</option>
					<option value="14">14</option>
					<option value="13">13</option>
					<option value="12">12</option>
					<option value="11">11</option>
					<option value="10">10</option>
					<option value="9">9</option>
					<option value="8">8</option>
					<option value="7">7</option>
					<option value="6">6</option>
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
					</select>
			</td>
		</tr>
		<tr>
			<td>남기는 말씀</td>
			<td>
				<textarea id="story" name="story"
          		rows="5" cols="33">
				
				</textarea>
			</td>
		</tr>
		</table>
		</div> -->
		
		<div id="infofix">
		<a href="javascript:window.history.back();">
		<button type="button" class="info" style='cursor:pointer;'>정보수정</button></a>
		<button class="fix" style='cursor:pointer;'>취소</button>
		</div>
		</form>
		<div id="exit">
		<a href="userDelete.do?id=${sessionScope.id }">회원탈퇴</a>
		</div>
	
	</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>