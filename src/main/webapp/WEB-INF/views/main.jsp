<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고강도</title>
<link href="resources/css/main.css" rel="stylesheet">
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>

<div id="main_container">
	<img alt="main_dog" src="/resources/img/main_dog.PNG" width="1200px" height="400px">
	<h1>WEEKLY BEST</h1>
	<h3>후회없는 베스트 상품</h3>
</div>
    <table class="main_product">
   		<tr>
            <div class="container">
                <td class="product"><a href="productDetail.do?product_no=88"><img src="resources/img/mainimg1.png" alt="#" style="width: 280px; height: 388px;"><br>요거바이트<br>블루베리맛 동결건조 요거트<br><span style="font-weight: bold;">5,900원</font></td>
                <td class="product"><img src="resources/img/mainimg2.png" alt="#" style="width: 280px; height: 388px;"><br>상품명<br>상품간략설명<br><span style="font-weight: bold;">가격</font></td>
                <td class="product"><img src="resources/img/mpi3.png" alt="#"><br>상품명<br>상품간략설명<br><span style="font-weight: bold;">가격</font></td>
                <td><img src="resources/img/mpi4.png" alt="#"><br>상품명<br>상품간략설명<br><span style="font-weight: bold;">가격</font></td>
            </div>
        </tr>
        </table>  
    <table class="main_product">
        <tr>
            <div class="container">
                <td class="product"><img src="resources/img/mpi1.png" alt="#"><br>개껌<br>3개가 들어있습니다<br><span style="font-weight: bold;">4,500원</font></td>
                <td class="product"><img src="resources/img/mpi2.png" alt="#"><br>상품명<br>상품간략설명<br><span style="font-weight: bold;">가격</font></td>
                <td class="product"><img src="resources/img/mpi3.png" alt="#"><br>상품명<br>상품간략설명<br><span style="font-weight: bold;">가격</font></td>
                <td><img src="resources/img/mpi4.png" alt="#"><br>상품명<br>상품간략설명<br><span style="font-weight: bold;">가격</font></td>
            </div>
        </tr>
    </table>        
<jsp:include page="include/footer.jsp"></jsp:include>
</script>
</div>
</body>
</html>