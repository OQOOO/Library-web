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

.post {
	display: grid;
    grid-template-columns: 50px 700px 250px;
    grid-template-rows: 70px;
    
}
	.post div {
		
		
	}
	
	.timeContainer {
		text-align: right;
		display: grid;
		grid-template-columns: 1fr;
		grid-template-rows: 1.5fr 1fr 1fr;
	}
		.time {
			font-size: 10px;
		}
	.postNum {
		display: flex;
		align-items: center; /* ���� ��Ҹ� �������� ��� ���� */
	
	}
	.title {
		display: flex;
		align-items: center; /* ���� ��Ҹ� �������� ��� ���� */
	}
a:link {
  color: blue; /* �̹湮 ��ũ�� ���� */
  text-decoration: none;
}

a:visited {
  color: purple; /* �湮�� ��ũ�� ���� */
}
	
.buttonsDivMid {
	display: flex;
}

.insertButton {
	width: 100px;
	height: 45px;
	margin: 5px;
	font-size: 17px;
	background-color: white;
	box-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	transition: transform 0.1s ease;	
}
.insertButton:active {
  transform: translate(1px, 1px);
	box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.5);
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
    <div id="main">
	    <h1>�Խ���</h1>
	    <div class="buttonsDivMid">
			<form action="IndexMain.do" method="post">
				<input class="insertButton" type="submit" value="�ڷ�">
			</form>
			<form action="InsertBoard.do" method="post">
				<input class="insertButton" type="submit" value="�� �� �ۼ�">
			</form>
		</div>
		<div class="midLine"></div>
		<c:forEach  var="post" items="${postList}">
			<div class="post">
				<div class="postNum">
					${post.seq}
				</div>
					
				<div class="title">
					<a href="PostView.do?seq=${post.seq}"> ${post.title}</a>
				</div>
				<div class="timeContainer">
					<div>
						�ۼ���: ${post.userId},  ��ȸ: ${post.views}
					</div>
					<div class="time">
						�ۼ��ð�: ${post.createAt}
					</div>
					<div class="time">
						�ֱټ���: ${post.updateAt}
					</div>
				</div>
			</div>
			<div class="midLine"></div>
		</c:forEach>
	</div>
</body>
</html>