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
</head>
<body>
	<h1>내 정보 변경</h1>
	<c:set var="vo" value="${requestScope.userInfo}"/>
	
	
	<form action="UserDateUpdate.do" method="post">
		
		아이디 : ${vo.id}<br>

		비밀번호 : <input type="hidden" name="id" value="${vo.id}"><br>
		
		비밀번호 : <input type="password" name="pw" value="${vo.password}"><br>
		비밀번호 확인 : <input type="password" name="pwCheck" value="${vo.password}"><br>
		<p class="errerMessage">${requestScope.pwErrer}</p> <br>
		
		이름 : <input type="text" name="name" value="${vo.name}"><br>
		<p class="errerMessage">${requestScope.nameErrer}</p> <br>
		
		생년월일 : <input type="date" name="birthDate" value="${vo.birthDate}"><br>
		<p class="errerMessage">${requestScope.birthDateErrer}</p> <br>
		
		이메일 : <input type="text" name="email" value="${vo.email}"><br>
		<p class="errerMessage">${requestScope.emailErrer}</p> <br>
		

		<c:set var="phoneNumber" value="${vo.phoneNum}" />

		<c:set var="areaCode" value="${phoneNumber.substring(0, 3)}" />
		<c:set var="middleNumber" value="${phoneNumber.substring(3, 7)}" />
		<c:set var="lastNumber" value="${phoneNumber.substring(7)}" />
		
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
		
		<input type="number" name="phoneNum2" oninput="checkNumberLength(this)" value="${middleNumber}">
		<input type="number" name="phoneNum3" oninput="checkNumberLength(this)" value="${lastNumber}"><br>
		<p class="errerMessage">${requestScope.phoneNumErrer}</p> <br>
		
		<input type="submit" value="변경사항 적용">
		</form>
		<form method="post" action ="../MyPage.jsp">
		<input type="submit" value="뒤로">
	</form>
</body>
</html>