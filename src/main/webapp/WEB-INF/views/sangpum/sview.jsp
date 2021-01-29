<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/litera/bootstrap.min.css" integrity="sha384-enpDwFISL6M3ZGZ50Tjo8m65q06uLVnyvkFO3rsoW0UC15ATBFz3QEhr3hmxpYsn" crossorigin="anonymous">
<meta charset="UTF-8">

<script>
function del(bno){
	var chk = confirm("정말 삭제하시겠습니까?");
	if(chk){
		location.href='delete?bno='+bno;
	}
}
</script>


<!-- 댓글 목록 가져옴 -->
<script> 
function commList(){
var bno = ${Detail.bno};
$.getJSON("commList" + "?bno=" + bno, function(data){
 var str = "";
 
 $(data).each(function(){
  
  console.log(data);
  
  var cdate = new Date(this.cdate);
  cdate = cdate.toLocaleDateString("ko-US")
  
  str += "<li data-bno='" + this.bno + "'>"
    + "<div class='userInfo'>"
    + "<span class='userName'>" + this.cid + "</span>"
    + "<span class='date'>" + cdate + "</span>"
    + "</div>"
    + "<div class='replyContent'>" + this.ctext + "</div>"
    + "</li>";           
 });
 
 $("section.commList ol").html(str);
});

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
<jsp:include page="../include/header.jsp" />
	<br>
	<br>

<h2>게시판</h2>
<div id="outter">
	<table class="table table-hover">
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
	<input type="button" value="글 목록" class="btn btn-primary" style="float: right;" onclick="location.href='boardList';"> 
	<input type="button" value="삭제" class="btn btn-primary" onclick="del(${Detail.bno})">
	</div>

</div>
<br>
<br>
	
	<div id="outter">

			<form role="form" method="post" autocomplete="off">
				<input type="hidden" id="bno" value="${Detail.bno }"> <!-- 게시글번호 컨트롤러 전달용/숨겨진폼 -->
				<input type="hidden" id="cid" value="임시아이디"> <!-- 에러 방지용 임시아이디/삭제예정 -->
				<div class="input_area">
					<textarea name="ctext" id ="ctext" class="form-control" style="width:1000px;height:50px;"></textarea>
					<button type="button" id="CommBtn" class="btn btn-primary" style="float: right;">댓글 등록</button>
	

					<!-- 댓글 등록 -->
					<script>
 $("#CommBtn").click(function(){

  var bno = $("#bno").val();
  var cid = $("#cid").val();
  var ctext = $("#ctext").val();
  
  var data = {
    bno : bno,
    ctext : ctext,
    cid : cid
    };
  
  
  $.ajax({
   url : "commInsert",
   type : "post",
   data : data,
   success : function(){
    commList();
   }
  });
 });
</script>
								</div>
				
			</form>
		<section class="commList">
		<ol>
		</ol>
		<script>
		commList();
		</script>
	

		</section>
	</div>
	
	

</body>
</html>