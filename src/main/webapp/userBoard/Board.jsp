<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<h1>�Խ���</h1>
<body>
	<form action="InsertBoard.do" method="post">
		<input type="submit" value="�� �� �ۼ�">
	</form>
	
	<c:forEach  var="post" items="${postList}">
		<a href="PostView.do?seq=${post.seq}">${post.seq}, ${post.title}, ${post.userId}, ${post.createAt}, ${post.updateAt}, ${post.views}</a>
		
		<hr> 
	</c:forEach>
	
</body>
</html>