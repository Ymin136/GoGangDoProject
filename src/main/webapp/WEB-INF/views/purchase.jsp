<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고강도</title>
<style type="text/css">
	*{
            margin: 0;
            padding: 0;
        }
        .main_container{
            width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
        }
        .sub_title{
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
        .order_list{
            width: 1200px;
            margin: 10px auto;
        }
        .order_list tr{
            text-align: center;
        }
        .order_list img{
            width: 50px;
            height: 50px;
        }
        thead{
            background-color: bisque;
        }
        #cart{
            width: 130px;
            height: 25px;
            font-size: 12px;
            background-color: #f7d794;
            border: none;
        }
        .total{
            width: 1200px;
            margin: 20px auto;
            background-color: #f3a683;
        }
        .total td{
            width: 20%;
            text-align: center;
        }
        #buyer{
            width: 1200px;
            margin: 10px 0px;
            border-top: solid 2px lightgrey;
        }
        #buyer tr{
            margin: 50px 0px;
            border-top: solid 1px lightgrey;
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
            margin: 10px 0px;
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
            border: none;
            background-color: #f19066;
            color: white;
        }
</style>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
	<div class="main_container">
        <div class="sub_title">
            <h3>주문서 작성/결제</h3>
            <div id="step">
                <p>01.장바구니</p>
                <p>>></p>
                <p>02.주문서 작성/결제</p>
                <p>>></p>
                <p>03.주문완료</p>
            </div>
        </div>
        <table class="order_list">
            <p>주문상세내역</p>
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
        <button id="cart">장바구니로 돌아가기</button>
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
        <h3>주문자 정보</h3>
        <form action="" method="post">
            <table id="buyer">
                <tr>
                    <td>주문하시는 분</td>
                    <td><input type="text" name="buyer"></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" name="tel"></td>
                </tr>
                <tr>
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
                    <td>배송정보</td>
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
                <tr>
                    <td>받으실 곳</td>
                    <td>
                        <input type="text" readonly>
                        <button>우편번호 검색</button><br>
                        <input type="text" readonly id="detail_address">
                    </td>
                </tr>
                <tr>
                    <td>남기실 말씀</td>
                    <td><input type="text"></td>
                </tr>
                <tr>
                    <td>회원정보 반영</td>
                    <td><input type="checkbox">나의 배송지에 추가합니다</td>
                </tr>
            </table>
            <table id="buy_way">
                <h3>결제수단 선택/결제</h3>
                <tr>
                    <td rowspan="5">일반결제</td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="radio">무통장 입금
                        <input type="radio">신용카드
                        <input type="radio">계좌이체
                        <input type="radio">가상계좌
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>(무통장 입금의 경우 입금확인 후부터 배송단계가 진행됩니다)</td>
                </tr>
                <tr>
                    <td></td>
                    <td>입금자명 <input type="text"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>입금은행 <select name="bank" id="bank">
                                    <option value="kakao_bank">카카오뱅크</option>
                                    <option value="shinhan">신한</option>
                                    <option value="kb">KB</option>
                                </select>
                    </td>
                </tr>
                <tr>
                    <td>현금영수증/계산서 발행</td>
                    <td>
                        <input type="radio">신청안함
                        <input type="radio">현금영수증
                    </td>
                </tr>
                <tr>
                    <td id="final_price">최종결제 금액 0000원</td>
                </tr>
            </table>
            <p id="agree"><input type="checkbox">(필수)구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</p>
            <button id="pay">결제하기</button>
        </form>
    </div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>