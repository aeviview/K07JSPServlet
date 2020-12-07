package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;

public class MyFileDAO 
{
	//멤버변수(전역) 선언
		Connection con; //커넥션 객체를 멤버변수로 설정하여 공유
		PreparedStatement psmt;
		ResultSet rs;
		
	
		//DB 커넥션 방법 변경
	/*
		인자생성자2 : JSP에서는 application내장객체를 파라미터로 전달하고
		 		생성자에서 web.xml을 직접 접근한다.
		 		application 내장객체는
		 		javax.servlet.ServletContext타입으로 정의되었으므로
		 		매개변수를 이와 같이 정의해준다!
	*/
	public MyFileDAO(ServletContext ctx) //생성자 만들기!
	{
		try
		{
			Class.forName(ctx.getInitParameter("JDBCDriver"));
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection
					(ctx.getInitParameter("ConnectionURL"), id, pw);
			System.out.println("DB 연결성공^^");
		}
		catch(Exception e)
		{
			System.out.println("DB 연결실패ㅠㅠ");
			e.printStackTrace();
		}
	}
	
	//입력처리를 하는 메소드
	public int myfileInsert(MyFileDTO dto)
	{
		int affected = 0;
		try
		{
			String query = "INSERT INTO myfile ( "
					+ " idx, name, title, inter, ofile, sfile) "
					+ " VALUES ( "
					+ "SEQ_BBS_NUM.nextval, ?, ?, ?, ?, ?)";
					//시퀀스는 별도로 만든게 아니고 게시판 할 때 걸로 그냥 가져옴
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getInter());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
		
	}
	
////////////////////////////////////////////////////////////////
//Download2.jsp에서 쿼리문 날리는 소스!
	
	public List<MyFileDTO> myFileList()
	{
		List<MyFileDTO> fileList = new Vector<MyFileDTO>();
		
		String query = "SELECT * FROM myfile "
				+ " WHERE 1=1 "
				+ " ORDER BY idx DESC ";
		System.out.println("query=" + query);
		
		try
		{
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while(rs.next()) 
			{
				MyFileDTO dto = new MyFileDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getNString(3));
				dto.setInter(rs.getNString(4));
				dto.setOfile(rs.getNString(5));
				dto.setSfile(rs.getNString(6));
				dto.setPostdate(rs.getNString(7));
				
				fileList.add(dto);
			}
		}
		catch(Exception e)
		{
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return fileList;
	}
	
}
