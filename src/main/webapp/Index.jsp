<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
    background-color: rgb(109, 189, 189);
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
<script>
    // �������� �ε�� �� ����� �Լ�
    window.onload = function() {
        
    let s = ${requestScope.SingupSuccess};
	    if(s === true) {
	    	alert("ȸ�����Կ� �����߽��ϴ�!");
	    }
    };
</script>
</head>
<body>

	<c:if test="${not empty sessionScope.id}">
    	<c:set var="nextURL" value="IndexMain.do" />
  	  	<c:redirect url="${nextURL}" />
	</c:if>
	
	    <header>
	    
        <div id="menuContainer" class="container">
            <form id="loginForm" method="post" action="LoginPage.do">
                <input id="loginbutton" class="headerMenus" type="submit" value="�α���">
            </form>
        </div>
    </header>
    <div id="v">
        <div class="container">
            <h1 id="mainTitle">���� ���� �ý���</h1>
        </div>
    </div>
    <hr>
    <div id="main">
        <div class="container" id="mainMenuCon">
            <div>
                <form method="post" action="LoginPage.do">
                    <input class="mainMenu" type="submit" value="�����˻�">
                </form>
            </div>
            <div>
                <form method="post" action="LoginPage.do">
                    <input class="mainMenu" type="submit" value="�����뿩">
                </form>
            </div>
            <div>
                <form method="post" action="LoginPage.do">
                    <input class="mainMenu" type="submit" value="�����ݳ�">
                </form>
            </div>
            <div>
                <form method="post" action="LoginPage.do">
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