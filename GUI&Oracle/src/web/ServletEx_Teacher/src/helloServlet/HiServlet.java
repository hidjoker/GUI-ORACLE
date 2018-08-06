package helloServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hiServlet")
public class HiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(
			HttpServletRequest request,
			HttpServletResponse response) 
					throws ServletException, IOException {
		
		response.setContentType(
				"text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>안녕하세요</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>반가워요!</h1>");
		out.println("<p>First Servlet Program</p>");
		out.println("</body>");
		out.println("</html>");
		
	}
}











