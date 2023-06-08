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
	position:relative;
	top: 7px;
	height : 35px;
	width: 150px;
}

.infoDiv {
background-color: rgb(240, 242, 244);
width : 500px;
height: 50px;
margin: 5px;
}

#otherButtonDiv input {
	margin : 5px;
	position:relative;
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
		<div class="infoDiv">아이디 : ${vo.id}</div>
		<div class="infoDiv">비밀번호 : ${vo.password }</div>
		<div class="infoDiv">이름 : ${vo.name }</div>
		<div class="infoDiv">생년월일 : ${vo.birthDate }</div>
		<div class="infoDiv">이메일 : ${vo.email }</div>
		<div class="infoDiv">전화번호 : ${vo.phoneNum }</div>
		
		<c:set var="re" value="infoPage"/>
		<form class="topMenuForm" method="post" action="UserInfo.do?re=infoPage">
			
			<input type="hidden" name="key" value="${re}" />
		
			<input id="infoSb" type="submit" value="내정보 수정">
		</form>
		</div>
</body>
</html>