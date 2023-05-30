<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Library</title>
<link rel="stylesheet" href="css/main.css">

</head>
<body>

	<c:if test="${not empty sessionScope.id}">
    	<c:set var="nextURL" value="MainPage.jsp?id=${sessionScope.id}" />
  	  	<c:redirect url="${nextURL}" />
	</c:if>
	
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
                <form method="post" action="./BookSearch.jsp">
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