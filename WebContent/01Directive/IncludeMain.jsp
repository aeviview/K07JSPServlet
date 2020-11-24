<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	include지시어 : 공통으로 사용할 jsp파일을 생성한 후 현재문서에 포함시킬 때 사용한다. 
	각각의 jsp파일 상단에는 반드시 page지시어가 삽입되어야 한다.
	단, 하나의 jsp파일에서는 page지시어가 중복선언되면 안된다.
--%>
<%@ include file = "IncludePage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeMain.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- CSS코드는 양이 많으므로 외부파일로 선언하여 현재 문서에 링크시킨다 -->
<link rel="stylesheet" href="./css/div_layout.css" />
</head>
<body>
<div class="AllWrap">
	<div class="header">
		<!-- GNB(Global Navigation Bar)영역 -->
		<%@ include file="../common/Top.jsp" %>
	</div>
	<div class="body">
		<div class="left_menu">
			<!-- LNB영역(Local Navigation Bar) -->
			<%@ include file = "../common/Left.jsp" %>
		</div>
		<div class="contents">
			<!-- Contents 영역 -->
			<%--
			해당변수는 외부파일에 선언하여 본 문서에 include처리되었다.
			include는 문서자체를 포함시키는 개념이므로 에러가 발생하지 않는다.
			 --%>
			
			<h2>오늘의 날짜 : <%=todayStr %></h2>
			<br /><br />
			하메스 로드리게스(29)가 법적조치를 고려하고 있다. 

			에버튼 FC 소속인 하메스는 지난 18일 콜롬비아 국가대표로 에콰도르 국가대표팀과 맞붙었다. 
			
			해당 경기에서 콜롬비아는 에콰도르에 1-6으로 완패했다. 
			
			경기 후 하메스가 격노했으며 대표팀 동료들과 신체적 마찰을 빚었다는 루머들이 보도됐다. 

			하메스가 20일 이를 일축했다. 같은나 하메스 공식 SNS에 따르면 그는 
			
			"나는 매 경기 결과와 관계없이 동료들은 존중했으며, 현재도 동료들과의 관계가 좋다.
			
			거짓된 이야기를 쏟아내는 곳들은 내 이름에 악영향을 끼치며 혼란을 만든다. 
			
			이에 필요하다면 법적 조치도 취할 수 있다"라고 경고했다. 

			더불어 하메스는 "나는 앞으로도 혼란을 원하지 않으며 동료들과 함께 
			
			더 열심히 준비하고 경기할 것이다"라고 덧붙였다. 
<br /><br />
			
		</div>
	</div>
	<div class="copyright">
	<!-- Copyright -->
		<%@ include file="../common/Copyright.jsp" %>
	</div>
</div>
</body>
</html>