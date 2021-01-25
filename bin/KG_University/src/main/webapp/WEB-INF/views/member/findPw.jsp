<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<hr>
	<label>아이디</label>
	<input type="text" id="userId" name="userId" required />
	<label>이메일</label>
	<input type="text" id="email" name="email" required />
	<input type="button" id="findPwBtn" value="비밀번호찾기">
	<div id="findResult"></div>
	<br>
	<a href="/www/member/login.do"><input type="button"value="로그인"></a>
	<a href="/www/member/join.do"><input type="button"value="회원가입"></a>
	
	<a href="/www/member/find1.do"><input type="button"value="아이디찾기"></a>
	
	<script type="text/javascript">
	$('#findPwBtn').click(function(){
		var userId = $("#userId").val();
		var email = $("#email").val();
		
		$.ajax({
			type: 'POST',
			url: '/www/member/findPw.do',
			data:{
				userId: userId,
				email: email
			},
			success: function(result) {
				if(result==-1){
					$('#findResult').text('회원정보가 존재하지 않습니다.\n 회원가입을 진행해 주세요');
					$('#findResult').css('color','red');
				}
				if(result==1){
						$('#findResult').text('임시비밀번호를 이메일로 전송했습니다. 이메일을 확인해주세요');
						$('#findResult').css('color','blue');	
				}
				if(result==0){
						$('#findResult').text('아이디가 틀렸습니다.\n 아이디를 확인해주세요');
						$('#findResult').css('color','red');
				}
			}
			
		})
	})
	</script>
</body>
</html>