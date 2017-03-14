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
		    /* location.href="${path}/mainLogin.jsp"; */
		   	location.href="javascript:history.back()"
		</script>
	</c:if>
	<script>
		var grant = "<c:out value='${message}'/>";
		if(grant != ""){
			alert(grant);	
		}
		// **원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	    function list(page){
	        location.href="${path}/user/getAllUser.do?curPage="+page+"&searchOption=${map.searchOption}"+"&keyword=${map.keyword}";
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
			<h2>회원 목록</h2>
		    <form name="form3" method="post" action="${path}/user/getAllUser.do">
		        <select name="searchOption">
		            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
		            <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >닉네임+이메일+휴대전화</option>
		            <option value="usr_nick" <c:out value="${map.searchOption == 'usr_nick'?'selected':''}"/> >닉네임</option>
		            <option value="usr_email" <c:out value="${map.searchOption == 'usr_email'?'selected':''}"/> >이메일</option>
		            <option value="usr_phone" <c:out value="${map.searchOption == 'usr_phone'?'selected':''}"/> >휴대전화</option>
		        </select>
		        <input type="text" name="keyword" value="${map.keyword}">
		        <input class="search" type="submit" value="조회">
		    </form>
		    <!-- 레코드의 갯수를 출력 -->
		    ${map.count}명의 회원이 있습니다.

			<div class="wrapper">
				<div class="table">
				  <div class="row header">
				  	<div class="cell">Index</div>
				    <div class="cell">ID</div>
				    <div class="cell">Email</div>
				    <div class="cell">PW</div>
				    <div class="cell">BabyBirth</div>
				    <div class="cell">Company</div>
				    <div class="cell">Grant</div>
				    <div class="cell">Phone</div>
				    <div class="cell">Exist</div>
				    <!-- <div class="cell">Grant Management</div> -->
				  </div>
				  <c:forEach var="data" items="${map.list}">
				  	<div class="row">
				  		<div class="cell">${data.rnum}</div>
					    <div class="cell title">
						    <!-- ** 게시글 상세보기 페이지로 이동시 게시글 목록페이지에 있는 검색조건, 키워드, 현재페이지 값을 유지하기 위해 -->
            				<a href="${path}/user/getUserAdmin.do?usrNick=${data.usrNick}&curPage=${map.listPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${data.usrNick}</a>
					    	<%-- <a href="${path}/user/getUserAdmin.do?usrNick=${data.usrNick}">${data.usrNick}</a> --%>
					    </div>
					    <div class="cell">${data.usrEmail}</div>
					    <div class="cell">${data.usrPw}</div>
					    <div class="cell">${data.usrBirth}</div>
					    <div class="cell">${data.usrCom}</div>
					    <div class="cell">${data.usrGrant}</div>
					    <div class="cell">${data.usrPhone}</div>
					    <div class="cell">${data.usrExist}</div>
					    <%-- <div class="cell">
					    	<form name="formUserList" class="format" method="post">
								<!-- <button class="listbtn" onclick="">탈퇴</button> -->
								<input type="hidden" value="${data.usrNick}" name="usrNick">
								<input type="hidden" value="${data.usrEmail}" name="usrEmail">
								<input type="hidden" value="${data.usrPw}" name="usrPw">
								
								<input class="listbtn" type="button" value="탈퇴" id="btnDelete">
							    
							    <div class="dropdown">
								  <button class="listbtn">권한부여&nbsp; &nbsp;<div class="fa fa-bars" aria-hidden="true"></div></button>
								  <div class="dropdown-content">
								    <a href="#" onclick="">Admin</a>
								    <a href="#">Manager</a>
								    <a href="#">User</a>
								    <a href="#">Guest</a>
								  </div>
								</div>
							</form>
					    </div> --%>
					  
					</div>
				  </c:forEach>
				  <div class="row">
					    <div class="cell col-5">
					    	<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
			                <c:if test="${map.listPager.curBlock > 1}">
			                    <a href="javascript:list('1')">[처음]</a>
			                </c:if>
			                
			                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
			                <c:if test="${map.listPager.curBlock > 1}">
			                    <a href="javascript:list('${map.listPager.prevPage}')">[이전]</a>
			                </c:if>
			                
			                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
			                <c:forEach var="num" begin="${map.listPager.blockBegin}" end="${map.listPager.blockEnd}">
			                    <!-- **현재페이지이면 하이퍼링크 제거 -->
			                    <c:choose>
			                        <c:when test="${num == map.listPager.curPage}">
			                            <span style="color: red">${num}</span>&nbsp;
			                        </c:when>
			                        <c:otherwise>
			                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
			                        </c:otherwise>
			                    </c:choose>
			                </c:forEach>
			                
			                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
			                <c:if test="${map.listPager.curBlock <= map.listPager.totBlock}">
			                    <a href="javascript:list('${map.listPager.nextPage}')">[다음]</a>
			                </c:if>
			                
			                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
			                <c:if test="${map.listPager.curPage <= map.listPager.totPage}">
			                    <a href="javascript:list('${map.listPager.totPage}')">[끝]</a>
			                </c:if>
					    	
					    </div>
				  </div>
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
    
    <script>
    	
		//수정버튼 로직		
		$(document).ready(function(){
	        $("#btnUpdate").click(function(){
	            // 확인 대화상자    
	            if(confirm("수정하시겠습니까?")){
	                document.formUserList.action = "${path}/user/updateUser.do";
	                document.formUserList.submit();
	            }
	        });
	    });
		//삭제버튼 로직
	    $(document).ready(function(){
	        $("#btnDelete").click(function(){
	            // 확인 대화상자 
	            if(confirm("삭제하시겠습니까?")){
	                //document.formUserList.action = "${path}/user/deleteUser.do";
	                document.getElementById("formUserList").action = "${path}/user/deleteUser.do";
	                document.getElementById("formUserList").submit();
	            }
	        });
	    });

		
	</script>
    
    
  </body>
</html>