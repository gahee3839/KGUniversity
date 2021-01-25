<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../include/header.jsp" />
	<br>
	<br>
	
	<%@include file="../../../menu.jsp" %>
	<h2>마이페이지</h2>
	<table border="2">
		<tr>
			<td>아이디</td>
			<td>${vo.userId}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${vo.userName}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${vo.email}</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${vo.nickname}</td>
		</tr>
		<tr>
			<td>가입일</td>
			<c:set var="now" value="${vo.joinDate}"></c:set>
			<td><fmt:formatDate value="${now}" type="date"/></td>
		</tr>
		<tr>
			<td>내가쓴글</td>
			<td><a href="myWrite">내가쓴글</a></td>
		</tr>
	</table>
	<a href="/www/member/update.do?userId=${vo.userId}">
		<input type="button" value="회원정보수정">
	</a>
	<a href="/www/member/pw.do">
		<input type="button" value="비밀번호수정">
	</a>
	<a href="/www/member/delete.do">
		<input type="button" value="회원탈퇴">
	</a>
</body>
</html>