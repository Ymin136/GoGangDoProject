<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고강도</title>
<style type="text/css">
        .main_container{
            width: 1200px;
            margin: 0 auto;
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
        .order_list{
            width: 1200px;
            margin: 10px auto;
            border-collapse: collapse;
        }
        .order_list tr{
            text-align: center;
            border-bottom: solid 1px lightgray;
        }
        .order_list img{
            width: 40px;
            height: 40px;
        }
        /*thead{
            background-color: bisque;
        }*/
        #cart{
            width: 170px;
            height: 30px;
            font-size: 14px;
            background-color: white;
            border: none;
        }
        #cart a{
        	text-decoration: none;
        	color: black;
        }
        .total{
            width: 1200px;
            margin: 20px auto;
            background-color: #e9e9e9;
        }
        .total td{
            width: 20%;
            text-align: center;
        }
        #buyer{
        	margin-top: 20px;
        	margin-bottom: 0px;
        }
        #buyer_info{
            width: 1200px;
            margin: 20px 0px;
        	border-top: solid 2px lightgrey;
        }
        #buyer_info tr{
            height: 50px;
        }
        #detail_address{
            width: 300px;
        }
        #buy_way{
            width: 1200px;
            margin: 10px 0px;
            border-top: solid 1px lightgrey;
        }
        #buy_way tr{
            height: 50px;
        }
        #agree{
            text-align: center;
        }
        #pay{
            width: 200px;
            height: 50px;
            font-size: 20px;
            margin-left: 40%;
            margin-top: 20px;
            margin-bottom: 50px;
            border: none;
            background-color: black;
            color: white;
        }
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">
$(function(){
	$("#search_address").click(function(){
		new daum.Postcode({
		    oncomplete: function(data) {
		        var addr = '';
		        if(data.userSelectedType === 'R'){
		        	addr = data.roadAddress;
		        }else{
		        	addr = data.jibunAddress;
		        }
		        document.getElementById('road_address').value = data.zonecode;
		        document.getElementById('detail_address').value = data.address;
		    }
		}).open();
	});
});
</script>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
	<div class="main_container">
        <div class="sub_header">
            <h3>주문서 작성/결제</h3>
            <div id="step">
                <p>01.장바구니</p>
                <p>>></p>
                <p style="font-weight:bold">02.주문서 작성/결제</p>
                <p>>></p>
                <p>03.주문완료</p>
            </div>
        </div>
        <table class="order_list">
            <p style="color:gray; height:10px;">주문상세내역</p>
            <thead style="height:30px">
                <th>상품정보</th>
                <th>수량</th>
                <th>상품 금액</th>
                <th>합계 금액</th>
                <th>배송비</th>
            </thead>
            <tr style="height:70px">
                <td><img alt="" src="img/dog-food.jpg">상품명OOOO</td>
                <td>1개</td>
                <td>4,000원</td>
                <td>4,000원</td>
                <td rowspan="2">3,000원</td>
            </tr>
            <tr style="height:70px">
                <td><img alt="" src="img/dog-food.jpg">상품명OOOO</td>
                <td>1개</td>
                <td>4,000원</td>
                <td>4,000원</td>
                <!--<td>3,000원</td>-->
            </tr>
        </table>
        <button id="cart"><a href="cartView.do">장바구니로 돌아가기</a></button>
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
        <h3  id="buyer">주문자 정보</h3>
        <form action="" method="post">
            <table id="buyer_info">
                <tr style="height:50px">
                    <td>주문하시는 분</td>
                    <td><input type="text" name="buyer"></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" name="tel"></td>
                </tr>
                <tr style="height:60px">
                    <td>이메일</td>
                    <td><input type="text" name="e-mail">              
                        <select name="mail" id="email">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="font-size:18px; color:gray; border-bottom:solid 1px lightgray">배송정보</td>
                </tr>
                <tr>
                    <td>배송지 확인</td>
                    <td>
                        <input type="radio" name="address">기본배송지
                        <input type="radio" name="address">최근배송지
                        <input type="radio" name="address" checked>직접입력
                        <input type="radio" name="address">주문자정보와 동일
                    </td>
                </tr>
                <tr style="height:70px">
                    <td>받으실 곳</td>
                    <td>
                        <input type="text" readonly id="road_address" name="road_address">
                        <button id="search_address" name="search_address">우편번호 검색</button><br>
                        <input type="text" readonly id="detail_address" name="detail_address">
                    </td>
                </tr>
                <tr>
                    <td>남기실 말씀</td>
                    <td><input type="text" name="deliver_comment"></td>
                </tr>
                <tr>
                    <td>회원정보 반영</td>
                    <td><input type="checkbox" name="my_address">나의 배송지에 추가합니다</td>
                </tr>
            </table>
            <table id="buy_way">
                <h3>결제수단 선택/결제</h3>
                <tr>
                    <td rowspan="5">일반결제</td>
                    <td>
                        <tr>
                            <td>
                                <input type="radio" name="pay_way">무통장 입금
                                <input type="radio" name="pay_way">신용카드
                                <input type="radio" name="pay_way">계좌이체
                                <input type="radio" name="pay_way">가상계좌
                            </td>
                        </tr>
                        <tr>
                            <td style="height:20px">(무통장 입금의 경우 입금확인 후부터 배송단계가 진행됩니다)</td>
                        </tr>
                        <tr>
                            <td>입금자명 <input type="text" name="pay_name"></td>
                        </tr>
                        <tr style="height:20px">
                            <td>입금은행 <select name="bank" id="bank">
                                            <option value="kakao_bank">카카오뱅크</option>
                                            <option value="shinhan">신한</option>
                                            <option value="kb">KB</option>
                                        </select>
                            </td>
                        </tr>
                    </td>
                </tr>
                <tr style="height:70px">
                    <td>현금영수증/계산서 발행</td>
                    <td>
                        <input type="radio" name="receipt">신청안함
                        <input type="radio" name="receipt">현금영수증
                    </td>
                </tr>
                <tr>
                    <td id="final_price" name="final_price">최종결제 금액 0000원</td>
                </tr>
            </table>
            <p id="agree"><input type="checkbox" checked>(필수)구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</p>
            <button id="pay">결제하기</button>
        </form>
    </div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>