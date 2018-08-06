package form;

//+ 작성한 서블릿(.java) 클래스 폴더(경로)
//	- 워크스페이스/프로젝트/src/
//
//+ 컴파일 결과(바이트코드, .class) 파일 폴더(경로)
//	- 워크스페이스/프로젝트/build/classes/
//
//+ 서버 업로드 폴더(경로)
//	-C:\Users\
//     user2\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ServletEx\WEB-INF\classes\
//
//+ 전달 파라미터 한글(UTF-8) 처리 설정하기
//	- GET method
//		Server설정에서 server.xml 파일의 <Connector>
//		에 URIEncoding="UTF-8" 항목을 추가한다
//		서버의 port를 포함하고 있는 <Connector> 태그에 설정
//		요청 URI에 포함된 한글을 UTF-8로 처리되도록 하는 설정
//	<Connector URIEncoding="UTF-8" connectionTimeout="20000" port="8088" protocol="HTTP/1.1" redirectPort="8443"/>
//
//	- POST method
//		요청 객체를 사용하기 전에 인코딩을 UTF-8로 설정한다
//		request.setCharacterEncoding("UTF-8");
//		** 아파치 웹 서버는 내부 인코딩을 ISO-8859-1로 사용한다
//		** 한글이 웹 서버를 통과할 때 ISO-8859-1 방식으로
//		  나누어지게 된다
//		** 한글 데이터를 사용하기 전에 UTF-8 인코딩으로 다시
//		  합성한다면 원본 데이터를 확인할 수 있게된다


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/form")
public class FormServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) 
					throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//request 요청객체에서 전달 파라미터 꺼내기
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		// 콘솔로 확인하기
		System.out.println("ID : "+userId);
		System.out.println("PW : "+userPw);
		
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
