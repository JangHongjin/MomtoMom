<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 상세 페이지</title>
<%@ include file="./member_header.jsp" %>
<script>
    $(document).ready(function(){
        $("#btnUpdate").click(function(){
            document.form1.action = "update.do";
            document.form1.submit();
        });
    });
</script>

</head>
<body>
	<div style="text-align: center;">
        <a href="${path}/user/getAllUser.do"><h4>회원목록</h4></a>
    </div>
    <hr>
    <h2>회원정보 상세</h2>
    <form name="form1" action="updateReq.do" method="post">
        <table border="1" width="400px">
            <tr>
                <td>ID</td>
                 <!-- usrNick은 수정이 불가능하도록 readonly속성 추가 -->
                <td><input name="usrNick" value="${dto.usrNick}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input name="usrEmail" value="${dto.usrEmail}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" value="${dto.usrPw}" name="password"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" value="${dto.usrPw}" name="password"></td>
            </tr>
            <tr>
                <td>BabyBirth</td>
                <td><input name="usrBirth" value="${dto.usrBirth}"></td>
            </tr>
            <tr>
                <td>Company</td>
                <td><input name="usrCom" value="${dto.usrCom}"></td>
            </tr>
            <tr>
                <td>Grant</td>
                <td><input name="usrGrant" value="${dto.usrGrant}" readonly="readonly"></td>
            </tr>
            <tr>
                <td>Phone</td>
                <td><input name="usrPhone" value="${dto.usrPhone}"></td>
            </tr>
            <tr>
                <td>회원가입일자</td>
                <td>
                    <%-- <fmt:formatDate value="${dto.userRegdate}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
                    2017-03-10 hi
                </td>
            </tr>
            <tr>
                <td>회원정보 수정일자</td>
                <td>
                    <%-- <fmt:formatDate value="${dto.userUpdatedate}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
                    null hi
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="button" value="수정" id="btnUpdate">
                    <input type="button" value="삭제" id="btnDelete">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
