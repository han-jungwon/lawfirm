<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/header.jsp" />
<link rel="stylesheet" href="resources/css/carousel.css" />
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/">
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="bd-placeholder-img" width="100%" height="100%" src="./resources/images/배너1.jpg" border="0">
					<div class="container">
						<div class="carousel-caption text-left">
							<h1 style="font-weight:bold;">LAW FIRM SONGHAN</h1>
							<p style="font-weight:bold;">
							의뢰인 중심 법률 서비스, 여기는 법무법인 한송입니다.
							</p>
						</div>
					</div>
				</div>
		
			</div>
		</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>