<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	//선언부 선언
	
	public int getBaesu(int start, int end, int baesu) //getBaesu 함수를 선언한다
	{
		int sum = 0; //sum은 0으로 초기화한다
	
		for(int i=start ; i<=end ; i++) //start에서 end까지 반복한다, i는 int형
		{
			if(i%baesu==0) //i를 baesu로 나눠서 떨어질 때만 sum값에 i를 더한다!
			{
				sum += i;
			}
		}
		
		return sum;
	}
%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MethodDefine.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>선언부에서 메소드 정의</h2>
	<h3>스크립트렛에서 결과값 출력</h3>
	<%
	/*
	연습문제] 1부터 100사이의 숫자중 3의배수의 합을 반환하는 함수를 선언 후
			결과를 출력하시오.
			함수명 : getBaesu()
	*/
	
	int hapResult = getBaesu(1, 100, 3); //매개변수가 3개임 , 선언부에서 만들자!
	
	
	out.println("1~100 사이의 3의배수의 합 : "+ hapResult);
	%>
	
	<h3>표현식에서 결과값 출력</h3>
	
	1~200사이의 숫자 중 5의 배수의 합은?
		<%=getBaesu(1,200,5) %>
		
</body>
</html>