<%@page import="model.MemberDAO"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값 받기
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

//web.xml에 저장된 컨텍스트 초기화 파라미터 가져오기
String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

//DAO객체생성 및 DB연결 => ctrl+좌클릭해서 경로를 보고 알 수 있다~
MemberDAO dao = new MemberDAO(drv, url);


//방법3 : Map 컬렉션에 저장된 회원정보를 통해 세션영역에 저장한다
Map<String, String> memberMap = dao.getMemberMap(id, pw);

if(memberMap.get("id")!=null)
{
	//로그인 성공시 "세션영역"에 아래 속성을 저장한다
	//세션영역에 밑에 놈들이 있는걸 확인하는게 로그인 되어있는지 확인하는 방법이다!
	session.setAttribute("USER_ID", memberMap.get("id"));
	session.setAttribute("USER_PW", memberMap.get("pass"));
	session.setAttribute("USER_NAME", memberMap.get("name"));	
	//로그인 페이지로 이동한다
	response.sendRedirect("Login.jsp");
}
else
{
	//로그인 실패시 리퀘스트 영역에 속성을 저장 한 후 로그인 페이지로 포워드한다
	request.setAttribute("ERROR_MSG", "넌 회원이 아니시군 ㅡㅡ");
	request.getRequestDispatcher("Login.jsp").forward(request, response);
}
%>