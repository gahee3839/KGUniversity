<%@page import="com.kgu.www.vo.FreeBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KG_University - 자유게시판</title>

<style>
	a {text-decoration:none}
	table{
		margin-left:auto;
		margin-right:auto;
	}
	#div_root{
		margin:0 auto;
		width:1500px;
		height:100%;
	}
	#header{
		background-color: gray;
		height:50px;
	}
	#blank{
		background-color: red;
		width:100%;
		height:100px;
		float:left;
	}
	#nav1{
		background-color: green;
		width:20%;
		height:1200px;
		float:left;
	}
	#section1{
		background-color: yellow;
		width:80%;
		height:1200px;
		float:left;
	}
	#footer{
		background-color: olive;
	}
	#header, #blank, #nav1, #section1, #footer{text-align: center;}
</style>

</head>
<body>	
	<div id="div_root">
		<div id="header">
			<h2>header</h2>
		</div>
		<div id="blank">
			<h2>　</h2>
		</div>
		
		<div id="nav1">
			<hr width="70%">
			<h1 style="font-weight: bold;">게시판</h1>
			<hr width="70%">
			
			<table border="0" style="text-align: left;">
				<tr>
					<td width="170" height="30">
						<font size="4" style="font-weight: bold;">
							* <a href="">공지사항</a>
						</font>
					</td>
				</tr>
				<tr>
					<td height="30">
						<font size="4" style="font-weight: bold;">
							* <a href="FreeBoard_List.do">자유게시판</a>
						</font>
					</td>
				</tr>
				<tr>
					<td height="30">
						<font size="4" style="font-weight: bold;">
							* <a href="">정보게시판</a>
						</font>
					</td>
				</tr>
				<tr>
					<td height="30">
						<font size="4" style="font-weight: bold;">
							* <a href="">동아리게시판</a>
						</font>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="section1">
			<br>
			<table border="0" width="90%">
				<tr>
					<td style="text-align: left;">
						<font size="6" style="font-weight: bold;">자유게시판</font>
					</td>
					<td style="text-align: right;">
						<input type="button" value="글쓰기" onclick="location.href='FreeBoard_Write.do'"
								style="font-size: 18px;
										font-weight:bold;
										padding: 5px 10px;
										border-radius: 5px;
										background-color: aqua;">
					</td>
				</tr>
			</table>	
			<hr width="90%">
			
			<br>
			<table border="1" width="90%">
				<thead>
					<tr height="50">
						<th width="70">번호</th>
						<th width="100">분류</th>
						<th>제목</th>
						<th width="150">작성자</th>
						<th width="200">작성일</th>
						<th width="70">조회수</th>
					</tr>
				</thead>
				<c:forEach var="fbList" items="${fbList}"	begin="${(boardPagingVO.pageNum-1)*boardPagingVO.perPageCnt}"
															end="${boardPagingVO.pageNum*boardPagingVO.perPageCnt-1}">
					<tr>
						<td width="70" height="25"><c:out value="${fbList.FBN_seq}" /></td>
						<td width="100"><c:out value="${fbList.type}" /></td>
						<td style="text-align: left; padding-left: 5px;">
							<a href="FreeBoard_Content.do?cNum=${fbList.FBN_seq}">
								<c:out value="${fbList.title}" />
							</a>
							<c:if test="${fbList.commentCnt > 0}">
								[<c:out value="${fbList.commentCnt}" />]
							</c:if>
						</td>
						<td width="120"><c:out value="${fbList.writer}" /></td>
						<td width="150"><c:out value="${fbList.regDate}" /></td>
						<td width="70"><c:out value="${fbList.hit}" /></td>
					</tr>
				</c:forEach>
			</table>
			
			<br>
			<hr width="90%">
			<br>
			
			<!-- 페이징부 -->
			<font size="3" style="font-weight: bold; color: black;">페이지이동</font><br>
			<c:if test="${boardPagingVO.pageNum ne 1}">
				<font size="3" style="font-weight: bold;">
					<a href="FreeBoard_List.do?page=1
							&searchType=${boardPagingVO.searchType}
							&searchKeyword=${boardPagingVO.searchKeyword}">처음</a>
				</font>
			</c:if>
			<c:if test="${boardPagingVO.prev}">
				<font size="3" style="font-weight: bold;">
					<a href="FreeBoard_List.do?page=${(boardPagingVO.pageBlock-2) * boardPagingVO.displayPageNum + 1}
							&searchType=${boardPagingVO.searchType}
							&searchKeyword=${boardPagingVO.searchKeyword}">이전</a>
				</font>
			</c:if>
			<c:forEach var="page" begin="${boardPagingVO.startPage}" end="${boardPagingVO.endPage}">
				<font size="3" style="font-weight: bold;">
					<a href="FreeBoard_List.do?page=${page}
							&searchType=${boardPagingVO.searchType}
							&searchKeyword=${boardPagingVO.searchKeyword}">${page}</a>
				</font>
			</c:forEach>
			<c:if test="${boardPagingVO.next}">
				<font size="3" style="font-weight: bold;">
					<a href="FreeBoard_List.do?page=${boardPagingVO.pageBlock * boardPagingVO.displayPageNum + 1}
							&searchType=${boardPagingVO.searchType}
							&searchKeyword=${boardPagingVO.searchKeyword}">다음</a>
				</font>
			</c:if>
			<c:if test="${boardPagingVO.pageNum < boardPagingVO.lastPage}">
				<font size="3" style="font-weight: bold;">
					<a href="FreeBoard_List.do?page=${boardPagingVO.lastPage}
							&searchType=${boardPagingVO.searchType}
							&searchKeyword=${boardPagingVO.searchKeyword}">마지막</a>
				</font>
			</c:if>
			
			<!-- 검색부 -->
			<br>
			<form action="FreeBoard_List.do">
				<select name="searchType">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
			</form>

		</div>
		<div id="footer">
			<h2>footer</h2>
		</div>
	</div>
	
</body>
</html>