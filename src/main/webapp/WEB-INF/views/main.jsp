<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<jsp:include page="./include/header.jsp" />
<html>
<head>
<meta charset="UTF-8">
<title>KG_University</title>
</head>
<body>
	<h2>메인화면</h2><br>
	서점
	<c:forEach items="${book}" var = "book" begin="0" end="4">
		${book.book_name}<br>
	</c:forEach>
	
	<br><br>
	자유게시판<br>
	<c:forEach items="${free}" var = "free" begin="0" end="4">
		${free.title}<br>
	</c:forEach>
	
	<br><br>
	공지사항<br>
	<c:forEach items="${notice}" var = "notice" begin="0" end="4">
		${notice.title}<br>
	</c:forEach>
	
	<br><br>
	정보게시판<br>
	<c:forEach items="${info}" var = "info" begin="0" end="4">
		${info.title}<br>
	</c:forEach>
	
	<br><br>
	동아리<br>
	<c:forEach items="${club}" var = "club" begin="0" end="4">
		${club.title}<br>
	</c:forEach>
</body>
</html>