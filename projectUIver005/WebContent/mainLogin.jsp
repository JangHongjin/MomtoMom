<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="./mainHeader.jsp" %>
	<link rel="stylesheet" href="${path}/css/menu.css">
	
  </head>

  <body class="size-1140">
    
	<!-- HEADER -->
    <%@ include file="./mainLoginHeader.jsp" %>
	
    <!-- MAIN -->
    <%@ include file="./menuList.jsp" %>
    

    <!-- FOOTER -->
    <%@ include file="./footer.jsp" %>
    
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
	            document.form1.action="<c:out value='${path}'/>/user/loginCheck.do"
	            // 제출
	            document.form1.submit();
	        });
	    });
	</script>
    
  </body>
</html>