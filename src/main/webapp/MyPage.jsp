<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>����������</h1>
    <form class="topMenuForm" method="post" action="./myPages/InputPasswordPage.jsp">
		<input class="headerMenus" type="submit" value="�� ����">
	</form>
    <form class="topMenuForm" method="post" action="GetRentalBooks.do?rePage=myPage">
		<input class="headerMenus" type="submit" value="�뿩�� å ���">
	</form>
    <form class="topMenuForm" method="post" action="Withdrawal.do">
		<input class="headerMenus" type="submit" value="ȸ��Ż��">
	</form>
	<form class="topMenuForm" method="post" action="IndexMain.do">
		<input type="submit" value="�ڷ�">
	</form>
</body>
</html>