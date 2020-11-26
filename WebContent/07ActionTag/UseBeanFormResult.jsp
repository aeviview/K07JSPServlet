<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
//폼값받기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");

MemberDTO member1 = new MemberDTO(); //DTO객체 생성 = Bean생성
//setter() 세터 메소드를 통해 값 설정!
member1.setId(id);
member1.setPass(pass);
member1.setName(name);
%> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanFormResult.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

	<h2>useBean 액션태그로 폼의 하위요소 값 받기</h2>
	
	<h3>자바코드를 통해 받기</h3>
	
	<ul>
		<li><%=member1.getId() %></li>
		<li><%=member1.getPass() %></li>
		<li><%=member1.getName() %></li>
	</ul>

	<!-- 
		useBean을 통해 객체생성시 scope=" " 이와 같은
		scope속성을 지정하지 않으면 가장 좁은 page영역에 저장된다.
		자바빈을 생성한 후 전송된 폼값을 한 번에 설정한다.
		폼의 name속성과 1:1로 매칭되는 DTO의 멤버변수들이 있기 때문에 이런게 가능하다!
	 -->
	<h3>액션태그로 폼값 받기</h3>
	
	<jsp:useBean id="actionMember" class="model.MemberDTO" />
	<jsp:setProperty property="*" name="actionMember" />
	<ul>
		<li><%=actionMember.getId() %></li>
		<li><%=actionMember.getPass() %></li>
		<li><%=actionMember.getName() %></li>
		<%-- <li><%=actionMember.getAge1() %></li> useBeanForm.jsp 참고 --%>
	</ul>

</body>
</html>