<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%!
	public int getBaesu(int start, int end, int baesu)
	{
		int sum = 0;
		
		for(int i=start ; i<=end ; i++)
		{	
			if(i%baesu==0)
			{
				sum += i;
			}
		}
		return sum;
	}
	%>
	
	<%
	int Result = getBaesu(1, 100, 5);
	out.println("1~100사이의 5의배수의 합 : "+ Result);
	%>
	
	
	
	
	
</body>
</html>