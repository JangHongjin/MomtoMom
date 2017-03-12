<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl 시간 출력 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>

<header role="banner" class="position-absolute">
      <!-- Top Navigation -->
      <nav class="background-transparent background-transparent-hightlight full-width sticky">
        <div class="s-12 l-2">
          <a href="${path}/mainLogin.jsp" class="logo">
            <!-- Logo White Version -->
            <img class="logo-white" src="${path}/img/kt-logo-main.png" width="30%" alt="">
            <!-- Logo Dark Version -->
            <img class="logo-dark" src="${path}/img/kt-logo-main.png" alt="">
          </a>
        </div>
        <c:choose>
	        <c:when test="${sessionScope.usrNick == null}">
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
		                </button> ***-->
		                <button class="button" type="button" onclick="location.href='${path}/userSignin.jsp'">
		                  <div class="fa fa-sign-out">회원가입/pw찾기</div>
		                </button>
		                
		              </form>
		            </li>
		          </ul>
		        </div>
			</c:when>
			<c:otherwise>
			    <div class="top-nav s-12 l-10">
		       		<ul class="right chevron">
		       			<li>
						<form action="#" method="post">
							<div class="dropdown">
								<c:choose>
								<c:when test="${message == 'success'}">
									<button class="dropbtn">${sessionScope.usrNick} 님[관리자] 환영합니다!&nbsp;<div class="fa fa-bars" aria-hidden="true"></div></button>
									<div class="dropdown-content">
									    <!-- <a href="#" onclick="document.getElementById('id01').style.display='block'"">내 정보</a> -->
									    <a href="#" onclick="location.href='${path}/user/getUser.do?usrNick=${sessionScope.usrNick}'">내 정보</a>
									    <a href="board.jsp">내 글</a>
									    <a href="#">내 쪽지</a>
									    <a href="${path}/user/getAllUser.do">회원 관리</a>
									    <a href="${path}/user/logout.do">로그아웃</a>
									  </div>
								</c:when>
								<c:otherwise>
									<button class="dropbtn">${sessionScope.usrNick} 님[관리자]&nbsp;<div class="fa fa-bars" aria-hidden="true"></div></button>
									<div class="dropdown-content">
									    <!-- <a href="#" onclick="document.getElementById('id01').style.display='block'"">내 정보</a> -->
									    <a href="#" onclick="location.href='${path}/user/getUser.do?usrNick=${sessionScope.usrNick}'">내 정보</a>
									    <a href="board.jsp">내 글</a>
									    <a href="#">내 쪽지</a>
									    <a href="${path}/user/getAllUser.do">회원 관리</a>
									    <a href="${path}/user/logout.do">로그아웃</a>
									  </div>
								</c:otherwise>
								</c:choose>
							</div>
			            </form>
			            </li>
		        	</ul>
		        </div>
			</c:otherwise>
		</c:choose>
        
        
        
      </nav>
      
      	<!-- modal 1 -->
		<div id="id01" class="modal">
	      <form class="modal-content animate" action="${path}/mainLogin.jsp" method="post">
	        <div class="imgcontainer">
	          <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
	          <img src="${path}/img/login-icon.png" alt="Avatar" class="avatar">
	        </div>
	        <div class="container">
		        <label><b>ID</b></label>
		        <input class="modaltext" name="usrNick" value="${sessionScope.usrNick}" readonly="readonly">
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
		        
		        
		        <!-- <input class="btn" type="button" value="수정" id="btnUpdate"> -->
                   <!-- <input class="btn" type="button" value="삭제" id="btnDelete"> -->
                <div style="color: red;">${message}</div>
		        
	        </div>
	        
	      </form>
	    </div>
    </header>
    
    