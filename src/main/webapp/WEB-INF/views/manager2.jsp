<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style type="text/css">
.container{
	width:1200px;
	margin: 0 auto;
}


h1 {
	maign: 0px;
	text-align: center;
}
.updaterproduct table{
	text-overflow: ellipsis;
    overflow: hidden;
}
.updaterproduct tr,td{
	width: 1100px;
    margin-left: 30px;
    white-space: nowrap;
    border-collapse: collapse;
    table-layout: fixed;
    
}

.updateruser {
	display: none;
	width: 1150px;
}

.updatermamber {
	display: none;
	width: 1150px;
	
}
/*
	.order{
		display : none;
	}
	.qna{
		display : none;
	}
	*/
.container ul {
	list-style: none;
	padding-left: 0px;
	font-size: 20px;
	text-align: center;
	width: 100%;
	padding: 10px 0px;
	text-decoration: none;
}

.container li {
	width: 200px;
	/* display: inline-block; */
	display: inline-block;
	width: 200px;
	overflow: hidden;
	list-style: none;
}
/*.container ul{
	white-space: nowrap;
	overflow: hidden;
}
*/

.updateruser {
	display: none;
	width: 1150px;
    margin: 0 auto;
    padding: 25px;
    border: 1px solid black;
}

form>li {
	display: inline-block;
	list-style: none;
	width: 300px;
}

.searchBar {
	width: 1150px;
	text-align: center;
	display: block;
    unicode-bidi: isolate;
    margin-block-start: 0.5em;
    margin-block-end: 0.5em;
    margin-inline-start: auto;
    margin-inline-end: auto;
    overflow: hidden;
    
}

.updaterproduct {
	width: 1200px;
    margin-left: 30px;
    border-collapse: collapse;
    table-layout: fixed;
	text-align: center;
	display: block;
    unicode-bidi: isolate;
    margin-block-start: 0.5em;
    margin-block-end: 0.5em;
    margin-inline-start: auto;
    margin-inline-end: auto;
    overflow: hidden;
    white-space: nowrap;
    display : none;
    text-overflow: ellipsis;
    border: 1px solid;
}

.updaterqna {
	width: 1150px;
	text-align: center;
	display: block;
    unicode-bidi: isolate;
    margin-block-start: 0.5em;
    margin-block-end: 0.5em;
    margin-inline-start: auto;
    margin-inline-end: auto;
    overflow: hidden;
    border: 1px solid;
}

.reviewList{
	width: 1150px;
	display: block;
    unicode-bidi: isolate;
    margin-block-start: 0.5em;
    margin-block-end: 0.5em;
    margin-inline-start: auto;
    margin-inline-end: auto;
    overflow: hidden;
    border: 1px solid;
}

.container nav ul{
	display: flex;
	flex-direction : row;
	justify-content : center;
	width : 100%;
}
.updaterproduct li{
	width: 15%;
	white-space: nowrap;
	text-overflow: ellipsis;
	text-decoration: none;
}
.updaterorder{
	display : none;
	text-align: center;
}
</style>
<script type="text/javascript">	
var clickFnSw = false;
	function clickFn (){
		$('.updaterproduct').css('display', 'none');
		$('.updateruser').css('display','none');
		$('.reviewList').css('display','none');
		
		if(!clickFnSw){
			$('.updatermamber').css('display','block');
			clickFnSw = true;			
		}
		else{
			$('.updatermamber').css('display','none');
			clickFnSw = false;
		}
	};
var clickProductSw = false;	
	function clickProduct(){
		$('.updatermamber').css('display','none');
		$('.updateruser').css('display','none');
		$('.reviewList').css('display','none');
		
		$('.updaterproduct').css('display', 'block');
		
		if(!clickProductSw){
			$('.updaterproduct').css('display', 'block');
			clickProductSw = true;
		}
		else{
			$('.updaterproduct').css('display', 'none');
			clickProductSw = false;
		}
	}
var clickOrderSw = false;	
	function clickOrder(){
		$('.updatermamber').css('display','none');
		$('.updateruser').css('display','none');
		$('.reviewList').css('display','none');
		
		$('.updaterorder').css('display', 'block');
		
		if(!clickOrderSw){
			$('.updaterorder').css('display', 'block');
			clickOrderSw = true;
		}
		else{
			$('.updaterorder').css('display', 'none');
			clickOrderSw = false;
		}
	}
