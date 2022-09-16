<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
        .main_container{
            width: 1200px;
            text-align: center;
            margin: 0px auto;
            display: flex;
            flex-direction: column;
            border-top: solid 1px gray;
        }
        .sub_header{
            width: 1200px;
            margin: 20px auto;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            border-bottom: solid 1px gray;
        }
        #step{
            font-size: 14px;
            display: flex;
            flex-direction: row;
            margin-top: 20px;
        }
        #step p{
            margin: 0px 5px;
        }
        .cart_list{
            width: 1200px;
            border-collapse: collapse;
        }
        /*.cart_list thead{
            background-color: lightgray;
        }*/
        .cart_list tr{
            border-bottom: solid 1px lightgray;
        }
        /*.cart_list td{
            border: solid 1px lightgray;
        }*/
        .cart_list img{
            width: 40px;
            height: 40px;
        }
        .cart_total{
            width: 1200px;
            margin: 10px auto;
        }
        .total{
            width: 1200px;
            margin: 10px auto;
            background-color: #e9e9e9;
        }
        .total img{
            width: 25px;
            height: 25px;
            margin-bottom: 15px;
        }
        .total td{
            width: 20%;
            text-align: center;
        }
        #price td{
            font-weight: bold;
        }
        #choose{
        	float: left;
            margin: 20px 10px;
        }
        #choose button{
            width: 150px;
            height: 30px;
            font-size: 14px;
            background-color: gray;
            color: white;
            border: none;
        }
         #delete_choose a{
        	text-decoration: none;
        	color: white;
        }
        #continue{
            text-align: center;
            margin: 20px;
        }
        #continue button{
            width: 200px;
            height: 50px;
            font-size: 20px;
            border: none;
            background-color: black;
        }
        #continue button a{
        	text-decoration: none;
            color: white;
        }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
    $("#check_all").click(function() {
    	var check = $("#check_all").prop("checked");
    	if(check){
    		$(".check").prop("checked", true);
    	}else{
    		$(".check").prop("checked", false);    		
    	}
    });
    $("#choose_all").click(function(){
    	$("#check_all").prop("checked",false);
    	$("input[type=checkbox]").prop("checked",true);
    });
    $("#delete_choose").click(function(){
    	var check_product = $(".check").prop("checked");
    	$.ajax({
    		url: "cartDelete.do",
    		data: check_product,
    		type: "post",
    		success: function(r){
    			var tag = "";
    			for(int i=0; i<r.length; i++){
    				tag += '<tr>';
    				tag += '<td><input type="checkbox" name="check" class="check"></td>';
    				tag += '<td><img alt="#" src="imageLoad.do?fno="'+r[i].img_no+'">'+r[i].product_name+'</td>';
    				tag += '<td id="ea">'+r[i].cart_ea+'</td>';
    				tag += '<td>'+r[i].product_price+'</td>';
    				tag += '<td id="total_price">'+r[i].total_price+'</td>';
                    tag += '<td rowspan='+r[i].cart_count+'>3,000원</td>';
                    tag += '</tr>';
    			}
    			$(".cart_product").html(tag);
    		}
    	});
    });
 });
</script>
</head>
<body>
<c:if test="${sessionScope.login == null || sessionScope.login == false  }">
	<script>
		alert("로그인을 하셔야 이용할수 있습니다.");
		location.href="loginView.do";
	</script>
</c:if>
<jsp:include page="include/header.jsp"></jsp:include>
	<div class="main_container">
        <div class="sub_header">
            <h3>장바구니</h3>
            <div id="step">
                <p style="font-weight:bold">01.장바구니</p>
                <p>>></p>
                <p>02.주문서 작성/결제</p>
                <p>>></p>
                <p>03.주문완료</p>
            </div>
        </div>
        <table class="cart_list">
            <thead style="height:30px">
                <th><input type="checkbox" name="check_all" value="check" id="check_all"></th>
                <th>상품정보</th>
                <th>수량</th>
                <th>상품 금액</th>
                <th>합계 금액</th>
            </thead>
        	<tbody class="cart_product">
            	<c:forEach var="cart" items="${requestScope.cart }">
            	<tr style="height:70px">
                	<td><input type="checkbox" name="check" class="check"></td>
             		<td><img alt="" src="imageLoad.do?fno=${cart.img_no }">${cart.product_name }</td>
                	<td id="ea">${cart.cart_ea }</td>
                	<td>${cart.product_price }</td>
                	<td id="total_price">${cart.cart_ea*cart.product_price }</td>
            	</tr>
            	</c:forEach>
            </tbody>
        </table>
        <form action="#" class="cart_total">
            <div id="choose">
                <button id="choose_all">전체 선택</button>
                <button id="delete_choose">선택 상품 삭제</button>
            </div>
                <table class="total">
                    <tr>
                        <td></td>
                        <td></td>
                        <td>총 상품금액</td>
                        <td>배송비</td>
                        <td>합계</td>
                    </tr>
                    <tr >
                        <td></td>
                        <td></td>
                        <td>${requestScope.all_price }원</td>
                        <td>3,000원</td>
                        <td id="cart_price">${requestScope.cart_price }원</td>
                    </tr>
                </table>   
            <div id="continue">
                <button><a href="productList.do?category_no=0">쇼핑 계속하기</a></button>
                <button><a href="purchase.do">구매하기</a></button>
            </div>
        </form>
    </div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>