<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
<form action="/form" method="post">
	<label for="userId">이름</label>
	<input type="text" id="userId" name="userId" /><br>
	
	<%	for(int i=0; i<3; i++) { %>
		  <h3>JSP 경험하기!</h3>
	<%	} %>
	
	<label for="userPw">패스워드</label>
	<input type="password" id="userPw" name="userPw" /><br>
	
	<input type="submit" value="로그인" />
</form>
</div>

</body>
</html>