var clickSearchFnSw =false;	
	function clickSearchFn(){
		$('.updaterproduct').css('display', 'none');
		$('.updatermamber').css('display','none');
		$('.reviewList').css('display','none');
		
		$('.updateruser').css('display','block');
		
		if(!clickSearchFnSw){
			$('.updateruser').css('display','block');
			clickSearchFnSw = true;
		}else{
			$('.updateruser').css('display','none');
			clickSearchFnSw = false;
		}
		
		
		var d = 'type=id&search=';
		$.ajax({
			url : 'searchMember.do',
			data : d,
			type : 'post',
			dataType : 'json',
			success : function(r){
				if(r.message != null){
					$('.updateruser div').empty();
					$('.updateruser div').append(r.message);
				}else{
					$('.updateruser div').empty();
					var list = r.list;
					var result = "";
					
					for(i=0;i<list.length;i++){
						result += `<ul><li>회원등급 : ` + list[i].user_grade + ` <select name="user_grade">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>`;
						result += '<input type="hidden" name="user_no" value="'+list[i].user_no+'"></li>';
						result += '<li>아이디 : <input type="text" name="id" value="'+list[i].id+'"></li>';
						result += '<li>이름 : <input type="text" name="user_name" value="'+list[i].user_name+'"></li>';
						result += '<li>전화번호 : <input type="text" name="tel" value="'+list[i].tel+'"></li>';
						result += '<li>주소 : <input type="text" name="address1" value="'+list[i].address1+'"></li>';
						result += '<li>이메일 : <input type="text" name="email" value="'+list[i].email+'"></li>';
						result += '<li>상세주소 : <input type="text" name="address2" value="'+list[i].address2+'"></li>';		
						result += '<li>우편번호 : <input type="text" name="post" value="'+list[i].post+'"></li>';
						result += '<li> <button class="member_upd_btn" type="button">수정</button> <button class="member_del_btn" type="button">삭제</button></li></ul>';
					}
					$('.updateruser div').append(result);
				}
			}
		});
	};
	
	
	$(function(){
		$('.searchProduct').click(function(){
			var d = $('.productregister').serialize();
			$.ajax({
				url : 'productreList.do',
				data : d,
				type : 'post',
				dataType : 'json',
				success : function(r){
					if(r.message != null){
						$('.updaterproduct ul').empty();
						$('.updaterproduct ul').append(r.message);
					}else{
						$('.updaterproduct ul').empty();
						var list = r.list;
						var result = "";
						
						for(i=0;i<list.length;i++){
							result += '<li>상품번호 : '+list[i].product_no+'</li>';
							result += '<li>대분류(번호) : '+list[i].category_no+'</li>';
							result += '<li>상품명 : '+list[i].product_name+'</li>';
							result += '<li>가격 : '+list[i].product_price+'</li>';
							result += '<li>재고량 : '+list[i].product_stock+'</li>';
							result += '<li>판매 : '+list[i].product_sell+'</li>';		
							result += '<li>설명 : '+list[i].product_desc+'</li>';
							result += '<li>개수 : '+list[i].sub_category_no+'</li>';
						}
						$('.updaterproduct ul').append(result);
					}
				}
			});
		});
		
		
	
		$('.searchBar button').click(function(){
			var d = $('.searchBar').serialize();
			$.ajax({
				url : 'searchMember.do',
				data : d,
				type : 'post',
				dataType : 'json',
				success : function(r){
					if(r.message != null){
						$('.updateruser div').empty();
						$('.updateruser div').append(r.message);
					}else{
						$('.updateruser div').empty();
						var list = r.list;
						var result = "";
						
						for(i=0;i<list.length;i++){
							result += `<ul><li>회원등급 : ` + list[i].user_grade + ` <select name="user_grade">
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>`;
							result += '<input type="hidden" name="user_no" value="'+list[i].user_no+'"></li>';
							result += '<li>아이디 : <input type="text" name="id" value="'+list[i].id+'"></li>';
							result += '<li>이름 : <input type="text" name="user_name" value="'+list[i].user_name+'"></li>';
							result += '<li>전화번호 : <input type="text" name="tel" value="'+list[i].tel+'"></li>';
							result += '<li>주소 : <input type="text" name="address1" value="'+list[i].address1+'"></li>';
							result += '<li>이메일 : <input type="text" name="email" value="'+list[i].email+'"></li>';
							result += '<li>상세주소 : <input type="text" name="address2" value="'+list[i].address2+'"></li>';		
							result += '<li>우편번호 : <input type="text" name="post" value="'+list[i].post+'"></li>';
							result += '<li> <button class="member_upd_btn" type="button">수정</button> <button class="member_del_btn" type="button">삭제</button></li></ul>';
						}
						$('.updateruser div').append(result);
					}
				}
			});
		});
		
		$(document).on('click','.member_upd_btn',function(){
			var pTag = $(this).parent().parent().children('li');
			var d = 'user_no='+pTag.children('input[type="hidden"]').val();
				d += '&user_grade='+pTag.children('select[name="user_grade"]').val();
				d += '&id='+pTag.children('input[name="id"]').val();
				d += '&user_name='+pTag.children('input[name="user_name"]').val();
				d += '&tel='+pTag.children('input[name="tel"]').val();
				d += '&address1='+pTag.children('input[name="address1"]').val();
				d += '&address2='+pTag.children('input[name="address2"]').val();
				d += '&email='+pTag.children('input[name="email"]').val();
				d += '&post='+pTag.children('input[name="post"]').val();
			$.ajax({
				url : 'updateMember.do',
				data : d,
				type : 'post',
				dataType : 'json',
				success : function(r){
					if(r==1)
						alert('회원정보수정 성공');
					else
						alert('회원정보수정 실패');
					
					location.reload();
				}
			});
		});
		
		$(document).on('click','.member_del_btn',function(){
			var pTag = $(this).parent().parent().children('li');
			var d = 'user_no='+pTag.children('input[type="hidden"]').val();
			
			$.ajax({
				url : 'deleteMember.do',
				data : d,
				dataType : 'json',
				success : function(r){
					if(r==1)
						alert('회원정보삭제 성공');
					else
						alert('회원정보삭제 실패');
					
					location.reload();
				}
			});
		});
		//orderUpbtn
		$(document).on('click','.orderUpbtn',function(){
			var pTag = $(this).parent().parent();
			//pTag = <tr>
			var d = 'order_no='+pTag.children().children('input[name="order_no"]').val();
			d += '&product_name='+pTag.children().children('input[name="product_name"]').val();
			d += '&order_ea='+pTag.children().children('input[name="order_ea"]').val();
			d += '&product_price='+pTag.children().children('input[name="product_price"]').val();
			//console.log(d);
			
			$.ajax({
				url : 'updateOrder.do',
				data : d,
				dataType : 'json',
				success : function(r){
					if(r==1){
						alert('수정 완료 되었습니다.');
						location.reload();
					}else{
						alert('수정 실패 하였습니다.');
					}
					
				}
				
			});
			
		});
		$(document).on('click','.orderDelbtn',function(){
			var pTag = $(this).parent().parent();
			//pTag = <tr>
			var d = 'order_no='+pTag.children().children('input[name="order_no"]').val();
			console.log(d);
			
			$.ajax({
				url : 'deleteOrder.do',
				data : d,
				dataType : 'json',
				success : function(r){
					if(r==1){
						alert('삭제 완료 되었습니다.');
						location.reload();
					}else{
						alert('삭제 실패 하였습니다.');
					}
					
				}
				
			});
			
		});
		
	});	
