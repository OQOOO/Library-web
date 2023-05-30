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
å�˻�
<form method="post" action ="./BookSearchServlet">
	����<input type="text" name="title"><br>
	�۰�<input type="text" name="writer"><br>
	����<input type="text" name="publisher"><br>
	<input type="submit" value="�˻�">
</form>
	<c:forEach items="${userSelect}" var="se"  varStatus="status">
        ${se}<c:if test="${!status.last}">,</c:if>
    </c:forEach>
    <c:if test="${not empty userSelect}"> 
    (��)�� �˻����
    </c:if>

    <c:forEach items="${booksInfo}" var="vo">
        <div class="bookInfoDiv">${vo.bookName}, ${vo.isbn}</div>
    </c:forEach>
</body>
</html>