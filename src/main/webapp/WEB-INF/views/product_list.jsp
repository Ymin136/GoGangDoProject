<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
<style type="text/css">
        .main_container{
            width: 1200px;
            text-align: center;
            margin: 0px auto;
            display: flex;
            flex-direction: column;
            border-top: solid 1px gray;
        }
        .sub_bar{
            width: 1200px;
            margin: 0px;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }
        #product_count{
            font-size: 16px;
            font-weight: bold;
        }
        #sub_menu{
            font-size: 14px;
            height: 25px;
            display: flex;
            flex-direction: row;
            margin-right: 60px;
            margin-top: 15px;
        }
        #product_list{
            width: 1200px;
            margin: 0 auto;
        }
        article{
            display: flex;
            flex-direction: row;
        }
        #product{
            margin: 20px;
        }
        .main_container img{
            width: 250px;
            height: 250px;
        }
        #sub_menu a{
            text-decoration: none;
        }
        #product a{
            text-decoration: none;
        }
        .page_bar{
        	margin-top: 10px;
        	margin-bottom: 20px;
        }
        .page_bar a{
        	text-decoration: none;
        }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#popular").click(function(){
		
	})
	$("#recent").click(function(){
		
	})
	$("#lowprice").click(function(){
		var data = ("#product").serialize();
		$.ajax({
			url: "",
			data: data,
			method: "get", 
		})
	})
	$("#highprice").click(function(){
		
	})
});
</script>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
	<div class="main_container">
        <div class="sub_bar">
            <p id="product_count">전체 상품 000개</p>
            <select name="sub_menu" id="sub_menu">
            	<option id="popular">인기순</option>
            	<option id="recent">최신등록순</option>
            	<option id="lowprice">낮은가격순</option>
            	<option id="highprice">높은가격순</option>
            </select>
        </div>
        <hr>
        <section id="product_list">
            <article>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
            </article>
            
            <article>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
            </article>
            
            <article>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
            </article>

            <article>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
            </article>

            <article>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div id="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
            </article>
        </section>
        <div class="page_bar">
        	<c:if test="${pagging.previousPageGroup }">
				<a href="main.do?pageNo=${pagging.startPageOfPageGroup - 1 }">◀</a>
			</c:if>
			<c:forEach var="i" begin="${pagging.startPageOfPageGroup}" end="${pagging.endPageOfPageGroup}">
				<a href="main.do?pageNo=${i }">${ i}</a>
			</c:forEach>
			<c:if test="${pagging.nextPageGroup }">
				<a href="main.do?pageNo=${pagging.endPageOfPageGroup + 1 }">▶</a>
			</c:if>            
        </div>
    </div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>