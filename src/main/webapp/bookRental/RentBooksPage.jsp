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

.bookInfoDiv {
	background-color: rgb(240, 242, 244);
	height: 100px;
	width: 700px;
	margin-top: 10px;
	border: solid 1px #cccccc;
	box-shadow: 3px 3px 0px rgba(0, 0, 0, 0.5);
	position: relative;
}

.bookInfoText {
	margin:0px;
	margin-bottom: 5px;
	margin-top: 5px;
	margin-left: 5px;
}

.returnButton {
	position: absolute;
	bottom:0px;
	right:0px;
	height: 40%;
	width: 150px;
	background-color: #ffffff;
	color: black;
	margin:0px;
	font-size: 15px;
	clip-path: polygon(20% 0%, 100% 0%, 100% 100%, 100% 100%, 0% 100%);
	border:none;
}
.returnButton:hover {
	background-color: #f6fdfe;
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
		<h1>대여한 책 목록</h1>
		<c:forEach items="${bookList}" var="vo">
	        <div class="bookInfoDiv">
	        	<p class="bookInfoText" style="font-size:1.2em">${vo.bookName}</p>
	        	<p class="bookInfoText" style="font-size:0.8em">대여일 : ${vo.rentalDate}</p>
	        	<p class="bookInfoText" style="font-size:0.8em; color:red;">반납일 : ${vo.returnDate}</p>
		        
		        <form method="post" action ="BookReturn.do">
	        		<input type="hidden" name="isbn" value="${vo.isbn }">
	        		<input class="returnButton" type="submit" value="반납하기">
	        	</form>
        	</div>
	    </c:forEach>
    </div>
</body>
</html>