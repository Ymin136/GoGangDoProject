<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
            margin: 0;
            padding: 0;
        }
        .main_container{
            width: 100%;
            display: flex;
            flex-direction: column;
        }
        .sub_header{
            width: 1200px;
            margin: 20px auto;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }
        #step{
            font-size: 14px;
            display: flex;
            flex-direction: row;
        }
        #step p{
            margin: 0px 5px;
        }
        #cart{
            font-size: 16px;
            font-weight: bold;
        }
        .cart_list{
            width: 1200px;
            margin: 10px auto;
        }
        tr{
            text-align: center;
        }
        .cart_list img{
            width: 50px;
            height: 50px;
        }
        .cart_list thead{
            background-color: bisque;
        }
        .cart_total{
            width: 1200px;
            margin: 10px auto;
        }
        .total{
            width: 1200px;
            margin: 10px auto;
            background-color: #f3a683;
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
            margin: 10px 10px;
        }
        #choose button{
            width: 100px;
            height: 25px;
            font-size: 14px;
            background-color: #f7d794;
            border: none;
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
            background-color: #f19066;
            color: white;
        }
</style>
</head>
<body>
	<div class="main_container">
        <div class="sub_header">
            <p id="cart">장바구니</p>
            <div id="step">
                <p>01.장바구니</p>
                <p>>></p>
                <p>02.주문서 작성/결제</p>
                <p>>></p>
                <p>03.주문완료</p>
            </div>
        </div>
        <hr>
        <table class="cart_list">
            <thead>
                <input type="radio" name="all_check" value="check">
                <th>상품정보</th>
                <th>수량</th>
                <th>상품 금액</th>
                <th>합계 금액</th>
                <th>배송비</th>
            </thead>
            <tr>
                <td><img alt="" src="img/dog-food.jpg">상품명OOOO</td>
                <td>1개</td>
                <td>4,000원</td>
                <td>4,000원</td>
                <td rowspan="2">3,000원</td>
            </tr>
            <tr>
                <td><img alt="" src="img/dog-food.jpg">상품명OOOO</td>
                <td>1개</td>
                <td>4,000원</td>
                <td>4,000원</td>
                <!--<td>3,000원</td>-->
            </tr>
        </table>
        <form action="#" class="cart_total">
            <div id="choose">
                <button>전체 선택</button>
                <button>선택 상품 삭제</button>
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
                        <td>4,000원</td>
                        <td> 3,000원</td>
                        <td>7,000원</td>
                    </tr>
                </table>   
            <div id="continue">
                <a href="product_list.do"><button>쇼핑 계속하기</button></a>
                <a href="purchase.do"><button>구매하기</button></a>
            </div>
        </form>
    </div>
</body>
</html>