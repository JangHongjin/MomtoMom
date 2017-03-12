<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="./mainHeader.jsp" %>
	<link rel="stylesheet" href="css/menu.css">
	<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	
  </head>

  <body class="size-1140">
    <!-- HEADER -->
    <header role="banner" class="position-absolute">
      <!-- Top Navigation -->
      <nav class="background-transparent background-transparent-hightlight full-width sticky">
        <div class="s-12 l-2">
          <a href="mainUnlogin.jsp" class="logo">
            <!-- Logo White Version -->
            <img class="logo-white" src="img/kt-logo-main.png" width="30%" alt="">
            <!-- Logo Dark Version -->
            <img class="logo-dark" src="img/kt-logo-main.png" alt="">
          </a>
        </div>
        <div class="top-nav s-12 l-10">
          <p class="nav-text"></p>
          <ul class="right chevron">

            <li>
              <form action="mainLogin.jsp" method="post">
                <fieldset class="email">
                  <input placeholder="Email" type="email" name="email"/>
                </fieldset>
                <fieldset class="password">
                  <input placeholder="Password" type="password" name="password"/>
                </fieldset>
                <button class="button" role="submit">
                  <div class="fa fa-sign-in">&nbsp 로그인11</div>
                </button>
                
                <button class="button" type="button" onclick="document.getElementById('id01').style.display='block'">
                  <div class="fa fa-sign-out">회원가입/pw찾기</div>
                </button>
              </form>
            </li>
          </ul>
        </div>
      </nav>
    </header>
	<div id="id01" class="modal">
      <form class="modal-content animate" action="./mainLogin.jsp" method="post">
        <div class="imgcontainer">
          <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
          <img src="img/login-icon.png" alt="Avatar" class="avatar">
        </div>
        <div class="container">
	        <label><b>ID</b></label>
	        <input class="modaltext" type="text" placeholder="Enter Username" name="userName" required>
	        <label><b>Nickname</b></label>
	        <input class="modalpassword" type="password" placeholder="Enter Nickname" name="userPassword" required>
	        <label><b>Password</b></label>
	        <input type="text" placeholder="Enter Password" name="psw" required>
	        <input type="text" placeholder="Repeat Password" name="pswcheck" required>
	        <label><b>Email</b></label>
			<input class="modaltext" type="email" placeholder="example@example.com" name="userEmail" required>
			<label><b>Phone</b></label>
			<input class="modaltext" type="tel" placeholder="- 없이 입력해주세요." name="userPhone" required>
			<label><b>Baby Birth</b></label>
			<input class="modaltext" type="number" placeholder="아기 출생년,월,일을 입력해주세요. ex)20151230" name="babyBirth" required>
			<label><b>Company</b></label>
			<input class="modaltext" type="text" placeholder="kt, ktds, kth .." name="userCompany" required>
			
	        <button class="login" type="submit">가입신청</button>
	        <a href="findId.jsp">ID/PW가 기억나지 않아요..</a>
	        <!-- <input type="checkbox" checked="checked"> Remember me -->
	        
        </div>

        <div class="container" style="background-color:#fff">
          <button class="login" type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
          <span class="psw">Forgot <a href="#" onClick="alert('왜까먹었니')">password?</a></span>
        </div>
      </form>
    </div>

    <!-- MAIN -->


    <main role="main">
	
	<!-- Content -->
      <article>
        <header class="section-small-padding background-dark">
          <div class="line">        
            <h2 class="text-white margin-top-40 margin-bottom-20 text-size-30 text-line-height-1">ID/PW 찾기</h2>
            <p class="margin-bottom-0 text-size-16">양식에 따라 메세지를 보내주세요.<br>
            	본인 인증 절차를 통해 회원 정보를 확인해드리겠습니다.</p>
          </div>  
        </header>
        <div class="section background-white"> 
          <div class="line margin-bottom-60">
            <div class="margin">
              <div class="s-12 m-12 l-4 margin-m-bottom">
                <div class="padding-2x block-bordered border-radius">
                  <div class="float-left hide-s">
                    <i class="icon-sli-location-pin icon3x text-primary"></i>
                  </div>
                <div class="margin-left-70 margin-s-left-0 margin-bottom">
                  <h3 class="margin-bottom-0">Company Address</h3>
                  <p>대한민국 서울특별시 서초구<br>
                     	효령로 176
                  </p>               
                </div>
                </div>
              </div>
              <div class="s-12 m-12 l-4 margin-m-bottom">
                <div class="padding-2x block-bordered border-radius">
                  <div class="float-left hide-s">
                    <i class="icon-sli-envelope icon3x text-primary"></i>
                  </div>
                  <div class="margin-left-70 margin-s-left-0 margin-bottom">
                    <h3 class="margin-bottom-0">E-mail</h3>
                    <p>contact@sampledomain.com<br>
                       office@sampledomain.com
                    </p>              
                  </div>
                </div>
              </div>
              <div class="s-12 m-12 l-4 margin-m-bottom">
                <div class="padding-2x block-bordered border-radius">
                  <div class="float-left hide-s">
                    <i class="icon-sli-phone icon3x text-primary"></i>
                  </div>
                  <div class="margin-left-70 margin-s-left-0">
                    <h3 class="margin-bottom-0">Phone Numbers</h3>
                    <p><span class="text-primary">Infoline: 010 0000 0000</span><br>
                       Office: 02 0000 0000<br>
                       Office 2: 02 0000 0000
                    </p>             
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="line">
            <div class="margin">
            
           		<iframe name="hiddeniframe" src="https://docs.google.com/forms/d/e/1FAIpQLSfl07WqpeMQOAyNRb2jc3fpe3ZBOCuqvMRr43F4wXsS3aKFfA/formResponse?" style="width:0;height:0;border:0; border:none;"></iframe>
              <!-- Contact Form -->
              <div class="s-12 m-12 l-6">
                <h2 class="margin-bottom-10">Leave Message</h2>
                <form class="customform" method="post" target="hiddeniframe">
                  <div class="line">
                    <div class="margin">
                      <div class="s-12 m-12 l-6">
                        <input name="entry.1014367274" id="entry.1014367274" class="email" placeholder="Your e-mail" title="Your e-mail" type="email" />
                        <p class="email-error form-error">Please enter your e-mail.</p>
                      </div>
                      <div class="s-12 m-12 l-6">
                        <input name="entry.802219975" id="entry.802219975" class="name" placeholder="Your name" title="Your name" type="text" />
                        <p class="name-error form-error">Please enter your name.</p>
                      </div>
                    </div>
                  </div>
                  <div class="s-12"> 
                    <input name="entry.2114674037" id="entry.2114674037" class="subject" placeholder="Subject" title="Subject" type="text" />
                    <p class="subject-error form-error">Please enter the subject.</p>
                  </div>
                  <div class="s-12">
                    <textarea name="entry.1556605091" id="entry.1556605091" class="message" placeholder="Your message" rows="3"></textarea>
                    <p class="message-error form-error">Please enter your message.</p>
                  </div>
                  <div class="s-12"><button class="s-12 button text-white" type="submit">Submit Button</button></div>
                </form>
                <div id="success">
           	        <p>Your Message was sent successfully</p>
           	    </div>
           	    <div id="error">
           	        <p>Your Message was not sent successfully</p>
           	    </div>	    
              </div>
              
              
              <div class="s-12 m-12 l-4">
                <h2 class="margin-bottom-10">Office Hours</h2>
                <div class="s-6">
                  <p class="text-size-16">
                  Monday<br>
                  Tuesday<br>
                  Wednesday<br>
                  Thursday<br>
                  Friday<br>
                  Saturday<br>
                  Sunday
                  </p>
                </div>
                <div class="s-6">
                  <p class="text-size-16 text-strong">
                  08.00-18.00<br>
                  08.00-18.00<br>
                  08.00-18.00<br>
                  08.00-18.00<br>
                  08.00-14.00<br>
                  08.00-14.00<br>
                  Close
                  </p>
                </div>
              </div>
            </div>    
          </div>  
        </div> 
      </article>
    
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
    <script type="text/javascript" src="js/responsee.js"></script>
    <script type="text/javascript" src="owl-carousel/owl.carousel.js"></script>
    <script type="text/javascript" src="js/template-scripts.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    
    <script language="JavaScript">
    	document.formagent.target="hiddeniframe";
    	document.formagent.submit();
    </script>
	

  </body>
</html>