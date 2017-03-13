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
		    location.href="${path}/mainLogin.jsp"; 
		</script>
	</c:if>
	<script>
		var grant = "<c:out value='${message}'/>";
		if(grant != ""){
			alert(grant);	
		}
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
			<h2>게시글 목록</h2>
		    <form name="form3" method="post" action="${path}/user/getAllUser.do">
		        <select name="searchOption">
		            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
		            <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >닉네임+이메일+휴대전화</option>
		            <option value="usr_nick" <c:out value="${map.searchOption == 'usr_nick'?'selected':''}"/> >닉네임</option>
		            <option value="usr_email" <c:out value="${map.searchOption == 'usr_email'?'selected':''}"/> >이메일</option>
		            <option value="usr_phone" <c:out value="${map.searchOption == 'usr_phone'?'selected':''}"/> >휴대전화</option>
		        </select>
		        <input name="keyword" value="${map.keyword}">
		        <input type="submit" value="조회">
<!-- 		        <button type="button" id="btnWrite">글쓰기</button> -->
		    </form>
		    <!-- 레코드의 갯수를 출력 -->
		    ${map.count}명의 회원이 있습니다.

			<div class="wrapper">
				<div class="table">
				  <div class="row header">
				    <div class="cell">ID</div>
				    <div class="cell">Email</div>
				    <div class="cell">PW</div>
				    <div class="cell">BabyBirth</div>
				    <div class="cell">Company</div>
				    <div class="cell">Grant</div>
				    <div class="cell">Phone</div>
				    <div class="cell">Exist</div>
				    <div class="cell">Grant Management</div>
				  </div>
				  <c:forEach var="data" items="${map.list}">
				  	<div class="row">
					    <div class="cell title">
					      <a href="${path}/user/getUserAdmin.do?usrNick=${data.usrNick}">${data.usrNick}</a>
					    </div>
					    <div class="cell">${data.usrEmail}</div>
					    <div class="cell">${data.usrPw}</div>
					    <div class="cell">${data.usrBirth}</div>
					    <div class="cell">${data.usrCom}</div>
					    <div class="cell">${data.usrGrant}</div>
					    <div class="cell">${data.usrPhone}</div>
					    <div class="cell">${data.usrExist}</div>
					    <div class="cell">
							<button class="button" onclick="">
							    	탈퇴
							    </button>
							    <div class="dropdown">
							  <button class="dropbtn">권한부여&nbsp; &nbsp;<div class="fa fa-bars" aria-hidden="true"></div></button>
							  <div class="dropdown-content">
							    <a href="#" onclick="">Admin</a>
							    <a href="#">Manager</a>
							    <a href="#">User</a>
							    <a href="#">Guest</a>
							  </div>
							</div>
					    </div>
					  </div>
				  </c:forEach>
				</div>
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