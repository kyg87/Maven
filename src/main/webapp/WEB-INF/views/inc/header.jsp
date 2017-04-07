<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 태그라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:set var="root" value="${pageContext.request.contextPath}"/>    
    
    
<header id="header">
	<div class="content-container">
	
		<h1 id="logo">
			<img src="${root}/resource/images/logo.png" alt="뉴렉처 온라인">
		</h1>
		<section>
			<h2 class="hidden">헤더</h2>

			<nav id="main-menu" class="hr-menu">
				<h3 class="">
					메인메뉴 <input type="button" value="출력" id="btn-result" />
				</h3>
				<ul>
					<li><a href="">학습가이드</a></li>
					<li><a href="">뉴렉과정</a></li>
					<li><a href="">강좌선택</a></li>
				</ul>
			</nav>

			<div id="lecture-search-form">
				<h3 class="hidden">강좌검색폼</h3>
				<form>
					<fieldset>
						<legend class="hidden">검색 필드</legend>
						<label>과정검색</label> <input type="text" /> <input
							class="lecture-search-button" type="submit" value="검색" />
					</fieldset>
				</form>
			</div>


			<security:authentication property="authorities" var="auths"/>
			<security:authentication property="name" var="name"/>
			
			<div>
			id:${name }<br/>
			<c:forEach var ="role" items="${auths }">
			role : ${role }</br>
			</c:forEach>
			</div>
			
			<nav id="account-menu" class="hr-menu">
				<h3 class="hidden">계정메뉴</h3>
				<ul>
					<li class="first"><a href="../index.html">HOME</a></li>
					
					<security:authorize access="isAnonymous()">
					<li><a href="${root}/joinus/login">로그인</a></li>
					</security:authorize>
					
					<security:authorize access="isAuthenticated()">
					<li>
						<a href="${root}/j_spring_security_logout">
						<security:authentication property="name"/>}님 로그아웃</a></li>
					</security:authorize>
					
					<li><a href="${root}/joinus/join">회원가입</a></li>
				</ul>
			</nav>

			<nav id="member-menu" class="hr-menu">
				<h3 class="hidden">회원메뉴</h3>
				<ul>
					<li class="first">
					<a href="${root}/joinus/mypage"> <img alt="마이페이지" src="${root}/resource/images/menuMyPage.png"> </a></li>
					<li><a href="notice.html"><img alt="고객센터"
							src="${root}/resource/images/menuCustomer.png"></a></li>
				</ul>
			</nav>
		</section>
	</div>
</header>