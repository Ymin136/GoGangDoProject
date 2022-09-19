<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고강도</title>
<style type="text/css">
	#qna_container{
		width:1150px;
		margin : 0 auto;
		padding:25px;
		border: 1px solid black;		
	}
	
	#qna_container #qna_table{
		width : 1100px;
		margin-left:30px;
		border-collapse: collapse;
		table-layout: fixed;
	}
	#qna_container #qna_table td{
		padding :5px 0px;
		text-overflow:ellipsis; overflow:hidden
	}
	#qna_container #qna_table #title{
		width:12%;
		text-align: left;
	}
	#qna_container #qna_table #date{
		width:18%;
	} 
	#qna_container #qna_table .content{
		width : 55%;
		text-align: left;
	}
	#qna_container #qna_table #under td{
		border-bottom:1px solid lightgray;
		padding-bottom:10px;
	}
	#qna_container #qna_table #question td{
		padding-top:30px;
	}
	#qna_container #qna_table #product{
		width:150px;
		padding:0px 10px;
	}
	#qna_container #qna_tfoot {
		text-align: center;
		text-decoration: none;
	}
	#qna_container a{
		font-family: sans-serif;
		white-space: nowrap;
		text-overflow: ellipsis;
		text-decoration: none;
	}
	#page_bar a{
		text-decoration:none; 
		margin : 0px 10px;
	}
	#qna_btn{
		width:100px;
		height:50px;
		border:none;
		background-color : gray;
		color : white;
		border-radius:5px;
		margin-left:1000px;
	}
	.qna_pop{
		width:640px;
		height:auto;
		padding-bottom:20px; 
		top:10%;
		left:35%;
		background-color:#fff;
		position:fixed;
		border:1px solid black;
		vertical-align:middle; content:'';
		overflow: hidden;
	}
	.qna_pop textarea{
		width:100%;
		height:200px;
	}
	.qna_pop table{
		width:90%;
		margin : 0 auto;
		border-top : 3px solid gray;
		border-collapse: collapse;
	}
	.qna_pop td:not(#btn_td){
		text-align: left;
		padding :20px;
		border-bottom:1px solid lightgray;
	}
	#btn_td{
		text-align: left;
		padding:10px;
		padding-top:20px;
	}
	.qna_pop #title{
		vertical-align: top;
		text-align: left;
		width:30%;
		border-right:1px solid lightgray;
		border-bottom:1px solid lightgray;
	}
	.qna_pop button{
		color: white;
	    font-weight: bold;
	    text-align: center;
	    width: 45%;
	    height: 40px;
	    border: none;
	    border-radius: 5px;
	    margin-left: 20px;
	}
	.btn_close{
		background: gray;
	}
	#btn_send{
		background: #008cff;
	}
	.shadow{position: fixed;left: 0;top: 0;background: rgba(0, 0, 0, 0.52);width: 100%;height: 100vh;display: none}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function qna_load(pageNo, answer_check){
	$.ajax({
		url:"qnaAllList.do",
		data : "pageNo="+pageNo+"&answer_check="+answer_check,
		dataType : "json",
		success:function(r){
			console.log(r);
			var tag = "";
			for(i=0;i<r.length;i++){
				tag += "<tr id='question'><td id='qno'>"+r[i].qna_no+"</td>";
				tag += "<td id='product'><a href='productDetail.do?product_no="+r[i].product_no+"'>"+r[i].product_name+"</a></td>";
				tag += "<td id='title'><span style='color:blue;font-weight:bold;'>질문</span> : "+r[i].id+"</td>";
				tag += "<td class='content'>"+r[i].qna_content+"</td><td>"+r[i].qna_date+"</td></tr>";
				if(r[i].answer_check==1)
				tag+="<tr id='under'><td></td><td id='product'></td><td id='title'><a class = 'qna_answer_update'href='#'style='color:gray;font-weight:bold;'>답변수정하기</a></td><td id='content' style='color:red;font-weight:bold;'>"+r[i].answer_content+"</td><td id ='date'></td></tr>";
				if(r[i].answer_check==0)
				tag+="<tr id='under'><td></td><td id='product'></td><td id='title' colspan='3'><a class ='qna_answer_insert' href='#' style='color:gray;font-weight:bold;'>답변등록하기</a></td></tr>";
			}
			$('#qna_tbody').html(tag);

			$('.qna_answer_insert').click(function(){
				var qna_content = $(this).parent().parent().prev().find($('.content')).text();
				var title = $(this).parent().parent().prev().find($('#product a')).text();
				var qno = $(this).parent().parent().prev().find('#qno').text();
				$('.qna_no').val(qno);
				$('.product_title').text(title);
				$('.qna_content').val(qna_content);
				$('body').css("overflow","hidden");
				$('#answer_insert_pop').css("display","block");
				$(".shadow").show();
			});
			$('.qna_answer_update').click(function(){
				var qna_content = $(this).parent().parent().prev().find($('.content')).text();
				var answer_content = $(this).parent().next().text();
				var qno = $(this).parent().parent().prev().find('#qno').text();
				$('.qna_no').val(qno);
				$('.qna_content').val(qna_content);
				$('.answer_content').val(answer_content);
				$('body').css("overflow","hidden");
				$('#answer_update_pop').css("display","block");
				$(".shadow").show();
			});
			$('.btn_close').click(function(){
				console.log(1);
				$('body').css("overflow","visible");
				$('.qna_pop').css("display","none");
				$('.qna_pop textarea').val("");
				$('.shadow').hide();
			});
		}
	});
};
function qna_pagging(pageNo, answer_check){
	$.ajax({
		url:"qnaPagging.do",
		data : "pageNo="+pageNo+"&answer_check="+answer_check,
		dataType : "json",
		success:function(r){
			console.log(r);
			var tag = "";
			tag+="<tr><td colspan='4' id = 'page_bar' style ='padding:20px 10px; border:none;'>";
			for(var i=1; i<=r.endPageOfPageGroup;i++)     
				tag+="<a class='qna_pagging' href ='#'>"+i+"</a>";			
        		tag+="</td></tr>"
        		$('#qna_tfoot').html(tag);
        		$('.qna_pagging').click(function(){
        			console.log(1);
        			var ac = $("input[name='answer_check']:checked").val();
        			var pageNo = $(this).text();
        			qna_load(pageNo,ac);
        			return false;
        		});
			}
	});
};
$(function(){
	qna_load(1,0);
	qna_pagging(1,0);
	$('#qna_container input').change(function(){
		var ac = $(this).val();
		qna_load(1,ac);
		qna_pagging(1,ac);
	});
});
</script>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
<div id="qna_container">
	<h2>문의사항</h2>
		<div style="text-align: right">
			<input type="radio" id = "answer_check" name="answer_check" value="1">답변완료
			<input type="radio" id = "answer_check" name="answer_check" value="0" checked>답변미완료
		</div>
		<hr>
	<table id="qna_table">
		<tbody id="qna_tbody">
		</tbody>
		<tfoot id="qna_tfoot">
   	    </tfoot>
	</table>
	<div class="shadow"></div>
	<div class = 'qna_pop' id="answer_insert_pop" style="display:none;">
		<div class="pop_inner">
			<h2 style="margin-left:10px;">문의하기</h2>
	 		<form action="insertQnaAnswer.do">
		 		<input type="hidden" name="qna_no" class="qna_no"value="">
	 		<table>
	 		<tr>
	 			<td id="title">상품정보</td>
	 			<td class="product_title"></td>
	 		</tr>
	 		<tr>
	 			<td id="title">문의내용</td>
	 			<td><textarea class="qna_content" name="qna_content" readonly="readonly"></textarea></td>
	 		</tr>
	 		<tr>
	 			<td id="title">답변내용</td>
	 			<td><textarea class="answer_content" name="answer_content"></textarea></td>
	 		</tr>
	 		<tr>
	 			<td colspan="2" id="btn_td"><button id="btn_send">등록하기</button>
	 			<button type="button" class="btn_close">취소</button></td>
	 		</tr>
	 		</table>
	 		</form>
		</div>
	</div>
	<div class = 'qna_pop' id="answer_update_pop" style="display:none;">
	<div class="pop_inner">
		<h2 style="margin-left:10px;">문의하기</h2>
		 		<form action="updateQnaAnswer.do">
		 		<input type="hidden" name="qna_no" class="qna_no"value="">
		 		<table>
		 		<tr>
		 			<td id="title">상품정보</td>
		 			<td class="product_title"></td>
		 		</tr>
		 		<tr>
		 			<td id="title">문의내용</td>
		 			<td><textarea class="qna_content" name="qna_content" readonly="readonly"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td id="title">답변내용</td>
		 			<td><textarea class="answer_content" name="answer_content"></textarea></td>
		 		</tr>
		 		<tr>
		 			<td colspan="2" id="btn_td"><button id="btn_send">수정하기</button>
		 			<button type="button" class="btn_close">취소</button></td>
		 		</tr>
		 		</table>
		 		</form>
		</div>	
	</div>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>