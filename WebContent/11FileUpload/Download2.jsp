<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%-- 파일명 : Download2.jsp --%>

<%-- 이 곳은 다운로드 활성화를 위한 코드이다 --%>
<%-- 복붙하는 곳이기 때문에 굳이 이해할 필요는 없다! --%>
<%-- 물리적경로 얻어오기랑 파일명 지정만 보자! --%>

<%
//한글처리
request.setCharacterEncoding("UTF-8");

//파일이 업로드된 디렉토리의 물리적 경로 얻어오기!
String root = request.getSession().getServletContext().getRealPath("/");
String savePath = root + "Upload"; //중요 : 이거를 바꿔야함

//파일명지정(서버에 저장된 파일명, 다운로드할 원본 파일명)
String filename = request.getParameter("sName");  //중요 : 이거를 바꿔야함
String orgfilename = request.getParameter("oName");  //중요 : 이거를 바꿔야함

//입출력 스트림 및 파일객체 생성
InputStream in = null;
OutputStream os = null;
File file = null;
boolean skip = false;
String client = "";

try
{
	//물리적경로 및 파일객체를 통해 파일을 읽어와서 스트림에 저장
	try
	{
		file = new File(savePath, filename);
		in = new FileInputStream(file);
	}
	catch(FileNotFoundException fe)
	{
		skip = true;
	}
	//사용자의 웹브라우저 정보를 반환
	client = request.getHeader("User-Agent");
	
	/*
		파일다운로드를 위한 응답헤더 설정
			- 웹브라우저가 인식하지 못하는 컨텐츠타입(MIME)을 응답헤더에
				설정하면 다운로드 창을 보여주게 된다.
				(웹브라우저에 따라 다운로드창의 형태는 달라진다)
	*/
	response.reset() ;
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Description", "JSP Generated Data");

	if(!skip)
	{
		
		if(client.indexOf("MSIE") != -1)
		{
			//웹브라우저가 인터넷 익스플로러 일 때 한글 파일명 처리!
			response.setHeader ("Content-Disposition", "attachment; filename="+new String(orgfilename.getBytes("KSC5601"),"ISO8859_1"));
		}
		else
		{
			//웹브라우저가 인터넷 익스플로러가 아닐 때 한글 파일명 처리!
			//다운로드시 원본파일명으로 변경할 때 이 부분을 변경한다.
			orgfilename = new String(orgfilename.getBytes("utf-8"),"iso-8859-1");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
			response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
		} 
		 
		response.setHeader ("Content-Length", ""+file.length() );
		
		//웹브라우저에 연결한 출력스트림 생성
		os = response.getOutputStream();
		byte b[] = new byte[(int)file.length()];
		int leng = 0;
		
		/*
			input스트림으로 파일내용을 읽어와서 output스트림으로 웹브라우저에 출력한다.
			이 때 웹브라우저는 해당 파일의 MIME타입을 인식하지 못하므로
			다운로드창을 통해 파일을 다운로드 시키게 된다!
		*/
		while( (leng = in.read(b)) > 0 )
		{
			os.write(b,0,leng);
		}
	}
	else
	{
		response.setContentType("text/html;charset=UTF-8");
		out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
	}

	in.close();
	os.close();
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
