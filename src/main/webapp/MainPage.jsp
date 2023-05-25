<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Library</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
    <header>
        <div id="menuContainer" class="container">
	        <form class="topMenuForm" method="post" action="./SessionServlet">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="마이페이지">
			</form>
	        <form class="topMenuForm" method="post" action="./SessionServlet">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="로그아웃">
			</form>
        </div>
    </header>
    <div id="v">
        <div class="container">
            <h1 id="mainTitle">로그인 성공 임시 페이지</h1>
        </div>
    </div>
    <hr>
    <div id="main">
        <div class="container" id="mainMenuCon">
            <div>
                <form method="post" action="">
                    <input class="mainMenu" type="submit" value="도서검색">
                </form>
            </div>
            <div>
                <form method="post" action="">
                    <input class="mainMenu" type="submit" value="도서대여">
                </form>
            </div>
            <div>
                <form method="post" action="">
                    <input class="mainMenu" type="submit" value="도서반납">
                </form>
            </div>
            <div>
                <form method="post" action="">
                    <input class="mainMenu" type="submit" value="게시판">
                </form>
            </div>
            <div>
                <form method="post" action="">
                    <input class="mainMenu" type="submit" value="공지사항">
                </form>
            </div>
        </div>
    </div>
</body>
</html>