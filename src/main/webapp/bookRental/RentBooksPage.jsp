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
		<input type="submit" value="�ڷ�">
	</form>
	<h1>�뿩�� å ���</h1>
	<c:forEach items="${bookList}" var="vo">
        <div class="bookInfoDiv">${vo.bookName}, ${vo.isbn}</div>
        <form method="post" action ="BookReturn.do">
        		<input type="hidden" name="isbn" value="${vo.isbn }">
        		<input type="submit" value="�ݳ��ϱ�">
        	</form>
    </c:forEach>
</body>
</html>