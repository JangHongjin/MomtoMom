<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

	<form name="form1" action="${path}/board/updateBoard.do?bPno=${getBoardDetail.bPno}&bNo=${getBoardDetail.bNo}&bDate=${getBoardDetail.bDate}&bLikeNum=${getBoardDetail.bLikeNum}&bReadNum=${getBoardDetail.bReadNum}&bAuthor=${getBoardDetail.bAuthor}" method="post">
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
					<div class="cell">
						<input name="bTitle" value="${getBoardDetail.bTitle}" placeholder="제목을 입력해주세요">
					</div>
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
					<div class="cell">
						<textarea name="bCon" id="content" rows="5" cols="80"  placeholder="내용을 입력해주세요">${getBoardDetail.bCon}</textarea>
					</div>
				</div>
				<div class="row">
					<br> <br>
				</div>
			</div>

		</div>
		<button type="submit" id="btnUpdate">수정</button>
		<button type="button" id="btnCancel">취소</button>
	</form>
	<!-- 댓글달기 --> </section> </main>

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