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
	  var maxLength = 4; // 최대 자릿수 제한
	  var value = input.value;
	
	  if (value.length > maxLength) {
	    input.value = value.slice(0, maxLength); // 최대 자릿수까지 잘라냄
	  }
	}
</script>
</head>
<body>
	<h1>회원가입</h1>
	<form action="Singup.do" method="post">
		아이디 : <input type="text" name="id" value="${requestScope.id}"><br>
		<p class="errerMessage">${requestScope.idErrer}</p> <br>
		비밀번호 : <input type="password" name="pw" value="${requestScope.pw}"><br>
		비밀번호 확인 : <input type="password" name="pwCheck" value="${requestScope.pw}"><br>
		<p class="errerMessage">${requestScope.pwErrer}</p> <br>
		이름 : <input type="text" name="name" value="${requestScope.name}"><br>
		<p class="errerMessage">${requestScope.nameErrer}</p> <br>
		생년월일 : <input type="date" name="birthDate" value="${requestScope.birthDate}"><br>
		<p class="errerMessage">${requestScope.birthDateErrer}</p> <br>
		
		이메일 : <input type="text" name="email" value="${requestScope.email}"><br>
		<p class="errerMessage">${requestScope.emailErrer}</p> <br>
		
		전화번호 :
		<select id="phoneNum1" name="phoneNum1">
			<option value="010">010</option>
			<option value="031">031</option>
		</select>
		<script>
		    // 페이지가 로드될 때 실행될 함수
		    window.onload = function() {
		        var selectElement = document.getElementById("phoneNum1");
		        selectElement.selectedIndex = ${requestScope.phoneNum1}; // 두 번째 옵션을 선택 (인덱스는 0부터 시작)
		    };
		</script>
		
		<input type="number" name="phoneNum2" oninput="checkNumberLength(this)" value="${requestScope.phoneNum2}">
		<input type="number" name="phoneNum3" oninput="checkNumberLength(this)" value="${requestScope.phoneNum3}"><br>
		<p class="errerMessage">${requestScope.phoneNumErrer}</p> <br>
		
		<input type="submit" value="회원가입">
		</form>
		<form method="post" action ="./Index.jsp">
		<input type="submit" value="뒤로">
	</form>
</body>
</html>