<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 페이지</title>
 <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<style type="text/css">
	h1{
		maign : 0px;	
		text-align: center;
	}
	.updateruser{
		display : none;
	}
	.updatermamber{
		display : none;
	}
	/*
	.order{
		display : none;
	}
	.qna{
		display : none;
	}
	*/
	ul{
		
		list-style:none;
		padding-left:0px;
		font-size: 20px;	
		text-align: center;
		width: 100%;
		padding: 10px 0px;
		text-decoration: none;	
	}
	li{
		width:200px;
		display : inline-block;
		list-style:none;
	}
	.updateruser{
		display : none;
	}
	form > li{
		display : inline-block;
		list-style : none;
		width : 300px;
	}
	
	.searchBar{
		text-align: center;
	}
	.updaterproduct{
		text-align: center;
		display : none;
	}
</style>
<script type="text/javascript">	
	function clickFn (){
		$('.updateruser').css('display','none');
		$('.updaterproduct').css('display', 'none');
		
		$('.updatermamber').css('display','block');
	};
	
	function clickSearchFn(){
		$('.updatermamber').css('display','none');
		$('.updaterproduct').css('display', 'none');
		
		$('.updateruser').css('display','block');
		
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
	
	function clickProduct(){
		$('.updatermamber').css('display','none');
		$('.updateruser').css('display','none');
		
		$('.updaterproduct').css('display', 'block');
	}
	$(function(){
		
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
	<header>
		<h1> 관리자 페이지 </h1>
	</header>
	<nav>
		<ul>
			<li>
				<div  onclick="clickFn()" >관리자</div>
			</li>
			<li>
			<div><a href="productRegisterView.do">상품 등록</a></div>
			</li>
			<li><div onclick="clickSearchFn()">회원정보</div></li>
			<li><div onclick="clickProduct()">상품 목록</div></li>
			<li><div>환불 내역</div></li>
			<li><div>주문 내역</div></li>
			<li><div>배송여부</div></li>
			<li><div>리뷰 모아보기</div></li>
		</ul>
	</nav>
	
	<table class="updatermamber">
		<c:forEach var="member" items="${requestScope.memberList }">
			<tr>
				<td>아이디 : ${member.id } | 접근 권한 : ${member.user_grade } | 
				<form action="updateMemberAccess.do">
				권한 변경 : 
				<input type="hidden" name="id" value="${member.id }">
				<select name="user_grade">
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				<button>멤버 권한 변경</button>
				</form> 
				</td>
			</tr>
		</c:forEach>
	</table>
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
			</select>
			<input type="text" name="search">
			<button type="button">검색</button>
		</form>
		<form action="">
		<div>		
		<!-- 
			<c:forEach var="m" items="${requestScope.memberList }">
				<li>회원등급 : <input value="${m.user_grade }"></li>
				<li>아이디 : <input value="${m.id }"></li>
				<li>이름 : <input value="${m.user_name } "></li>
				<li>전화번호 : <input value="${m.tel }"> </li>
				<li>주소 : <input value="${m.address1 }"></li>
				<li>이메일 : <input value="${m.email }"> </li>
				<li>상세주소 : <input value="${m.address2 }"></li>		
				<li>우편번호 : <input value="${m.post }"></li>
				<button>수정</button> <button>삭제</button> 
			<br>
			</c:forEach>
			 --> 
		</div>		
		</form>
	</div>
	
		<!--  --><div class="updaterproduct">
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
			</select>
					<input type="text" name="search">
					<button type="button">검색</button>			
		</form>								
	<ul>
	 
		<c:forEach var="p" items="${requestScope. productreList }">
				<li>상품번호 : ${p.product_no }</li> 
				<li>대분류(번호) : ${p.category_no}</li> 
				<li>상품명 : ${p.product_name }</li>
				<li>가격 : ${p.product_price }</li> 
				<li>재고량 : ${p.product_stock }</li> 
				<li>판매 : ${p.product_sell }</li>
				<li>설명 : ${p.product_desc }</li> 
				<li>개수 : ${p.sub_category_no }</li>	
			<br>		
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
	</ul>
	
</div>
		<!-- 	
		<div class="">
		<form action="order">
	<ul>
		
			<li>상세주문번호<input type="text" name="order_detail_no"></li>
			<li>주문번호<input type="text" name="order_no"></li>
			<li>환불번호<input type="text" name="refund_no"></li>
			<li>주문번호<input type="text" name="order_no"></li>
			<li>환불내용<input type="text" name="refund_content"></li>
			<li>환불사진<input type="text" name="refund_img"></li>		
	</ul>					
		</form>
		</div>		
		<div>
				<form action="ana">
	<ul>	
		<li>문의번호<input type="text" name="qna_no"></li>
		<li>아이디<input type="text" name="id"></li>
		<li>상품번호<input type="text" name="product_no"></li>
		<li>문의내용<input type="text" name="qna_content"></li>
		<li>문의등록일<input type="text" name="qna_date"></li>
		<li>답변여부확인<input type="text" name="qna_check"></li>
		<li>답변내용<input type="text" name="qna_answer"></li>
		<button>확인</button> 
	</ul>
		</form>
		</div>			
		 -->
</body>
</html>