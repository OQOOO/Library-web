<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
	margin: 0px;
}

header {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	background-color: rgb(51, 46, 41);
	margin: 0px;
	height: 40px;
}

.container {
	min-width: 1000px;
}

#menuContainer {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: flex-end;
}

.headerMenus {
	font-size: 20px;
	height: 100%;
	width: 150px;
	background-color: rgba(255, 255, 255, 0);
	color: white;
	border: none;
}

.headerMenus:hover {
	background-color: rgba(219, 219, 219, 0.144);
}
	.errerMessage {
		color:red;
		margin:0px;
	}
</style>
</head>
<body>
	<header>
		<div id="menuContainer" class="container">
        	<form class="topMenuForm" method="post" action="IndexMain.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="����������">
			</form>
			<form class="topMenuForm" method="post"
				action="SearchBookPage.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="�����˻�">
			</form>
			<form class="topMenuForm" method="post"
				action="GetRentalBooks.do?rePage=RentBooksPage">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="�뿩���">
			</form>
	        <form class="topMenuForm" method="post" action="MyPage.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="����������">
			</form>
	        <form class="topMenuForm" method="post" action="Logout.do">
				<input type="text" name="logout" value="logout" style="display: none;">
				<input class="headerMenus" type="submit" value="�α׾ƿ�">
			</form>
        </div>
    </header>
	<h1>�� ���� ����</h1>
	<c:set var="vo" value="${requestScope.userInfo}"/>
	
	
	<form action="UserDateUpdate.do" method="post">
		
		���̵� : ${vo.id}<br>

		<input type="hidden" name="id" value="${vo.id}"><br>
		
		��й�ȣ : <input type="password" name="pw" value="${vo.password}"><br>
		��й�ȣ Ȯ�� : <input type="password" name="pwCheck" value="${vo.password}"><br>
		<p class="errerMessage">${requestScope.pwErrer}</p> <br>
		
		�̸� : <input type="text" name="name" value="${vo.name}"><br>
		<p class="errerMessage">${requestScope.nameErrer}</p> <br>
		
		������� : <input type="date" name="birthDate" value="${vo.birthDate}"><br>
		<p class="errerMessage">${requestScope.birthDateErrer}</p> <br>
		
		�̸��� : <input type="text" name="email" value="${vo.email}"><br>
		<p class="errerMessage">${requestScope.emailErrer}</p> <br>
		

		<c:set var="phoneNumber" value="${vo.phoneNum}" />

		<c:set var="areaCode" value="${phoneNumber.substring(0, 3)}" />
		<c:set var="middleNumber" value="${phoneNumber.substring(3, 7)}" />
		<c:set var="lastNumber" value="${phoneNumber.substring(7)}" />
		
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
		
		<input type="number" name="phoneNum2" oninput="checkNumberLength(this)" value="${middleNumber}">
		<input type="number" name="phoneNum3" oninput="checkNumberLength(this)" value="${lastNumber}"><br>
		<p class="errerMessage">${requestScope.phoneNumErrer}</p> <br>
		
		<input type="submit" value="������� ����">
		</form>
		<form method="post" action ="../MyPage.jsp">
		<input type="submit" value="�ڷ�">
	</form>
</body>
</html>