<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고강도</title>
<link href="resources/css/all.css" rel="stylesheet">
<link href="resources/css/mypage.css" rel="stylesheet">
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>

		<div id="main_container">
			<div id="main_table">
				<table>
				<tr>
					<th><img src="resources/img/GeneralMembership.png" width="50px" height="50px"></th>
					<th><img src="resources/img/coupon.png" width="50px" height="50px"></th>
					<th><img src="resources/img/Mileage.png" width="50px" height="50px"></th>
				</tr>
				<tr>
					<th>일반회원등급 입니다.</th>
					<th>쿠폰</th>
					<th>마일리지</th>
				</tr>
				<tr>
					<th><button type="button"><img src="resources/img/MembershipBenefits.png" alt="">등급혜택보기</button></th>
					<th>3장</th>
					<th>0원</th>	
				</tr>
				</table>
			</div>
		</div>

<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>