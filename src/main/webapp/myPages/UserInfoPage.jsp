<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>���� ���� ������</h1>
<c:set var="vo" value="${requestScope.userInfo}"/>
���̵� : ${vo.id}<br>
��й�ȣ : ${vo.password }<br>
�̸� : ${vo.name }<br>
������� : ${vo.birthDate }<br>
�̸��� : ${vo.email }<br>
��ȭ��ȣ : ${vo.phoneNum }<br>
<form class="topMenuForm" method="post" action="../MyPage.jsp">
	<input type="submit" value="�ڷ�">
</form>
</body>
</html>