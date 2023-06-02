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
	${requestScope.vo.title} | ${requestScope.vo.seq} | ${requestScope.vo.userId}<br>
	${requestScope.vo.content}<br>
	${requestScope.vo.createAt}<br>
	${requestScope.vo.updateAt}<br>
	${requestScope.vo.views}<br>
	
	<c:if test = "${sessionScope.id eq requestScope.vo.userId}">
		<form action="DeleteBoard.do" method="post">
			<input type="hidden" name = "postSeq" value="${requestScope.vo.seq}">
			<input type="submit" value="삭제">
		</form>
		<form action="UpdateBoard.do" method="post">
			<input type="hidden" name = "seq" value="${requestScope.vo.seq}">
			<input type="submit" value="수정">
		</form>
	</c:if>
</body>
</html>