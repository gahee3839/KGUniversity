<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 판매 목록</title>
</head>
<body>
<form action = "search.do" method="get">
<select name = "searchType" id = "searchType">
	<option value = "book_name" <c:out value = "${search.searchType eq 'book_name' ? 'selected' : ''}"/>>책 제목</option>
	<option value = "book_writer" <c:out value = "${search.searchType eq 'book_writer' ? 'selected' : ''}"/>>글쓴이</option>
</select>
<input type = "keyword" name = 'keyword' value = "${search.keyword}">
<input type = "submit" value = "검색">
</form><br>

	<c:forEach items = "${book}" var = "List" >
		<img src ="<spring:url value='/resources/img/${List.book_picture}'/>"><br>
		<a href="${path}/book/getBookInfo.do${pageMaker.makeSearch(pageMaker.supPaging.page)}&book_name=${List.book_name}">${List.book_name}</a><br>
		${List.book_writer}<br>		
		${List.book_price}<br>
	</c:forEach>
	
	<br><br>
	
	<c:if test="${pageMaker.prev}">
		<a href="${path}/book/search.do${pageMaker.makeSearch(pageMaker.startPage-1)}">이전</a>
     </c:if>
	 <c:forEach begin="${pageMaker.startPage}" end ="${pageMaker.endPage}" var ="idx">
		<c:out value ="${pageMaker.supPaging.page == idx ? '' : ''}"/>
		<a href="${path}/book/search.do${pageMaker.makeSearch(idx)}">${idx}</a>
	</c:forEach>
	<c:if test="${pageMaker.next && pageMaker.endPage >0}">
		<a href ="${path}/book/search.do${pageMaker.makeSearch(pageMaker.endPage+1)}">다음</a>
	</c:if>
</body>
</html>
 