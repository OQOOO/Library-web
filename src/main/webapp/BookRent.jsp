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
		title="isbn�� 13�ڸ��� ���ڷ� �̷���� �ֽ��ϴ�." id='id' name = "isbn"><br>
	</form>
</body>
</html>