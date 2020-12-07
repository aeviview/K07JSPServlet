<%@page import="java.util.List"%>
<%@page import="model.MyFileDAO"%>
<%@page import="model.MyFileDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//업로드 폴더의 물리적 경로 가져오기
String saveDirectory = application.getRealPath("/Upload");
//경로를 기반으로 File객체 생성
File file = new File(saveDirectory);
//listFiles()를 통해 파일목록을 배열형태로 얻어온다!
File[] fileList = file.listFiles();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileList.jsp</title>

</head>
<body>
	<h2>업로드 된 파일 리스트 보기(디렉토리 읽어오기)</h2>
	<ul>
	<%
	int fileCnt = 1;
	//위에서 얻어온 파일목록을 기반으로 반복 출력
	for(File f : fileList)
	{
	%>
		<li>
			파일명 : <%=f.getName() %>
			&nbsp;&nbsp;
			파일크기 : <%=(int)Math.ceil(f.length()/1024.0) %>Kb
			&nbsp;&nbsp;
			<a href="Download1.jsp?fileName=<%=URLEncoder.encode(f.getName(),"UTF-8") %>">[다운로드1-1]</a>
		</li>
	<%
		fileCnt++;
	}
	%>
	</ul>
	
<!-- ---------------------------------------------------------------- -->
<!-- 파일업로드3 - 파일명을 DB처리 후 다운로드에서 -->
<!-- 기존 파일명이 숫자로 저장된걸 다시 다운받으면 원래 이름으로 나오게 하는 소스 -->	
	
	<h2>DB에 등록된 파일 리스트 보기</h2>
	
	<a href="FileUploadMain.jsp">파일등록하기</a>
	
	<%
	MyFileDTO dto = new MyFileDTO();
	MyFileDAO dao = new MyFileDAO(application);
	List<MyFileDTO> fileLists = dao.myFileList();
	//out.print(fileList.size());
	%>
	
	<table border="1">
	<%
		for(MyFileDTO f : fileLists)
		{
	%>		
		<tr>
			<td><%=f.getIdx() %></td> 
			<td><%=f.getName() %></td>
			<td><%=f.getTitle() %></td>
			<td><%=f.getInter() %></td>
			<td><%=f.getOfile() %></td>
			<td><%=f.getSfile() %></td>
			<td><%=f.getPostdate() %></td>
			<td><a href="Download2.jsp?oName=<%=URLEncoder.encode(f.getOfile(), "UTF-8")%>&sName=<%=URLEncoder.encode(f.getSfile(), "UTF-8")%>">[다운로드]</a></td>
		</tr>
	<%	
		}
	%>
	</table>


</body>
</html>