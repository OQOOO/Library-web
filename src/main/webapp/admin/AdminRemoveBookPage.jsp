<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
	margin: 0px;
	margin-bottom: 30px;
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
			<form class="topMenuForm" method="post" action="AdminMainPage.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="관리자 페이지">
			</form>
			<form class="topMenuForm" method="post" action="BookManagementPage.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="도서 관리">
			</form>
			<form class="topMenuForm" method="post"
				action="GetRentalBooks.do?rePage=RentBooksPage">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="유저 관리">
			</form>
			<form class="topMenuForm" method="post" action="Logout.do">
				<input type="text" name="logout" value="logout"
					style="display: none;"> <input class="headerMenus"
					type="submit" value="로그아웃">
			</form>
		</div>
	</header>
	<h1>도서 삭제 페이지</h1>
	<h3>제거하려는 도서의 ISBN을 입력하세요</h3>
	<form method="post" action="AdminRemoveBook.do">
		<input type="text" name="isbn">
			<input type="submit" value="도서 삭제">
		</form>
</body>
</html>