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

/*----------------------------------------------------------  */
.icon_toptxt {
	display: table;
	width: 100%;
	margin-bottom: 45px;
}

.icon_toptxt dt {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	background: #f2f2f2 url('/hansong/resources/images/camera1.png') center
		center no-repeat;
}

.font_navy {
	color: navy !important;
}

.icon_toptxt dd {
	width: calc(100% - 150px);
	padding-left: 30px;
	box-sizing: border-box;
	display: table-cell;
	vertical-align: middle;
}

h4.sub_title {
	position: Relative;
	font-size: 32px;
	font-weight: bold;
	line-height: 100%;
	margin-bottom: 22px;
	color: #393939;
	letter-spacing: -1pt;
}

h5.dep_tit {
	position: Relative;
	font-size: 20px;
	font-weight: bold;
	letter-spacing: -0.5pt;
	line-height: 160%;
	margin: 45px 0 20px 0;
	color: #262626;
	padding-left: 30px;
	box-sizing: Border-box;
}

.black {
	line-height: inherit;
	letter-spacing: inherit;
}

.font_navy2 {
	color: navy !important;
	line-height: inherit;
	letter-spacing: inherit;
}

.medium {
	font-weight: bold !important;
}

.dot p {
	line-height: 28px;
	padding-left: 12px;
	position: relative;
	letter-spacing: -0.5pt;
	text-align: left;
}

.dot3 {
	margin-left: 40px;
}

/* FAQ */
.faq {
	border-bottom: 0px solid #ddd;
	margin: 1em 0;
	margin-top: 80px;
}

.faq .faqHeader {
	position: relative;
	zoom: 1
}

.faq .faqHeader .showAll {
	position: absolute;
	bottom: 0;
	right: 0;
	border: 0;
	padding: 0;
	overflow: visible;
	background: none;
	cursor: pointer
}

.faq .faqBody {
	margin: 0;
	padding: 0
}

.faq .faqBody .article {
	list-style: none
}

.faq .q {
	margin:
}

.faq .q a {
	display: block;
	text-align: left;
	background: url("faq1_icon_q.png") no-repeat 0 0;
	padding: 0 0 0 35px;
	font-size: 18px;
	color: #5e5e5e;
	font-weight: bold;
	line-height: 27px;
	cursor: pointer;
	margin: 10px 0 !important;
	margin-top: 50px !important;
}

.faq .q a:hover, .faq .q a:active, .faq .q a:focus {
	
}

