<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>+ + + 회원 가입 + + +</title>
</head>
<body>

<form action="/member/join" method="post">
<table>
<tr>
	<td><label for="userId">ID : </label></td>
	<td><input type="text" id="userId" name="userId" /></td>
</tr>
<tr>
	<td><label for="nick">NICK : </label></td>
	<td><input type="text" id="nick" name="nick" /></td>
</tr>	
<tr>
	<td><label for="email">EMAIL : </label></td>
	<td><input type="text" id="email" name="email" /></td>
</tr>
<tr>
	<td></td>
	<td><input type="submit" value="가입" /></td>
</tr>
</table>


</form>
</body>
</html>