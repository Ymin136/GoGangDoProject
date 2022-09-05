<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href = "resources/css/header.css" rel="stylesheet">
<style type="text/css">
	#header_search button{
		width:35px;
		height:35px;
		border: none;
		background: url("resources/img/search_img.PNG") no-repeat;
	}
	#header_nav_menu_bar a:link,#header_nav_menu_bar a:visited {
		color:white;
		text-decoration: none;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#header_nav_menu_bar").hide();
	$('#menubar').mouseenter(function(){
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
<div id = "header_non_login">
	<ul>
		<a href="loginView.do"><li>로그인</li></a>
		<a href="registerView.do"><li>회원가입</li></a>	
	</ul>
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
		<li><a href="productList.do">사료/분유</a></li>
		<li><a href="productList.do">간식</a></li>	
		<li><a href="productList.do">영양제</a></li>
		<li><a href="productList.do">위생/배변</a></li>
		<li><a href="productList.do">미용/목욕</a></li>
		<li><a href="productList.do">장난감</a></li>
		<li><a href="myPage.do">고양이</a></li>
	</ul>
</nav>
<table id="header_nav_menu_bar">
	<tr><td id="top" rowspan="3" ><a href="#">사료/분유</a></td>
	<td><a href="#">건식사료</a></td></tr>	
	<tr><td><a href="#">건식사료</a></td></tr>
	<tr><td><a href="#">건식사료</a></td></tr>
	<tr><td></td></tr><tr><td></td></tr>
	<tr><td id="top" rowspan="3" ><a href="#">사료/분유</a></td>
	<td><a href="#">건식사료</a></td></tr>	
	<tr><td><a href="#">건식사료</a></td></tr>
	<tr><td><a href="#">건식사료</a></td></tr>
	<tr><td></td></tr><tr><td></td></tr>
	<tr><td id="top" rowspan="3" ><a href="#">사료/분유</a></td>
	<td><a href="#">건식사료</a></td></tr>	
	<tr><td><a href="#">건식사료</a></td></tr>
	<tr><td><a href="#">건식사료</a></td></tr>
	<tr><td></td></tr><tr><td></td></tr>
	<tr><td id="top" rowspan="3" ><a href="#">사료/분유</a></td>
	<td><a href="#">건식사료</a></td></tr>	
	<tr><td><a href="#">건식사료</a></td></tr>
	<tr><td><a href="#">건식사료</a></td></tr>
</table>
</div>
</body>
</html>