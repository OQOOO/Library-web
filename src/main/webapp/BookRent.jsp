<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action ="./BookRentServlet">
		<input class="ipt" type="text" pattern="^\d{13}$" 
		title="isbn은 13자리의 숫자로 이루어져 있습니다." id='id' name = "isbn"><br>
	</form>
</body>
</html>