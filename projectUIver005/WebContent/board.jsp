<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="./mainHeader.jsp" %>
	<link rel="stylesheet" href="css/menu.css">
	<link rel="stylesheet" href="css/board.css">
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
		
			<div class="wrapper">
		  
				<div class="table">
				  
				  <div class="row header">
				    <div class="cell">
				      	번호
				    </div>
				    <div class="cell">
				      	제목
				    </div>
				    <div class="cell">
				      	작성자
				    </div>
				    <div class="cell">
				      	조회
				    </div>
				    <div class="cell">
				      	test
				    </div>
				  </div>
				  
				  <div class="row">
				    <div class="cell">
				      1
				    </div>
				    <div class="cell title">
				      <a href="#">UI얼른끝내고싶다아아아아아</a>
				    </div>
				    <div class="cell">
				      NickName1
				    </div>
				    <div class="cell">
				      132
				    </div>
				    <div class="cell">
				      <button class="button" onclick="">
				      	승인
				      </button>
				    </div>
				  </div>
				  
				  <div class="row">
				    <div class="cell">
				      1
				    </div>
				    <div class="cell">
				      UI얼른끝내고싶다아아아아아
				    </div>
				    <div class="cell">
				      NickName1
				    </div>
				    <div class="cell">
				      132
				    </div>
				    <div class="cell">
				      <button class="button" onclick="">
				      	승인
				      </button>
				    </div>
				  </div>
				  
				  <div class="row">
				    <div class="cell">
				      1
				    </div>
				    <div class="cell">
				      UI얼른끝내고싶다아아아아아
				    </div>
				    <div class="cell">
				      NickName1
				    </div>
				    <div class="cell">
				      132
				    </div>
				    <div class="cell">
				      <button class="button" onclick="">
				      	승인
				      </button>
				    </div>
				  </div>
				  
				  <div class="row">
				    <div class="cell">
				      1
				    </div>
				    <div class="cell">
				      UI얼른끝내고싶다아아아아아
				    </div>
				    <div class="cell">
				      NickName1
				    </div>
				    <div class="cell">
				      132
				    </div>
				    <div class="cell">
				      <button class="button" onclick="">
				      	승인
				      </button>
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
  </body>
</html>