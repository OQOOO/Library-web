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
    background: linear-gradient(to top right, #F4E4B7, #AADBD1);
    margin: 0px;
    height: 200px;
    overflow: hidden;
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
	background-color: #f8f8f8;
	box-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	transition: transform 0.1s ease;
	border: 1px solid;

    width: 195px;
    height: 90px;
    margin: 0px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    font-weight: bold;
}
.mainMenu:active {
  	transform: translate(1px, 1px);
	box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.5);
}

.mainMenu:hover {
    background-color: aliceblue;
}
</style>
</head>
<body>
    <header>
        <div id="menuContainer" class="container">
	        <form class="topMenuForm" method="post" action="IndexMain.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="����������">
			</form>
			<form class="topMenuForm" method="post"
				action="SearchBookPage.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="�����˻�">
			</form>
			<form class="topMenuForm" method="post"
				action="GetRentalBooks.do?rePage=RentBooksPage">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="�뿩���">
			</form>
			<form class="topMenuForm" method="post"
				action="BoardView.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="�Խ���">
			</form>
	        <form class="topMenuForm" method="post" action="MyPage.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="����������">
			</form>
	        <form class="topMenuForm" method="post" action="Logout.do">
				<input type="text" name="logout" value="logout" style="display: none;">
				<input class="headerMenus" type="submit" value="�α׾ƿ�">
			</form>
        </div>
    </header>
    <div id="v">
        <div class="container">
            <h1 id="mainTitle">${sessionScope.id}�� ȯ���մϴ�.</h1>
        </div>
        
    </div>
    <hr>
    <div id="main">
        <div class="container" id="mainMenuCon">
            <div>
                <form method="post" action="SearchBookPage.do">
                    <input class="mainMenu" type="submit" value="�����˻�">
                </form>
            </div>
            <div>
                <form method="post" action="GetRentalBooks.do?rePage=RentBooksPage">
                    <input class="mainMenu" type="submit" value="�뿩�� ���� Ȯ��">
                </form>
            </div>
            <div>
                <form method="post" action="MyPage.do">
                    <input class="mainMenu" type="submit" value="����������">
                </form>
            </div>
            <div>
                <form method="post" action="BoardView.do">
                    <input class="mainMenu" type="submit" value="�Խ���">
                </form>
            </div>
            <div>
                <form method="post" action="">
                    <input class="mainMenu" type="submit" value="��������">
                </form>
            </div>
        </div>
    </div>
</body>
</html>