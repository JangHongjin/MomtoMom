<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	  <%@ include file="./mainHeader.jsp" %> 
	<link rel="stylesheet" href="${path}/css/menu.css">
	<link rel="stylesheet" href="${path}/css/board.css">
</head>

<body class="size-1140">
   	<!-- HEADER -->
    <%@ include file="./mainLoginHeader.jsp" %>  
    
    <!-- MAIN -->
    <main role="main">
		 <%@ include file="./subMenuList.jsp" %> 
	
		<section>
			<div class="container">
			  <div class="stick stick-1"></div>
			  <div class="stick stick-2"></div>
			  <div class="stick stick-3"></div>
			</div>
			
		    
		    <!-- modal form -->
			<div id="id01" class="">
		      <form name="form1" class="modal-content animate" method="post"style=" width: 336px;">
		        <div class="imgcontainer">
		          <!-- <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span> -->
		          <img src="${path}/img/login-icon.png" alt="Avatar" class="avatar">
		        </div>
		        <div class="container">
			        <label><b>ID</b></label>
			        <input class="modaltext" name="usrNick" value="${getUser2.usrNick}" readonly="readonly"><br>
			        <label><b>Email</b></label>
			        <input class="modaltext" name="usrEmail" value="${getUser2.usrEmail}" readonly="readonly"><br>
			        <label><b>Company</b></label>
			        <input class="modaltext" name="usrCom" value="${getUser2.usrCom}"><br>
                    
			        <input class="btn" type="button" value="확인" onclick="location.href='${path}/message/getAllReceiveMessage.do?rid=${sessionScope.usrNick}'">
			        
			        
			      
                    <div style="color:red">${message}</div>
		        </div>
		      </form>
		    </div>
		  
		</section>
    </main>

    <!-- FOOTER -->
    <footer>
      <hr class="break margin-top-bottom-0" style="border-color: rgba(0, 38, 51, 0.80);">

      <!-- Bottom Footer -->
      <section class="padding background-dark full-width">
        <div class="s-12 l-6">
          <p class="text-size-12">Copyright 2017, ktds edu</p>
          <p class="text-size-12">All images have been gotten from pixabay which is free web site.</p>
        </div>
        <div class="s-12 l-6">
          <a class="right text-size-12" title="Responsee - lightweight responsive framework">Design and coding<br> by mom2mom Team</a>
        </div>
      </section>
    </footer>
    <script type="text/javascript" src="${path}/js/responsee.js"></script>
    <script type="text/javascript" src="${path}/owl-carousel/owl.carousel.js"></script>
    <script type="text/javascript" src="${path}/js/template-scripts.js"></script>
    <script type="text/javascript" src="${path}/js/modal.js"></script>
    
  
  </body>
</html>