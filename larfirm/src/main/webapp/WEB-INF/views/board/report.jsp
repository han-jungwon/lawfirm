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
.big_tab{
	margin-left : 300px;
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
	border-bottom-color: white ;
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

.tab-contents{
    margin-top: 50px;
    margin-bottom: 200px;
}

.page-link{
	color: navy !important;
}

.paging{
	justify-content: center;
    display: flex;
	margin-top: 50px;
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
						<h1 style="font-weight: bold; font-size: 25px; color:white;">
														LAW FIRM SONGHAN</h1>
						<br>
						<p style="font-weight: bold; color:white; margin-top: 30px;">
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
  <h2 style="font-size: 30px;
    font-weight: bold;">언론보도</h2>     
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

