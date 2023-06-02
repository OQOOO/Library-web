<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>회원 탈퇴를 위한 비밀번호 입력</h1>

	<form method="post" action="UserDataRemove.do">
		<input type="password">
		<input type="submit" value="회원탈퇴">
	</form>
	<form method="post" action="./MyPage.jsp">
		<input type="submit" value="뒤로">
	</form>
</body>
</html>