package helloServlet;

//+ 서블릿, Servlet ( Server + Applet )
//	- 서버에서 동작하는 Applet이라는 뜻
//	** Applet : 자바 바이트코드 형태로 배포되는 실행가능 프로그램
//	- 웹 어플리케이션을 작성하는 기술
//	- 자바 일반클래스에 HttpServlet 클래스를 상속하면
//	  서블릿 클래스라고 부름
//		-> 줄여서 '서블릿' 이라고 부름
//			(javax.servlet.http.Http.Servlet class)
//
//+ 서블릿 클래스 구성
//	import javax.servlet.http.HttpServlet;
//	public class [서블릿클래스명] extends HttpServlet {
//		// 클라이언트의 요청 처리 코드
//	}
//	- 접근제한자는 반드시 public
//	- HttpServlet 클래스를 상속받는다
//+ 클라이언트의 HTTP 요청을 처리하는 메소드
//	- doGet() 메소드
//		클라이언트의 GET method 요청을 처리
//		서버의 자원(정보)를 요청할 때 사용
//		URL에 쿼리스트링을 추가해서 전달 데이터를 전송
//		검색어 전달할 때 많이 사용
//	- doPost() 메소드
//		클라이언트의 POST method 요청을 처리하는 메소드
//		서버로 데이터(정보)를 전송하기 위해 사용
//		HTTP 프로토콜의 Request Header에 쿼리스트링으로
//		포함하여 전달
//	- service() 메소드
//		클라이언트의 요청을 받아들임
//		get, post 구분하지 않음
//		Request Method를 파악한 후 doGet(), doPost()로 적절히
//		전달해주는 메소드
//
//+ 서블릿의 동작 원리
//	클라이언트 요청 -> (Apache 웹서버 - Tomcat Was(JVM) )
//	-> 서블릿 컨테이너 -> 서블릿 객체 -> Service() [멀티스레딩]
//	-> doGet() or doPost()
//	-> 서블릿 컨테이너 -> 웹서버 -> 클라이언트 응답
//
//** 서블릿 컨테이너
//	- 서블릿 처리환경을 구축하는 역할
//	- 서블릿을 실행시키는 역할
//	- 웹서버(아파치톰캣)와 서블릿객체 사이의 중간자
//	- 요청 URL-Pattern 과 서블릿객체를 맵핑해놓고 기다림
//		
//
//+ 서블릿 객체 라이프사이클(생명주기)
//	객체생성 -> init() -> service() -> destroy()
//							doGet()
//							doPost()
//							반복수행

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	
	@Override
	protected void doGet(
			HttpServletRequest req,
			HttpServletResponse resp)
					throws ServletException, IOException {
		
		resp.getWriter().println("Hello");		
	}
	
}
