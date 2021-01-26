<%@page import="javax.mail.Session"%>
<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%
	String user_id = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css"
	integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn"
	crossorigin="anonymous">
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" initail-scale="1">
<title>책 상세내용</title>
<style>
.grid {
	width: 500px;
	margin: 0 auto;
	text-align: center;
	font-size: 0;
	position: relative;
	left: 400px;
	top: 40px;
}

.grid_item {
	width: 100px;
	height: 100px;
	display: inline-block;
	vertical-align: top;
}

.container2 ul li {
	display: inline-block;
	margin: 10px;
	width: 400px;
}

div.pic img {
	width: 200px;
	height: 200px;
}

div.book1 {
	padding: 10px 0;
	text-align: center;
}

div.book1 a {
	color: #000;
}

.pagination {
	justify-content: center;
}
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp" />
	<br>
	<br>

<div align="center">

		<div class="container1">
			<div class="pic"><!-- 책 사진 -->
				<img src="<spring:url value='/resources/img/${bvo.book_picture}'/>">
			</div>
		</div>
	<br>
		<div class="book1"> <!-- 책 명 -->
			<h5>[책 제목] : ${bvo.book_name}</h5>
		</div>
	<br>
		<div class="book1"> <!-- 저자 -->
			<h5>[글쓴이(저자)] : ${bvo.book_writer}</h5>
		</div>
	<br>
		<div class="book1"> <!-- 가격 -->
			<h5>[책 가격] : ${bvo.book_price}원</h5>
		</div>
	<br>
	
		<form action = "kakao.do" method = "GET">
			<input type="hidden" name="user_id" id ="user_id" value="<%=user_id%>">
			<input type="hidden" name="book_num" id ="book_num" value="${bvo.book_num}">
			<input type="hidden" name="book_picture" id ="book_picture" value="${bvo.book_picture}">
			<input type="hidden" name="book_name" id ="book_name" value="${bvo.book_name}">
			<input type="hidden" name="book_inventory" id ="book_inventory" value="${bvo.book_inventory}">
			<input type="hidden" name="book_price" id ="book_price" value="${bvo.book_price}">
			<c:if test="${bvo.book_inventory>=1}">
				<select name="purchase_amount" id = "purchase_amount">
					<c:forEach var="book_amount" begin="1" end="${bvo.book_inventory}" step="1" varStatus="a">
						<option>${book_amount}</option>
					</c:forEach>
				</select>
				<input type="submit" value = "구매"/>
			</c:if>
			<c:if test="${bvo.book_inventory==0}">
				<input type = "button" value = "품절" disabled="disabled">
			</c:if>
		</form>
		(재고 : ${bvo.book_inventory})
		<br><br>
		<div class="container2">
			<ul>
				<li>
					<div class="card border-primary mb-3" style="max-width: 20rem;">
						<div class="card-header">
							<font style="vertical-align: inherit;"> 
							<font style="vertical-align: inherit;">
								<h5>책 소개</h5>
								</font>
							</font>
						</div>
						
						<p class="card-text">
							<font style="vertical-align: inherit;">
							<font style="vertical-align: inherit;">
							<pre style="overflow : auto; max-height: 20rem;"><c:out value="${bvo.book_info}"/></pre>
							</font></font>
						</p>
					</div>
				</li>

				<li>
					<div class="card border-primary mb-3" style="max-width: 20rem;">
						<div class="card-header">
							<font style="vertical-align: inherit;"> 
							<font style="vertical-align: inherit;">
							 <h5>목차</h5></font></font>
						</div>

						<p class="card-text">
							<font style="vertical-align: inherit;"> 
							<font style="vertical-align: inherit;">
							<pre style="overflow : auto; max-height: 20rem;"><c:out value="${bvo.book_mokcha}"/></pre>
							</font></font>
						</p>
					</div>
				</li>
			</ul>
		</div>

<%	if(!user_id.equals("bookadmin")) { %>
		<form action="${path}/book/bookAll.do?page=${supPaging.page}&perPageNum=${supPaging.perPageNum}">
			<input type="hidden" name="page" value="${supPaging.page}">
			<input type="hidden" name="perPageNum" value="${supPaging.perPageNum}">
			<button type = "submit"class = "btn btn-primary">
			<font style = "vertical-align : inherit;">
			<font style = "vertical-align : inherit;">목록 </font></font></button>
		</form>
	<%} else { %>
		<!-- 관리자 로그인시 보여야할 버튼 -->
		<div class="grid">
		 <div class="grid_item first">
			<form action="${path}/book/bookAll.do?page=${supPaging.page}&perPageNum=${supPaging.perPageNum}">
				<input type="hidden" name="page" value="${supPaging.page}"> 
				<input type="hidden" name="perPageNum" value="${supPaging.perPageNum}">
				<button type = "submit"class = "btn btn-primary">
				<font style = "vertical-align : inherit;">
				<font style = "vertical-align : inherit;">목록 </font></font></button>
			</form>
		</div>
		
		<div class="grid_item two">
			<form action="${path}/book/updateBook.do" method="GET">
				<input type="hidden" name="book_name" value="${bvo.book_name}">
				<input type="hidden" name="page" value="${supPaging.page}">
				<input type="hidden" name="perPageNum" value="${supPaging.perPageNum}">
			<button type = "submit"class = "btn btn-info">
			<font style = "vertical-align : inherit;">
			<font style = "vertical-align : inherit;">수정</font></font></button>
			</form>
		</div>
		
		<div class="grid_item third">
			<form action="${path}/book/deleteBook.do" method="POST">
				<input type="hidden" name="book_name" value="${bvo.book_name}">
				<input type="hidden" name="page" value="${supPaging.page}"> 
				<input type="hidden" name="perPageNum" value="${supPaging.perPageNum}">
			<button type = "submit"class = "btn btn-danger"onclick="return confirm('삭제하시겠습니까?')">
				<font style = "vertical-align : inherit;">
				<font style = "vertical-align : inherit;">삭제</font></font> 
			</button>
			</form>
		</div>
 	   </div>
	<%} %>
</div>
</body>
</html>