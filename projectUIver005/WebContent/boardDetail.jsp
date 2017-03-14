<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="./mainHeader.jsp"%>
<link rel="stylesheet" href="${path}/css/menu.css">
<link rel="stylesheet" href="${path}/css/board.css">
</head>

<body class="size-1140">
	<!-- HEADER -->
	<%@ include file="./mainLoginHeader.jsp"%>
	<!-- MAIN -->
	<main role="main"> <%@ include file="./subMenuList.jsp"%>

	<section>
	<div class="container">
		<div class="stick stick-1"></div>
		<div class="stick stick-2"></div>
		<div class="stick stick-3"></div>
	</div>


	<div class="wrapper">
		<div class="table">
			<div class="row header">
				<div class="cell">게시글번호</div>
				<div class="cell">제목</div>
				<div class="cell">작성자</div>
				<div class="cell">조회수</div>
				<div class="cell">추천수</div>
				<div class="cell">작성일</div>
			</div>
			<div class="row">
				<div class="cell title">${getBoardDetail.bPno}</div>
				<div class="cell">${getBoardDetail.bTitle}</div>
				<div class="cell">${getBoardDetail.bAuthor}</div>
				<div class="cell">${getBoardDetail.bReadNum}</div>
				<div class="cell">${getBoardDetail.bLikeNum}</div>
				<div class="cell">${getBoardDetail.bDate}</div>
			</div>
			<div class="row header">
				<div class="cell">내용</div>
				<div class="cell"></div>
				<div class="cell"></div>
				<div class="cell"></div>
				<div class="cell"></div>
				<div class="cell"></div>
			</div>
			<div class="row">
				<div class="cell">${getBoardDetail.bCon}</div>
			</div>
			<div class="row">
				<form action="${path}/board/updateBoardPage.do" method="post">
			<input type="hidden" name="bPno" value="${getBoardDetail.bPno}">
			<input type="hidden" name="bNo" value="${getBoardDetail.bNo}">
			<input type="hidden" name="bTitle" value="${getBoardDetail.bTitle}">
			<input type="hidden" name="bCon" value="${getBoardDetail.bCon}">
			<input type="hidden" name="bDate" value="${getBoardDetail.bDate}">
			<input type="hidden" name="bReadNum"
				value="${getBoardDetail.bReadNum}"> <input type="hidden"
				name="bLikeNum" value="${getBoardDetail.bLikeNum}"> <input
				type="hidden" name="bAuthor" value="${getBoardDetail.bAuthor}">
				<%-- ${sessionScope.usrNick}
				${getBoardDetail.bAuthor} --%>
				
			<c:if test="${getBoardDetail.bAuthor eq  sessionScope.usrNick}">
				<input type=submit value="수정">
				${getBoardDetail.bPno}
				<input class="btn" type=button value="삭제"
					onclick="location.href='${path}/board/deleteBoard.do?bNo=${getBoardDetail.bNo}&bPno=${getBoardDetail.bPno}'">
			</c:if>
			
		</form>
			</div>
		</div>

		<div class="table">
			<div class="row header">
				<div class="cell">No</div>
				<div class="cell">작성자</div>
				<div class="cell">내 용</div>
				<div class="cell">작성일</div>
				<div class="cell"></div>
			</div>

			<c:forEach var="data" items="${getAllComment}">
				<div class="row">
					<div class="cell title">${data.commNo}</div>
					<div class="cell">${data.usrNick}</div>
					<div class="cell">${data.commCon}</div>
					<div class="cell">${data.commDate}</div>
					<div class="cell">			
						<c:if test="${data.usrNick eq  sessionScope.usrNick}">
							<!-- <input type=submit value="수정"> -->
							<input class="btn" type=button value="삭제"
									onclick="location.href='${path}/comment/deleteComment.do?commNo=${data.commNo}&bPno=${data.bPno}'">
									
						</c:if>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
	<!-- 댓글달기 -->
	<div style="wirdth: 650px;"text-align; center;">
		

		<form action="${path}/comment/writeComment.do" method="post">
			<textarea rows="5" cols="80" id="commentCon" name="commCon"
				placeholder="댓글을 작성해주세요"></textarea>
			<input type="hidden" name="bPno" value="${getBoardDetail.bPno}">
			<input type="hidden" name="usrNick" value="${sessionScope.usrNick}">
			<input type="submit" value="댓글작성">
		</form>

	</div>

	</section> </main>

	<!-- FOOTER -->
	<footer>
	<hr class="break margin-top-bottom-0"
		style="border-color: rgba(0, 38, 51, 0.80);">

	<!-- Bottom Footer --> <section
		class="padding background-dark full-width">
	<div class="s-12 l-6">
		<p class="text-size-12">Copyright 2017, ktds edu</p>
		<p class="text-size-12">All images have been gotten from pixabay
			which is free web site.</p>
	</div>
	<div class="s-12 l-6">
		<a class="right text-size-12"
			title="Responsee - lightweight responsive framework">Design and
			coding<br> by mom2mom Team
		</a>
	</div>
	</section> </footer>
	<script type="text/javascript" src="js/responsee.js"></script>
	<script type="text/javascript" src="owl-carousel/owl.carousel.js"></script>
	<script type="text/javascript" src="js/template-scripts.js"></script>
	<script type="text/javascript" src="js/modal.js"></script>

</body>
</html>