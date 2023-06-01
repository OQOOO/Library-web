<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.errerMessage {
		color:red;
		margin:0px;
	}
</style>
<script>
	function checkNumberLength(input) {
	  var maxLength = 4; // �ִ� �ڸ��� ����
	  var value = input.value;
	
	  if (value.length > maxLength) {
	    input.value = value.slice(0, maxLength); // �ִ� �ڸ������� �߶�
	  }
	}
</script>
</head>
<body>
	<h1>ȸ������</h1>
	<form action="Singup.do" method="post">
		���̵� : <input type="text" name="id" value="${requestScope.id}"><br>
		<p class="errerMessage">${requestScope.idErrer}</p> <br>
		��й�ȣ : <input type="password" name="pw" value="${requestScope.pw}"><br>
		��й�ȣ Ȯ�� : <input type="password" name="pwCheck" value="${requestScope.pw}"><br>
		<p class="errerMessage">${requestScope.pwErrer}</p> <br>
		�̸� : <input type="text" name="name" value="${requestScope.name}"><br>
		<p class="errerMessage">${requestScope.nameErrer}</p> <br>
		������� : <input type="date" name="birthDate" value="${requestScope.birthDate}"><br>
		<p class="errerMessage">${requestScope.birthDateErrer}</p> <br>
		
		�̸��� : <input type="text" name="email" value="${requestScope.email}"><br>
		<p class="errerMessage">${requestScope.emailErrer}</p> <br>
		
		��ȭ��ȣ :
		<select id="phoneNum1" name="phoneNum1">
			<option value="010">010</option>
			<option value="031">031</option>
		</select>
		<script>
		    // �������� �ε�� �� ����� �Լ�
		    window.onload = function() {
		        var selectElement = document.getElementById("phoneNum1");
		        selectElement.selectedIndex = ${requestScope.phoneNum1}; // �� ��° �ɼ��� ���� (�ε����� 0���� ����)
		    };
		</script>
		
		<input type="number" name="phoneNum2" oninput="checkNumberLength(this)" value="${requestScope.phoneNum2}">
		<input type="number" name="phoneNum3" oninput="checkNumberLength(this)" value="${requestScope.phoneNum3}"><br>
		<p class="errerMessage">${requestScope.phoneNumErrer}</p> <br>
		
		<input type="submit" value="ȸ������">
		</form>
		<form method="post" action ="./Index.jsp">
		<input type="submit" value="�ڷ�">
	</form>
</body>
</html>