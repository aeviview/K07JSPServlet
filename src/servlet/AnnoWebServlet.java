package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
  	web.xml에 매핑작업을 하는 대신
  	@WebServlet어노테이션을 사용해서 요청명에 대한 매핑을 한다.
  	요청명과 서블릿 클래스의 관계를 명확히 해둔 상태에서 사용해야 한다.
 */
@WebServlet("/13Servlet/AnnoWebServlet.do")
public class AnnoWebServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setAttribute("message", "어노테이션을 이용한 서블릿 작성");
		
		req.setAttribute("HELLO", "Hello~ 안녕~ 어노테이션!");
		
		req.getRequestDispatcher("/13Servlet/HelloServlet.jsp").forward(req, resp);
	}
}
