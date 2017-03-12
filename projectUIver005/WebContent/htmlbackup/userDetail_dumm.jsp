<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="${path}/css/menu.css">
	<link rel="stylesheet" href="${path}/css/board.css">
</head>

<body class="size-1140">
   	<!-- HEADER -->
    <!-- MAIN -->
    <main role="main">
	
		<section>
			<div class="container">
			  <div class="stick stick-1"></div>
			  <div class="stick stick-2"></div>
			  <div class="stick stick-3"></div>
			</div>
			<div style="text-align: center;">
		        <a href="${path}/user/getAllUser.do"><h4>회원목록</h4></a>
		    </div>
		    <hr>
		    
		    <!-- modal form -->
			<div id="id01" class="">
		      <form class="modal-content animate" action="./mainLogin.jsp" method="post">
		        <div class="imgcontainer">
		          <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
		          <img src="img/login-icon.png" alt="Avatar" class="avatar">
		        </div>
		        <div class="container">
			        <label><b>ID</b></label>
			        <input class="modaltext" type="text" name="usrName" value="${getUser.usrNick}" readonly="readonly">
			        <label><b>Nickname</b></label>
			        <input class="modalpassword" type="password" placeholder="맘투맘" name="userPassword" required>
			        <label><b>Password</b></label>
			        <input type="text" placeholder=" " name="psw" required>
			        <input type="text" placeholder=" " name="pswcheck" required>
			        <label><b>Email</b></label>
					<input class="modaltext" type="email" placeholder="example@example.com" name="userEmail" required>
					<label><b>Phone</b></label>
					<input class="modaltext" type="tel" placeholder="01012341234" name="userPhone" required>
					<label><b>Baby Birth</b></label>
					<input class="modaltext" type="number" placeholder="20151230" name="babyBirth" required>
					<label><b>Company</b></label>
					<input class="modaltext" type="text" placeholder="ktds" name="userCompany" required>
					
			        <button class="login" type="submit">수정</button>
			        
		        </div>
		        <div class="container" style="background-color:#fff">
		          <button class="login" type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">확인</button>
		          
		        </div>
		      </form>
		    </div>
		    
		    <hr>
			<div class="wrapper">
				<form name="form1" action="updateReq.do" method="post">
				<div class="table">
				  <div class="row header">
				  	<div class="cell">회원 정보</div>
				  	
				  </div>
					<div class="row">
						  <!-- usrNick은 수정이 불가능하도록 readonly속성 추가 -->
						<div class="cell">
							ID : <input name="usrNick" value="${getUser.usrNick}" readonly="readonly">
						</div>
					</div>
					<div class="row">
						<div class="cell">
							Email : <input name="usrEmail" value="${getUser.usrEmail}" readonly="readonly">
						</div>
					</div>
					<div class="row">
						<div class="cell">
							PW : <input type="password" value="${getUser.usrPw}" name="password">
						</div>
					</div>
					<div class="row">
						<div class="cell">
							PW : <input type="password" value="${getUser.usrPw}" name="password">
						</div>
					</div>
					<div class="row">
						<div class="cell">
							BabyBirth : <input name="usrBirth" value="${getUser.usrBirth}"></td>
						</div>
					</div>
					<div class="row">
						<div class="cell">
							Company <input name="usrCom" value="${getUser.usrCom}">
						</div>
					</div>
					<div class="row">
						<div class="cell">
							Grant :<input name="usrGrant" value="${getUser.usrGrant}" readonly="readonly">
						</div>
					</div>
					<div class="row">
						<div class="cell">
							Phone : <input name="usrPhone" value="${getUser.usrPhone}">
						</div>
					</div>
					<div class="row">
						<div class="cell">
							Exist : <input name="usrPhone" value="${getUser.usrPhone}" readonly="readonly">
						</div>
					</div>
					<div class="row">
					
					    <div class="cell">
							<input type="button" value="수정" id="btnUpdate">
                    		<input type="button" value="삭제" id="btnDelete">
					    </div>
					</div>
					  
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
    <script type="text/javascript" src="js/responsee.js"></script>
    <script type="text/javascript" src="owl-carousel/owl.carousel.js"></script>
    <script type="text/javascript" src="js/template-scripts.js"></script>
    <script type="text/javascript" src="js/modal.js"></script>
    
    <script>
    	// session으로 값 받아와야 함 ***
    	var grant = "<c:out value='${list[0].usrGrant}'/>";
		if(grant == 'admin'){
			$("#admin").show();	
		}else{
			$("#admin").hide();
		}
		
		// 수정버튼 로직
		$(document).ready(function(){
	        $("#btnUpdate").click(function(){
	            document.form1.action = "update.do";
	            document.form1.submit();
	        });
	    });
	</script>
  </body>
</html>