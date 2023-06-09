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
	
	#updateButton {
		position: relative;
		top: 20px;
		left: 375px;
		
		width : 120px;
		height :30px;
		background-color: white;
		box-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
		transition: transform 0.3s ease;	
	}

	#signupButton:active {
	  transform: translate(1px, 1px);
	}
	
	
	#backButton {
		display: inline;
		position: relative;
		top: 30px;
		left: 160px;
		
		width : 120px;
		height :30px;
		background-color: white;
		box-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
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
			<form class="topMenuForm" method="post"
				action="SearchBookPage.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="도서검색">
			</form>
			<form class="topMenuForm" method="post"
				action="GetRentalBooks.do?rePage=RentBooksPage">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="대여목록">
			</form>
			<form class="topMenuForm" method="post"
				action="BoardView.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="게시판">
			</form>
	        <form class="topMenuForm" method="post" action="MyPage.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="마이페이지">
			</form>
	        <form class="topMenuForm" method="post" action="Logout.do">
				<input type="text" name="logout" value="logout" style="display: none;">
				<input class="headerMenus" type="submit" value="로그아웃">
			</form>
        </div>
    </header>
	<c:set var="vo" value="${requestScope.userInfo}"/>
	
	<div id="main">
		<h1>내 정보 변경</h1>
	<form action="UserDateUpdate.do" method="post">
		<div id="container">
			<div class="textDiv">
				아이디
			</div>
			<div class="inputDiv">
				${vo.id}
				<input type="hidden" name="id" value="${vo.id}"><br>
			</div>
			
			<div class="textDiv">
				비밀번호
			</div>
			<div class="inputDiv">
				<input type="password" name="pw" value="${vo.password}"><br>
			</div>
			
			<div class="textDiv">
				비밀번호 확인
			</div>
			<div class="inputDiv">
				<input type="password" name="pwCheck" value="${vo.password}"><br>
				<p class="errerMessage">${requestScope.pwErrer}</p> <br>
			</div>
			
			<div class="textDiv">
				이름
			</div>
			<div class="inputDiv">
				<input type="text" name="name" value="${vo.name}"><br>
				<p class="errerMessage">${requestScope.nameErrer}</p> <br>
			</div>
			
			<div class="textDiv">
				생년월일
			</div>
			
			<div class="inputDiv">
				<input type="date" name="birthDate" value="${vo.birthDate}"><br>
				<p class="errerMessage">${requestScope.birthDateErrer}</p> <br>
			</div>
			
			<div class="textDiv">
				이메일
			</div>
			<div class="inputDiv">
				<input type="text" name="email" value="${vo.email}"><br>
				<p class="errerMessage">${requestScope.emailErrer}</p> <br>
			</div>
			
			<div class="textDiv">
				전화번호
			</div>
			<div class="inputDiv">
				<c:set var="phoneNumber" value="${vo.phoneNum}" />
		
				<c:set var="areaCode" value="${phoneNumber.substring(0, 3)}" />
				<c:set var="middleNumber" value="${phoneNumber.substring(3, 7)}" />
				<c:set var="lastNumber" value="${phoneNumber.substring(7)}" />
				
				
				<select style="width:70px; height:30px;" id="phoneNum1" name="phoneNum1">
					<option value="010">010</option>
					<option value="031">031</option>
				</select>
				<input style="width:70px" type="number" name="phoneNum2" oninput="checkNumberLength(this)" value="${middleNumber}">
				<input style="width:70px" type="number" name="phoneNum3" oninput="checkNumberLength(this)" value="${lastNumber}"><br>
				<p class="errerMessage">${requestScope.phoneNumErrer}</p> <br>
			</div>
		</div>
			<input id="updateButton" type="submit" value="변경사항 적용">
		</form>
		<form method="post" action ="MyPage.do">
			<input id="backButton" type="submit" value="뒤로">
		</form>
	</div>
			<script>
			    // 페이지가 로드될 때 실행될 함수
			    window.onload = function() {
			    	var selectElement = document.getElementById("phoneNum1");
			        selectElement.selectedIndex = ${requestScope.phoneNum1}; // 두 번째 옵션을 선택 (인덱스는 0부터 시작)
			    };
			</script>
</body>
</html>