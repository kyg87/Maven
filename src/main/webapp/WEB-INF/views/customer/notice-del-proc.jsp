<%-- <%@page import="com.newlecture.web.data.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String code=request.getParameter("c");

	NoticeDao noticeDao = new MySQLNoticeDao();
	int result = noticeDao.delete(code);
	
	if(result>0)
		response.sendRedirect("notice.jsp");

%> --%>