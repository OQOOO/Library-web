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
	<form method="post" action="./MainPage.jsp">
		<input type="submit" value="뒤로">
	</form>
	<h1>대여한 책 목록</h1>
	<c:forEach items="${bookList}" var="vo">
        <div class="bookInfoDiv">${vo.bookName}, ${vo.isbn}</div>
        <form method="post" action ="BookReturn.do">
        		<input type="hidden" name="isbn" value="${vo.isbn }">
        		<input type="submit" value="반납하기">
        	</form>
    </c:forEach>
</body>
</html>