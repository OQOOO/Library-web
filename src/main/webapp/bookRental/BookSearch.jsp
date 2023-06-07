<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="webapp/css/main.css">
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

.bookInfoDiv {
	background-color: #ededed;
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
.isRentText {
	color:red;
}

.lentButton {
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
.lentButton:hover {
	background-color: #f6fdfe;
}


.searchInput {
	width: 530px;
	height: 30px;
	margin-top: 5px;
}

#main {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

#main div {
	display: block;
}

#userSelect {
	font-size: 1.2em;
	font-weight: bold;
}

#searchDiv {
	position: relative;
	width: 700px;
}

#inputBox {
	position: absolute;
	left: 0px;
}

#inputBox div {
	display: flex;
	align-items: center;
	justify-content: center;
}

#inputBox p {
	display: inline;
	font-size: 1.5em;
	margin: 0px;
	margin-top: 2px;
	margin-right: 10px;
}

#submitButton {
	position: absolute;
	right: 0px;
	top: 5px;
	height: 118px;
	width: 100px;
}

#space {
	height: 130px;
}

#midLine {
	width: 100%;
	height:1px;
	margin-bottom: 10px;
	background-color: #a3a3a3;
}
</style>
</head>
<body>
	<c:set var="admin" value="${sessionScope.admin }"/>
	<header>
		<div id="menuContainer" class="container">
			<form class="topMenuForm" method="post" action="IndexMain.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="메인페이지">
			</form>
			<form class="topMenuForm" method="post"
				action="GetRentalBooks.do?rePage=RentBooksPage">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="도서반납">
			</form>
			<form class="topMenuForm" method="post" action="MyPage.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="마이페이지">
			</form>
			<form class="topMenuForm" method="post" action="Logout.do">
				<input type="text" name="logout" value="logout"
					style="display: none;"> <input class="headerMenus"
					type="submit" value="로그아웃">
			</form>
		</div>
	</header>

	<div id="main">
		<h2>원하는 조건으로 검색해보세요</h2>
		<form id="searchInputForm" method="post" action="BookSearch.do?re=bookSearch">
			<div id="searchDiv">
				<div id="inputBox">
					<div>
						<p>제목</p>
						<input class="searchInput" type="text" name="title">
					</div>
					<div>
						<p>작가</p>
						<input class="searchInput" type="text" name="writer">
					</div>
					<div>
						<p>출판</p>
						<input class="searchInput" type="text" name="publisher">
					</div>
				</div>

				<input id="submitButton" type="submit" value="검색">

			</div>
		</form>

		<div id="space"></div>
		<div id="midLine"></div>
		<div id="userSelect">
			<c:forEach items="${userSelect}" var="se" varStatus="status">
		        ${se}<c:if test="${!status.last}">,</c:if>
			</c:forEach>
			<c:if test="${not empty userSelect}"> 
		    (으)로 검색결과
		    </c:if>
		</div>

		<c:forEach items="${booksInfo}" var="vo">
			<div class="bookInfoDiv">
				<p class="bookInfoText" style="font-size:1.2em">${vo.bookName}</p>
				<p class="bookInfoText" style="font-size:0.8em">${vo.writer}</p>
				<c:if test="${not empty vo.rentUserId }">
					<c:if test="${not empty admin }">
						<p class="bookInfoText isRentText" style="font-size:0.8em">대여자 : ${vo.rentUserId }</p>
					</c:if>
					<c:if test="${empty admin }">
						<p class="bookInfoText isRentText" style="font-size:0.8em">해당 도서는 대여중입니다.</p>
					</c:if>
				</c:if>
				<c:if test="${empty vo.rentUserId }">
					<c:if test="${empty admin }">
					<form method="post" action="BookRent.do">
						<input type="hidden" name="isbn" value="${vo.isbn }">
						 
						<input type="hidden" name="bookName" value="${userSelect[0]}"> 
						<input type="hidden" name="writer" value="${userSelect[1]}"> 
						<input type="hidden" name="publisher" value="${userSelect[2]}"> 
						
						<input class="lentButton" type="submit" value="대여하기">
					</form>
					</c:if>
				</c:if>
				
			</div>
		</c:forEach>
	</div>

</body>
</html>