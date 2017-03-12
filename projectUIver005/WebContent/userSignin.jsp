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
   	<header role="banner" class="position-absolute">
      <!-- Top Navigation -->
      <nav class="background-transparent background-transparent-hightlight full-width sticky">
        <div class="s-12 l-2">
          <a href="${path}/mainUnlogin.jsp" class="logo">
            <!-- Logo White Version -->
            <img class="logo-white" src="${path}/img/kt-logo-main.png" width="30%" alt="">
            <!-- Logo Dark Version -->
            <img class="logo-dark" src="${path}/img/kt-logo-main.png" alt="">
          </a>
        </div>
        <div class="top-nav s-12 l-10">
          <p class="nav-text"></p>
          <ul class="right chevron">
            <li>
              <form action="mainLogin.jsp" method="post">
                <button type="button" class="welcome">
                  	환영합니다!
                </button>
            
              </form>
            </li>
          </ul>
        </div>
      </nav>
    </header>
    
    <!-- MAIN -->
    <main role="main">
			
		<section>
		
			<div class="container">
			  <div class="stick stick-1"></div>
			  <div class="stick stick-2"></div>
			  <div class="stick stick-3"></div>
			</div>
			
			
		    
		    <!-- modal form -->
			<div id="id01" class="">
			
		      <form name="form1" class="modal-content animate" action="${path}/user/insertUser.do" method="post">
		      	<div class="right">
		      		<h2><a href="${path}/findId.jsp">Forgot password?</a></h2>
		      	</div>
		        <div class="imgcontainer">
		          
		          <img src="${path}/img/login-icon.png" alt="Avatar" class="avatar">
		        </div>
		        <div class="container">
			        <label><b>ID</b></label>
			        <input class="modaltext" type="text" placeholder="Nickname" name="usrNick" required>
			        <label><b>Email</b></label>
			        <input class="modaltext" type="email" placeholder="example@example.com" name="usrEmail" required>
			        <label><b>Password</b></label>
			        <input class="modalpassword" type="password" placeholder="8자리 이상 숫자+영문자 권장" name="usrPw"" required>
			        <!-- <label><b>Password Check</b></label>
			        <input class="modalpassword" type="password" name="usrPw2" required> -->
			        <label><b>BabyBirth</b></label>
			        <input class="modaltext" type="date" style="ime-mode:inactive" placeholder="yyyy-mm-dd" name="usrBirth">
			        <label><b>Company</b></label>
			        <input class="modaltext" type="text" placeholder="kt, ktds, kth, .." name="usrCom">
			        <label><b>Phone</b></label>
			        <input class="modaltext" type="text" placeholder="01012341234" name="usrPhone" required>
			        
			        
			        <input type="hidden" name="usrExist" value="0">
			        <input type="hidden" name="usrGrant" value="Guest">
			        <input class="btn" type="submit" value="가입신청">
                    <input class="btn" type="reset" value="취소">
                    
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