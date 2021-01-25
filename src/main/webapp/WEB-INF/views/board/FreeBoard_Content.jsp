<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 - ${fbContent.content}</title>

<style type="text/css">
	textarea {
		width: 100%;
		height: 120px;
		resize: none;
	}
</style>
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
						<input type="button" value="목록" onclick="location.href='FreeBoard_List.do'"
								style="font-size: 18px;
										font-weight:bold;
										padding: 5px 10px;
										border-radius: 5px;
										background-color: aqua;">
					</td>
					<td width="90" style="text-align: right;">
						<input type="button" value="글쓰기" onclick="location.href='FreeBoard_Write.do'"
								style="font-size: 18px;
										font-weight:bold;
										padding: 5px 10px;
										border-radius: 5px;
										background-color: aqua;">
					</td>
					<td width="90" style="text-align: right;">
						<input type="button" value="글삭제" onclick="content_Delete();"
								style="font-size: 18px;
										font-weight:bold;
										padding: 5px 10px;
										border-radius: 5px;
										background-color: aqua;">
						<script>
							function content_Delete(){
								if(confirm("정말로 삭제하시겠습니까?")){
									location.href="FreeBoard_Delete.do?cNum="+${fbContent.FBN_seq}
								}
							}
						</script>
					</td>
				</tr>
			</table>		
			<hr width="90%">
			
			<table border="0" width="90%">
				<tr>
					<td colspan="5" style="text-align: left;">
						<font size="4" style="font-weight: bold;">[${fbContent.type}] ${fbContent.title}</font>
					</td>
				</tr>
				<tr style="text-align: left;">
					<td><font style="font-weight: bold;">글번호</font> ${fbContent.FBN_seq}</td>
					<td width="200"><font style="font-weight: bold;">일자</font> ${fbContent.regDate}</td>
					<td width="80"><font style="font-weight: bold;">조회수</font> ${fbContent.hit}</td>
					<td width="150"><font style="font-weight: bold;">글쓴이</font> ${fbContent.writer}</td>
					<td width="80" style="text-align: right;"><font style="font-weight: bold;">댓글</font> ${fbContent.commentCnt}개</td>
				</tr>
			</table>
			<hr width="90%">
			
			<br><br>
			<div style="width: 90%;;
						text-align: left;
						padding-left: 5%;">
				글내용 : ${fbContent.content}
			</div>
			<br><br>
		<!-- <hr width="90%"> -->
			
			<table width="90%">
				<tr><td style="text-align: left; font-weight: bold;">댓글 ${fbContent.commentCnt}개</td></tr>
			</table>
			<hr width="90%" style="border-bottom-style: solid; border-color: blue;">
			
			<table border="0" width="90%">
				<thead>
					<tr>
						<th width="150" style="text-align: left;">닉네임</th>
						<th>댓글</th>
						<th width="200" style="text-align: right;">등록일</th>
					</tr>
				</thead>
			</table>
			<hr width="90%"><br>
			<table border="0" width="90%">
				<c:forEach var="fbComment" items="${fbComment}" begin="${(boardCommentPagingVO.pageNum-1)*boardCommentPagingVO.perPageCnt}"
																end="${boardCommentPagingVO.pageNum*boardCommentPagingVO.perPageCnt-1}">
					<tr>
						<td width="150" height="30" style="text-align: left;"><c:out value="${fbComment.nickname}" /></td>
						<td style="text-align: left;"><c:out value="${fbComment.fbComment}" /></td>
						<td width="200" style="text-align: right;"><c:out value="${fbComment.regDate}" /></td>
					</tr>
				</c:forEach>
			</table>
			<br>
			
			<!-- 댓글페이징부 -->
			<c:if test="${boardCommentPagingVO.pageNum ne 1}">
				<font size="3" style="font-weight: bold;">
					<a href="FreeBoard_Content.do?cPage=1&cNum=${fbContent.FBN_seq}">처음</a>
				</font>
			</c:if>
			<c:if test="${boardCommentPagingVO.prev}">
				<font size="3" style="font-weight: bold;">
					<a href="FreeBoard_Content.do?cPage=${(boardCommentPagingVO.pageBlock-2) * boardCommentPagingVO.displayPageNum + 1}&cNum=${fbContent.FBN_seq}">이전</a>
				</font>
			</c:if>
			<c:forEach var="cPage" begin="${boardCommentPagingVO.startPage}" end="${boardCommentPagingVO.endPage}">
				<font size="3" style="font-weight: bold;">
					<a href="FreeBoard_Content.do?cPage=${cPage}&cNum=${fbContent.FBN_seq}">${cPage}</a>
				</font>
			</c:forEach>
			<c:if test="${boardCommentPagingVO.next}">
				<font size="3" style="font-weight: bold;">
					<a href="FreeBoard_Content.do?cPage=${boardCommentPagingVO.pageBlock * boardCommentPagingVO.displayPageNum + 1}&cNum=${fbContent.FBN_seq}">다음</a>
				</font>
			</c:if>
			<c:if test="${boardCommentPagingVO.pageNum < boardCommentPagingVO.lastPage}">
				<font size="3" style="font-weight: bold;">
					<a href="FreeBoard_Content.do?cPage=${boardCommentPagingVO.lastPage}&cNum=${fbContent.FBN_seq}">마지막</a>
				</font>
			</c:if>
			<!-- 댓글페이징부-end -->
			
			<!-- 댓글등록 -->			
			<hr width="90%" style="border-bottom-style: solid; border-color: blue;">
			<!-- <form action="FreeBoard_Content.do"> -->
			<form action="FreeBoard_Content_CommentUpload.do">
			<!-- <input type="hidden" name="fbcFlag" value="true"> -->
			<input type="hidden" name="cPage" value="${boardCommentPagingVO.lastPage}">
			<input type="hidden" name="cNum" value="${fbContent.FBN_seq}">
			
			<table border="0" width="90%">
				<tr>
					<td style="text-align: left;">
						<input type="text" name="fbCommentPW" placeholder="비밀번호" style="font-size: 11pt;">
					</td>
				</tr>
				<tr>
					<td>
						<textarea name="fbComment" placeholder="댓글을 입력해주세요" style="font-size: 11pt;"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;">
						<input type="submit" value="댓글등록"
								style="font-size: 16px;
										font-weight:bold;
										padding: 5px 10px;
										border-radius: 5px;
										background-color: aqua;">
					</td>
				</tr>
			</table>
			</form>
			<hr width="90%" style="border-bottom-style: solid; border-color: blue;">
			<!-- 댓글등록-end -->
			
		</div>
		<div id="footer">
			<h2>footer</h2>
		</div>
	
	</div>
</body>
</html>