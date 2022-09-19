<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 페이지</title>
<style type="text/css">
	form{
		display :inline;
	}
</style>
</head>
<body>
<c:if test="${sessionScope.user_grade !=0 }">
		<script>
			alert("관리자만 접근 가능합니다");
			location.href="main.do";
		</script>
	</c:if>	 
	<header>
		<h2>반려동물 관리자 페이지 </h2>
	</header>
	<a>관리자 접근권한 설정</a><br>
	<table>
		<c:forEach var="member" items="${requestScope.memberList }">
			<tr>
				<td>아이디 : ${member.id } | 접근 권한 : ${member.user_grade } | 
				<form action="updateMemberAccess.do">
				권한 변경 : 
				<input type="hidden" name="id" value="${member.id }">
				<select name="user_grade">
					<option value="0">0</option>
					<option value="1">1</option>
				</select>
				<button>멤버 권한 변경</button>
				</form> 
				</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a>상품 등록/수정/삭제 </a>
	<a>상품 목록 조회/수정/삭제</a>
	<a>환불 내역 조회/등록</a>
	<a>사용자 검색기능</a>
	<a>주문 내역 확인</a>
	<a>송장 등록</a>
	<a>배송여부 확인</a>
	<a>리뷰 모아보기/ 삭제기능</a>
</body>
</html>