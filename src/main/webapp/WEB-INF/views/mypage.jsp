<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고강도</title>
<link href="resources/css/all.css" rel="stylesheet">
<link href="resources/css/mypage.css" rel="stylesheet">
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
					<th><a href="getInfo.do"><button type="button" style='cursor:pointer;'>개인정보 수정</button></a></th>
					<th>3장</th>
					<th>0원</th>	
				</tr>
				</table>
			</div>
			
			<div id="second_header">
			<h2>진행 중인 주문</h2>&nbsp&nbsp<h5>최근 30일 내에 진행중인 주문정보입니다.</h5>
			</div>
			
			<div id="second_table">
			<table id= "ing_table">
			<tr>
				<th>주문일자</th>
				<th>주문번호</th>
				<th>상품명</th>
				<th>결제금액</th>
				<th>배송현황</th>
			</tr>
			<tr>
				<td>2022.09.05</td>
				<td>10</td>
				<td>샴푸</td>
				<td>20,000원</td>
				<td><button type="button" 
				onclick="location.href='https://www.cjlogistics.com//ko/tool/parcel/tracking' 
				" style='cursor:pointer;'>조회</button></td>
			</tr>
			<tr>
				<td>2022.09.06</td>
				<td>9</td>
				<td>장난감</td>
				<td>40,000원</td>
				<td><button type="button" onclick="location.href='https://www.cjlogistics.com//ko/tool/parcel/tracking' " style='cursor:pointer;'>조회</button></td>
			</tr>
			<tr>
				<td>2022.09.07</td>
				<td>8</td>
				<td>사료</td>
				<td>50,000원</td>
				<td><button type="button" onclick="location.href='https://www.cjlogistics.com//ko/tool/parcel/tracking' " style='cursor:pointer;'>조회</button></td>
			</tr>
			<tr>
				<td>2022.09.08</td>
				<td>7</td>
				<td>하네스</td>
				<td>25,000원</td>
				<td><button type="button" onclick="location.href='https://www.cjlogistics.com//ko/tool/parcel/tracking' " style='cursor:pointer;'>조회</button></td>
			</tr>
			
			</table>
			</div>
			
			
			
			<div id="three_header">
			<h2>최근 주문 정보</h2>&nbsp&nbsp<h5>최근 30일 내에 진행중인 주문정보입니다.</h5>
			</div>
			
			<div id="three_table">
			<table id= "ing2_table">
			<tr>
				<th>주문일자</th>
				<th>주문번호</th>
				<th>상품명</th>
				<th>결제금액</th>
				<th>주문상태</th>
			</tr>
			<tr>
				<td>2022.09.05</td>
				<td>10</td>
				<td>빅스비 러블 건식키블사료</td>
				<td>37000원</td>
				<td><a href="/productDetail.do?product_no=83#review_container">
				<button type="button"style='cursor:pointer;'>후기작성</button></a></td>
			</tr>
			<tr>
				<td>2022.09.06</td>
				<td>9</td>
				<td>빅스비 러블 건식키블사료</td>
				<td>37000원</td>
				<td><a href="/productDetail.do?product_no=82#review_container"><button type="button"style='cursor:pointer;'>후기작성</button></a></td>
			</tr>
			<tr>
				<td>2022.09.07</td>
				<td>8</td>
				<td>원더푸드 요거바이트</td>
				<td>5900원</td>
				<td><a href="/productDetail.do?product_no=88#review_container"><button type="button"style='cursor:pointer'>후기작성</button></a></td>
			</tr>
			<tr>
				<td>2022.09.08</td>
				<td>7</td>
				<td>스페시픽 처방사료</td>
				<td>5900원</td>
				<td><a href="/productDetail.do?product_no=85#review_container"><button type="button"style='cursor:pointer'>후기작성</button></a></td>
			</tr>
			
			</table>
			</div>
			
			<div id="f_header">
			<h2><a href="cartView.do">장바구니</a></h2>
			</div>
			
			<div id="f_table">
			<table id="f2_table">
            		<tr style="height:70px">
				<c:forEach var="cart" items="${requestScope.cart }">
             			<td style="font-size:14px;color:gray">
             			<a href="/productDetail.do?product_no=${cart.product_no}">
             			<img alt="" src="imageLoad.do?fno=${cart.img_no }"></a></td>
            	</c:forEach>
            		</tr>
			</table>
			</div>
		</div>

<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>