.faq .a {
	background: #f8f8f8 url("faq1_icon_a.png") no-repeat 40px 10px;
	padding: 10px 75px 10px 75px;
	font-size: 16px;
	color: #444444;
	line-height: 22px;
	border-top: 1px solid #bdbdbd;
	margin: 5px 0 0 0;
}
</style>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />
	<div id="myCarousel" class="carousel slide" data-ride="carousel">

		<div class="carousel-inner">

			<div class="carousel-item active">
				<img class="bd-placeholder-img"
					src="/hansong/resources/images/lawyer.jpg"
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
				<li><a href="#tab01">전자발찌</a></li>
				<li><a href="#tab02">카메라촬영죄</a></li>
				<li><a href="#tab03">성매매란</a></li>
			</ul>
		</div>
		<div class="sm_select">
			<select name="" id="tabmenu">
				<option value="#tab01">전자발찌</option>
				<option value="#tab02">카메라촬영죄</option>
				<option value="#tab03">성매매란</option>
			</select>
		</div>
	</div>

	<div id="tab02" class="tab-contents">
		<div class="container" style="margin-bottom: 20px">
			<h2 id="ag">카메라촬영죄</h2>
		</div>

		<div class="container">
			<dl class="icon_toptxt camera">
				<dt></dt>
				<dd>
					<h4 class="sub_title">
						<span class="font_navy">카메라등이용촬영죄</span> (카메라촬영죄)
					</h4>

					<p class="sub_txt">성폭력범죄의 처벌 등에 관한 특례법 상 법령에 의거 제14조(카메라 등을 이용한
						촬영) 카메라나 그 밖에 이와 유사한 기능을 갖춘 기계장치를 이용하여 성적 욕망 또는 수치심을 유발할 수 있는 다른
						사람의 신체를 그 의사에 반하여 촬영하거나 그 촬영물을 반포·판매·임대·제공 또는 공공연하게 전시·상영한 자는 5년
						이하의 징역 또는 1천만원 이하의 벌금에 처하도록 규정하고 있습니다.</p>
				</dd>
			</dl>

			<div class=" camera_result_con">
				<div class=" camera_Result_img">
					<img alt="카메라 사범" src="/hansong/resources/images/camera_img.jpg">
				</div>
				<div class="camera_result_txt">
					<h5 class="dep_tit nomtop">● 일반적으로 카메라 사범의 경우</h5>
					<p class="sub_txt">
						지하철이나 버스처럼 공중이 밀집된 장소에서 무음 어플을 사용하여 기습적으로 촬영을 하거나<br> 은폐된
						장소(화장실, 탈의실, 속옷이 보이는 위치 등)를 이용하여 몰래카메라를 설치합니다. <br> 범행에 착수하던
						과정에 현행범이나 몰카 단속반에 의해 적발된 경우 <span class="medium black">상대방과의
							관계, 어플리케이션(무음), 피사체(노출수위), 촬영물의 수량, 범행 장소 등 다양한 각도에서 종합적으로 검토</span>하여
						형량(처벌수위)을 정하게 됩니다.
					</p>
				</div>
			</div>


			<div class="container faq">
				<div class="faqHeader">
					<h5 style="font-weight: bold; font-size: 20px;">● 카메라등이용촬영죄
						허용범위</h5>
					<hr>
				</div>
				<ul class="faqBody">
					<li class="article" id="a1">
						<p class="q">
							<a href="#a1">Q) 여성이 촬영시 치마를 입고 있는 상태였으며 허리부분부터 신발까지의 하반신 전체를
								대상으로 전면과 옆면을 각 1회씩 촬영한 경우?</a>
						</p>
						<p class="a">A) 이는 여성이 통상적인 정도를 넘어서는 과도한 노출에 이르지는 아니하였는지, 촬영자가
							어느 정도 거리에서 사진을 촬영하였는지 등을 검토하게 됩니다.</p>
					</li>
					<li class="article" id="a2">
						<p class="q">
							<a href="#a2">Q) 카페에서 일반 여성을 보고 순간적인 호감이 발생하여 앉아 있는 모습을 촬영한
								경우 ?</a>
						</p>
						<p class="a">A) 성욕을 불러일으키는 자세나 그로 인하여 과도한 노출이 발생하도록 특별한 각도나
							특수한 방법이 아닌 사람의 시야에 통상적으로 비춰지는 부분을 그대로 촬영한 모습이라면 여성이 커피를 마시는 모습을
							자연스럽게 촬영한 것으로 사진들에 나타난 여성의 옷차림이나 노출정도가 일상생활에서도 흔하게 찾아볼 수 있는 정도에
							불과한지 등을 포함하여 여성이 성적 불쾌감을 느낄만한 요소가 있는지 확인한 후 판단하게 됩니다.</p>
					</li>
					<li class="article" id="a3">
						<p class="q">
							<a href="#a3">Q) 경찰서 조사 당시 촬영한 핸드폰에 대하여 수사기관에서 범죄도구로 압수한 경우 ?</a>
						</p>
						<p class="a">A) 피의자 핸드폰에 피해자의 나체 사진이 다수 보관되어 있을 가능성이 높고 혹여라도
							실수로 사진이 유출을 되거나 유포하는 경우를 배제할 수 없어 범행 당시 수사기관에서는 핸드폰을 압수하는데 이에
							대하여는 압류가환부 신청을 할 수 있습니다. 다만, 무혐의(증거불충분) 또는 기소유예 처분을 받지 않는다면 실상
							핸드폰을 돌려받기 어렵습니다.</p>
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
	
	jQuery(function($){
	    // Frequently Asked Question
	    var article = $('.faq>.faqBody>.article');
	    article.addClass('hide');
	    article.find('.a').hide();
	    article.eq(0).removeClass('hide');
	    article.eq(0).find('.a').show();
	    $('.faq>.faqBody>.article>.q>a').click(function(){
	        var myArticle = $(this).parents('.article:first');
	        if(myArticle.hasClass('hide')){
	            article.addClass('hide').removeClass('show');
	            article.find('.a').slideUp(100);
	            myArticle.removeClass('hide').addClass('show');
	            myArticle.find('.a').slideDown(100);
	        } else {
	            myArticle.removeClass('show').addClass('hide');
	            myArticle.find('.a').slideUp(100);
	        }
	        return false;
	    });
	    $('.faq>.faqHeader>.showAll').click(function(){
	        var hidden = $('.faq>.faqBody>.article.hide').length;
	        if(hidden > 0){
	            article.removeClass('hide').addClass('show');
	            article.find('.a').slideDown(100);
	        } else {
	            article.removeClass('show').addClass('hide');
	            article.find('.a').slideUp(100);
	        }
	    });
	});
		
</script>

</html>

