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
	margin-bottom: 30px;
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

.userInfoDiv {
	background-color: #ededed;
	height: 120px;
	width: 700px;
	margin-top: 10px;
	border: solid 1px #cccccc;
	box-shadow: 3px 3px 0px rgba(0, 0, 0, 0.5);
	position: relative;
}

.userInfoText {
	margin:0px;
	margin-bottom: 5px;
	margin-top: 5px;
	margin-left: 5px;
}

.isAdminText {
	position:absolute;
	color:red;
	margin:0px;
	top: 5px;
	right: 10px;
}

.userRemoveButton {
	position: absolute;
	bottom:5px;
	right:5px;
}
.setAdminRightButton {
	position: absolute;
	bottom:5px;
	right:90px;
}

.bookManageButton {
	position: absolute;
	right: 215px;
	bottom: 5px;

	width: 100px;
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


#inputBox div {
	display: flex;
	align-items: center;
	justify-content: center;
}
#searchDiv {
	position: relative;
	width: 700px;
	height: 50px;
}


#userInput {
	position: absolute;
	left: 107px;
	height: 30px;
	width: 480px;
}

#userSelect {
	position: absolute;
	height: 36px;
	
}

#submitButton {
	position: absolute;
	right: 0px;

	height: 36px;
	width: 100px;
}


#space {
	height: 50px;
}



#midLine {
	width: 100%;
	height:1px;
	margin-bottom: 10px;
	background-color: #a3a3a3;
}


</style>
<script>
	function userRemoveCheck(delId) {
	
	  var result = confirm("정말 삭제하겠습니까? 유저가 대여중인 책이 있다면 반납 처리됩니다." + delId);
	  
	  if (result) {
		  var form = document.getElementById('del'+delId); // 폼의 ID를 선택
		  
		  if (form) {
		    form.submit(); // 폼 서브밋
		  }
	  } else {
	    // 취소 버튼을 클릭한 경우
	    console.log('취소');
	  }
	}
	
	function userSetAdminCheck(setId) {
	
	  var result = confirm("정말 해당 유저에게 관리자 권한을 부여하시겠습니까? 해당 유저가 대여한 책은 반납 처리됩니다." + setId);
	  
	  if (result) {
		  var form = document.getElementById('setAdmin'+setId); // 폼의 ID를 선택
		  
		  if (form) {
		    form.submit(); // 폼 서브밋
		  }
	  } else {
	    // 취소 버튼을 클릭한 경우
	    console.log('취소');
	  }
	}

</script>
</head>
<body>
	<c:set var="admin" value="${sessionScope.admin }"/>
	<header>
		<div id="menuContainer" class="container">
			<form class="topMenuForm" method="post" action="AdminMainPage.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="관리자 페이지">
			</form>
			<form class="topMenuForm" method="post"
				action="BookManagementPage.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="도서 관리">
			</form>
			<form class="topMenuForm" method="post" action="Logout.do">
				<input type="text" name="logout" value="logout"
					style="display: none;"> <input class="headerMenus"
					type="submit" value="로그아웃">
			</form>
		</div>
	</header>

	<div id="main">
		<h1>유저 관리 페이지</h1>
		<h2>유저 정보 검색</h2>
		<form id="searchInputForm" method="post" action="AdminUserSearch.do?re=page">
			<div id="searchDiv">

					<select id="userSelect" name="userSelect">
					  <option value="id">아이디</option>
					  <option value="name">이름</option>
					  <option value="email">이메일</option>
					  <option value="phoneNum">전화번호</option>
					</select>
					<input id="userInput" type="text" name="searchValue">


				<input id="submitButton" type="submit" value="검색">

			</div>
		</form>

		<div id="space"></div>
		<div id="midLine"></div>
		<div id="userSelect">

		</div>

		<c:forEach items="${UsersInfo}" var="vo">
			<div class="userInfoDiv">
				<p class="userInfoText" style="font-size:1.0em">ID: ${vo.id}</p>
				<c:if test="${vo.adminRight eq 1 }">
					<p class="isAdminText" style="font-size:1.0em">관리자</p>
				</c:if>
				<p class="userInfoText" style="font-size:0.8em">이름: ${vo.name}</p>
				<p class="userInfoText" style="font-size:0.8em">생년월일: ${vo.birthDate}</p>
				<p class="userInfoText" style="font-size:0.8em">이메일: ${vo.email}</p>
				<p class="userInfoText" style="font-size:0.8em">전화번호: ${vo.phoneNum}</p>
				
				<input class="userRemoveButton" type="button" onclick="userRemoveCheck('${vo.id}')" value="유저 삭제">
				<form id="del${vo.id}" action="AdminUserRemove.do" method="post">
					<input type="hidden" name="adminSelect" value=${adminSelect }>
					<input type="hidden" name="adminInput" value=${adminInput }>
					<input type="hidden" name="userId" value=${vo.id }>
				</form>
				
				<input class="setAdminRightButton" type="button" onclick="userSetAdminCheck('${vo.id}')" value="관리자권한 부여">
				<form id="setAdmin${vo.id}" action="AdminSetUserAdmin.do" method="post">
					<input type="hidden" name="adminSelect" value=${adminSelect }>
					<input type="hidden" name="adminInput" value=${adminInput }>
					<input type="hidden" name="userId" value=${vo.id }>
				</form>
				
				<form action="AdminUserBookManagementPage.do" method="post">
					<input type="hidden" name="adminSelect" value=${adminSelect }>
					<input type="hidden" name="adminInput" value=${adminInput }>
					<input type="hidden" name="userId" value=${vo.id }>
					<input class="bookManageButton" type="submit" value="대여도서 확인">
				</form>
				
				
				
			</div>
		</c:forEach>
	</div>

</body>
</html>