</script>
</head>
<body>
	<c:if test="${sessionScope.user_grade !=0 }">
		<script>
			alert("관리자만 접근 가능합니다");
			location.href="main.do";
		</script>
	</c:if>
	<jsp:include page="include/header.jsp"></jsp:include>
	<div class="container">
	<nav>
		<ul>
			<li><div><a href="productRegisterView.do">상품 등록</a></div></li>
			<li><div onclick="clickSearchFn()">회원정보</div></li>
			<li><div onclick="clickProduct()">상품 목록</div></li>
			<li><div onclick="clickOrder()">주문 내역</div></li>
			<li><div><a href="qnaManagerView.do">문의사항</a></div></li>
		</ul>
	</nav>
	<br>
	<div class="updateruser">
		<form class="searchBar">
			<select name="type">
				<option value="id">아이디</option>
				<option value="user_name">이름</option>
				<option value="tel">전화번호</option>
				<option value="address1">주소</option>
				<option value="email">이메일</option>
				<option value="address2">상세주소</option>
				<option value="post">우편번호</option>
			</select> <input type="text" name="search">
			<button type="button">검색</button>
		</form>
		<form class="">
			<div>

				<c:forEach var="m" items="${requestScope.memberList }">
					<li>회원등급 : <input value="${m.user_grade }"></li>
					<li>아이디 : <input value="${m.id }" readonly="readonly"></li>
					<li>이름 : <input value="${m.user_name } "></li>
					<li>전화번호 : <input value="${m.tel }">
					</li>
					<li>주소 : <input value="${m.address1 }"></li>
					<li>이메일 : <input value="${m.email }">
					</li>
					<li>상세주소 : <input value="${m.address2 }"></li>
					<li>우편번호 : <input value="${m.post }"></li>
					<button>수정</button>
					<button>삭제</button>
					<br>
				</c:forEach>

			</div>
		</form>
	</div>

	<div class="updaterproduct">
		<form class="productregister">
			<select name="type">
				<option value="product_no">상품번호</option>
				<option value="category_no">카테고리번호</option>
				<option value="product_name">상품명</option>
				<option value="product_price">가격</option>
				<option value="product_stock">재고량</option>
				<option value="product_sell">판매</option>
				<option value="product_desc">설명</option>
				<option value="sub_category_name">개수</option>
			</select> <input type="text" name="search">
			<button type="button" class="searchProduct">검색</button>
		</form>

			<c:forEach var="p" items="${requestScope. productreList }">
			<table>
			<tr>
				<td>상품번호 : ${p.product_no }</td>
				<td>대분류(번호) : ${p.category_no}</td>
				<td>상품명 : ${p.product_name }</td>
				<td>가격 : ${p.product_price }</td>
				</tr>
				<tr>
				<td>재고량 : ${p.product_stock }</td>
				<td>판매 : ${p.product_sell }</td>
				<td>설명 : ${p.product_desc }</td>
				<td>개수 : ${p.sub_category_no }</td>
				</tr>
				<hr>
			</table>		
			</c:forEach>
			<!--   	
	 <li>상품번호<input type="text" name="product_no"></li>
	 <li>대분류(번호)<input type="text" name="category_no"></li>
	 <li>상품명<input type="text" name="product_name"></li>
	 <li>가격<input type="text" name="product_price"></li>
	 <li>재고량<input type="text" name="product_stock"></li>
	 <li>판매<input type="text" name="product_sell"></li>
	 <li>설명<input type="text" name="product_desc"></li>
	 <li>개수<input type="text" name="sub_category_no"></li> -->

	</div>
		
		<div class="updaterorder">
			<form class="orderregister">
				<select name="type">
					<option value="product_name">이름</option>
					<option value="order_ea">개수</option>
					<option value="peoduct_[roce]">가격</option>
				</select> <input type="text" name="search">
				<button type="button" class="searchProduct">검색</button>
				
				<table class="orderList">
					<c:forEach var="O" items="${requestScope.orderList }">
						<tr>
							<td>
							<input type="hidden" name="order_no" value="${O.order_no }">
							이름 : <input type="text" name="product_name" value="${O.product_name }">
							</td>
							<td>
							개수 :
							<input type="text" name="order_ea" value="${O.order_ea}"> 
							</td>
							<td>
							가격 :
							<input type="text" name="product_price" value="${O.product_price }"> 
							</td>
							<td>
								<button type="button" class="orderUpbtn">수정</button>
								<button type="button" class="orderDelbtn">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</table>		
							
		
			
				<!--  <td>상세주문번호<input type="text" name="order_detail_no"></td>
				<td>주문번호<input type="text" name="order_no"></td>
				<td>환불번호<input type="text" name="refund_no"></td>
				<td>환불내용<input type="text" name="refund_content"></td>-->		
					
			</form>
		</div>		

	</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>