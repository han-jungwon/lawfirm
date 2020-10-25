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

.lawyer_info {
    border: 1px solid #ddd;
    box-sizing: border-box;
    position: Relative;
    overflow: hidden;
    margin-bottom: 9px;
    width: 950px;
    max-width: 100%;

}

.lawyer_img {
    float: left;
    width: 488px;
}

.lawyer_img > img {
    display: block;
    margin-left: 40px;
  max-width: 100%;
	width : auto;
	height: 300px;
}

.lawyer_img dl {
    background: #0B0B3B;
    padding: 35px 25px 30px 25px;
    box-sizing: border-box;
    text-align: right;
	width : 300px;
    height: 165px;
    max-width: 100%;
}
}

.lawyer_img dt {
    position: relative;
    font-size: 18px;
    letter-spacing: -0.5pt;
    line-height: 100%;
}

.lawyer_img dt span {
    font-size: 23px;
    display: inline-block;
    margin-left: 13px;
}

.lawyer_img dd {
    font-size: 15px;
    letter-spacing: -0.5pt;
    color: #fff;
    margin-top: 18px;
    line-height: 23px;
}

 .lawyer_txt {
    float: left;
    width: calc(100% - 488px);
    padding: 55px 0 55px 68px;
    box-sizing: border-box;

}
.dot{
  margin-top: 30px;

}

.dot p {
    line-height: 28px;
    padding-left: 12px;
    position: relative;
    letter-spacing: -0.5pt;
}

dt{
	color : white;

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

	<div id="tab01" class="tab-contents">
		<div class="container" style="margin-bottom: 20px">
                <h2 id="ag">변호사 소개</h2>

                <div class="lawyer_con">
                        <div class="lawyer_info">
                                <div class="lawyer_img">
                                        <img src="/hansong/resources/images/re_jungwon.png" alt="한정원 변호사">
                                                <dl>
                                                        <dt>대표 변호사
                                                                <span class="bold">한정원</span>
                                                        </dt>
                                                        <dd>인천 고등학교 졸업
                                                         <br>한국대학교 법학과 졸업
                                                         <br>사법연수원 36기
                                                        </dd>
                                                </dl>
                                </div>
                                <div class="lawyer-txt dot">
                                        <p>
                                          - 인천 고등학교 졸업
                                        </p>
                                        <p>
                                          - 한국대학교 법학과 졸업
                                        </p>
                                        <p>
                                          - 법무법인 콘나 소속변호사
                                        </p>
                                        <p>
                                          - 법무법인 정송 소속변호사
                                        </p>
                                        <p>
                                          - 前 법무법인 가든 소속변호사
                                        </p>
                                        <p>
                                          - 現 법무법인 송한 대표변호사
                                        </p>
                                        <br>
                                        <p>
                                          - 前  서울법원 조정위원
                                        </p>
                                        <p>
                                          - 現 (주)콜라 자문변호사 역임
                                        </p>
                                        <p>
                                          - 現 KH 자문변호사
                                        </p>

                                </div>
                         </div>
                </div>
                <div class="lawyer_con">
                        <div class="lawyer_info">
                                <div class="lawyer_img">
                                        <img src="/hansong/resources/images/song.jpg" alt="한정원 변호사">
                                        <dl>
                                                <dt>대표 변호사
                                                        <span class="bold">송민준</span>
                                                </dt>
                                                <dd>인천 고등학교 졸업
                                                 <br>한국대학교 법학과 졸업
                                                 <br>사법연수원 36기
                                                </dd>
                                        </dl>
                                </div>
                                <div class="lawyer-txt dot">
                                        <p>
                                          - 인천 고등학교 졸업
                                        </p>
                                        <p>
                                          - 한국대학교 법학과 졸업
                                        </p>
                                        <p>
                                          - 법무법인 콘나 소속변호사
                                        </p>
                                        <p>
                                          - 법무법인 정송 소속변호사
                                        </p>
                                        <p>
                                          - 前 법무법인 가든 소속변호사
                                        </p>
                                        <p>
                                          - 現 법무법인 송한 대표변호사
                                        </p>
                                         <br>
                                        <p>
                                          - 前  서울법원 조정위원
                                        </p>
                                        <p>
                                          - 現 (주)콜라 자문변호사 역임
                                        </p>
                                        <p>
                                          - 現 KH 자문변호사
                                        </p>
                                </div>
                        </div>
                </div>
        </div>
    </div>
    <div id="tab02" class="tab-contents">
        <div class="container" style="margin-bottom: 20px">
                <h2 id="ag2">사무실 소개</h2> <br>
                <img class="image" alt="사무실 소개" src="/hansong/resources/images/office.jpg">

                <h3 style="font-size: 25px; font-weight: bold; margin-top: 30px;">
                <span class="font_navy">Six</span>
                        Competitive
                </h3>
                <p>법무법인 송한만의 특별한 6가지 경쟁력! 눈에 보이는 확실한 결과를 창출해 냅니다.</p>
                <div class="container six_com" style="margin-top: 30px;">
                        <ul>
                                <li>노하우가 담긴<br>
                                        <span>전략</span>과
                                        <span>기획</span>이<br>
                                        만납니다.
                                </li>
                                <li>
                                        <span>실제 사례</span>를<br>
                                        직접 보여드림으로써<br>
                                        <span>신뢰감</span>을 드립니다.
                                </li>
                                <li>
                                        실무진이<br>
                                        <span>전문성</span>있는 상담을<br>
                                        진행합니다.
                                </li>
                        </ul>
                        <ul>
                                <li>
                                        <span>의뢰인의 입장</span>에서<br>
                                        최선의 결과를<br>
                                        이끌어내고자 합니다.
                                </li>
                                <li>
                                        조금 더
                                        <span>자세히</span>
                                        <br>
                                        조금 더
                                        <span>꼼꼼히</span>
                                        <br>
                                        살핍니다.
                                </li>
                                <li>
                                        사건 종결 후에도<br>
                                        <span>철저한 관리</span>를 통해<br>
                                        걱정을 덜어 드립니다.
                                </li>
                        </ul>
                </div>

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

