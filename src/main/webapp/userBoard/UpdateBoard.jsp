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
 	<h1>글수정</h1>
	<hr/>
	<form action="UpdateBoard2.do" method="post">
		<input type="hidden" name="seq" value="${requestScope.vo.seq}">
		제목<input type="text" name="title" value="${requestScope.vo.title}"/><br>

		작성자 ${sessionScope.id}<br>

		내용<textarea name="content" cols="40" rows="10">${requestScope.vo.content}</textarea><br>


		<input type="submit" value="add"/><br>
	</form>
</body>
</html>