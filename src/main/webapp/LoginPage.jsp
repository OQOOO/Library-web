<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LoginPage</title>
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
	#container {
	  position: relative;
	  border: 2px solid;
	  top: 100px;
	  width: 500px;
	  height: 500px;
	   display: flex;
  		justify-content: center;
  		align-items: center;
	}
	fome {
		position:relative;
	}
	#main {
	    width: 100%;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    flex-direction: column;
	}
	.inputBotton {
		background-color: white;
		box-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
		transition: transform 0.1s ease;	
	}
	.inputBotton:active {
	  transform: translate(2px, 2px);
		box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.5);
	}
	.inputBox {
		position:relative;
		height: 100px;
		bottom: 20px;
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
		bottom: 140px;
		right: 96px;
	}
	#singUpButton {
		position: absolute;
		width: 100px;
		height : 30px;
		bottom: 140px;
		right: 250px;
	}
	#backButton {
		position: absolute;
		width: 100px;
		height : 30px;
		bottom: 30px;
		right: 96px;
	}
</style>

</head>
<body>
    <header> 
        <div id="menuContainer" class="container">
        	<form class="topMenuForm" method="post" action="IndexMain.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="메인페이지">
			</form>
            <form id="loginForm" method="post" action="LoginPage.do">
                <input id="loginbutton" class="headerMenus" type="submit" value="로그인">
            </form>
        </div>
    </header>
	<div id="main">
	<div id="container">
	<c:if test="${not empty sessionScope.id}">
    	<c:set var="nextURL" value="MainPage.jsp?id=${sessionScope.id}" />
  	  	<c:redirect url="${nextURL}" />
	</c:if>
	
	<form method="post" action ="Login.do">
		<div class="inputBox">
			<p class="idpw">아이디</p>
			<input class="ipt" type="text" pattern="[A-Za-z0-9]+" 
			oninvalid="setCustomValidity('잘못된 입력입니다.')"
			id='id' name = "id" value=${param.bId }><br>
			
			<c:if test="${param.id == 'false'}">
				${"<p id='errer'>아이디를 입력하세요</p>"}
			</c:if>
		</div>
		<div class="inputBox">
			<p class="idpw">비밀번호</p>
			<input class="ipt" type="password" id='pw' name = "pw"><br>
			<c:if test="${param.pw == 'false'}">
				${ "<p id='errer'>비밀번호를 입력하세요</p>" }
			</c:if>
			<c:if test="${param.login == 'false'}">
				${ "<p id='errer'>해당 계정이 존재하지 않습니다.</p>" }
			</c:if><br>
		</div>
		<input class="inputBotton" id="logInButton" type="submit" value="로그인">
		<!-- 뒤로 -->
	</form>
		<form method="post" action ="IndexMain.do">
		<input class="inputBotton" id="backButton" type="submit" value="뒤로">
	</form>

	<form method="post" action ="SingupPage.do">
		<input class="inputBotton" id="singUpButton" type="submit" value="회원가입">
	</form>
	</div>
	</div>
</body>
</html>