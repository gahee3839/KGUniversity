<%@page import="java.awt.print.Printable"%>
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

<jsp:include page="../include/header.jsp" />
	<br>
	<br>


<c:forEach items = "${pvo}" var = "purchase">
<img src ="<spring:url value='/resources/img/${purchase.book_picture}'/>"><br>
${purchase.book_name}<br>
${purchase.book_amount}<br>
${purchase.purchase_date}<br>
</c:forEach>

<br><br>
<c:if test="${pageMaker.prev}">
		<a href="${path}/book/userPurchase.do${pageMaker.makeUserPurchase(pageMaker.startPage-1)}">이전</a>
     </c:if>
	 <c:forEach begin="${pageMaker.startPage}" end ="${pageMaker.endPage}" var ="idx">
		<c:out value ="${pageMaker.purPaging.page == idx ? '' : ''}"/>
		<a href="${path}/book/userPurchase.do${pageMaker.makeUserPurchase(idx)}">${idx}</a>
	</c:forEach>
	<c:if test="${pageMaker.next && pageMaker.endPage >0}">
		<a href ="${path}/book/userPurchase.do${pageMaker.makeUserPurchase(pageMaker.endPage+1)}">다음</a>
	</c:if>
</body>
</html>