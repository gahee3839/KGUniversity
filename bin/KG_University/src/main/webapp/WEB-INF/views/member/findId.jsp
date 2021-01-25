<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<h1>아이디찾기</h1>
	<hr>
	<label>이메일</label>
	<input type="text" id="email" name="email" required />
	<input type="button" id="findIdBtn" value="아이디찾기">
	<div id="findResult"></div>
	<br>
	<a href="/www/member/login.do"><input type="button"value="로그인"></a>
	<a href="/www/member/join.do"><input type="button"value="회원가입"></a>
	
	<a href="/www/member/find2.do"><input type="button"value="비밀번호찾기"></a>
	
	<script type="text/javascript">
	$('#findIdBtn').click(function(){
		var email = $("#email").val();
		
		$.ajax({
			type: 'POST',
			url: '/www/member/findId.do',
			data:{
				email: email
			},
			success: function(result) {
				if(result!=''){
					$('#findResult').text('아이디 찾기 성공! 아이디는 '+result+' 입니다.');
					$('#findResult').css('color','blue');
				}else{
					$('#findResult').text('아이디를 찾을 수 없습니다.\n회원가입을 진행해 주세요');
					$('#findResult').css('color','red');
				}
			}
		})
	})
	</script>
</body>
</html>