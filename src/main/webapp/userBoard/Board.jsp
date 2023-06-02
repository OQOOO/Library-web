<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<h1>게시판</h1>
<body>
	<form action="InsertBoard.do" method="post">
		<input type="submit" value="새 글 작성">
	</form>
	
	<c:forEach  var="post" items="${postList}">
		<a href="PostView.do?seq=${post.seq}">${post.seq}, ${post.title}, ${post.userId}, ${post.createAt}, ${post.updateAt}, ${post.views}</a>
		
		<hr> 
	</c:forEach>
	
</body>
</html>