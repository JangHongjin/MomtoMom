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


	<div class="wrapper">
		<div class="table">
			<div class="row header">
				<div class="cell">제목</div>
			</div>
			<div class="row">
				<form name = "form1" action="${path}/board/boardWrite.do?bNo=${getBoardList.getbNo}" method="post">
					<input type="text" rows="20" cols="50" id="bCon" name="bCon">
					<div class="row header">
						<div class="cell">내용</div>
					</div>
					<textarea rows="20" cols="80" id="bCon" name="bCon"></textarea>
					<input type="submit" value="등   록">
				</form>


				 <div id="id02" class="modal">
					<form name="form2" class="modal-content animate"
						action="${path}/board/boardWrite.do" method="post">
						<div class="container" style="height: 333px;">
							제목<br> 
							<input type="hidden"
								name="bAuthor" value="${sessionScope.usrNick}">  
							
							<input
								class="modaltext" type="textarea" colspan="66"
								placeholder="제목을 적어주세요." name="bTitle" required
								style="height: 15%;">
								내용
								<input
								class="modaltext" type="textarea" colspan="66"
								placeholder="내용을 적어주세요." name="bCon" required
								style="height: 65%;">
								<input class="btn" type="submit" value="보내기"> 
								<input class="btn" type="reset" value="취소">
						</div>
					</form>
				</div> 
        </div>
        </form>
    </div>

			</div>
		</div>
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