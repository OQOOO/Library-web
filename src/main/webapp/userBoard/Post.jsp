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
	${requestScope.vo.title} | ${requestScope.vo.seq} | ${requestScope.vo.userId}<br>
	${requestScope.vo.content}<br>
	${requestScope.vo.createAt}<br>
	${requestScope.vo.updateAt}<br>
	${requestScope.vo.views}<br>
	
	<c:if test = "${sessionScope.id eq requestScope.vo.userId}">
		<form action="DeleteBoard.do" method="post">
			<input type="hidden" name = "postSeq" value="${requestScope.vo.seq}">
			<input type="submit" value="����">
		</form>
		<form action="UpdateBoard.do" method="post">
			<input type="hidden" name = "seq" value="${requestScope.vo.seq}">
			<input type="submit" value="����">
		</form>
	</c:if>
</body>
</html>