<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Library</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
	<%
	String id = (String)session.getAttribute("id");
	if (id != null) {
		String nextURL = "MainPage.jsp?id=" + id;
		response.sendRedirect(nextURL);
	}
	%>
	    <header>
        <div id="menuContainer" class="container">
            <form id="loginForm" method="post" action="./LoginPage.jsp">
                <input id="loginbutton" class="headerMenus" type="submit" value="로그인">
            </form>
        </div>
    </header>
    <div id="v">
        <div class="container">
            <h1 id="mainTitle">도서 관리 시스템</h1>
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
                <form method="post" action="./LoginPage.jsp">
                    <input class="mainMenu" type="submit" value="도서대여">
                </form>
            </div>
            <div>
                <form method="post" action="./LoginPage.jsp">
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