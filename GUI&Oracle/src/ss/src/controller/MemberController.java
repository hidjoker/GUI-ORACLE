package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.MemberDaoImpl;
import dto.Member;

@WebServlet("/member/join")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		//joinForm 띄우기
		request.getRequestDispatcher("/view/member/joinForm.jsp")
			.forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 파라미터 member 객체에 담기
		Member member = new Member();
		member.setUserId(request.getParameter("userId"));
		member.setNick(request.getParameter("nick"));
		member.setEmail(request.getParameter("email"));
		
		// DAO를 이용한 회원가입 처리
		MemberDao dao = new MemberDaoImpl();
		boolean result = dao.join(member);
		
		// VIEW에 결과값 전달
		request.setAttribute("result", result);
		request.getRequestDispatcher("/view/member/result.jsp")
			.forward(request, response);
		
	}
}
