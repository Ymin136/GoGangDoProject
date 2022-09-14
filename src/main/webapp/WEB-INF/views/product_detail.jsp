<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		margin : 40px auto;
		text-align:left;
		height: 300px; 
	}
	#review_container p, h2{
		margin-left:30px;
	}
	#review_container table{
		width:1200px;
		text-align: center;
		border-collapse: collapse;
		
	}
	#review_container td:not(#content){
		border-bottom: 1px solid gray;
		padding:10px 20px;
		vertical-align: center;
	}
	#review_container #content{
		width:60%;
		text-align: left;
		padding-left:150px;
		border-bottom: 1px solid gray;
	}
	#review_container a{
		margin:0px 10px;
		text-decoration: none;
		color : black;
	}
	#QnA_container{
		width:1200px;
		margin : 80px auto;
		height: 300px; 
		text-align: left;
	}
	#QnA_container p, h2{
		margin-left:30px;
	}
	#introduce_container{
		width:1200px;
		margin : 20px auto;
		padding : 20px 0px;
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
$(function(){
	$('#ea').change(function(){
		var ea = $('#ea').val();
		var price = ${requestScope.product.product_price };
		var total_price = ea*price;
		$('#total').text(total_price+" 원");
	});
	$('#review_container a').click(function(){
		var pageNo = $(this).text();
		var product_no = ${requestScope.product.product_no };
		$.ajax({
			url:"ReviewList.do",
			data : "product_no="+product_no+"&pageNo="+pageNo,
			dataType : "json",
			success:function(r){
				var tag = "";
				for(i=0;i<r.length;i++){
					tag += "<tr>";
					tag += "<td>"+r[i].id+"</td>";
					tag += "<td id='content'>"+r[i].review_content+"</td>";
					tag += "<td>"+r[i].review_date+"</td>";
					tag += "</tr>";
				}
				if(r.length<5)
				for(i = 0; i<5-r.length;i++)
	   			tag+="<tr><td colspan='3' style='height:20px;'></td></tr>";
	   			
				$('#review_list').html(tag);
			}
		});
		return false;
	});
});
</script>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
<div id = "product_detail_container">
	<table id = product_detail>
		<tr>
			<td id = "sample_img" rowspan="8"> <img alt="sample" src="imageLoad.do?fno=${requestScope.thumbnail.img_no}"></td>
			<td id ="title" colspan="3" style="font-size: 30px;"><b>${requestScope.product.product_name }</b></td>			
		</tr>
		<tr><td id ="title" colspan="3">${requestScope.product.product_desc }</td></tr>
		<tr><td id ="title">카테고리</td>
			<td colspan="2">${requestScope.product.category_name} &nbsp | &nbsp ${requestScope.product.sub_category_name}</td>			
		</tr>
		<tr><td id ="title">가격</td>
			<td colspan="2">${requestScope.product.product_price }원</td>		
		</tr>
		<tr><td id ="title">개수</td>			
			<td> <input id = "ea" type="number" value ="1"> </td>
		</tr>
		<tr>
			<td colspan="3" style="text-align: right; font-size: 20px;">
			<span id = "total">${requestScope.product.product_price } 원</span></td>
		</tr>
		<tr>
			<td colspan="3"><button>장바구니</button><a href="purchaseView.do"><button>구매하기</button></a></td>
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
	
	<img id="Detail"alt="product_sample" src="imageLoad.do?fno=${requestScope.image.img_no}">
	<br>
	<div id="review_container">
		<p><h2>상품평</h2></p>
		<p>동일한 상품에 대해 작성된 상품평으로 판매자는 다를 수 있습니다.<p>
		<hr>
		<table>
		<tr id="thead">
			<td>작성자</td>
			<td style="width:60%;">내용</td>
			<td>작성일자</td>
		</tr>
		<tbody id="review_list">
		<c:forEach var="review" items="${requestScope.list }">
	           	<tr>
	           		<td>${review.id}</td>
	           		<td id="content">${review.review_content }</td>
	           		<td>${review.review_date }</td>
	           	</tr>           	
        </c:forEach>
		<c:if test="${requestScope.list.size()<5}">
   			<c:forEach var = "i" begin="1" end="${5-requestScope.list.size()}">
   			<tr><td colspan="3" style="height:20px;"></td></tr> 
   			</c:forEach>
    	</c:if>
        </tbody>
	        <tr>
	        	<td colspan="3" id = "page_bar" style ="padding:20px 10px; border:none;">
	        		<c:forEach var="i" begin="${pagging.startPageOfPageGroup}" end="${pagging.endPageOfPageGroup}">
					<a href ="#"> ${ i}</a>
				</c:forEach>
	        	</td>
    	    </tr>
        </table>
	</div>
	<br>
	
	<div id="QnA_container">
		<p><h2>상품문의</h2></p>
		
		<hr>
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