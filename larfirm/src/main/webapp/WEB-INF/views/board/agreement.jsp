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
	background: #f2f2f2 url('/hansong/resources/images/agreement.png')
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
				<option value="#tab04">반성문</option>
			</select>
		</div>
	</div>

	<div id="tab02" class="tab-contents">
		<h2 id="ag">합의서</h2>
		<div class="container">
			<div class="contents">
				<ul class="business_icon">
					<li><span class="icon"></span></li>
					<li style="font-weight: bold;
    					font-size: 20px;"> ● 형사사건 합의서가 재판에 미치는 영향</li>
    					<br><br><br>
					<li><p style="text-align: left">
							 형사 사건의 특성상 가해자에게 처벌 면제의 기회를 부여하거나 형량을 감면해주는 특수한 역할을 하는 합의서는 <br>
							 다양하게 하게 안전장치를 기재해야 향후 분쟁에 휘말리지 않을 수 있는데 반의사 불벌죄나 친고죄의 경우 피해자의<br>
							의사에 따라 공소권(형사처벌)의 유무가 결정되는 만큼 결코 합의서 영향이 적지 않음을 확인할 수 있습니다.
						</p></li>
					<li><p style="text-align: left">>
							 하지만 단순하게 일반적인 합의서와 같이 피의자로 하여금 자신의 반성을 뉘우친다는 의사만 피해자에게 전달하면 된다는<br>
							 인식을 가지고 합의가 쉽사리 이루어질 것으로 예단하여 처절한 준비를 하지 않은 채 인터넷이나 관공서에 비치되어 있는<br>
							 양식을 이용하는경우가 많은데 이런 안일한 자세로 임하다 보면 합의 조율자체가 어긋나 합의서를 작성할 기회조차 얻지<br>
							 못하는  상황이 초래될 수 있습니다. 따라서 합의서를 작성하셔야 하는 분들은 하단의 게시물을 꼭 확인하시어 사전에 <br>
							 준비하시기 바랍니다.
						</p>
					<li>
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
						<td style="width: 400px">합의서가 재판에 미치는 영향</td>
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

