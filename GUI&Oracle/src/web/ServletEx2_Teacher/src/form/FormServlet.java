package form;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/form")
public class FormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	protected void doPost(
			HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// request 요청객체에서 전달 파라미터 꺼내기
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		// 콘솔로 확인하기
		System.out.println("ID : " + userId);
		System.out.println("PW : " + userPw);
		
		//응답 데이터 양식 설정하기(인코딩 포함)
		response.setContentType("text/html;charset=UTF-8");
		
		//응답 데이터 생성하기
		response.getWriter()
			.append("<h1>전달받은 데이터</h1>")
			.append("<hr>")
			.append("<h3>아이디 : "+userId+"</h3>")
			.append("<h3>패스워드 : "+userPw+"</h3>");
		
	}
}











