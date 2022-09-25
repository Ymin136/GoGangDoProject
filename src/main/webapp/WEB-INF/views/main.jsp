<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고강도</title>
<style>
.main_product img{
	width: 300px;
	height: 300px;
}


</style>
<link href="resources/css/main.css" rel="stylesheet">
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>

<div id="main_container">
	<img alt="main_dog" src="/resources/img/main_dog.PNG" width="1200px" height="400px">
	<p style="font-weight: bold; font-size: 25px;"><br><br>WEEKLY BEST</p>
	<p style="font-size: 18px;">이번 달 베스트 상품을 만나보세요

    <table class="main_product">
   		<tr>
            <c:forEach var="dto" items="${requestScope.list }">
             			<td style="font-size:14px;color:gray">
             			<a href="productDetail.do?product_no=${dto.product_no }"><img alt="" src="imageLoad.do?fno=${dto.img_no }"><span id="productName"> ${dto.product_name }</span></a> 
             			<br>${dto.product_price }</a></td>
            </c:forEach>
        </tr>
        </table>  
    <table class="main_product">
        <tr>
        <c:forEach var="dto" items="${requestScope.list2 }">
             			<td style="font-size:14px;color:gray"><a href="productDetail.do?product_no=${dto.product_no }"><img alt="" src="imageLoad.do?fno=${dto.img_no }"></a></td>
            	</c:forEach>
        </tr>
    </table>
    </div>        
<jsp:include page="include/footer.jsp"></jsp:include>
</script>
</div>
</body>
</html>