<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Library</title>
<!--link rel="stylesheet" href="css/main.css"-->
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

#v {
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f09393;
    margin: 0px;
    height: 200px;
}

#mainTitle {
    margin: 0px;
    text-align: center;
}

#main {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
}

#mainMenuCon {
    background-color: rgba(125, 156, 156, 0);
    width: 1000px;
    height: 100px;
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
}

.mainMenu {
    width: 195px;
    height: 90px;
    margin: 0px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: none;
    font-size: 15px;
}

.mainMenu:hover {
    background-color: aliceblue;
}
</style>
</head>
<body>
    <header>
    
        <div id="menuContainer" class="container">
	        <form class="topMenuForm" method="post" action="Logout.do">
				<input type="text" name="logout" value="logout" style="display: none;">
				<input class="headerMenus" type="submit" value="로그아웃">
			</form>
        </div>
    </header>
    <div id="v">
        <div class="container">
            <h1 id="mainTitle">관리자 화면</h1>
        </div>
    </div>
    <hr>
    <div id="main">
        <div class="container" id="mainMenuCon">
            <div>
                <form method="post" action="BookManagementPage.do">
                    <input class="mainMenu" type="submit" value="도서관리">
                </form>
            </div>
            <div>
                <form method="post" action="AdminUserManagementPage.do">
                    <input class="mainMenu" type="submit" value="사용자 관리">
                </form>
            </div>
            <div>
                <form method="post" action="${pageContext.request.contextPath }/GoAdminBoard.sp">
                    <input class="mainMenu" type="submit" value="게시판 관리">
                </form>
            </div>
            <div>
                <form method="post" action="">
                    <input class="mainMenu" type="submit" value="공지사항 관리">
                </form>
            </div>
            <div>
                <form method="post" action="">
                    <input class="mainMenu" type="submit" value="기타">
                </form>
            </div>
        </div>
    </div>
</body>
</html>