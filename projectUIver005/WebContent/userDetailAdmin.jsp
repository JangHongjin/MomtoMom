<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="./mainHeader.jsp" %>
	<link rel="stylesheet" href="${path}/css/menu.css">
	<link rel="stylesheet" href="${path}/css/board.css">
	<c:if test="${sessionScope.usrGrant != '관리자'}">
	    <script>
	        alert("관리자만 접근 가능한 페이지입니다.");
	        location.href="${path}/mainUnlogin.jsp"; 
	    </script>
	</c:if>
	
	<script>
	$(document).ready(function(){
		// ** 목록 버튼 클릭 이벤트 : 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
        $("#btnList").click(function(){
            //location.href="${path}/user/getAllUser.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
        	location.href="${path}/user/getAllUser.do";
        });
	});
	</script>
	
	
</head>

<body class="size-1140">
   	<!-- HEADER -->
   	<%@ include file="./mainLoginHeaderAdmin.jsp" %>
    
    <!-- MAIN -->
    <main role="main">
		<%@ include file="./subMenuList.jsp" %>
	
		<section>
			<div class="container">
			  <div class="stick stick-1"></div>
			  <div class="stick stick-2"></div>
			  <div class="stick stick-3"></div>
			</div>
			
			<div style="text-align: center;">
		        <h2>관리자 페이지</h2><br>
		        <button type="button" id="btnList">목록</button>
		        
		    </div>
		    <hr>
		    
		    <!-- modal form -->
			<div id="id01" class="">
		      <form name="form2" class="modal-content animate" method="post">
		        <div class="imgcontainer">
		          <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
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
			        <label for="gran"><b>Grant</b></label>
			        <input id="gran" list="grants" class="modaltext" name="usrGrant" value="${getUser.usrGrant}">
			        <datalist id="grants">
				      <option value="관리자">
				      <option value="일반1">
				      <option value="일반2">
				    </datalist>
			        <label><b>Phone</b></label>
			        <input class="modaltext" name="usrPhone" value="${getUser.usrPhone}">
			        <label><b>Exist</b></label>
			        <input class="modaltext" name="usrPhone" value="${getUser.usrExist}">
			        <label><b>회원가입일자</b></label>
			        <%-- <fmt:formatDate value="${dto.userRegdate}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
                    2017-03-10 hi<br>
			        
			        
			        <input class="btn" type="button" value="수정" id="btnUpdate">
                    <input class="btn" type="button" value="탈퇴" id="btnDelete">
                    <div style="color: red;">${message}</div>
	
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
	                document.form2.action = "${path}/user/updateUser.do";
	                document.form2.submit();
	            }
	        });
	    });
		//삭제버튼 로직
	    $(document).ready(function(){
	        $("#btnDelete").click(function(){
	            // 확인 대화상자 
	            if(confirm("삭제하시겠습니까?")){
	                document.form2.action = "${path}/user/deleteUser.do";
	                document.form2.submit();
	            }
	        });
	    });

		
	</script>
  </body>
</html>