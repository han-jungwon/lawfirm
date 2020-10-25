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

/* 이미지 반응형  */
.image { 

	max-width: 100%; 
	width : auto;
	height: 300px;
}

.font_navy {
 
    font-size: 30px;
    font-weight: bold;
    color: navy;
}

.six_com{
	text-align: center;
    background: #f4f4f4;
    padding: 60px 0;
    margin-top: 30px;
	max-width: 100%; 
}

.six_com li {
	display: inline-block;
    letter-spacing: -0.5pt;
    width: 170px;
    height: 170px;
    border-radius: 50%;
    background: #8181F7;
    color: #fff;
    line-height: 26px;
    position: Relative;
    margin: 0 60px 0 0;
    padding: 55px 0 0 0;
    box-sizing: Border-box;
}

.six_com li span {
	font-weight: 500;
    letter-spacing: inherit;
    line-height: inherit;
    text-decoration: underline;
}

.six_com li:nth-child(2n) {
    background: #8258FA;
}

.en {
    font-size: 16px;
    color: navy;
    font-weight: 600;
    text-align: center;
    letter-spacing: 6px;
    margin-bottom: 10px !important;


}
</style>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />
	<div id="myCarousel" class="carousel slide" data-ride="carousel">

		<div class="carousel-inner">
		
			<div class="carousel-item active">
				<img class="bd-placeholder-img" src="/hansong/resources/images/lawyer.jpg" 
				style="height: 250px; width: 100%;">
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
				<option value="#tab03">찾아오시는 길</option>
			</select>
		</div>
	</div>
	<div id="tab02" class="tab-contents">
		<div class="container" style="margin-bottom: 20px">
		<h2 id="ag">사무실 소개</h2> <br>
		<img class="image" alt="사무실 소개" src="/hansong/resources/images/office.jpg">
		
		<h3 style="font-size: 25px; font-weight: bold; margin-top: 30px;">
		<span class="font_navy">Six</span>
		Competitive
		</h3>
		<p>법무법인 송한만의 특별한 6가지 경쟁력! 눈에 보이는 확실한 결과를 창출해 냅니다.</p>
		
		</div>
		<div class="container">

	
	</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
<script>
	$(function() {
		$('.big_tab li').first().addClass("activeClass");
		$(".tab-contents").not(':first').hide();
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
	

		
</script>

</html>

