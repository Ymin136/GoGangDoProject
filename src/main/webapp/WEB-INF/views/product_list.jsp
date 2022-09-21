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
        #sub_menu a{
        	color: black;
        }
        #product_list{
            width: 1200px;
            margin: 0 auto;
        }
        #product_list a{
        	color: black;
        	text-decoration: none;
        }
        article{
        	width:100%;
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
        }
        #product{
        	width:25%;

        }
        .main_container img{
            width: 250px;
            height: 250px;
        }
        #sub_menu a{
            text-decoration: none;
            margin: 0px 10px;
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

</script>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
	<div class="main_container">
        <div class="sub_bar">
            <p id="product_count">전체 상품 ${requestScope.count }개</p>
            <div id="sub_menu">
            	<a href="productSortList.do?category_no=${requestScope.category }&sort=0">낮은가격순</a>
            	<span>|</span>
            	<a href="productSortList.do?category_no=${requestScope.category }&sort=1">높은가격순</a>
            </div>
        </div>
        <hr>
        <section id="product_list">
            <article>
            	<c:forEach var="dto" items="${requestScope.list }">
                    	<div id="product">
                    	<a href="productDetail.do?product_no=${dto.product_no }">
                        	<img alt="" src="imageLoad.do?fno=${dto.img_no }">
                        	<p>${dto.product_name}</p>
                        </a>
                        	<h4>${dto.product_price }원</h4>	
                    	</div>
            	</c:forEach>
            </article>
        </section>
        <div class="page_bar">
        	<c:if test="${pagging.previousPageGroup }">
				<a href="productList.do?category_no=${requestScope.category }&pageNo=${pagging.startPageOfPageGroup - 1 }">◀</a>
			</c:if>
			<c:forEach var="i" begin="${pagging.startPageOfPageGroup}" end="${pagging.endPageOfPageGroup}">
				<a href="productList.do?category_no=${requestScope.category }&pageNo=${i }">${ i}</a>
			</c:forEach>
			<c:if test="${pagging.nextPageGroup }">
				<a href="productList.do?category_no=${requestScope.category }&pageNo=${pagging.endPageOfPageGroup + 1 }">▶</a>
			</c:if>  
        </div>
    </div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>