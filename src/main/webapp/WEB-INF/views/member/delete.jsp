<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<h2>회원탈퇴</h2>
	<br>
	<form action="/www/member/deleteUser.do" method="post">
			<p>
				사용하고 계신 아이디<font color="red">${sessionScope.userId}</font>를 탈퇴하시겠습니까?<br>
				회원탈퇴시 해당 계정의 개인정보는 모두 삭제처리되며, 탈퇴후에는 복구가 불가능합니다.<br>
			</p>
			<br>
				<input type="hidden" id="userId" name="userId" value="${sessionScope.userId}">
				<label>비밀번호:</label> <input type="password" id="userPw" name="userPw" required>
				<div id="pwChkMsg"></div>
				<input type="submit" value="회원탈퇴" id="deleteSubmit" onclick="return confirm('정말 탈퇴하시겠습니까?')" disabled>
				<a href="/www/member/mypage.do?userId=${sessionScope.userId}"><input type="button" value="취소" ></a>
	</form> 
				
<script type="text/javascript">
//비밀번호 확인 
	$('#userPw').blur(function(){
		var userId = $("#userId").val();
		var inputPw = $("#userPw").val();
		$.ajax({
			type:"POST",
			url:"/www/member/pwChk.do",
			data:{
				userId: userId,
				inputPw: inputPw
			},
			success: function(result) {
				if(result == true){
					$('#pwChkMsg').text('');
					$("#userPw").css('border','3px solid green');
					$('#deleteSubmit').attr("disabled",false);
				}else{
					$('#pwChkMsg').text('비밀번호가 일치하지 않습니다.');
					$("#userPw").css('border','3px solid red');
					$('#pwChkMsg').css('color','red');
					$('#deleteSubmit').attr("disabled",true);
				}
			}
		})
	})
</script>
</body>
</html>