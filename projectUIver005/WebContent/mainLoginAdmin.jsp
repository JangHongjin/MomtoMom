<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="./mainHeader.jsp" %>
	<link rel="stylesheet" href="${path}/css/menu.css">
	
  </head>

  <body class="size-1140">
    
	<!-- HEADER -->
    <%@ include file="./mainLoginHeaderAdmin.jsp" %>
	
    <!-- MAIN -->
    <%@ include file="./menuList.jsp" %>
    

    <!-- FOOTER -->
    <%@ include file="./footer.jsp" %>
    
    <script type="text/javascript" src="${path}/js/responsee.js"></script>
    <script type="text/javascript" src="${path}/owl-carousel/owl.carousel.js"></script>
    <script type="text/javascript" src="${path}/js/template-scripts.js"></script>
    <script type="text/javascript" src="${path}/js/modal.js"></script>
    
  </body>
</html>