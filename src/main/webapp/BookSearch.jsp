<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
	.bookInfoDiv {
	 background-color:#ffd966;
	 height : 50px;
	 width : 700px;
	 border-radius: 10px;
	 margin-top: 5px;
	}
</style>
</head>
<body>
책검색
<form method="post" action ="./BookSearchServlet">
	제목<input type="text" name="title"><br>
	작가<input type="text" name="writer"><br>
	출판<input type="text" name="publisher"><br>
	<input type="submit" value="검색">
</form>
	<c:forEach items="${userSelect}" var="se"  varStatus="status">
        ${se}<c:if test="${!status.last}">,</c:if>
    </c:forEach>
    <c:if test="${not empty userSelect}"> 
    (으)로 검색결과
    </c:if>

    <c:forEach items="${booksInfo}" var="vo">
        <div class="bookInfoDiv">${vo.bookName}, ${vo.isbn}</div>
    </c:forEach>
</body>
</html>