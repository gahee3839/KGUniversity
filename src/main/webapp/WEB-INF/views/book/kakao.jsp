<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value ="${pageContext.request.contextPath}"/>
<%@ page session="false" %> 
<%
	String user_id = (String) request.getParameter("user_id");
	int book_num = (int) Integer.parseInt(request.getParameter("book_num"));
	String book_picture = (String) request.getParameter("book_picture");
	String book_name = (String) request.getParameter("book_name");
	int book_inventory = (int) Integer.parseInt(request.getParameter("book_inventory"));
	int book_amount = (int) Integer.parseInt(request.getParameter("book_amount"));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세내용</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<% out.println(user_id);
	out.println(book_num);
	out.println(book_picture);
	out.println(book_name);
	out.println(book_inventory);
	out.println(book_amount);
%>
<%-- <script>
$("#pgForm").click(function () {
var IMP = window.IMP; // 생략가능
IMP.init('imp99338921');
IMP.request_pay({
	pg: 'kakao', // version 1.1.0부터 지원.
	pay_method: 'card',
	merchant_uid: 'merchant_' + new Date().getTime(),
	name: '주문 결제 테스트',
	amount: 1,
	buyer_email: 'iamport@siot.do',
	buyer_name: <%=user_id%>,
	buyer_tel: '010-1234-5678',
	buyer_addr: '서울특별시 강남구 삼성동',
	buyer_postcode: '123-456'
	}, function (rsp) {
		if (rsp.success) {
	var msg = '결제가 완료되었습니다.';
	msg += '고유ID : ' + rsp.imp_uid;
	msg += '상점 거래ID : ' + rsp.merchant_uid;
	msg += '결제 금액 : ' + rsp.paid_amount;
	msg += '카드 승인번호 : ' + rsp.apply_num;
	} else {
	var msg = '결제에 실패하였습니다.';
	msg += '에러내용 : ' + rsp.error_msg;
	}
	alert(msg);
});
}); --%>
</script>

</body>
</html>