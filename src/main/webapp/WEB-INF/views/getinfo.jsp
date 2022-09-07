<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/all.css" rel="stylesheet">
<link href="resources/css/getinfo.css" rel="stylesheet">
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
	<div id="main_container">
		
		<div id="first_header">
		<table>
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
			
			<div id="first_header">
			<table class="info_table">
			<tr>
				<td class="j">아이디</td>
				<td class="j">jun</td>
				<td class="j">&nbsp</td>
			</tr>
			<tr>
				<td class="j">비밀번호</td>
				<td class="j">
					<button></button>
					<button></button>
				</td>
				<td class="j"></td>
			</tr>
			<tr>
				<td class="j">이름</td>
				<td class="j">이준택</td>
				<td class="j"></td>
			</tr>
			<tr>
				<td rowspan='2' class="j">이메일</td>
				<td >jun@naver.com</td>
				<td>직접입력</td>
			</tr>
			<tr>
				
				<td class="f">정보/이벤트 메일 수신에 동의합니다.</td>
				<td class="f"></td>
			</tr>
			<tr>
				<td rowspan='2' class="j">휴대폰 번호</td>
				<td >01012345678</td>
				<td></td>
			</tr>
			<tr>
				
				<td class="f">정보/이벤트 메일 수신에 동의합니다.</td>
				<td class="f"> </td>
			</tr>
			<tr>
				<td class="j">전화번호</td>
				<td class="f">-없이 입력하세요</td>
				<td class="f"></td>
			</tr>
			<tr>
				<td rowspan='3' class="j">주소</td>
				<td><input type="text" name="우편번호"><button>우편번호검색</button></td>
				<td></td>
			</tr>
			<tr>
				
				<td><input type="text" name="우편번호"><input type="text" name="우편번호"></td>
				<td></td>
			</tr>
			<tr>
				
				<td><input type="text" name="우편번호"><input type="text" name="우편번호"><input type="text" name="우편번호"></td>
				<td></td>
			</tr>
			
			</table>
			</div>
	
	</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>