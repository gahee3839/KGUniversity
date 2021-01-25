<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script>
	function validate() {
		var userId = document.loginForm.userId;
		var userPw = document.loginForm.userPw;
		if (userId.value == '') {
			alert('아이디를 입력하세요');
			userId.focus();
			return false;
		}
		if (userPw.value == '') {
			alert('비밀번호를 입력하세요');
			userPw.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h1>로그인</h1>
	<hr>
	<form name="loginForm" action="/www/member/loginChk.do" method="post" onsubmit="return validate()">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" id="userId" name="userId" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="userPw" name="userPw" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit"id="btnLogin" value="로그인"/> 
					<input type="reset" value="취소" /></td>
			</tr>
		</table>
		아직 회원이 아니신가요?<a href="/www/member/join.do">회원가입</a><br>
		<a href="/www/member/find1.do">아이디찾기</a>/<a href="/www/member/find2.do">비밀번호찾기</a>
	</form>
	<c:if test="${msg=='failure'}">
		<script>
			alert("아이디 또는 비밀번호가 일치하지 않습니다")
		</script>
	</c:if>
	<c:if test="${msg=='verify failure'}">
		<script>
			alert("이메일 인증이 완료되지 않은 계정입니다.\n이메일 인증 완료 후 로그인해주세요.")
		</script>
	</c:if>
</body>
</html>