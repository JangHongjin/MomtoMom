<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="./mainHeader.jsp" %>
	<link rel="stylesheet" href="${path}/css/menu.css">
	<link rel="stylesheet" href="${path}/css/board.css">
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
			<h2>${boardNmae} 게시판입니다.</h2>
		    <form name="formBoardSearch" method="post" action="${path}/board/getBoardList.do">
		        <select name="searchOption">
		            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
		            <option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/> >닉네임+내용+제목</option>
		            <option value="bAuthor" <c:out value="${map.searchOption == 'bAuthor'?'selected':''}"/> >닉네임</option>
		            <option value="bCon" <c:out value="${map.searchOption == 'bCon'?'selected':''}"/> >내용</option>
		            <option value="bTitle" <c:out value="${map.searchOption == 'bTitle'?'selected':''}"/> >제목</option>
		        </select>
		        <input type="text" name="keyword" value="${map.keyword}">
		        <input class="search" type="submit" value="조회">
		        <!-- <button type="button" id="btnWrite">글쓰기</button> -->
		    </form>
		    
		    <!-- 게시글 수 -->
		    ${map.count}명의 회원이 있습니다.
			
			<div class="wrapper">
				<div class="table">
				  <div class="row header">
				    <div class="cell">게시글번호</div>
				    <div class="cell">제목</div>
				    <div class="cell">작성자</div>
				    <div class="cell">조회수</div>
				    <div class="cell">추천수</div>
				    <div class="cell">작성일</div>
				  </div>
				  <%-- <c:forEach var="data" items="${map.list}">
				  	
				  	<c:if test="ture">
					  	<div class="row">
						    <div class="cell title">${data.bPno} </div>
						    <div class="cell"><a href="${path}/board/getBoardDetail.do?bNo=${data.bNo}&bPno=${data.bPno}">${data.bTitle} [${data.commentCount}]</a></div>
						    <div class="cell">${data.bAuthor}</div>
						    <div class="cell">${data.bReadNum}</div>
						    <div class="cell">${data.bLikeNum}</div>
						    <div class="cell">${data.bDate}</div>
					    </div>
				    </c:if>
				  </c:forEach> --%>
				  <c:forEach var="data" items="${map.list}">
				  	<div class="row">
					    <div class="cell title">${data.bPno} </div>
					    <div class="cell"><a href="${path}/board/getBoardDetail.do?bNo=${data.bNo}&bPno=${data.bPno}">${data.bTitle} [${data.commentCount}]</a></div>
					    <div class="cell">${data.bAuthor}</div>
					    <div class="cell">${data.bReadNum}</div>
					    <div class="cell">${data.bLikeNum}</div>
					    <div class="cell">${data.bDate}</div>
					    </div>
				  </c:forEach>
				</div>
				
				
		
		<input class="button" value="글쓰기" onclick="document.getElementById('id02').style.display='block'">
		
		<div id="id02" class="modal">
			
			<form name="form2" class="modal-content animate"
				action="${path}/board/boardWrite.do" method="post"
				style="width: 536px;">
				<div class="imgcontainer">
		          <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
		        </div>
				<div class="container" style="height: 80%;">
					제목
					<input type="hidden" name="bAuthor" value="${sessionScope.usrNick}"> 
					<input type="hidden" name="bNo" value="${bNo}"><br>
					<input class="modaltext2" type="textarea" placeholder="제목을 적어주세요."
						name="bTitle" required style="height: 15%; width: 406px">
						<br><br>
						내용
						<input class="modaltext2" type="textarea" placeholder="내용을 적어주세요."
						name="bCon" required style="height: 65%; width: 406px">
					<input class="btn" type="submit" value="보내기"> 
					<input class="btn" type="reset" value="취소" id="m_close">
				</div>
			</form>
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
    <script type="text/javascript" src="js/responsee.js"></script>
    <script type="text/javascript" src="owl-carousel/owl.carousel.js"></script>
    <script type="text/javascript" src="js/template-scripts.js"></script>
    <script type="text/javascript" src="js/modal.js"></script>
    
  </body>
</html>