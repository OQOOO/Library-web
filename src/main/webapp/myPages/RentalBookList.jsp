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
	<h1>�뿩�� å ���</h1>
	<form method="post" action ="./MyPage.jsp">
		<input type="submit" value="�ڷ�">
	</form>
	<c:forEach items="${bookList}" var="vo">
        <div class="bookInfoDiv">${vo.bookName}, ${vo.isbn}</div>
    </c:forEach>
    
</body>
</html>