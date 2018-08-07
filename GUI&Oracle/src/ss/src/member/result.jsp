<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean result = (boolean)request.getAttribute("result");
%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> + + + 회원가입 결과 + + + </title>
</head>
<body>

<% if(result){ %>
	<h1>회원가입 성공!!</h1>
<% }else{ %>
	<h1>회원가입 실패</h1>
<% } %>	
	<a href="/member/join">회원가입 폼으로 가기</a>
</body>
</html>