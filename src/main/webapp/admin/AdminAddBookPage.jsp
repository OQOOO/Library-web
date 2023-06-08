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
	
#main {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
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
	<div id="main">
	<h1>도서 추가 페이지</h1>
	<form id="searchInputForm" method="post" action="AddBook.do">
			<div id="addDiv">
				<div id="inputBox">
					<div>
						<p>ISBN</p>
						<input class="searchInput" type="text" name="isbn"> <br>
						<p class="errerMessage">${requestScope.isbnErrer}</p> <br>
					</div>
					<div>
						<p>제목</p>
						<input class="searchInput" type="text" name="title">
						<p class="errerMessage">${requestScope.titleErrer}</p> <br>
					</div>
					<div>
						<p>작가</p>
						<input class="searchInput" type="text" name="writer">
						<p class="errerMessage">${requestScope.writerErrer}</p> <br>
					</div>
					<div>
						<p>출판</p>
						<input class="searchInput" type="text" name="publisher">
						<p class="errerMessage">${requestScope.publisherErrer}</p> <br>
					</div>
					
				</div>

				<input id="submitButton" type="submit" value="도서 추가">

			</div>
		</form>
		</div>
</body>
</html>