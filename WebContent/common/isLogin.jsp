<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 파일명 : isLogin.jsp --%>

<!-- 
	로그인 확인을 수시로 해야하기 때문에 isLogin 파일을 따로 만들었다.
	나중에 include를 통해서 불러오면 된다^^
 -->
<%
/*
	해당 페이지처럼 JSP코드를 포함한 파일을 include 할 때는 지시어를 통해 기술하자.
	액션태그를 사용하는 경우 먼저 컴파일 된 후 페이지에 삽입되므로 문제가 될 수 있다!
*/
//글쓰기 페이지 진입 전 로그인 되었는지 확인
//(로그인이 되어야만 글을 쓸 수 있기 때문에)
if(session.getAttribute("USER_ID")==null)
{
%>
	<script>
		alert("로그인 후 이용해주세요");
		location.href = "../06Session/Login.jsp";
		//만약 로그인되지 않으면 로그인 페이지로 이동시킨다.
	</script>
<%
	return;
	/*
		JS코드보다 JSP코드가 우선순위가 높으므로
		만약 if문 뒤에 JSP코드가 존재하면 위의 JS코드가 실행되지 않는다.
		그러므로 if문을 벗어나지 못하도록 return을 걸어줘야 한다!
	*/
}
%>