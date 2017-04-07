<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<c:set var="root" value="${pageContext.request.contextPath}"/>  


<aside id="aside">
	<h1 class="aside-title aside-main-title aside-margin">teacher PAGE</h1>
	<nav>
		<h1>마이페이지 메뉴</h1>
		
		<ul>
			<security:authorize ifAnyGranted="ROLE_ADMIN">
			<li class="aside-menu-item"><a class="aside-menu-item-link"
				href="${root}/admin/index">관리자홈</a></li>
			</security:authorize>
			
			<security:authorize ifAnyGranted="ROLE_TEACHER">
			<li class="aside-menu-item"><a class="aside-menu-item-link"
				href="${root}/teacher/index">선생님</a></li>
			</security:authorize>
	
			<li class="aside-menu-item"><a class="aside-menu-item-link"
				href="${root}/student/index">학생</a></li>
		
		</ul>
		
	</nav>
	
	<nav>
		<h1>수강 메뉴</h1>
		
		<ul>
			<li class="aside-menu-item"><a class="aside-menu-item-link"
				href="">입금확인</a></li>
			<li class="aside-menu-item"><a class="aside-menu-item-link"
				href="">확인된 목록</a></li>
			<li class="aside-menu-item"><a class="aside-menu-item-link"
				href="">학습안내</a></li>
		</ul>
		
	</nav>
	



	<nav>
		<h1 class="aside-title margin">추천사이트</h1>
		<ul class="margin">
		
<%-- 			<li><a href=""><img src="/<%=request.getServletContext().getContextPath()%>MavenPrj/resource/images/answeris.png" alt="앤서이즈"></a></li> --%>
<%--			<li><a href=""><img src="${pageContext.request.contextPath}/resource/images/answeris.png" alt="앤서이즈"></a></li> 						--%>

			<li><a href=""><img src="${root}/resource/images/answeris.png" alt="앤서이즈"></a></li>
			<li><a href=""><img src="${root}/resource/images/w3c.png" alt="w3c"></a></li>
			<li><a href=""><img src="${root}/resource/images/microsoft.png"
					alt="마이크로소프트"></a></li>
		</ul>
	</nav>
</aside>