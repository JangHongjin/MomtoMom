<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% String url = application.getContextPath(); %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
<br><br><br>

	<center>
		<h3>${param.errorMsg}</h3>
			
		<br><br><br>
		<a href="<%=url%>/mainLogin.jsp">���� ȭ������ �̵��ϱ�</a>
	</center>
	
</body>
</html>