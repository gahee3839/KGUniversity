<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<meta charset="UTF-8">
<title>중고장터 목록</title>
</head>

<style>
	h2{
		text-align: center;
		}
	table{
		width: 100%;
		}
	#outter{
		display: block;
		width: 60%;
		margin:auto;
		 }
	</style>
	

<body>

<h2>게시판</h2>
<div id="outter">
	<table border ="1">
		<tr>
				<td>NO.</td>
				<td width="50%">제목</td>
				<td>작성자</td>
				<td>등록일</td>
				<td>조회수</td>				
		</tr>
		<c:forEach var="s" items="${slist}" >
		<tr>
		<td>${s.bno}</td>
		<td><a href="detail?bno=${s.bno }">[${s.sb }] ${s.title }</a></td>
		<td> ${s.id }</td>
		<td><fmt:formatDate value="${s.wrdate }" pattern="yyyy.MM.dd"/> </td>
		<td>${s.viewcnt }</td>
		</tr>
	</c:forEach>		
</table>
</div>

<form>
<div id ="outter" class="search">
  <select name="searchType">
      <option value="t">제목</option>
      <option value="c">내용</option>
      <option value="i">작성자</option>
  </select>
  
  <input type="text" name="Keyword" /> 
  <button type="submit">검색</button>
   </div>
    </form>

  <a href="callwrite" style="align-content: right">게시물 작성</a>
 


<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/boardList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/boardList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/boardList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	
	
	

</body>
</html>