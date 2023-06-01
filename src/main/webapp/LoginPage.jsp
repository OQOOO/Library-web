<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LoginPage</title>
<style>
	#container {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  width: 500px;
	  height: 700px;
	  background-color: rgb(114, 214, 206);
	   display: flex;
  		justify-content: center;
  		align-items: center;
	}
	fome {
	position:relative;
	}
	.inputBox {
		height: 100px;
	}
	
	.idpw {
		margin:0px;
		font-size: 17px;
		font-weight:bold;
	}
	
	.ipt {
		height: 30px;
		width: 300px;
		border-radius: 5px;
		border: 2px solid rgb(34, 148, 138);
		margin-top:3px;
		margin-bottom:5px;
	}
	#errer {
		color:red;
		margin:0px;
	}
	
	#logInButton {
		position: absolute;
		width: 150px;
		height : 30px;
		right: 96px;
		border: 2px solid rgb(34, 148, 138);
		border-radius: 5px;
	}
</style>

</head>
<body>
	<div id="container">
	<c:if test="${not empty sessionScope.id}">
    	<c:set var="nextURL" value="MainPage.jsp?id=${sessionScope.id}" />
  	  	<c:redirect url="${nextURL}" />
	</c:if>
	
	<form method="post" action ="Login.do">
		<div class="inputBox">
			<p class="idpw">���̵�</p>
			<input class="ipt" type="text" pattern="[A-Za-z0-9]+" 
			oninvalid="setCustomValidity('�߸��� �Է��Դϴ�.')"
			id='id' name = "id" value=${param.bId }><br>
			
			<c:if test="${param.id == 'false'}">
				${"<p id='errer'>���̵� �Է��ϼ���</p>"}
			</c:if>
		</div>
		<div class="inputBox">
			<p class="idpw">��й�ȣ</p>
			<input class="ipt" type="password" id='pw' name = "pw"><br>
			<c:if test="${param.pw == 'false'}">
				${ "<p id='errer'>��й�ȣ�� �Է��ϼ���</p>" }
			</c:if>
			<c:if test="${param.login == 'false'}">
				${ "<p id='errer'>�ش� ������ �������� �ʽ��ϴ�.</p>" }
			</c:if><br>
		</div>
		<input id="logInButton" type="submit" value="�α���">
		<!-- �ڷ� -->
	</form>
		<form method="post" action ="./Index.jsp">
		<input type="submit" value="�ڷ�">
	</form>
	</form>
		<form method="post" action ="./SingupPage.jsp">
		<input type="submit" value="ȸ������">
	</form>
	
	</div>
</body>
</html>