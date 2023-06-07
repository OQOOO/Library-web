<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>마이페이지</h1>
    <form class="topMenuForm" method="post" action="./myPages/InputPasswordPage.jsp">
		<input class="headerMenus" type="submit" value="내 정보">
	</form>
    <form class="topMenuForm" method="post" action="GetRentalBooks.do?rePage=myPage">
		<input class="headerMenus" type="submit" value="대여한 책 목록">
	</form>
    <form class="topMenuForm" method="post" action="Withdrawal.do">
		<input class="headerMenus" type="submit" value="회원탈퇴">
	</form>
	<form class="topMenuForm" method="post" action="IndexMain.do">
		<input type="submit" value="뒤로">
	</form>
</body>
</html>