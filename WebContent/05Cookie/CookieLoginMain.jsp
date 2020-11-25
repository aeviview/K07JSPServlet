<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//들어오자마자 쿠키를 확인해야한다(있는지, 없는지)
	//request 내장객체를 이용해서 생성된 쿠키를 가져온다!
	Cookie[] cookies = request.getCookies(); //전체를 가져오기 때문에 Cookies s가 있음
	String id = "", save = ""; //쿠키값을 저장할 변수
	
	if(cookies!=null) //쿠키값이 있는 경우!
	{
		for(Cookie ck : cookies)
		{
			if(ck.getName().equals("LoginId")) //로그인 아이디가 있는지 확인!
			{
				id = ck.getValue();
				System.out.println("id="+id);
			}
			else if(ck.getName().equals("SaveId")) //아이디 저장값이 있는지 확인!
			{
				save = ck.getValue();
				System.out.println("save="+save);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieLoginMain.jsp</title>
<!-- 아이디 저장하기 / 자동로그인 등도 쿠키로 실행하는 것이다 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	
	<h2>쿠키를 이용한 로그인 & 아이디 저장하기</h2>
<%
/*
	id에 저장된 값이 없다면 로그아웃 상태이므로
	로그인폼을 화면에 출력한다
*/
if(id.length()==0)
{
%>
	<!-- 로그인 실패시 리퀘스트 영역에 저장된 속성값을 출력한다 -->
	<span style="color:red; font-size:1.5em;">
		로그인 메시지 :
		<%=request.getAttribute("ERROR_MSG")==null ?
				"" : request.getAttribute("ERROR_MSG") %>
	</span>
	
	<!-- 
		input태그의 하위속성 [tabindex]
			- Tab키를 통해 포커스를 이동하는데
			작성된 순서가 아닌 임의의 순서를 부여하고 싶을 때 사용한다!
	 -->
	<form action="CookieLoginProc.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>
				<!-- 쿠키에 저장된 로그인 아이디가 있다면 value속성에 삽입한다 -->
				<!-- save 값이 존재한다면(0이 아니라면) checked 속성 활성화 -->
				<!-- 스크립트릿 <% %> 은 어디서나 사용가능 -->
				<input type="text" name="user_id" tabindex="1"
				value="<%=(save.length()==0) ? "" : save %>" />
				<input type="checkbox" name="id_save" value="Y" tabindex="3" 
					<% if(save.length()!=0){ %> 
						checked="checked"
					<% } %> /> 아이디저장하기
			</td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td>
				<input type="text" name="user_pw" tabindex="2" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인하기" tabindex="4" />
			</td>
		</tr>
	</table>
	</form>
	
<%
} 
else //로그인 상태라면 회원정보와 로그아웃 버튼을 출력한다
{
%>
	<table border=1 width=400>
		<tr>
			<td align="center">
				<%=id %>님, 로그인하셨습니다.
				<br />
				좋은 하루 되세요^^
				<br />
				<input type="button" value="로그아웃"
					onclick="location.href='CookieLogoutProc.jsp';" />
			</td>
		</tr>
	</table>
<%
}
%>

</body>
</html>