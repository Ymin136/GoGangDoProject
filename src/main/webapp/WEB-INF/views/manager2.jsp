<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ������</title>
<style type="text/css">
	form{
		display :inline;
	}
</style>
</head>
<body>
<c:if test="${sessionScope.user_grade !=0 }">
		<script>
			alert("�����ڸ� ���� �����մϴ�");
			location.href="main.do";
		</script>
	</c:if>	 
	<header>
		<h2>�ݷ����� ������ ������ </h2>
	</header>
	<a>������ ���ٱ��� ����</a><br>
	<table>
		<c:forEach var="member" items="${requestScope.memberList }">
			<tr>
				<td>���̵� : ${member.id } | ���� ���� : ${member.user_grade } | 
				<form action="updateMemberAccess.do">
				���� ���� : 
				<input type="hidden" name="id" value="${member.id }">
				<select name="user_grade">
					<option value="0">0</option>
					<option value="1">1</option>
				</select>
				<button>��� ���� ����</button>
				</form> 
				</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a>��ǰ ���/����/���� </a>
	<a>��ǰ ��� ��ȸ/����/����</a>
	<a>ȯ�� ���� ��ȸ/���</a>
	<a>����� �˻����</a>
	<a>�ֹ� ���� Ȯ��</a>
	<a>���� ���</a>
	<a>��ۿ��� Ȯ��</a>
	<a>���� ��ƺ���/ �������</a>
</body>
</html>