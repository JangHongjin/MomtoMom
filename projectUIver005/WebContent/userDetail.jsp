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
		      <form name="form1" class="modal-content animate" method="post">
		        <div class="imgcontainer">
		          <!-- <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span> -->
		          <img src="${path}/img/login-icon.png" alt="Avatar" class="avatar">
		        </div>
		        <div class="container">
			        <label><b>ID</b></label>
			        <input class="modaltext" name="usrNick" value="${getUser.usrNick}" readonly="readonly">
			        <label><b>Email</b></label>
			        <input class="modaltext" name="usrEmail" value="${getUser.usrEmail}" readonly="readonly">
			        <label><b>Password</b></label>
			        <input class="modalpassword" type="password" value="${getUser.usrPw}" name="usrPw">
			        <label><b>BabyBirth</b></label>
			        <input class="modaltext" name="usrBirth" value="${getUser.usrBirth}">
			        <label><b>Company</b></label>
			        <input class="modaltext" name="usrCom" value="${getUser.usrCom}">
			        <label><b>Grant</b></label>
			        <input class="modaltext" name="usrGrant" value="${getUser.usrGrant}" readonly="readonly">
			        <label><b>Phone</b></label>
			        <input class="modaltext" name="usrPhone" value="${getUser.usrPhone}">
			        <label><b>Exist</b></label>
			        <input class="modaltext" name="usrPhone" value="${getUser.usrExist}" readonly="readonly">
			        <label><b>회원가입일자</b></label>
			        <%-- <fmt:formatDate value="${dto.userRegdate}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
                    2017-03-10 hi<br>
                    
			        <input class="btn" type="button" value="수정" id="btnUpdate">
			        <input class="btn" type="button" value="탈퇴" id="btnDelete">
			      
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
    
    <script>
    		
		//수정버튼 로직		
		$(document).ready(function(){
	        $("#btnUpdate").click(function(){
	            // 확인 대화상자    
	            if(confirm("수정하시겠습니까?")){
	                document.form1.action = "${path}/user/updateUser.do";
	                document.form1.submit();
	            }
	        });
	    });
		//탈퇴버튼 로직
	    $(document).ready(function(){
	        $("#btnDelete").click(function(){
	            // 확인 대화상자 
	            if(confirm("탈퇴하시겠습니까?")){
	                document.form1.action = "${path}/user/deleteUser.do";
	                document.form1.submit();
	            }
	        });
	    });

		
	</script>
  </body>
</html>