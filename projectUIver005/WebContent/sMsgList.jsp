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
	
	<div class="wrapper" style="width: 1229px;">
	
	<h1>보낸 메시지함</h1>
	<div class="cell" style="width: 250px; float:right">
				<input class="button" value="받은메시지" onclick="location.href='${path}/message/getAllReceiveMessage.do?rid=${sessionScope.usrNick}'" style="width: 110px;">
				<input class="button" value="보낸메시지" onclick="location.href='${path}/message/getAllSendMessage.do?sid=${sessionScope.usrNick}'" style="width: 110px;">
			</div>
	
	
	
	
		<div class="table">
			<div class="row header">
				<div class="cell" style="width: 124px;">받은이</div>
				<div class="cell" style="height: 42px; padding-top: 10px;">내용</div>
				<div class="cell" style="padding-left: 27px;">작성일</div>
				<div class="cell"></div>
			</div>
		
			<c:forEach var="data" items="${getAllSendMessage}">
				<div class="row">
					<div class="cell title, dropdown">
						<a href="${path}/message/getAllSendMessage.do?sid=${data.msgRid}"><span id="idValue">${data.msgRid}</span></a>
						<div class="dropdown-content">
							<a href="#" onclick="location.href='${path}/user/getUser2.do?usrNick=${data.msgRid}'">정보보기</a>
							<a href="#" onclick="testFun('${data.msgRid}')">쪽지보내기</a>
						</div>
					</div>

					<div class="cell">${data.msgCon}</div>
					<div class="cell" style="width: 104px;">${data.msgDate}</div>

					<div class="cell" style="width: 74px;">
						<input class="button" value="삭제"
							onclick="location.href='${path}/message/deleteMessage2.do?msgNo=${data.msgNo}&sid=${sid}'"
							style="width: 60px;height: 30px;padding-left: 5px;padding-right: 5px;">
							
							
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
	<div id="id02" class="modal">
	<form name="form2" class="modal-content animate"
		action="${path}/message/writeMessage.do" method="post"
		style="width: 536px;">
		<div class="container" style="height: 333px;" id="idViewChoice">
				<span id="viewData"></span>님에게 보내실 쪽지<br> 
			<input type="hidden" name="msgSid" value="${sessionScope.usrNick}">
			<input type="hidden" id="msgRid" name="msgRid"> 
			<%-- <input type="hidden" name="msgRid" value="${data.msgRid}"><br> --%>
			<input class="modaltext2" type="textarea" placeholder="내용을 적어주세요." 
					name="msgCon" required style="height: 65%; width: 406px"><br>
			 <input	class="btn" type="submit" value="보내기"> 
			 <input class="btn" type="button" value="취소" onclick="location.href='${path}/message/getAllSendMessage.do?sid=${sessionScope.usrNick}'">
			 
		</div>
	</form>
</div>
	<script type="text/javascript" src="${path}/js/responsee.js"></script>
	<script type="text/javascript"
		src="${path}/owl-carousel/owl.carousel.js"></script>
	<script type="text/javascript" src="${path}/js/template-scripts.js"></script>
	<script type="text/javascript" src="${path}/js/modal.js"></script>
	<script>
		function testFun(v){
			
			var formData = document.getElementById('id02').style.display='block';
			document.getElementById("viewData").innerHTML = v; 	
			document.getElementById("msgRid").innerHTML = v; 		
			$('#msgRid').val(v);
		}
	</script>

</body>
</html>