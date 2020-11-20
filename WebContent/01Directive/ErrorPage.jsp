<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%--
	isErrorPage 지시어
	: 현재JSP페이지가 에러처리를 담당하는지 구분하는 속성으로 false가 디폴트 값이다.
	에러처리를 위해서는 true로 설정해야한다.
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorPage.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>에러발생됨 : 관리자에게 문의하세요</h2>
	<h3>연락처 : 010-1234-5678</h3>
	<h3>서버 업그레이드 중입니다.</h3>
	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUH7I9oQVvClppfAXm39BVuO6wJEp3-hqyUA&usqp=CAU" width="300" alt="" />
	<h3>
		에러내용 : <%=exception.getMessage() %>
	</h3>
</body>
</html>