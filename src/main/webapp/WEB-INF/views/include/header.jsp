<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href = "resources/css/header.css" rel="stylesheet">
</head>
<body>
<div id="header_container"> 
<div id = "header_non_login">
	<ul>
		<a href="loginView.do"><li>로그인</li></a>
		<a href="registerView.do"><li>회원가입</li></a>	
	</ul>
</div>
<div id="header_main">
	<a href="#"><img alt="logo" src="resources/img/logo.jpg" width = "400px" height="80px"><br></a>
</div>
<nav id = "header_menu_bar">
	<ul>
		<li> <img alt="menubar" src="resources/img/menubar.PNG" width = "40px" height="40px"> </li>
		<a href="productList.do"><li>사료/분유</li></a>
		<a href="productList.do"><li>간식</li></a>	
		<a href="productList.do"><li>영양제</li></a>
		<a href="productList.do"><li>위생/배변</li></a>
		<a href="productList.do"><li>미용/목욕</li></a>
		<a href="productList.do"><li>장난감</li></a>
		<a href="productList.do"><li>고양이</li></a>
	</ul>
</nav>
</div>
</body>
</html>