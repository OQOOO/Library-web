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
.midLine {
	width: 1000px;
	height:1px;
	margin-bottom: 15px;
	margin-top:10px;
	background-color: #a3a3a3;
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
 	<h1>글작성</h1>
	<hr/>
	<form action="InsertBoard2.do" method="post">

		제목<input type="text" name="title"/><br>

		작성자 ${sessionScope.id}<br>

		내용<textarea name="content" cols="40" rows="10"></textarea><br>


		<input type="submit" value="add"/><br>
	</form>
	
</body>
</html>