<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload</title>
</head>
<body>
<form action="doit" method="post" enctype="multipart/form-data">

   파일 : <input type="file" name="file" multiple="multiple"></br>
	<input type=text name=aaa>
   <input type="submit" value="업로드">

</form>

<form action="delFile" method="post">
<input type="text" name=filename value="${m.menuImg }">
console.log(${m.menuImg })
<input type="submit" value="삭제">
</form>

<!-- @RequestParam("file") MultipartFile file -->
</body>
</html>