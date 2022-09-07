<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고강도</title>
<link href="resources/css/product_register.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
$(function(){
	$('#main_cat').change(function(){
		var main = $('#main_cat').val();
		$("#sub_cat").find("option").remove();
		if(main == 0){
			$("#sub_cat").append("<option value = '0'>건식사료</option>");
			$("#sub_cat").append("<option value = '1'>습식사료</option>");
		}else if(main == 1){
			$("#sub_cat").append("<option value = '2'>건조간식</option>");
			$("#sub_cat").append("<option value = '3'>수제간식</option>");
		}else if(main == 2){
			$("#sub_cat").append("<option value = '4'>종합영양제</option>");
			$("#sub_cat").append("<option value = '5'>치아/피부</option>");
		}else if(main == 3){
			$("#sub_cat").append("<option value = '6'>배변패드/배변판</option>");
			$("#sub_cat").append("<option value = '7'>기저귀</option>");
			$("#sub_cat").append("<option value = '8'>탈취/소독</option>");
		}else if(main == 4){
			$("#sub_cat").append("<option value = '9'>샴푸/린스</option>");
			$("#sub_cat").append("<option value = '10'>브러쉬</option>");
		}else if(main == 5){
			$("#sub_cat").append("<option value = 'none'>장난감</option>");	
		}else if(main == 6){
			$("#sub_cat").append("<option value = '11'>사료/간식/영양제</option>");
			$("#sub_cat").append("<option value = '12'>위생/미용/목욕</option>");
			$("#sub_cat").append("<option value = '13'>장난감</option>");
		}
	});
});
</script>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
<div id="container">
	<h1>상품등록</h1>
	<form action="productRegister.do">
		<table>
			<tr>
				<td id="left"><h2>상품명</h2></td>
				<td><input type="text" width="300px" name="productName"></td>
			</tr>
			<tr>
				<td id="left"><h2>상품설명</h2></td>
				<td><textarea name="productContent"></textarea></td>
			</tr>
			<tr>
				<td id="left"><h2>카테고리</h2></td>
				<td><select id="main_cat" name="categoryNo">
					<option value="none">카테고리</option>
					<option value="0">사료/분유</option>
					<option value="1">간식</option>
					<option value="2">영양제</option>
					<option value="3">위생/배변</option>
					<option value="4">미용/목용</option>
					<option value="5">장난감</option>
					<option value="6">고양이</option>
				</select>
				<select id ="sub_cat" name="subcategoryNo">
					<option value="none">하위카테고리</option>
				</select></td>
			</tr>
			<tr>
				<td id="left"><h2>가격</h2></td>
				<td><input type="number" name="productPrice"></td>
			</tr>
			<tr>
				<td id="left"><h2>재고</h2></td>
				<td><input type="number" name="productStock"></td>
			</tr>
			<tr>
				<td id="left"><h2>상품이미지(썸네일)</h2></td>
				<td> <input type="file"> </td>
			</tr>
			<tr>
				<td id="left"><h2>상품이미지(상품설명)</h2></td>
				<td> <input type="file"> </td>
			</tr>
			<tr>
				<td colspan="2" id="btn_td">
				<a href="javascript:history.back();"><button type="button">취소</button></a>
				<button>등록하기</button></td>				
			</tr>
		</table>
	</form>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>