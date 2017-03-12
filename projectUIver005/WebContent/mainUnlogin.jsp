<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="./mainHeader.jsp" %>
	<script>
		var grant = "<c:out value='${message}'/>";
		if(grant != ""){
			
			alert(grant);	
		}
		
	</script>
  </head>
	<%-- <c:set val="message" value=""/> --%>
  <body class="size-1140">
    <!-- HEADER -->
    <header role="banner" class="position-absolute">
      <!-- Top Navigation -->
      <nav class="background-transparent background-transparent-hightlight full-width sticky">
        <div class="s-12 l-2">
          <a href="mainUnlogin.jsp" class="logo">
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
              <form name="form1" method="post">
                <fieldset class="email">
                  <input placeholder="Email" type="email" name="usrEmail"/>
                </fieldset>
                <fieldset class="password">
                  <input placeholder="Password" type="password" name="usrPw"/>
                </fieldset>
                <button class="button" id="btnLogin">
                  <div class="fa fa-sign-in">&nbsp; 로그인</div>
                </button>
                
                <!-- <button class="button" type="button" onclick="document.getElementById('id01').style.display='block'">
                  <div class="fa fa-sign-out">회원가입/pw찾기</div>
                </button> -->
                <button class="button" type="button" onclick="location.href='${path}/userSignin.jsp'">
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
          <img src="${path}/img/login-icon.png" alt="Avatar" class="avatar">
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
      <!-- Main Header -->
      <header>
        <div class="carousel-default owl-carousel carousel-main carousel-nav-white background-dark text-center">
          <div class="item">
            <div class="s-12">
              <img src="${path}/img/header.jpg" alt="">
              <div class="carousel-content">
                <div class="content-center-vertical line">
                  <div class="margin-top-bottom-80">
                    <!-- Title -->
                    <h1 class="text-white margin-bottom-30 text-size-60 text-m-size-30 text-line-height-1">MOM to MOM </h1>
                    <div class="s-12 m-10 l-8 center"><p class="text-white text-size-14 margin-bottom-40">KT ktds kth m&s skylife nasmedia ktds kth m&s skylife nasmedia ktds kth m&s skylife nasmedia</p></div>
                    <div class="line">
                      <div class="s-12 m-12 l-3 center">
                        <a class="button button-white-stroke s-12" href="javascript:window.alert('\n로그인 해주셔야\n\n입장가능하십니다~~');">입장!</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </header>

      <section class="section background-white text-center">
        <div class="line">
          <h2 class="text-size-50 text-center">3월의 MOM to MOM</h2>
          <hr class="break-small background-primary break-center">
          <div class="carousel-default owl-carousel carousel-wide-arrows">
            <div class="item">
              <div class="s-12 m-12 l-7 center text-center">
                <img class="image-testimonial-small" src="img/baby3.jpg" alt="">
                <p class="h1 margin-bottom text-size-20">아이보는게 제일 쉬웠어요</p>
                <p class="h1 text-size-16">최마미 / 웹 개발 / ktds</p>
              </div>
            </div>
            <div class="item">
              <div class="s-12 m-12 l-7 center text-center">
                <img class="image-testimonial-small" src="img/baby2.jpg" alt="">
                <p class="h1 margin-bottom text-size-20">아이에게 많은 관심을 줄 수 있는 회사! </p>
                <p class="h1 text-size-16">이마미 / IT기획 / KT</h5>
              </div>
            </div>
            <div class="item">
              <div class="s-12 m-12 l-7 center text-center">
                <img class="image-testimonial-small" src="img/baby1.jpg" alt="">
                <p class="h1 margin-bottom text-size-20">비비디바비디부</p>
                <p class="h1 text-size-16">권마미 / DBA / ktds</p>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>

    <!-- FOOTER -->
    <footer>
      
      <!-- Main Footer -->
      
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
    <script>
	    $(document).ready(function(){
	        $("#btnLogin").click(function(){
	            // 태크.val() : 태그에 입력된 값
	            // 태크.val("값") : 태그의 값을 변경 
	            var userEmail = $("#userEmail").val();
	            var userPw = $("#userPw").val();
	            if(userEmail == ""){
	                alert("아이디를 입력하세요.");
	                $("#userEmail").focus(); // 입력포커스 이동
	                return; // 함수 종료
	            }
	            if(userPw == ""){
	                alert("아이디를 입력하세요.");
	                $("#userPw").focus();
	                return;
	            }
	            // 폼 내부의 데이터를 전송할 주소
	            document.form1.action="${path}/user/loginCheck.do"
	            // 제출
	            document.form1.submit();
	        });
	    });
	</script>
    
  </body>
</html>
