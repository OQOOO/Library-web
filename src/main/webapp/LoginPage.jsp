<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LoginPage</title>

</head>
<body>
	<%
	String id = (String)session.getAttribute("id");
	if (id != null) {
		String nextURL = "MainPage.jsp?id=" + id;
		response.sendRedirect(nextURL);
	}
	%>
	<form method="post" action ="./LoginProcess1.jsp">
		id <input type="text" id='id' name = "id"><br>
		pw <input type="password" id='pw' name = "pw"><br>
		<input type="submit" value="로그인">
	</form>
	
</body>
</html>