<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>
    <form name="swrite" method="post" action="SangpumInsert" enctype="multipart/form-data">
       	<div><select name="sb">
		<option value="팝니다">팝니다</option>
		<option value="삽니다">삽니다</option>
		</select></div>
        <div>제목<input name="title" id="title" size="80" placeholder="글 제목 입력"></div>
        <div>내용<textarea name="content" id="content" rows="8" cols="80" placeholder="글 내용 입력"></textarea></div>
        <div>이름<input name="id" id="id" placeholder="이름 입력"></div>
        <div style="width:650px; text-align:center;">
        
        <div class ="inputArea">
        <label for="gdsImg">이미지</label>
        <input type="file" id="gdsImg" name="file"/>
        <div class="select_img"><img src=""/>
              <script>
  $("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
        </div>
        

</div>
        
        </div>
            <input type="submit" value="확인">
        </div>
    </form>



</body>
</html>