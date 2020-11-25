<%@page import="util.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 파일명 : CookieLoginProc.jsp --%>

<%
//클라이언트가 전송한 폼값을 받아온다
String userid = request.getParameter("user_id");
String userpw = request.getParameter("user_pw");
String id_save = request.getParameter("id_save");
/*
	id_save는 checkbox라서 여러 항목이 존재할 수 있으므로 getParameterValues()를 통해
	배열로 받는 것이 기본이지만, 항목이 하나만 있기 때문에 getParameter로 받을 수 있다!
*/

//JDBC연동없이 회원정보가 아래와 같으면 로그인을 성공한다!
if("kosmo".equals(userid) && "1234".equals(userpw))
{
	//로그인 성공시 회원 아이디를 쿠키로 생성한다
	CookieUtil.makeCookie(request, response, "LoginId", "kosmo", 60*60*24);
	
	if(id_save==null) //아이디 저장하기 체크박스를 체크 해제하면
	{
		CookieUtil.makeCookie(request, response, "SaveId", "", 0); //쿠키삭제
	}
	else //아이디 저장하기 체크박스를 체크하면
	{
		CookieUtil.makeCookie(request, response, "saveId", "kosmo", 60*60*24); //쿠키생성
	}
	response.sendRedirect("CookieLoginMain.jsp");
}
else
{
	/*
		로그인 실패시에는 에러메세지를 리퀘스트 영역에 저장한 후
		메인페이지로 "포워드"(페이지전달)한다.
		포워드 된 페이지까지 리퀘스트 영역이 공유되므로 해당 메세지는 화면에 출력할 수 있다.
	*/
	request.setAttribute("ERROR_MSG", "회원이 아닙니다");
	request.getRequestDispatcher
			("CookieLoginMain.jsp").forward(request, response);
}
%>
