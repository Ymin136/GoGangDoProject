<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        /*.order_list th{
        	width: 20%;
        }*/
        .order_list tr{
            text-align: center;
            border-bottom: solid 1px lightgray;
        }
        .order_list img{
            width: 50px;
            height: 50px;
        }
        #cart{
            width: 170px;
            height: 30px;
            font-size: 14px;
            background-color: white;
            border: none;
            text-decoration: underline;
        }
        #cart a{
        	text-decoration: none;
        	color: gray;
        }
        .total{
            width: 1200px;
            margin: 20px auto;
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
        .main_container input{
            height: 25px;
            font-size: 15px;
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
<script type="text/javascript">
	$(function(){
		
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
            <p style="color:gray; height:10px">주문상세내역</p>
            <thead style="height:30px;border-top:1px solid black">
                <th>상품정보</th>
                <th>수량</th>
                <th>상품 금액</th>
                <th>합계 금액</th>
            </thead>
                <c:forEach var="order" items="${requestScope.order }">
            <tr style="height:70px">
             		<td style="font-size:14px;color:gray"><img alt="" src="imageLoad.do?fno=${order.img_no }">${order.product_name }</td>
                	<td id="ea">${order.order_ea }</td>
                	<td>${order.product_price }</td>
                	<td id="total_price">${order.order_ea*order.product_price }</td>
            	</c:forEach>
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
                <td>${requestScope.all_price }원</td>
                <td>3,000원</td>
                <td id="cart_price">${requestScope.order_price }원</td>
            </tr>
        </table>
        <h3  id="buyer">주문자 정보</h3>
        <form action="purchase.do" method="get" class="order_info">
        <input type="hidden" name="order_total" value="${requestScope.order_price}">
        
            <table id="buyer_info">
                <tr style="height:50px">
                    <td>주문하시는 분</td>
                    <td><input type="text" name="id" value="${sessionScope.id }"></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" value="${sessionScope.tel }"></td>
                </tr>
                <tr style="height:60px">
                    <td>이메일</td>
                    <td><input type="text" value="${sessionScope.email }">              
                        <!-- <select name="mail" id="email">
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                        </select> -->
                    </td>
                </tr>
                <tr>
                    <td style="font-size:18px; color:gray; border-bottom:solid 1px lightgray">배송정보</td>
                </tr>
                <tr>
                    <td>배송지 확인</td>
                    <td>
                        <input type="radio" checked>기본배송지
                        <input type="radio">직접입력
                    </td>
                </tr>
                <tr style="height:120px">
                    <td>받으실 곳</td>
                    <td id="buyer_address">
                    <c:forEach items="${requestScope.address }" var="address"></c:forEach>
                        <input type="text" id="sample4_postcode" value="${sessionScope.post }" style="width:100px">
                        <input type="button" id="search_address" onclick="sample4_execDaumPostcode()" value="주소 바꾸기" 
                        style="width:100px;height:27px;background-color:black;color:white"><br>
                        <!-- <button id="search_address" name="search_address">주소 수정</button><br> -->
                        <input type="text" id="sample4_roadAddress" name="order_address" value="${sessionScope.address1 }" style="width:210px"><br>
                        <input type="text" id="sample4_detailcode" value="${sessionScope.address2 }" style="width:210px"><br>
                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                        <script>
                      //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
                        function sample4_execDaumPostcode() {
                            new daum.Postcode({
                                oncomplete: function(data) {
                                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                                    var extraRoadAddr = ''; // 참고 항목 변수

                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                        extraRoadAddr += data.bname;
                                    }
                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                    if(data.buildingName !== '' && data.apartment === 'Y'){
                                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    }
                                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                    if(extraRoadAddr !== ''){
                                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                                    }

                                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                    document.getElementById('sample4_postcode').value = data.zonecode;
                                    document.getElementById("sample4_roadAddress").value = roadAddr;
                                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                                    
                                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                                    if(roadAddr !== ''){
                                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                                    } else {
                                        document.getElementById("sample4_extraAddress").value = '';
                                    }

                                    var guideTextBox = document.getElementById("guide");
                                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                                    if(data.autoRoadAddress) {
                                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                                        guideTextBox.style.display = 'block';

                                    } else if(data.autoJibunAddress) {
                                        var expJibunAddr = data.autoJibunAddress;
                                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                                        guideTextBox.style.display = 'block';
                                    } else {
                                        guideTextBox.innerHTML = '';
                                        guideTextBox.style.display = 'none';
                                    }
                                }
                            }).open();
                        }
                        </script>
                    </td>
                </tr>
                <tr>
                    <td>남기실 말씀</td>
                    <td><input type="text"></td>
                </tr>
            </table>
            <table id="buy_way">
                <h3>결제수단 선택/결제</h3>
                <tr>
                    <td rowspan="5">일반결제</td>
                    <td>
                        <tr>
                            <td>
                                <input type="radio">무통장 입금
                                <input type="radio">신용카드
                                <input type="radio">계좌이체
                                <input type="radio">가상계좌
                            </td>
                        </tr>
                        <tr>
                            <td style="height:20px">(무통장 입금의 경우 입금확인 후부터 배송단계가 진행됩니다)</td>
                        </tr>
                        <tr>
                            <td>입금자명 <input type="text"></td>
                        </tr>
                        <tr style="height:20px">
                            <td>입금은행 <select id="bank" style="height:25px;font-size:15px">
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
                        <input type="radio">신청안함
                        <input type="radio">현금영수증
                    </td>
                </tr>
                <tr style="height: 100px">
                    <td id="final_price" style="font-weight:bold">최종결제 금액 ${requestScope.cart_price }원</td>
                </tr>
            </table>
            <p id="agree"><input type="checkbox" checked>(필수)구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</p>
            <button id="pay">결제하기</button>
        </form>
    </div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>