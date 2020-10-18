<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<jsp:include page="../common/header.jsp" />
<!-- Site css -->
<link rel="stylesheet" href="../resources/css/joinform.css" />
<link rel="stylesheet" href="resources/css/carousel.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<style>
.big_tab ul {
	overflow: hidden;
	width: 100%;
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
}

.sm_select {
	display: none;
}

.sm_select select {
	width: 100%;
	height: 40px;
}

@media ( max-width :500px) {
	.sm_select {
		display: block;
	}
	.big_tab {
		display: none;
	}
}

.clicked { /*클릭 시 적용되는 style 속성*/
	border-bottom: aqua;
}
</style>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/hansong/resources/images/변호사소개.jpg"
					style="height: 250px; width: 1800px;">
				<div class="container">
					<div class="carousel-caption text-left">
						<h1 style="font-weight: bold;">LAW FIRM SONGHAN</h1>
						<br>
						<p style="font-weight: bold;">의뢰인 중심 법률 서비스, 여기는 법무법인 한송입니다.</p>
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
				<li><a href="#tab03">오시는 길</a></li>
			</ul>
		</div>
		<div class="sm_select">
			<select name="" id="tabmenu">
				<option value="#tab01">변호사 소개</option>
				<option value="#tab02">사무실 소개</option>
				<option value="#tab03">오시는 길</option>
			</select>
		</div>
	</div>
	<div id="tab01" class="tab-contents">
		<h2>변호사를 소개합니다.</h2>
	</div>
	<div id="tab02" class="tab-contents">
		<h2>사무실을 소개합니다.</h2>
	</div>
	<div id="tab03" class="tab-contents">
		<h2>오시는 길입니다.</h2>
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
		
		$('.big_tab ul li').each(function() {
			$(this).click(function() {
				$(this).addClass("clicked");
				$(this).removeClass("clicked");

			})
		});
	});

	
		
	
</script>
</html>

