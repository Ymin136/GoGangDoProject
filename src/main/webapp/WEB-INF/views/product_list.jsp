<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
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
        .sub_bar{
            width: 1200px;
            margin: 20px auto;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }
        #sub_menu p{
            margin: 0px 5px;
        }
        #product_count{
            font-size: 16px;
            font-weight: bold;
        }
        #sub_menu{
            font-size: 14px;
            display: flex;
            flex-direction: row;
        }
        section{
            width: 1200px;
            margin: 0 auto;
        }
        article{
            display: flex;
            flex-direction: row;
        }
        .product{
            margin: 20px;
        }
        .main_container img{
            width: 250px;
            height: 250px;
        }
        #sub_menu a{
            text-decoration: none;
        }
        .product a{
            text-decoration: none;
        }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
	<div class="main_container">
        <div class="sub_bar">
            <p id="product_count">전체 상품 000개</p>
            <div id="sub_menu">
                <p><a href="#">인기순</a></p>
                <p>|</p>
                <p><a href="javascript:recent">최신등록순</a></p>
                <p>|</p>
                <p><a href="#">낮은가격순</a></p>
                <p>|</p>
                <p><a href="#">높은가격순</a></p>
                <select name="organize" id="">
                    <option value="10">10개씩 정렬</option>
                    <option value="20" selected>20개씩 정렬</option>
                </select>
            </div>
        </div>
        <hr>
        <section>
            <article>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
            </article>
            
            <article>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
            </article>
            
            <article>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
            </article>

            <article>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
            </article>

            <article>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
                    <a href="productDetail.do">
                        <img alt="" src="img/dog-food.jpg">
                        <p>상품명 OOO</p>
                        <h4>0000원</h4>
                    </a>
                </div>
                <div class="product">
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