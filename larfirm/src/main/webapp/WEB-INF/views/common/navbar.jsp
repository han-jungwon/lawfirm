<%--
  Created by IntelliJ IDEA.
  User: dkask
  Date: 2020-10-01
  Time: 오전 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal" />

<style>
.navbar {
	background-color: #FFFF !important;
}

.navbar-brand {
	color: black !important;
}

.navbar-toggler-icon {
	background-color: #0B0B3B;
}

.click:hover {
	color: navy;
}

.btn {
	font-weight: bold;
}

.btn-outline-success {
	color: #0B0B3B;
	border-color: #0B0B3B;
}

.btn-outline-success:hover {
	color: #fff;
	background-color: #0B0B3B;
	border-color: #0B0B3B;
}
</style>


<header>
    <nav class="navbar navbar-expand-xl navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="/hansong/main">
        	<img src="/hansong/resources/images/logo.png" style="width: 200px;">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
            	<li>
               <div class="dropdown">
                <button class="btn click" type="button" id="dropdownMenuIntro" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	법무법인 송한
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuIntro">
                    <button class="dropdown-item" type="button"  onclick="location.href='/hansong/main/lawyer'">변호사 소개</button>
                    <button class="dropdown-item" type="button"  onclick="location.href='/hansong/main/office'">사무실 소개</button>
                    <button class="dropdown-item" type="button"  onclick="location.href='/hansong/main/directions'">찾아오시는 길</button>
                </div>
            </div>
            
         </li>
         	<li>
             <div class="dropdown">
                <button class="btn click" type="button" id="dropdownMenuSpecial" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	전문분야
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuSpecial">
                    <button class="dropdown-item" type="button" onclick="location.href='/hansong/main/anklet'">전자발찌</button>
                    <button class="dropdown-item" type="button" onclick="location.href='/hansong/main/camera'">카메라 촬영죄</button>
                    <button class="dropdown-item" type="button" onclick="location.href='/hansong/main/prostitution'">성매매란</button>
                </div>
            </div>
            </li>
            <li>
             <div class="dropdown">
                <button class="btn click" type="button" id="dropdownMenuCounsel" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                	onclick="location.href = '/hansong/boards/counsel'">
                    	온라인 상담
                </button>
            </div>
            </li>
            <li>
             <div class="dropdown">
                <button class="btn click" type="button" id="dropdownNotice" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                	 onclick = "location.href ='/hansong/boards/boardList?BOARD_CATEGORY=0'">
                    	공지사항
                </button>
            </div>
            </li>
            <li>
             <div class="dropdown">
                <button class="btn click" type="button" id="dropdownMenuBoard" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	자료실
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuBoard">
                    <button class="dropdown-item" type="button" onclick="location.href='/hansong/boards/report'">언론보도</button>
                    <button class="dropdown-item" type="button" onclick="location.href='/hansong/boards/agreement'">합의서</button>
                    <button class="dropdown-item" type="button" onclick="location.href='/hansong/boards/petition'">탄원서</button>
                    <button class="dropdown-item" type="button" onclick="location.href='/hansong/boards/apology'">반성문</button>
                    
                </div>
            </div>
            </li> 
            
            </ul>
            
            <div style="display: flex;">
                <input  id="navInputSearch" class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                <button id="navBtnSearch"   class="btn btn-outline-success my-2 my-sm-0" type="button">Search</button>
            </div>
            <c:if test="${principal eq 'anonymousUser'}">
                <input id ="navUserId" value="" type="hidden">
                <input id ="navUserName" value="" type="hidden">
                <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg" onclick="location.href='/hansong/members/loginform'">
                    <path fill-rule="evenodd" d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path>
                </svg>
            </c:if>
            <c:if test="${principal ne 'anonymousUser'}">
                <input id ="navUserId" value="${principal.username}" type="hidden">
                <input id ="navUserName" value="" type="hidden">
                <svg id ="mypage" width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg" >
                    <path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"></path>
                </svg>
            </c:if>
        </div>
    </nav>
</header>