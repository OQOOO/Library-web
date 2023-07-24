<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
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
		align-items: center; /* 내부 요소를 수직으로 가운데 정렬 */
	
	}
	.title {
		display: flex;
		align-items: center; /* 내부 요소를 수직으로 가운데 정렬 */
	}
.content {
	width: 1000px;
}

.footer {
	display: flex;
}

.footer input {
	width: 100px;
	height: 45px;
	margin: 5px;
	font-size: 17px;
	background-color: white;
	box-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5);
	transition: transform 0.1s ease;	
}
.footer input:active {
  transform: translate(1px, 1px);
	box-shadow: 0px 0px 0px rgba(0, 0, 0, 0.5);
}


.card {
    

    box-shadow: 5px 6px 6px 2px #e9ecef;
    border-radius: 4px;
}

</style>
</head>

<body>
	<header>
        <div id="menuContainer" class="container">
        	<form class="topMenuForm" method="post" action="AdminMainPage.do">
				<input type="text" name="logout" value="1" style="display: none;">
				<input class="headerMenus" type="submit" value="메인페이지">
			</form>
        </div>
        </div>
    </header>
    <div id="main">
		<div class="midLine"></div>
    	<div class="post">
			<div class="postNum">
				${requestScope.vo.seq}
			</div>
					
			<div class="title">
				<a href="PostView.do?seq=${requestScope.vo.seq}"> ${requestScope.vo.title}</a>
			</div>
			<div class="timeContainer">
				<div>
					작성자: ${requestScope.vo.userId},  조회: ${requestScope.vo.views}
				</div>
				<div class="time">
					작성시간: ${requestScope.vo.createAt}
				</div>
				<div class="time">
					최근수정: ${requestScope.vo.updateAt}
				</div>
			</div>
		</div>
		<div class="midLine"></div>
		<div class="content">
			${vo.content}
		</div>
		<div class="midLine"></div>
		
		<div class="footer">
			<div>
				<form action="BoardView.do" method="post">
					<input type="submit" value="게시판으로">
				</form>
			</div>

				<div>
					<form action="${pageContext.request.contextPath}/delPostByAdmin.sp">
						<input type="hidden" name="seq" value="${requestScope.vo.seq}">
						<input type="submit" value="삭제">
					</form>
				</div>

		</div>
		<form action="${pageContext.request.contextPath}/InsertComment.sp">
			<input type="hidden" name="seq" value="${vo.seq }">
			<input type="text" name="content" style="width:500px">
			<input type="submit">		
		</form>
		
		<div class="container mt-5">
		<div class="row  d-flex justify-content-center">
			<div class="col-md-8">
				<div
					class="headings d-flex justify-content-between align-items-center mb-3">
					<h5>답변 목록</h5>

		
				</div>
				<c:forEach var="vo" items="${commentList}">
					
					<div style="margin: 10px;" class="card p-3">
					<div class="d-flex justify-content-between align-items-center">
						<div class="user d-flex flex-row align-items-center">
							<img src="https://static.vecteezy.com/system/resources/previews/002/219/582/non_2x/illustration-of-book-icon-free-vector.jpg" width="30"
								class="user-img rounded-circle mr-2"> 
								<span><small style="margin-left: 5px;" class="font-weight-bold text-primary">${vo.userId }</small> 
								<small class="font-weight-bold">${vo.content }</small></span>
						</div>
						<small>${vo.createAt }</small>
					</div>
					<div
						class="action d-flex justify-content-between mt-2 align-items-center">
				
							<form action="${pageContext.request.contextPath }/delComment.sp">
								<input type="hidden" name="seq" value="${vo.seq }">
								<input type="hidden" name="commentId" value="${vo.commentId}">
								<input type="submit" value="삭제">
							</form>

						<div class="icons align-items-center">
							<i class="fa fa-star text-warning"></i> <i
								class="fa fa-check-circle-o check-icon"></i>
						</div>
					</div>
				</div>
				</c:forEach>
		</div>
		</div>
	</div>
	
</body>
</html>