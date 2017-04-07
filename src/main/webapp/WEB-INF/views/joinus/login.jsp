<%@page import="javax.servlet.descriptor.TaglibDescriptor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	<header>
		<a href="index">Home</a>
		<a href="">로그인</a>
		<a href="agree.html">회원가입</a>
		<a href="customer/notice">고객센터</a>
	</header> -->
	<h1>로그인</h1>
	<form action="${root}/j_spring_security_check" method="post">
		<fieldset>			
			<table>
				<c:if test="${not empty validate && not validate}">
				<tr>
					<td colspan="2" style="color: red;">아이디 또는 비번이 유효하지 않습니다.</td>
				</tr>
				</c:if>
				<c:if test=""></c:if>
				<tr>
					<th>아이디:</th>
					<td><input name="j_username" type="text"/></td>
				</tr>
				<tr>
					<th>비밀번호:</th>
					<td><input name="j_password" type="password"/></td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="로그인"/>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>