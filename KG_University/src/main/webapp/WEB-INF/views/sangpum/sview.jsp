<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<script>
function del(bno){
	var chk = confirm("정말 삭제하시겠습니까?");
	if(chk){
		location.href='delete?bno='+bno;
	}
}
</script>
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
	<table border="1">
<tr>
			<td>제목: ${Detail.title }</td>
		</tr>
		<tr>
			<td>
				작성자: ${Detail.id }</td>
				<tr>
				<td>
				<span style="float: left;"><fmt:formatDate value="${Detail.wrdate }" pattern="yyyy.MM.dd"/></span>
			</td>
		</tr>
	
		<tr>
		<td>
		<div class="inputArea">
 	<img src="${Detail.IMGNAME}" class="oriImg"/>
 	</div>
 	</td>
		</tr>

		
		<tr>
			<td><div style="height: 300px; margin: 10px; display: inline-block">${Detail.content }</div></td>
		</tr>
	</table>
	<div>
	<input type="button" value="삭제" onclick="del(${Detail.bno})">
	<input type="button" value="글 목록" style="float: right;" onclick="location.href='boardList';"> 
	</div>

</div>
	
	
	

</body>
</html>