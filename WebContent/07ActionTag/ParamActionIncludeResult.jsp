<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamActionIncludeResult.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>나는 인클루드 된 페이지다</h2>
	
	<!-- 
		ParamAction.jsp에서 <param 액션태그로 전달된 값 2개와
		브라우저 URL창에 "query=값" 형태로 입력한 값 1개가 아래에 출력된다.
	 -->
	<h3>param 액션태그로 전달된 값 출력하기</h3>
	
	<ol>
		<li>queryString : <%=request.getParameter("query") %></li>
		<li>name : <%=request.getParameter("name") %></li>
		<li>id : <%=request.getParameter("id") %></li>
	</ol>
	
	<!-- 
		MemberDTO객체에 오버라이딩한 toString()메소드가 있다면 해당내용이 출력된다
		오버라이딩하지 않으면 객체의 주소값(참조값)이 출력된다.
		"MemberDTO.java" 참고
	 -->
	<h3>영역에 저장되어 전달된 객체</h3>
	<%=request.getAttribute("member") %>
</body>
</html>