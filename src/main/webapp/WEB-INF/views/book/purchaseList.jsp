<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<%@ page session="false" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css" integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn" crossorigin="anonymous">
<meta name="viewport" content = "width-device-width", initail-scale="1">
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
		<a href="${path}/book/purchaseList.do?page=${pageMaker.startPage-1}">이전</a>
     </c:if>
	 <c:forEach begin="${pageMaker.startPage}" end ="${pageMaker.endPage}" var ="idx">
		<c:out value ="${pageMaker.purPaging.page == idx ? '' : ''}"/>
		<a href="${path}/book/purchaseList.do${pageMaker.makePurchase(idx)}">${idx}</a>
	</c:forEach>
	<c:if test="${pageMaker.next && pageMaker.endPage >0}">
		<a href ="${path}/book/purchaseList.do?page=${pageMaker.endPage+1}">다음</a>
	</c:if>
	
</body>
</html>