<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>법무법인 한송</title>
<meta name="keywords" content="법무법인 한송">
<meta name="description" content="법무법인 한송 메인페이지">
<meta name="author" content="Team. hansong">
<jsp:include page="./common/header.jsp" />
<!-- Site css -->
<link rel="stylesheet" href="resources/css/carousel.css" />
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">
<style>

/* 반응형 화면  */
@media screen and (max-width: 1680px) {


	}

@media screen and (max-width: 1280px) {



	}

@media screen and (max-width: 980px) {
		.camera{
		margin-left: 0px !important; 
		margin-right: 0px !important;
		}	


	}

@media screen and (max-width: 736px) {
		.bd-placeholder-img-lg {
			font-size: 3.5rem;
		}
		ul.business_icon{
			margin-left: 60px !important;
		} 
		.camera{
		margin-left: 0px !important; 
		margin-right: 0px !important;
		}	


	}

@media screen and (max-width: 480px) {
		ul.business_icon{
			margin-left: 50px !important;
		} 
		.camera{
		margin-left: 0px !important; 
		margin-right: 0px !important;
		}	

	}


/* 전문분야  */
.business_con {
	position: relative;
	padding: 70px 0;
	width: 1170px;
	margin: 0 auto;
}

.business_icon {
	position: Relative;
	overflow: hidden;
}

.business_icon li {
	float: left;
	margin-right: 20px;
	text-align: center;
}

.business_icon li:last-child {
	margin-right: 0
}

.business_icon li a {
	display: block;
	font-size: 16px;
	line-height: 100%;
	color: #262626;
	font-weight: 500;
	letter-spacing: -0.5pt;
	transition: all 0.3s ease-out;
}

.business_icon li span {
	display: block;
	width: 150px;
	height: 150px;
	border-radius: 50%;
	background: #f2f2f2 url('./resources/images/전자발찌1.png') center center
		no-repeat;
	margin-bottom: 20px;
	transition: all 0.3s ease-out;
}

.business_icon li:nth-child(2) span {
	background-image: url('./resources/images/카메라촬영죄1.png');
}

.business_icon li:nth-child(3) span {
	background-image: url('./resources/images/성매매1.png');
	background-position: 49px center
}

ul.business_icon {
	margin-left: 200px;
}

.business_icon li a:hover {
	transition: all 0.3s ease-out;
	color: #182952;
}

.business_icon li a:hover span {
	transition: all 0.3s ease-out;
	background-color: #182952;
	background-image: url('./resources/images/전자발찌2.png')
}

.business_icon li:nth-child(2) a:hover span {
	background-image: url('./resources/images/카메라촬영죄2.png')
}

.business_icon li:nth-child(3) a:hover span {
	background-image: url('./resources/images/성매매2.png')
}
ul {
    list-style-type: none;
}
.specially {
	font-size: 35px;
	line-height: 100%;
	font-weight: 700;
	letter-spacing: -1.5pt;
	color: #262626;
	margin-bottom: 24px;
	text-align: center;
	position: relative;
}

.specially {
	letter-spacing: inherit;
	line-height: inherit;
	font-weight: 300
}

.specially-1 {
	font-size: 16px;
	letter-spacing: -0.5pt;
	line-height: 25px;
	text-align: center;
	margin-bottom: 40px;
}

.featurette-heading{
	margin-top: 80px;

}
.camera{
	margin-left: 100px; margin-right: 100px;
}


</style>
</head>
<body>

	<jsp:include page="./common/navbar.jsp" />
	<main role="main">

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="bd-placeholder-img" width="100%" height="100%" src="./resources/images/배너1.jpg" border="0">
					<div class="container">
						<div class="carousel-caption text-left">
							<h1 style="font-weight:bold;">LAW FIRM SONGHAN</h1>
							<p style="font-weight:bold;">
							법무법인 송한은 다년간의 전문적인 경험과 정직으로 <br>최상의 법률서비스를 제공해드립니다.
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="bd-placeholder-img" width="100%" height="100%" src="./resources/images/배너2.jpg" border="0">
					<div class="container">
						<div class="carousel-caption">
							<h1>LAW FIRM SONGHAN</h1>
							<p>2500건 이상의 사건 수임과 다양한 성공사례가 증명합니다.</p>
							<!-- <p>
								<a id = "learn_button"class="btn btn-lg btn-primary" href="#" role="button">Learn
									more</a>
							</p> -->
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="bd-placeholder-img" width="100%" height="100%" src="./resources/images/배너3.jpg" border="0"
							style="cursor: pointer">
					<div class="container">
						<div class="carousel-caption text-right">
							<img  src="./resources/images/배너3-1.png" style="margin-right: 500px">
							<h1>LAW FIRM SONGHAN</h1>
							<p>법무법인 송한은 언제나 의뢰인의 입장에서 생각하겠습니다.</p>
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#myCarousel" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#myCarousel" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>


		<!-------------- 전문분야 -------------->

		<div class="container marketing">

			<div class="contents">
				<h3 class="specially">전문분야</h3>
				<p class="specially-1">한송만의 노하우가 담긴 전략과 기획으로 형사법 분야의 최고가 되겠습니다.</p>
				<ul class="business_icon">
					<li><a href="#"> <span class="icon"></span> 전자발찌
					</a></li>

					<li><a class="camera" href="#"> <span class="icon"></span> 카메라 촬영죄
					</a></li>

					<li><a href="#"> <span class="icon"></span> 성매매
					</a></li>
				</ul>
			</div>
		



			<!------------ 변호사 소개 ------------>

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7 order-md-2">
					<h2 class="featurette-heading">대표 변호사  한정원</h2>
					
					<p class="lead">사법시험 45회, 사법연수원 36기 수료 <br> 
									前 법무법인 가든 소속변호사<br>
									現  KH 자문변호사<br>
									現 법무법인 송한 대표변호사</p>
				</div>
				<div>
					<div>
						<img src="./resources/images/정원.png" border="0"
							onclick="window.open('#')"
							style="cursor: pointer; border-radius: 10%; margin-left: 100px; margin-right: 80px;">
					</div>
				</div>
			</div>

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">변호사 송민준</h2>

				</div>
				<div class="col-md-5">
					<svg
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500" xmlns="http://www.w3.org/2000/svg"
						preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
						aria-label="Placeholder: 500x500">
						<title>Placeholder</title>
						<rect width="100%" height="100%" fill="#eee" />
						<text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text>
					</svg>
				</div>
			</div>

			<hr class="featurette-divider">

			<!-- /END THE FEATURETTES -->

		</div>
		<!-- /.container -->
		<jsp:include page="./common/footer.jsp" />
	</main>
</body>
</html>