<%--
  Created by IntelliJ IDEA.
  User: dkask
  Date: 2020-10-01
  Time: 오전 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.navbar{
	background-color: #FFFF !important;
}

.navbar-brand{
	color: black !important;
}

.navbar-toggler-icon{
	background-color: #0B0B3B;
}
 

.click:hover{
	color:navy;
} 

.btn{
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

<header class="pt-5">
    <nav class="navbar navbar-expand-xl navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#">
        	<img src="/hansong/resources/images/로고.png" style="width: 200px;">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
            	<li>
               <div class="dropdown">
                <button class="btn click" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	법무법인 송한
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                    <button class="dropdown-item" type="button">변호사 소개</button>
                    <button class="dropdown-item" type="button">사무실 소개</button>
                    <button class="dropdown-item" type="button">찾아오시는 길</button>
                </div>
            </div>
            
         </li>
         	<li>
             <div class="dropdown">
                <button class="btn click" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	전문분야
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                    <button class="dropdown-item" type="button">전자발찌</button>
                    <button class="dropdown-item" type="button">카메라 촬영죄</button>
                    <button class="dropdown-item" type="button">성매매란</button>
                </div>
            </div>
            </li>
            <li>
             <div class="dropdown">
                <button class="btn click" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	온라인 상담
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                    <button class="dropdown-item" type="button">온라인 상담</button>
                    <button class="dropdown-item" type="button">실시간 상담</button>       
                </div>
            </div>
            </li>
            <li>
             <div class="dropdown">
                <button class="btn click" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                	 onclick = "location.href = 'larfirm/menu/lawyer'">
                    	공지사항
                </button>
            </div>
            </li>
            <li>
             <div class="dropdown">
                <button class="btn click" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    	자료실
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                    <button class="dropdown-item" type="button" onclick = "location.href = '#' ">언론보도</button>
                    <button class="dropdown-item" type="button">합의서</button>
                    <button class="dropdown-item" type="button">탄원서</button>
                    <button class="dropdown-item" type="button">반성문</button>
                    
                </div>
            </div>
            </li> 
            
            </ul>
            
            <form class="form-inline mt-2 mt-md-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
            </svg>
        </div>
    </nav>
</header>