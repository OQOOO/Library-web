<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="BookReturn.do" method="post">
		<input type="text" name="isbn">
		<input type="submit" value="반납하기">
	</form>
	<form method="post" action="../MainPage.jsp">
		<input type="submit" value="뒤로">
	</form>
</body>
</html>