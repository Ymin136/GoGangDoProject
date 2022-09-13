<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href = "resources/css/header.css" rel="stylesheet">
<style type="text/css">
	#header_nav_menu_bar{
		z-index: 100;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<script type="text/javascript">
$(function(){
	$('#header_top').offset({top:800, left:1800});
	$("#header_nav_menu_bar").hide();
	$('#menubar').mouseenter(function(){
    	var l = $('#menubar').position().left;
    	var t = $('#menubar').position().top + 40;
    	$('#header_nav_menu_bar').css("left",l);
    	$('#header_nav_menu_bar').css("top",t);
    	$("#header_nav_menu_bar").show();
    });
    $('#menubar').mouseleave(function(){
    	$("#header_nav_menu_bar").hide();
    });
    $("#header_nav_menu_bar").mouseenter(function(){
    	$("#header_nav_menu_bar").show();
    });
    $("#header_nav_menu_bar").mouseleave(function(){
    	$("#header_nav_menu_bar").hide();
    });
});
</script>
</head>
<body>
<div id="header_container"> 
<div id = "header_login_container">
<c:choose>
	<c:when test="${!sessionScope.login }">
	<div id = "header_non_login">	
		<ul>
		<li><a href="loginView.do">로그인</a></li>
		<li><a href="registerView.do">회원가입</a></li>
		</ul>
	</div>
	</c:when>
	<c:when test="${sessionScope.user_no != 0 }">
	<div id = "header_login">
		 <ul>
		 <li>${sessionScope.user_name }님</li>
		 <li><a href="myPage.do">마이페이지</a></li>	 	
		 <li><a href="loginoutView.do">로그아웃</a></li>
		 </ul>
	</div>		 
	</c:when>
	<c:otherwise>
	<div id = "header_admin">
		 <ul>
		 <li>${sessionScope.user_name }님</li>
		 <li><a href="myPage.do">관리자페이지</a></li>	 	
		 <li><a href="loginoutView.do">로그아웃</a></li>
		 </ul>
	</div>	
	</c:otherwise>
</c:choose>	
</div>
<div id="header_main">
	<table>
	<tr>
		<td></td>
		<td><a href="main.do"><img alt="logo" src="resources/img/logo.jpg" width = "400px" height="80px"><br></a></td>
		<td id="header_search">
			<form action="productList.do" method="get">
				<button></button><input type="text" name="search">
			</form>
		</td>
	</tr>
	</table>
</div>
<nav id = "header_menu_bar">
	<ul>
		<li><img id="menubar" alt="menubar" src="resources/img/menubar.PNG" width = "40px" height="40px"></li>
		<li><a href="productList.do?category_no=0">사료/분유</a></li>
		<li><a href="productList.do?category_no=1">간식</a></li>	
		<li><a href="productList.do?category_no=2">영양제</a></li>
		<li><a href="productList.do">위생/배변</a></li>
		<li><a href="productList.do">미용/목욕</a></li>
	</ul>
</nav>
<table id="header_nav_menu_bar">
	<tr><td id="top" rowspan="3" ><a href="productList.do">사료/분유</a></td>
	<td><a href="productSubList.do?sub_category_no=0">건식사료</a></td></tr>	
	<tr><td><a href="productSubList.do?sub_category_no=4">습식사료</a></td></tr>
	<tr><td></td></tr><tr><td></td></tr>
	<tr><td id="top" rowspan="3" ><a href="productList.do">간식</a></td>
	<td><a href="productList.do">간식</a></td></tr>	
	<tr><td><a href="productList.do">수제간식</a></td></tr>
	<tr><td><a href="productList.do">건조간식</a></td></tr>
	<tr><td></td></tr><tr><td></td></tr>
	<tr><td id="top" rowspan="3" ><a href="productList.do">영양제</a></td>
	<td><a href="productList.do">종합영양제</a></td></tr>	
	<tr><td><a href="productList.do">치아/피부</a></td></tr>
	<tr><td></td></tr><tr><td></td></tr>
	<tr><td id="top" rowspan="3" ><a href="productList.do">위생/배변</a></td>
	<td><a href="productList.do">배변패드/배변판</a></td></tr>	
	<tr><td><a href="productList.do">기저귀</a></td></tr>
	<tr><td><a href="productList.do">탈취/소독</a></td></tr>
	<tr><td></td></tr><tr><td></td></tr>
	<tr><td id="top" rowspan="3" ><a href="productList.do">미용/목욕</a></td>
	<td><a href="productList.do">샴푸/린스</a></td></tr>	
	<tr><td><a href="productList.do">브러쉬</a></td></tr>
	<tr><td id="top" rowspan="3" ><a href="productList.do">장난감</a></td>
	<tr><td></td></tr><tr><td></td></tr>
	<tr><td></td></tr><tr><td></td></tr>
	<tr><td id="top" rowspan="3" ><a href="productList.do">고양이</a></td>
	<td><a href="productList.do">사료/간식/영양제</a></td></tr>	
	<tr><td><a href="productRegisterView.do">위생/미용/목욕</a></td></tr>
	<tr><td><a href="cartView.do">장난감</a></td></tr>
	<tr><td></td></tr><tr><td></td></tr>
</table>
</div>
</body>
</html>