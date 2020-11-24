<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieMain.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>쿠키(Cookie)</h2>
	<!-- 우리가 팝업 광고처럼 24시간 동안 보지 않겠습니까? 이런거 나오는 것들이 쿠키이다 -->
	<h3>쿠키 설정</h3>
	
	<%
	/*
		1.쿠키객체생성 : new Cookie(쿠키명, 쿠키값)
			- 쿠키명을 설정하는 setName() 함수가 별도로 존재하지 않으므로
			생성자를 통해 쿠키명을 설정한다.
	*/
	Cookie cookie = new Cookie("UserID", "KOSMO");
	
	/*
		2.쿠키의 적용경로 설정 : 쿠키 설정시 쿠키가 적용될 경로를 설정한다.
			아래의 설정은 컨택스트루트 경로를 사용하므로
			웹어플리케이션 전체에서 사용가능한 쿠키를 생성하게 된다.
	*/
	System.out.println("request.getContextPath()" + request.getContextPath());
	
	cookie.setPath(request.getContextPath());
	
	/*
		3.쿠키의 유효시간 설정(초단위)
			- 유효시간을 설정하지 않을 경우 웹브라우저를 닫을 때 자동으로 삭제된다.
			그 외에는 설정한 시간만큼 유지된다.
	*/
	cookie.setMaxAge(3600);
	
	/*
		4.응답헤더에 쿠키를 추가하여 클라이언트로 전송한다.
		이 때, 클라이언트 측 PC에 쿠키가 생성된다.
	*/
	response.addCookie(cookie);
	%>
	
	<!-- 
		쿠키는 첫 실행시에는 출력되지 않는다.
		이유는 클라이언트 측에서 응답헤더를 통해 전송되어 생성되고,
		그 후에 서버측으로 요청헤더를 통해서 다시 전송하여야 확인이 가능하기 때문이다.
		즉, 새로고침하고나 다른페이지에서 새로운 요청이 있을 때
		서버는 쿠키를 확인할 수 있게 된다.
	 -->
	<h2>쿠키를 설정하는 현재페이지에서 쿠키값 확인하기</h2>
	<%
	//request객체를 통해 쿠키값을 얻어온다. 여러개의 값이므로 배열로 반환한다!
	Cookie[] cookies = request.getCookies();
	
	if(cookies!=null)
	{
		for(Cookie c : cookies)
		{
			String cookieName = c.getName(); //쿠키의 이름 반환
			String cookieValue = c.getValue(); //쿠키의 값 반환
			
			out.println(String.format("%s : %s<br/>", cookieName, cookieValue));
		}
	}
	%>
	
	<h2>페이지 이동 후 쿠키값 확인하기</h2>
	<a href="CookieResult.jsp">쿠키값 다음페이지에서 확인하기</a>
	
</body>
</html>