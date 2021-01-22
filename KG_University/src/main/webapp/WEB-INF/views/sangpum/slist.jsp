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

<div id ="outter" class="search">
 <select name="searchType">
  <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
  <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
  <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
  <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
  <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
 </select>
 
 <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

 <button id="searchBtn">검색</button>
  <a href="callwrite" style="align-content: right">게시물 작성</a>
 
 <script>
 $(function(){
  $('#searchBtn').click(function() {
   self.location = "listSearch"
     + '${pageMaker.makeQuery(1)}'
     + "&searchType="
     + $("select option:selected").val()
     + "&keyword="
     + encodeURIComponent($('#keywordInput').val());
    });
 });   
 </script>


</div>


	
	
	

</body>
</html>