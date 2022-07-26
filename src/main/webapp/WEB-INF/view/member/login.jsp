<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
</head>
<style>
h5{
	color:red;
}
</style>
<body align=center>
<h4>아직 계정이 없으신가요? <a href="signin">가입하기</a></h4>

<form id=frmLogin method=post action="user_check">
<p>${ch }</p>
<table align=center id=tblone>
	<tr>
		<th>ID</th>
		<td>
			<input type=text name=id>
		</td>
	</tr>
	<tr>
		<th>PW</th>
		<td>
			<input type=password name=pwd>
		</td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type=submit value='로그인'>
		</td>
	</tr>
</table>
</form>
</body>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document)

</script>
</html>