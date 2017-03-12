<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원등록 페이지</title>
<%@ include file="./member_header.jsp" %>
</head>
<body>
<%@ include file="./member_menu.jsp" %>
    <h2>회원등록폼</h2>
    <form name="form1" method="post" action="insert.do">
        <table border="1" width="400px">
            <tr>
                <td>ID</td>
                <td><input type="text" name="usrNick"></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="usrEmail"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="usrPw"></td>
            </tr>
            <tr>
                <td>BabyBirth</td>
                <td><input type="text" name="usrBirth"></td>
            </tr>
            <tr>
                <td>Company</td>
                <td><input type="text" name="usrCom"></td>
            </tr>
            <tr>
                <td>Phone</td>
                <td><input type="tel" name="usrPhone"></td>
            </tr>
            
            <tr>
                <td colspan="2" align="center">
                	<input name="usrGrant" type="hidden" value="Guest">
                    <input type="submit" value="확인">
                    <input type="reset" value="취소">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
