<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고강도</title>
<style>
	#product_detail_container{
		width:1200px;
		margin : 20px auto;
		text-align: center;
	}
	#product_detail{
		width:1000px;
		height:600px;
		margin : 0px auto;
		box-sizing: border-box;
		background-color: #d3d3d3;
		
	}
	#product_detail #title{
		width : 15%;
		text-align: left;
		padding-left:30px;
	}
	#product_detail td:not(#sample_img){
		padding-right:20px;
		text-align: left;
		
	}
	#sample_img, #sample_img img{
		text-align : center;
		width:500px;
		height: 600px;
	}
	#product_detail select{
		width : 55%;
	}
	td button{
		color: white;
		font-weight:bold;
		text-align: center;
		width:45%;
		height:40px; 
		background: gray;
		border: none;
		border-radius:5px; 		
		margin-left:20px;		
	}
	#product_int{
	width:1200px;
	height:80px;
	margin:40px auto;
	border-collapse:collapse;
	box-sizing:border-box;
	text-align: center;
	vertical-align:center;	 
	}
	#product_int td{
		border-top: 1px solid black;
		font-size:20px;
		font-weight:bold;
		width:25%;
	}
	#product_int a:link, #product_int a:visited{
		text-decoration: none;
		color:black;
	}
	#review_container{
		width:1200px;
		margin : 20px auto;
		height: 300px; 
		border: 1px solid black;
	}
	#QnA_container{
		width:1200px;
		margin : 20px auto;
		height: 300px; 
		border: 1px solid black;
	}
	#introduce_container{
		width:1200px;
		margin : 20px auto;
		height: 300px; 
		border: 1px solid black;
	}
}
	
</style>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
<div id = "product_detail_container">
	<table id = product_detail>
		<tr>
			<td id = "sample_img" rowspan="10"> <img alt="sample" src="resources/img/product_sample.PNG"> </td>
			<td id ="title" colspan="3" style="font-size: 30px;"><b>후르타 레즐 하네스</b></td>			
		</tr>
		<tr><td id ="title" colspan="3">비트루트 / 헷지 / 블랙베리 / 빌베리<br>재미있고, 컬러풀한 레즐의 새로운 컬렉션<br>친환경, 30%이상 조절가능, 리플렉터</td></tr>
		<tr><td id ="title">브랜드</td>
			<td colspan="2">레즐</td>			
		</tr>
		<tr><td id ="title">가격</td>
			<td colspan="2">41,000원</td>		
		</tr>
		<tr><td id ="title">컬러-사이즈</td>			
			<td colspan="2"><select>
			<option>비트-15-25</option>
			<option>비트-25-35</option>
			<option>비트-35-45</option>
			</select></td>
		</tr>
		<tr>
			<td id ="title">비트-35-45</td>
			<td><input type="number" value="0"></td>
			<td>41,000원</td>
		</tr>
		<tr>
			<td colspan="3" style="text-align: right; font-size: 20px;">
			<b>41,000원</b></td>
		</tr>
		<tr>
			<td colspan="3"><button>관심상품</button><button>장바구니</button></td>
		</tr>
		<tr>
			<td colspan ="3"><button style="width: 95%;">구매하기</button></td>
		</tr>
		<tr><td></td></tr>
	</table>
	
	<table id="product_int">
		<tr>
			<td><a href="#Detail">상품상세</a></td>
			<td><a href="#review_container">상품평</a></td>
			<td><a href="#QnA_container">상품문의</a></td>
			<td><a href="#introduce_container">배송/교환/반품 안내</a></td>
		</tr>
	</table>
	<img id="Detail"alt="product_sample" src="resources/img/product_detail.jpg">
	<div id="review_container">
		상품평 테스트
	</div>
	<div id="QnA_container">
		상품문의 테스트
	</div>
	<div id="introduce_container">
		배송/교환/반품 안내 테스트
	</div>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>