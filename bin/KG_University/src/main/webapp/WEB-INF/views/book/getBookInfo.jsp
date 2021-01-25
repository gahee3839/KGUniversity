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
<title>책 상세내용</title>
</head>
<body>
<img src ="<spring:url value='/resources/img/${bvo.book_picture}'/>"><br>
${bvo.book_name}<br>
${bvo.book_writer}<br>
${bvo.book_price}<br>
	<form action = "${path}/book/purchase.do" method = "POST">
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
	<button type = "submit" onclick="return confirm('구매하시겠습니까?')">구매</button>
</form>
(재고 : ${bvo.book_inventory})<br>

<br>
<pre><c:out value="${bvo.book_info}"/></pre>
<pre><c:out value="${bvo.book_mokcha}"/></pre><br>


<% int admin = 0;
	if (admin == 1){ %>
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