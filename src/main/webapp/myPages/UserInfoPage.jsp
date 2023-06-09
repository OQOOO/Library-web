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

#main {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}
#midLine {
	width: 100%;
	height:1px;
	margin-bottom: 10px;
	background-color: #a3a3a3;
}

#pw {
	height: 25px;
	width: 200px;
}

#infoSb {
	position: relative;
	top: 20px;
	left: 250px;
	
	width : 120px;
	height :30px;
	background-color: white;
	box-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	transition: transform 0.1s ease;
}
#infoSb:active {
  	transform: translate(1px, 1px);
	box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.5);
}

#otherButtonDiv input {
	margin : 5px;
	position:relative;
}

	#infoContainer {
		display: grid;
	    text-align: center;
		grid-template-columns: 150px 300px;
		grid-template-rows: 50px 50px 50px 50px 50px 50px;
		font-weight: bold;
	}
	.who {
		text-align: right;
		padding:15px;
	}
	.infoDiv {
		border-left: solid gray 1px;
		text-align: left;
		padding: 15px;
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
    <div id="main">
		<h1>유저 정보 페이지</h1>
		<c:set var="vo" value="${requestScope.userInfo}"/>
    <div id="infoContainer">

		<div class="who">아이디 </div><div class="infoDiv"> ${vo.id}</div>
		<div class="who">비밀번호 </div><div class="infoDiv"> ${vo.password }</div>
		<div class="who">이름 </div><div class="infoDiv"> ${vo.name }</div>
		<div class="who">생년월일 </div><div class="infoDiv"> ${vo.birthDate }</div>
		<div class="who">이메일 </div><div class="infoDiv"> ${vo.email }</div>
		<div class="who">전화번호 </div><div class="infoDiv"> ${vo.phoneNum }</div>
		
		<c:set var="re" value="infoPage"/>
		<form class="topMenuForm" method="post" action="UserInfo.do?re=infoPage">
			
			<input type="hidden" name="key" value="${re}" />
		
			<input id="infoSb" type="submit" value="내정보 수정">
		</form>
		</div>
	</div>
</body>
</html>