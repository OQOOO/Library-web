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
	#main {
	    width: 100%;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    flex-direction: column;
	}
	#container {
		display: grid;
	    text-align: center;
		grid-template-columns: 150px 400px;
		grid-template-rows: 100px 45px 100px 100px 100px 100px 100px;
	}
	#container div {
	
		/*background-color:powderblue;*/
		padding-top: 10px;
	}
	.textDiv {
		text-align: right;
		padding-right: 15px;
		font-weight: bold;
	}
	
	.inputDiv {
		border-left: solid 1px gray;
		text-align: left;
		padding-left: 15px;
	}
	.inputDiv input {
		height: 25px;
		width: 300px;
	}
	.pNumInput {
		width: 100px;
	}
	
	#singupButton {
		position: relative;
		top: 20px;
		left: 375px;
		
		width : 120px;
		height :30px;
		background-color: white;
		box-shadow: 2px 2px 0px rgba(0, 0, 0, 0.5);
		transition: transform 0.3s ease;	
	}

	#signupButton:active {
	  transform: translate(2px, 2px);
	}
	
	
	#backButton {
		display: inline;
		position: relative;
		top: 30px;
		left: 160px;
		
		width : 120px;
		height :30px;
		background-color: white;
		box-shadow: 2px 2px 0px rgba(0, 0, 0, 0.5);
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
	<header> 
        <div id="menuContainer" class="container">
        	<form class="topMenuForm" method="post" action="IndexMain.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="����������">
			</form>
            <form id="loginForm" method="post" action="LoginPage.do">
                <input id="loginbutton" class="headerMenus" type="submit" value="�α���">
            </form>
        </div>
    </header>
	<h1 style="text-align: center;">ȸ������</h1>
    <div id="main">
		<form action="Singup.do" method="post">
			<div id="container">
				<div class="textDiv">
					���̵�
				</div>
				<div class="inputDiv">
					<input type="text" name="id" value="${requestScope.id}">
					<p class="errerMessage">${requestScope.idErrer}</p> <br>
				</div>
				
				<div class="textDiv">
					��й�ȣ
				</div>
				<div class="inputDiv">
					<input type="password" name="pw" value="${requestScope.pw}">
				</div>
				<div class="textDiv">
					��й�ȣ Ȯ��
				</div>
				<div class="inputDiv">
					<input type="password" name="pwCheck" value="${requestScope.pw}">
					<p class="errerMessage">${requestScope.pwErrer}</p> <br>
				</div>
				
				<div class="textDiv">
					�̸�
				</div>
				<div class="inputDiv">
					<input type="text" name="name" value="${requestScope.name}"><br>
					<p class="errerMessage">${requestScope.nameErrer}</p> <br>
				</div>
				
				<div class="textDiv">
					�������
				</div>
				<div class="inputDiv">
					<input type="date" name="birthDate" value="${requestScope.birthDate}"><br>
					<p class="errerMessage">${requestScope.birthDateErrer}</p> <br>
				</div>
				
				<div class="textDiv">
					�̸���
				</div>
				<div class="inputDiv">
					<input type="text" name="email" value="${requestScope.email}"><br>
					<p class="errerMessage">${requestScope.emailErrer}</p> <br>
				</div>
				
				<div class="textDiv">
					��ȭ��ȣ
				</div>
				<div class="inputDiv">
					<select style="width:70px; height:30px;" id="phoneNum1" name="phoneNum1">
						<option value="010">010</option>
						<option value="031">031</option>
					</select>
					<input style="width:70px;" type="number" name="phoneNum2" oninput="checkNumberLength(this)" value="${requestScope.phoneNum2}">
					<input style="width:70px;"  type="number" name="phoneNum3" oninput="checkNumberLength(this)" value="${requestScope.phoneNum3}"><br>
					<p class="errerMessage">${requestScope.phoneNumErrer}</p> <br>
				</div>
				
				<script>
				    // �������� �ε�� �� ����� �Լ�
				    window.onload = function() {
				        var selectElement = document.getElementById("phoneNum1");
				        selectElement.selectedIndex = ${requestScope.phoneNum1}; // �� ��° �ɼ��� ���� (�ε����� 0���� ����)
				    };
				</script>
				
				</div>
			<input id="singupButton" type="submit" value="ȸ������">
		</form>
		
		<form method="post" action ="IndexMain.do">
			<input id="backButton" type="submit" value="�ڷ�">
		</form>
	</div>
</body>
</html>