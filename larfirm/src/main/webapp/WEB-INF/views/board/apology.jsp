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

@media ( max-width :700px) {
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
	margin-bottom: 30px;
	justify-content: center;
	display: flex;
	
}

.tab-contents {
	margin-top: 50px;
	margin-bottom: 200px;
}

.page-link {
	color: navy !important;
}

.paging {
	justify-content: center;
	display: flex;
	margin-top: 50px;
}

.icon {
	margin-left: 50px;
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
	background: #f2f2f2 url('/hansong/resources/images/apology.png')
		center center no-repeat;
	margin-bottom: 20px;
	transition: all 0.3s ease-out;
}
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
				<li><a href="#tab01">언론보도</a></li>
				<li><a href="#tab02">합의서</a></li>
				<li><a href="#tab03">탄원서</a></li>
				<li><a href="#tab04">반성문</a></li>
			</ul>
		</div>
		<div class="sm_select">
			<select name="" id="tabmenu">
				<option value="#tab01">언론보도</option>
				<option value="#tab02">합의서</option>
				<option value="#tab03">탄원서</option>
				<option value="#tab03">반성문</option>
			</select>
		</div>
	</div>

	<div id="tab04" class="tab-contents">
		<h2 id="ag">반성문</h2>
		<div class="container">
			<div class="contents">
				<ul class="business_icon">
					<li><span class="icon"></span></li>
					<li style="font-weight: bold;
    					font-size: 20px;"> ● 반성문</li>
    					<br><br><br>
					<li><p style="text-align: left">
							죄를 인정하는 사안에 대하여 변호사 없이 자력으로 선처를 구할 수 있는 최선의 방법이고,<br> 
							제대로 작성된 반성문은 법리적인 다툼이나 구제력보다도 좋은 효과를 기대할 수 있습니다.<br>
							다년간 수많은 사건을 진행하며 여러 반성문을 검토하면서 작성된 내용입니다.
						</p></li>
				</ul>

			</div>


			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 70px">1</td>
						<td style="width: 400px">반성문이란</td>
						<td style="width: 50px">20.10.01</td>
						<td style="width: 100px">500</td>
					</tr>

				</tbody>
			</table>
		</div>

		<div class="container paging">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#">이전</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
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

