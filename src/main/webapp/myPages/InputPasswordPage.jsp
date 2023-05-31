<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호 입력</h1>
<form class="topMenuForm" method="post" action="PasswordCheck.do">
	<input type="password" name="pw">
	<input type="submit" value="비밀번호 확인">
</form>
<form class="topMenuForm" method="post" action="../MyPage.jsp">
	<input type="submit" value="뒤로">
</form>
</body>
</html>