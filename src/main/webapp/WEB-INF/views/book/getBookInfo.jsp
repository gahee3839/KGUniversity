<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<%@ page session="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>책 상세내용</title>
</head>
<body>
<p>
<p>아임 서포트 결제 모듈 테스트 해보기</p>
<button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button>
</p>

<script>
$("#check_module").click(function() {
var IMP = window.IMP; // 생략가능
/* var user_id = $('input[name="user_id"]').val();
var book_num = $('input[name="book_num"]').val();
var book_picture = $('input[name="book_picture"]').val();
var book_name = $('input[name="book_name"]').val();
var book_inventory = $('input[name="book_inventory"]').val();
var book_amount = $('input[name="book_amount"]').val(); */
IMP.init('imp99338921');
IMP.request_pay({
pg: 'kakao', // version 1.1.0부터 지원.
pay_method: 'card',
merchant_uid: 'merchant_' + new Date().getTime(),
name: '주문명:결제테스트',
amount: 1,
buyer_email: 'iamport@siot.do',
buyer_name: '구매자이름',
buyer_tel: '010-1234-5678',
buyer_addr: '서울특별시 강남구 삼성동',
buyer_postcode: '123-456',
}, function (rsp) {
console.log(rsp);
if (rsp.success) {
	var msg = '결제가 완료되었습니다.';
	msg += '고유ID : ' + rsp.imp_uid;
	msg += '상점 거래ID : ' + rsp.merchant_uid;
	msg += '결제 금액 : ' + rsp.paid_amount;
	msg += '카드 승인번호 : ' + rsp.apply_num;
	/* jQuery.ajax({
		url: "http://localhost:8089/www/book/purchase.do",
		methoed : "POST",
		headers: { "Content-Type": "application/json" },
        data: {
            user_id : "user_id",
            book_num : "1046",
            book_picture : "book_picture",
            book_name : "book_name",
            book_inventory : "book_inventory",
            book_amount : "book_amount"
        }
    })*/
} else {
	var msg = '결제에 실패하였습니다.';
	msg += '에러내용 : ' + rsp.error_msg;
}
alert(msg);
document.location.href="http://localhost:8089/www/book/bookAll.do";
});
</script>

<br><br><br><br>
<img src ="<spring:url value='/resources/img/${bvo.book_picture}'/>"><br>
${bvo.book_name}<br>
${bvo.book_writer}<br>
${bvo.book_price}<br>
<form action = "book/purchase.do" methoed = "post">
			<input type = "hidden" name = "user_id" value = "user_id">
			<input type = "hidden" name = "book_num" value = "${bvo.book_num}">
			<input type = "hidden" name = "book_picture" value = "${bvo.book_picture}">
			<input type = "hidden" name = "book_name" value = "${bvo.book_name}">
			<input type = "hidden" name = "book_inventory" value = "${bvo.book_inventory}">
	<select name = "purchase_amount">
		<c:forEach var = "book_amount" begin="1" end = "${bvo.book_inventory}" step = "1" varStatus="a" >
			<option>${book_amount}</option>
		</c:forEach>
	</select>
	<button type = "button" onclick="check_module()" value = "구매">구매</button>
</form>
(재고 : ${bvo.book_inventory})<br>

<br>
<pre><c:out value="${bvo.book_info}"/></pre>
<pre><c:out value="${bvo.book_mokcha}"/></pre><br>


<% int admin = 0;
	if (admin == 1) { %>
	<form action ="${path}/book/bookAll.do?page=${supPaging.page}&perPageNum=${supPaging.perPageNum}">
		<input  type = "hidden" name = "page" value ="${supPaging.page}">
		<input  type = "hidden" name = "perPageNum" value ="${supPaging.perPageNum}">
	<button type = "submit">목록</button>
	</form>
<% } else if (admin == 0) { %>
	<!-- 관리자 로그인시 보여야할 버튼 -->
	<form action ="${path}/book/bookAll.do?page=${supPaging.page}&perPageNum=${supPaging.perPageNum}">
		<input  type = "hidden" name = "page" value ="${supPaging.page}">
		<input  type = "hidden" name = "perPageNum" value ="${supPaging.perPageNum}">
	<button type = "submit">목록</button>
	</form>
	<form action ="${path}/book/updateBook.do" method = "GET">
		<input  type = "hidden" name = "book_name" value ="${bvo.book_name}">
		<input  type = "hidden" name = "page" value ="${supPaging.page}">
		<input  type = "hidden" name = "perPageNum" value ="${supPaging.perPageNum}">
		<button type = "submit">수정</button>
	</form>
	<form action ="${path}/book/deleteBook.do" method = "POST">
		<input  type = "hidden" name = "book_name" value ="${bvo.book_name}"> 
		<input  type = "hidden" name = "page" value ="${supPaging.page}">
		<input  type = "hidden" name = "perPageNum" value ="${supPaging.perPageNum}">
		<button type = "submit" onclick="return confirm('삭제하시겠습니까?')">삭제</button>
	</form>
<% } %>
<!-- ----------------------------------------------------------------------  -->

</body>
</html>