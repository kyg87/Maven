<%@page import="com.newlecture.web.data.mysql.MySQLNoticeDao"%>
<%@page import="com.newlecture.web.data.view.NoticeView"%>
<%@page import="java.util.List"%>
<%@page import="com.newlecture.web.data.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- //<link href="../css/reset.css" type="text/css" rel="stylesheet" /> -->
<link href="/MavenPrj/resource/css/customer/style.css" type="text/css" rel="stylesheet" />
</head>
<script src="../js/customer/notice.js"></script>
<body>
	<!-- -------------header--------------------->
	<!-- 헤더부분 -->
	<tiles:insertAttribute name="header" />
	<!-- --------visual ----------------------->
	<!-- 비쥬얼 부분 -->
	<tiles:insertAttribute name="visual" />
	<!-- ----------------body --------------->
	<div id="body">
	<div class="content-container clearfix">
		
	<!-- 어사이드부분 -->
	<tiles:insertAttribute name="aside" />

	<!-- 메인부분 -->
	<tiles:insertAttribute name="main" />
	</div>
	
	</div>
	<!-- --------footer -------------------->
	<!-- 푸터부분 -->
	<tiles:insertAttribute name="footer" />
</body>
</html>