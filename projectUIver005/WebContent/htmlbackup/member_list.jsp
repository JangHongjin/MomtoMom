<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
<%@ include file="./member_header.jsp" %>
</head>
<body>
<%@ include file="./member_menu.jsp" %>
    <h2>회원 목록</h2>
    <input type="button" value="회원등록" onclick="location.href='${path}/member_write.jsp'">
    <table border="1" width="700px">
        <tr>
            <th>ID</th>
            <th>Email</th>
            <th>PW</th>
            <th>BabyBirth</th>
            <th>Company</th>
            <th>Grant</th>
            <th>Phone</th>
            <th>Exist</th>
            
        </tr>
        <c:forEach var="row" items="${list}">
        <tr>
            <!-- 회원정보 상세조회를 위해 a태그 추가 -->
            <td><a href="board/view.do?usrNick=${row.usrNick}">${row.usrNick}</a></td>
            <td>${row.usrEmail}</td>
			<td>${row.usrPw}</td>
			<td>${row.usrBirth}</td>
			<td>${row.usrCom}</td>
			<td>${row.usrGrant}</td>
			<td>${row.usrPhone}</td>
			<td>${row.usrExist}</td>            

            <td>빈칸</td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>
