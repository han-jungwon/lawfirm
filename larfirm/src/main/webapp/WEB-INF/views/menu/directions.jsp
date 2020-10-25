<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>법무법인 송한</title>
<jsp:include page="../common/header.jsp" />
<!-- Site css -->
<link rel="stylesheet" href="../resources/css/joinform.css" />
<link rel="stylesheet" href="resources/css/carousel.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>


<style>
.big_tab {
	margin-left: 300px;
}

.big_tab ul {
	overflow: hidden;

	width: 900px;
	margin-left: 250px;
}

.big_tab ul li {
	width: 25%;
	box-sizing: border-box;
	float: left;
	list-style-type: none;
	border: 1px solid #ccc;
	text-align: center;
	line-height: 40px;
}

.big_tab ul li.activeClass {
	font-weight: bold;
	font-size: 20px;
	border-bottom-color: white;
}

.sm_select {
	display: none;
}

.sm_select select {
	width: 100%;
	height: 40px;
}

@media screen and ( max-width :700px) {
	.sm_select {
		display: block;
	}
	.big_tab {
		display: none;
	}
}
	
@media screen and (max-width: 1280px) {
	.sm_select {
		display: block;
	}
	.big_tab {
		display: none;
	}	
}


#ag {
	font-size: 30px;
	font-weight: bold;
	justify-content: left;
	display: flex;
	
}

.tab-contents {
	margin-top: 50px;
	margin-bottom: 200px;
}

.navybold {
	font-weight: bold;
	font-size : 23px;
	color : navy;
}

.bold {
	font-weight: bold;
	font-size: 23px;
}

.address { 
	font-weight: bold;
	font-size: 15px;
	margin-right: 10px;

}


.navyword
</style>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/hansong/resources/images/lawyer.jpg"
					style="height: 250px; width: 2200px;">
				<div class="container">
					<div class="carousel-caption text-left">
						<h1 style="font-weight: bold; font-size: 25px; color: white;">
							LAW FIRM SONGHAN</h1>
						<br>
						<p style="font-weight: bold; color: white; margin-top: 30px;">
							의뢰인 중심 법률 서비스, 여기는 법무법인 한송입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="tabmenu">
		<div class="big_tab">
			<ul>
				<li><a href="#tab01">변호사 소개</a></li>
				<li><a href="#tab02">사무실 소개</a></li>
				<li><a href="#tab03">찾아오시는 길</a></li>		
			</ul>
		</div>
		<div class="sm_select">
			<select name="" id="tabmenu">
				<option value="#tab01">변호사 소개</option>
				<option value="#tab02">사무실 소개</option>
				<option value="#tab03" selected>찾아오시는 길</option>
			</select>
		</div>
	</div>

	<div id="tab03" class="tab-contents">
		<div class="container" style="margin-bottom: 20px">
		<h2 id="ag">찾아오시는 길</h2> <br>
		<span class="navybold">위치와 연락처</span>
		<span class="bold">를 소개해 드립니다.</span></div>
		<div class="container">
		<!-- * 카카오맵 지도 -->
		<!-- 지도 노드 -->
		<div id="daumRoughmapContainer1603046769190" class="root_daum_roughmap root_daum_roughmap_landing"
		style="width:100%;" ></div>
		
	<div class="container" style="margin-top: 30px">
		<ul>
			<li>
				<span class="address">ADDRESS</span>
			  	 서울 강남구 테헤란로14길 6 남도빌딩
			</li>
			<li>
				<span class="address">TEL</span>
				 02-123-1234 &nbsp;&nbsp;&nbsp;
				<span class="address">FAX</span>
				 02-142-2345 &nbsp;&nbsp;&nbsp;
				<span class="address">PARKING</span>
				 탄천주차장 1번 출입구 이용(유료)
			</li>	
		</ul>	
	</div>		
	</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
<script>
	$(function() {
		$('.big_tab li').eq(2).addClass("activeClass");
		$('.big_tab li').on(
				'click',
				function() {
					$(this).addClass("activeClass").siblings().removeClass(
							"activeClass");
					var link = $(this).find("a").attr("href");
					var link_num = link.substr(link.length - 1);
					$("select#tabmenu option").eq(link_num - 1).prop(
							"selected", "selected");
					$(".tab-contents").hide();
					$(link).show();
				});
		$("select#tabmenu").on(
				"change",
				function() {
					var select_link = $("select#tabmenu").val();
					var select_num = $(this).prop('selectedIndex');
					$('.big_tab li').eq(select_num).addClass("activeClass")
							.siblings().removeClass('activeClass');
					$(".tab-contents").hide();
					$(select_link).show();
					console.log(select_link);
				});
	});
	
	/* 카카오지도 실행 스크립트 */
		new daum.roughmap.Lander({
			"timestamp" : "1603046769190",
			"key" : "22i9a",
			"mapHeight" : "360"
		}).render();
		
		
</script>

</html>

