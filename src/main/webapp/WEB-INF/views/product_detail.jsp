<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고강도</title>
<style type="text/css">
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
		margin : 40px auto;
		border-top : 1px solid black;
	}
	#introduce_container h3{
		color:black;
	}
	#introduce_container ul li{
		list-style-type: none;
		color : gray;
		text-align: left;
		margin-bottom: 10px;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
</script>
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
			<td colspan ="3"><a href="purchaseView.do"><button style="width: 95%;">구매하기</button></a></td>
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
		<ul>
			<li><h3>배송안내</h3></li>
			<li>- 배송비 : 기본배송료는 3,000원입니다. (도서, 산간, 오지 일부지역은 배송비가 추가될 수 있습니다.)			
			<li>- 기본적으로 평일오후 4시이전 주문건은 당일출고를 원칙으로 배송준비하고 있습니다.(재고가 부족하거나 창고/수입사에서 바로 발송되시는 제품은 1-2일<br>정보 배송일이 더 소요될 수 있습니다.)</li>
			<li>- 상품의 평균 배송일은 1-3일입니다.(입금 확인 후) 배송사의 사정에 따라 유동적일 수 있으며 배송일 지정은 불가능합니다.</li>
			<li>- 배송예정일은 주문시점(주문순서)에 따른 유동성이 발생하므로 평균 배송일과는 차이가 발생할 수 있습니다.</li>
		</ul><br>
		<ul>
			<li><h3>교환 및 반품안내</h3></li>
			<li>- 상품 택(tag)제거 또는 개봉으로 상품 가치 훼손 시에는 상품 수령후 7일 이내라도 교환 및 반품이 불가능합니다.</li>
			<li>- 저단가 상품, 일부 특가 상품은 고객 변심에 의한 교환, 반품은 고객께서 배송비를 부담하셔야 합니다.</li>
			<li>- 일부 상품은 신모델 출시, 원재료 가격 변동 등 제조사 사정으로 가격이 변동될 수 있습니다.</li>
			<li>- 공장에서 박스 자체가 상품으로 출고되는 제품에 대하여서는 박스 개봉 후 중고 상품으로 간주되어 교환이나 반품이 불가능합니다.</li>
		</ul>
	</div>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>