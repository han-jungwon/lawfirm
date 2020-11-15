<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>탄원서</title>
<jsp:include page="../common/header.jsp" />
<!-- Site css -->
<link rel="stylesheet" href="../resources/css/joinform.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>



<style>
.big_tab {
	margin-left: 300px;
}

.big_tab ul {
	overflow: hidden;
	width: 100%;
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

@media ( max-width :500px) {
	.sm_select {
		display: block;
	}
	.big_tab {
		display: none;
	}
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

/* 합의서,탄원문,반성문 공통  */
#ag {
	font-size: 30px;
	font-weight: bold;
	justify-content: left;
	display: flex;
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

ul {
	list-style: none;
	padding-left: 0px;
}

.business_icon li span {
	display: block;
	width: 150px;
	height: 150px;
	border-radius: 50%;
	margin-bottom: 20px;
	transition: all 0.3s ease-out;
}

.agreement li span {
	background: #f2f2f2 url('/hansong/resources/images/agreement.png')
		center center no-repeat;
}

.petition li span {
	background: #f2f2f2 url('/hansong/resources/images/petition.png') center
		center no-repeat;
}

.apology li span {
	background: #f2f2f2 url('/hansong/resources/images/apology.png') center
		center no-repeat;
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

	<div id="tab01" class="tab-contents">
		<div class="container">
			<h2 style="font-size: 30px; font-weight: bold;">언론보도</h2>
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
						<td style="width: 70px">31</td>
						<td style="width: 400px">상주시, 디지털 성범죄 근절 불법 카메라 점검</td>
						<td style="width: 50px">20.07.30</td>
						<td style="width: 100px">100</td>
					</tr>
					<tr>
						<td>30</td>
						<td>“창문 열고 음란행위”…女 혼자 사는 원룸만 노린 성범죄 전과자 실형</td>
						<td>20.10.30</td>
						<td>80</td>
					</tr>
					<tr>
						<td>29</td>
						<td>텔레그램만 빠진 'n번방 방지법'…악질 유포자 영영 못잡을까</td>
						<td>20.10.29</td>
						<td>76</td>
					</tr>
					<tr>
						<td>28</td>
						<td>3년간 성범죄 교직원 552명‥절반은 신분 유지</td>
						<td>20.10.28</td>
						<td>64</td>
					</tr>
					<tr>
						<td>27</td>
						<td>성범죄 공무원 징계시효 3→10년 늘어난다</td>
						<td>20.10.28</td>
						<td>56</td>
					</tr>
				</tbody>
			</table>
		</div>


		<div class="container paging">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</div>
	</div>
	<div id="tab02" class="tab-contents">

		<div class="container">
			<h2 id="ag">합의서</h2>
			<div class="contents">
				<ul class="business_icon agreement">
					<li><span class="icon"></span></li>
					<li style="font-weight: bold; font-size: 20px;">● 형사사건 합의서가
						재판에 미치는 영향</li>
					<br>
					<br>
					<br>
					<li><p style="text-align: left">
							형사 사건의 특성상 가해자에게 처벌 면제의 기회를 부여하거나 형량을 감면해주는 특수한 역할을 하는 합의서는 <br>
							다양하게 하게 안전장치를 기재해야 향후 분쟁에 휘말리지 않을 수 있는데 반의사 불벌죄나 친고죄의 경우 피해자의<br>
							의사에 따라 공소권(형사처벌)의 유무가 결정되는 만큼 결코 합의서 영향이 적지 않음을 확인할 수 있습니다.
						</p></li>
					<li><p style="text-align: left">
							> 하지만 단순하게 일반적인 합의서와 같이 피의자로 하여금 자신의 반성을 뉘우친다는 의사만 피해자에게 전달하면 된다는<br>
							인식을 가지고 합의가 쉽사리 이루어질 것으로 예단하여 처절한 준비를 하지 않은 채 인터넷이나 관공서에 비치되어 있는<br>
							양식을 이용하는경우가 많은데 이런 안일한 자세로 임하다 보면 합의 조율자체가 어긋나 합의서를 작성할 기회조차 얻지<br>
							못하는 상황이 초래될 수 있습니다. 따라서 합의서를 작성하셔야 하는 분들은 하단의 게시물을 꼭 확인하시어 사전에 <br>
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

	<div id="tab03" class="tab-contents">
		<div class="container">
			<h2 id="ag">탄원서</h2>
			<div class="contents">
				<ul class="business_icon petition">
					<li><span class="icon"></span></li>
					<li style="font-weight: bold; font-size: 20px;">● 탄원서</li>
					<br>
					<br>
					<br>
					<li><p style="text-align: left">
							먼저 탄원인과 피탄원인 관계를 소명하고 탄원 취지 및 탄원 이유에 대한 내용을 기술하여 피탄원인이 최대한 선처받을 수
							있도록 <br> 용서를 구하는 것을 목적으로 하는 글로써, 일종의 증언적 효과를 기대할 수 있습니다.
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
						<td style="width: 400px">탄원서 작성법</td>
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

	<div id="tab04" class="tab-contents">
		<div class="container">
			<h2 id="ag">반성문</h2>
			<div class="contents">
				<ul class="business_icon apology">
					<li><span class="icon"></span></li>
					<li style="font-weight: bold; font-size: 20px;">● 반성문</li>
					<br>
					<br>
					<br>
					<li><p style="text-align: left">
							죄를 인정하는 사안에 대하여 변호사 없이 자력으로 선처를 구할 수 있는 최선의 방법이고,<br> 제대로
							작성된 반성문은 법리적인 다툼이나 구제력보다도 좋은 효과를 기대할 수 있습니다.<br> 다년간 수많은 사건을
							진행하며 여러 반성문을 검토하면서 작성된 내용입니다.
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
		$('.big_tab li').eq(2).addClass("activeClass");
		$(".tab-contents").not(':eq(2)').hide();
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
