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
	<%@ include file="./mainLoginHeaderAdmin.jsp"%>

	<!-- MAIN -->
	<main role="main"> <%@ include file="./subMenuList.jsp"%>

	<section>
<!-- 	<div class="container">
		<div class="stick stick-1"></div>
		<div class="stick stick-2"></div>
		<div class="stick stick-3"></div>
	</div> -->
				<input type="button" value="받은 메시지함" onclick="location.href='${path}/message/getAllReceiveMessage.do?rid=${sessionScope.usrNick}'"/><br>
			<input type="button" value="보낸 메시지함" onclick="location.href='${path}/message/getAllSendMessage.do?sid=${sessionScope.usrNick}'"/>
	<div class="wrapper" style=" width: 1229px;">
		<div class="table">
			<div class="row header">
				<div class="cell">받은이</div>
				<div class="cell" style=" height: 42px; padding-top: 10px;">내용</div>
				<div class="cell" style=" padding-left: 27px;">작성일</div>
				<div class="cell"></div>
			</div>
			<c:forEach var="data" items="${getAllSendMessage}">
				<div class="row">
					<div class="cell title">
						<a
							href="${path}/message/getAllSendMessage.do?rid=${data.msgRid}">${data.msgRid}</a>
					</div>
					<div class="cell">${data.msgCon}</div>
					<div class="cell" style="width: 104px;">${data.msgDate}</div>
					
					<div class="cell" style=" width: 74px;">
						<input class="button" value="삭제" onclick="location.href='${path}/message/deleteMessage2.do?msgNo=${data.msgNo}&sid=${sid}'" style="
    width: 70px;">
					</div>
				</div>
			</c:forEach>
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
	<script type="text/javascript" src="${path}/js/responsee.js"></script>
	<script type="text/javascript"
		src="${path}/owl-carousel/owl.carousel.js"></script>
	<script type="text/javascript" src="${path}/js/template-scripts.js"></script>
	<script type="text/javascript" src="${path}/js/modal.js"></script>


</body>
</html>