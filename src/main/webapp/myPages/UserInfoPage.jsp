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
<h1>유저 정보 페이지</h1>
<c:set var="vo" value="${requestScope.userInfo}"/>
아이디 : ${vo.id}<br>
비밀번호 : ${vo.password }<br>
이름 : ${vo.name }<br>
생년월일 : ${vo.birthDate }<br>
이메일 : ${vo.email }<br>
전화번호 : ${vo.phoneNum }<br>
<form class="topMenuForm" method="post" action="../MyPage.jsp">
	<input type="submit" value="뒤로">
</form>
</body>
</html>