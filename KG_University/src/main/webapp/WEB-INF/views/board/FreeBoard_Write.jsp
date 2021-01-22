<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KG_University</title>

<style>
	textarea {
		width: 100%;
		height: 400px;
		resize: none;
	}
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
	<script>
		function return_List(){
			if(confirm("정말로 나가시겠습니까?\n작성중이던 내용은 삭제됩니다")){
				location.href="FreeBoard_List.do"
			}
		}
	</script>

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
						<input type="button" value="목록" onclick="return_List();"
								style="font-size: 18px;
										font-weight:bold;
										padding: 5px 10px;
										border-radius: 5px;
										background-color: aqua;">
					</td>
				</tr>
			</table>	
			<hr width="90%" style="border-style: solid; border-color: blue;"><br>
			
		<!-- 등록임시 -->
			<form action="FreeBoard_Upload.do" method="post" enctype="multipart/form-data">
			<table border="0" width="90%">
				<tr>
					<td colspan="2" style="text-align: left;">
						<input type="password" name="contentPW" placeholder="비밀번호">
					</td>
				</tr>
				<tr>
					<td width="65" height="45" style="text-align: left; font-weight: bold;">
						<font size="5">분류</font>
					</td>
					<td style="text-align: left;">
						<select name="contentType">
							<option value="standard">일반</option>
							<option value="university">대학</option>
							<option value="daily">일상</option>
							<option value="discuss">토론</option>
						</select>
					</td>
				</tr>
				<tr>
					<td height="45" style="text-align: left; font-weight: bold;">
						<font size="5">제목</font>
					</td>
					<td style="text-align: left;">
						<input type="text" name="contentTitle" placeholder="제목을 입력해 주세요">
					</td>
				</tr>
				<tr>
					<td colspan="2" height="45" style="text-align: left;">
						<input type="file" name="file"><br>
					</td>
				</tr>
				<tr>
					<td colspan="2" height="420" style="text-align: left; margin-top: 40px;">
						<textarea placeholder="내용을 입력해 주세요"></textarea>
					</td>
				</tr>
			</table>
			<br><hr width="90%" style="border-style: solid; border-color: blue;">
			<input type="submit" value="작성완료">
			<input type="button" value="취소" onclick="return_List();">
			</form>
		<!-- 등록임시 -->
			
		</div>
		<div id="footer">
			<h2>footer</h2>
		</div>
	</div>
	
</body>
</html>