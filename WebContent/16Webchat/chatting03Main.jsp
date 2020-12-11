<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatting03Main.jsp</title>

</head>
<body>
	<script>
	function chatWin03()
	{
		//아이디 입력창에 입력된 내용을 가져오기 위해 DOM객체를 이용한다.
		//아이디 입력창에 입력한 아이디로 채팅을 시작한다^^
		var id = document.getElementById("chat_id");
		if(id.value=="")
		{
			alert("닉네임을 입력후 채팅창을 열어주세요");
			id.focus();
			return; 
		}
		/*
			open() 메소드의 두번째 속성은 창의 이름을 부여하는 속성으로
			만약 이름을 부여하게 되면 항상 같은 창에서 열리게 된다.
			따라서 여기서는 창의 이름을 부여하면 안된다!
		*/
		window.open("chatting03.jsp?chat_id="+id.value, 
				"",
				"width=500,height=700");
		id.value="";
	}
	</script>
	<h2>웹소켓03 - 아이디 적용해서 채팅창 띄워주기</h2>
	아이디 : <input type="text" id="chat_id" />
	<button type="button" onclick="chatWin03();">채팅창열기</button>
	
</body>
</html>