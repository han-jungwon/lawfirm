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
	background: #f2f2f2 url('/hansong/resources/images/anklet1.png') center
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

h4.sub_title span {
	line-height: inherit;
	letter-spacing: inherit;
}

.font_orange {
	font-size: 15px;
	color: #e39131 !important;
}

.whiteBox {
	position: relative;
	border: 1px solid #ddd;
}

.whiteBox_in {
	background: #fff;
	position: relative;
	overflow: hidden;
	padding: 24px 17px 20px 17px;
	box-sizing: border-box;
	border: 4px solid #f6f6f6;
}

.anklet_map {
	position: Relative;
	overflow: hidden;
	margin-top: 45px;
}

.anklet_map>div {
	float: left;
	box-sizing: border-box;
	margin-left: 20px;
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
	margin-left: 10px;
	font-weight: bold;
	font-size: 16px;
}

td.dot.left {
	width: 450px;
}

.table_style {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0px;
	border: 1px solid #ddd;
	border-bottom: none;
}

.table_style th {
	font-size: 16px;
	color: #393939;
	font-weight: 500;
	text-align: center;
	padding: 15px;
	border-bottom: 1px solid #ddd;
	background-color: #f6f6f6;
	letter-spacing: -0.5pt;
}

.table_style td {
	font-size: 16px;
	border-bottom: 1px solid #ddd;
	text-align: center;
	letter-spacing: -0.5pt;
	border-right: 1px solid #ddd;
}

/* FAQ */
.faq {
	border-bottom: 0px solid #ddd;
	margin: 1em 0;
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

.faq .a {
	background: #f8f8f8 url("faq1_icon_a.png") no-repeat 40px 10px;
	padding: 10px 75px 10px 75px;
	font-size: 16px;
	color: #444444;
	line-height: 22px;
	border-top: 1px solid #bdbdbd;
	margin: 5px 0 0 0;
}


/******************** 카메라 촬영죄 ************** */
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

/************** 성매매란 ************  */

.icon_toptxt {
	display: table;
	width: 100%;
	margin-bottom: 45px;
}

.icon_toptxt dt {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	background: #f2f2f2 url('/hansong/resources/images/prostitution1.png')
		center center no-repeat;
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

h4.sub_title span {
	line-height: inherit;
	letter-spacing: inherit;
}

.whiteBox_in {
	background: #fff;
	position: relative;
	overflow: hidden;
	padding: 24px 17px 20px 17px;
	box-sizing: border-box;
	border: 4px solid #f6f6f6;
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
	margin-left: 10px;
	font-weight: bold;
	font-size: 16px;
}

td.dot.left {
	width: 450px;
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

	<div id="tab01" class="tab-contents">
		<div class="container" style="margin-bottom: 20px">
			<h2 id="ag">전자발찌</h2>
		</div>

		<div class="container">
			<dl class="icon_toptxt anklet">
				<dt></dt>
				<dd>
					<h4 class="sub_title bold">
						<span class="font_navy">전자감독제도</span> (전자발찌)
					</h4>

					<p class="sub_txt">
						재범위험성이 높은 특정 범죄자의 신체에 전자장치를 부착하여 24시간 대상자의 위치, 이동경로를 파악하여 <br>
						보호관찰관의 지도 감독에 활용함으로써 재범을 억제시키는 것입니다.
					</p>
					<p class="font_orange sub_txt mtop20">※ 특정 범죄자에 대한 보호관찰 및 전자장치
						부착 등에 관한 법률 (약칭:전자장치부착법)</p>
				</dd>
			</dl>

			<div class="container whiteBox">
				<div class="whiteBox_in">
					<h6 class="dot3">제 17조(부착명령의 가해제 신청 등)</h6>
					<p>
						① 보호관찰소의 장 또는 피부착자 및 그 법정대리인은 해당 보호관찰소를 관할하는 심사위원회에 부착명령의 가해제를 신청할
						수 있다. <br> ② 제1항의 신청은 부착명령의 집행이 개시된 날부터 3개월이 경과한 후에 하여야 한다.
						신청이 기각된 경우에는 기각된 날부터 3개월이 경과한 후에 다시 신청할 수 있다. <br> ③ 제2항에 따라
						가해제의 신청을 할 때에는 신청서에 가해제의 심사에 참고가 될 자료를 첨부하여 제출하여야 한다.
					</p>
					<br>
					<h6 class="dot3">제 19조(가해제의 취소 등)</h6>
					<p>
						① 보호관찰소의 장은 부착명령이 가해제된 자가 특정범죄를 저지르거나 주거이전 상황 등의 보고에 불응하는 등 재범의
						위험성이 있다고 판단되는 때에는 심사위원회에 가해제의 취소를 신청할 수 있다. 이 경우 심사위원회는 가해제된 자의
						재범의 위험성이 현저하다고 인정될 때에는 가해제를 취소하여야 한다.[ 개정 2009. 5. 8. ] <br>
						② 제1항에 따라 가해제가 취소된 자는 잔여 부착명령기간 동안 전자장치를 부착하여야 하고, 부착명령할 때 개시된
						보호관찰을 받아야 하며, 부과된 준수사항(준수기간이 종료되지 않은 경우에 한정한다)을 준수하여야 한다. 이 경우
						가해제기간은 부착명령기간에 산입하지 아니한다. <br>
					</p>
					<h6 class="dot3">제 21조(벌칙)</h6>
					<p>
						① 성매매를 한 사람은 1년 이하의 징역이나 300만원 이하의 벌금·구류 또는 과료(科料)에 처한다. <br>
						② 제7조제3항을 위반한 사람은 500만원 이하의 벌금에 처한다.
					</p>
				</div>
			</div>

			<div class="container anklet_map">
				<div class="anklet_map_img">
					<img alt="보호관찰심사위원회" src="/hansong/resources/images/anklet_map.gif">
				</div>
				<div class="anklet_map txt">
					<h5 class="dep_tit nomtop">● 보호관찰심사위원회</h5>
					<p class="dot3">
						<span class="medium black">관할소재지</span> : 서울,부산,대구,광주,대전 등 5개 <span
							class="font_navy2 medium">고등검찰청 소재지</span>
					</p>

					<div class="dot">
						<p>
							ㆍ 위원장을 포함한 <span class="font_navy2 medium">5~9 이내 위원</span> 으로 구성
						</p>
						<p>ㆍ 위원장은 고등검찰청 검사장 또는 고등검찰청 소속 검사중에서 법무부장관이 임명</p>
					</div>
				</div>
			</div>
			<h5 class="dep_tit">● 전자장치의 구성</h5>
			<table class="table_style">
				<colgroup>
					<col width="248" />
					<col width="182" />
					<col width="" />
				</colgroup>
				<thead>
					<tr>
						<th>이미지</th>
						<th>명칭</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><img src="/hansong/resources/images/anklet_img01.jpg"
							alt="부착장치" /></td>
						<td class="black medium">부착장치</td>
						<td class="dot left">
							<p>ㆍ 피부착자의 발목에 부착</p>
							<p>ㆍ 휴대용 추적 장치 소지여부 감독</p>
							<p>ㆍ 본체 및 스트랩 훼손 감지</p>
						</td>
					</tr>
					<tr>
						<td><img src="/hansong/resources/images/anklet_img02.jpg"
							alt="휴대용 추적장치" /></td>
						<td class="black medium">휴대용 추적장치</td>
						<td class="dot left">
							<p>ㆍ 위치를 실제 측위하여 관제센터로 전송</p>
							<p>ㆍ 필요에 따라 보호관찰관 및 관제센터와 음성통화</p>
							<p>ㆍ 장치훼손 감지</p>
						</td>
					</tr>
					<tr>
						<td><img src="/hansong/resources/images/anklet_img03.jpg"
							alt="재택감독장치" /></td>
						<td class="black medium">재택감독장치</td>
						<td class="dot left">
							<p>ㆍ 피부착자의 주거지에 설치 대상자 귀가, 재택여부 파악</p>
							<p>ㆍ 휴대용 추적장치 충전</p>
							<p>ㆍ 장치훼손 감지</p>
						</td>
					</tr>
				</tbody>
			</table>


			<div class="container faq">
				<div class="faqHeader"></div>
				<ul class="faqBody">
					<li class="article" id="a1">
						<p class="q">
							<a href="#a1">Q) 재범위험성평가도구란?</a>
						</p>
						<p class="a">A) 특정범죄자를 대상으로 재범 위험성 평가도구를 이용하여 범죄 경력과 성습관, 사회성
							등을 분석하여 재범을 예측하는 도구이며,항목은 "성범죄 횟수", " 피해자 나이와의 관계", "최초 경찰입건 나이",
							"범행의 책임수용", "혼인관계" 등 문항으로 나뉘어져 있습니다.</p>
					</li>
					<li class="article" id="a2">
						<p class="q">
							<a href="#a2">Q) 특정범죄 중 전자발찌 가해제의 인용률이 왜 낮을까?</a>
						</p>
						<p class="a">
							A) 전자발찌 가해제에 대하여 전자장치부착법 제17조는 3개월 이후 피부착자를 담당하는 보호관찰소장 또는 피부착자 및
							법정대리인은 가해제를 신청할 수 있다고 규정하고 있습니다.<br> 그러나 특정범죄 중 성범죄만 유독 가해제
							신청률도 낮을 뿐만 아니라 가해제 인용률도 다른 범죄에 비해 현저히 낮게 나타나고 있습니다.
						</p>
					</li>
					<li class="article" id="a3">
						<p class="q">
							<a href="#a3">Q) 가해제 인용률이 낮기 때문에 부착명령기간을 온전히 준수하여야 하는가?</a>
						</p>
						<p class="a">A) 부착명령 기간을 짧게면 짧게 길게면 길게 받았어도 본인에게 차갑게 돌아오는 주변의
							시선을 감수하고 사회생활을 정상적으로 할 수 있다면 가해제 신청을 신청하지 않고 부착명령 기간을 준수하시면 됩니다.</p>
					</li>
				</ul>
			</div>
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
	
		<div id="tab03" class="tab-contents">
		<div class="container" style="margin-bottom: 20px">
			<h2 id="ag">성매매란</h2>
		</div>

		<div class="container">
			<dl class="icon_toptxt anklet">
				<dt></dt>
				<dd>
					<h4 class="sub_title bold">
						<span class="font_navy">성매매란?</span>
					</h4>

					<p class="sub_txt">
						성관계를 매개로 금품이나 그 밖의 재산상의 이익을 서로 약속한 상태에서 이루어지는 성행위는 물론, 신체의 일부 또는
						도구를 이용한 '유사 성교 행위'까지 포괄적으로 포함됩니다. <br> 법적규제는「성매매알선 등 행위의 처벌에
						관한 법률」과「풍속영업의 규제에 관한 법률」,「청소년의 성 보호에 관한 법률」 등 특별법으로 제정 하여 성매매행위에
						대한 규제를 하고 있습니다.
					</p>

				</dd>
			</dl>

			<div class="container">
				<p style="font-weight: bold; font-size: 18px;">● 성매매알선등 행위의 처벌에
					관한 법률</p>
				<div class="whiteBox_in">
					<h6 class="dot3">제 18조(벌칙)</h6>
					<p>
						①다음 각 호의 어느 하나에 해당하는 사람은 10년 이하의 징역 또는 1억원 이하의 벌금에 처한다. <br>
						1. 폭행이나 협박으로 성을 파는 행위를 하게 한 사람 <br> 2. 위계 또는 이에 준하는 방법으로 성을
						파는 사람을 곤경에 빠뜨려 성을 파는 행위를 하게 한 사람 <br> 3. 친족관계, 고용관계, 그 밖의 관계로
						인하여 다른 사람을 보호·감독하는 것을 이용하여 성을 파는 행위를 하게 한 사람 <br> 4. 위계 또는
						위력으로 성교행위 등 음란한 내용을 표현하는 영상물 등을 촬영한 사람
					</p>
					<br>
					<h6 class="dot3">제 19조(벌칙)</h6>
					<p>
						① 다음 각 호의 어느 하나에 해당하는 사람은 3년 이하의 징역 또는 3천만원 이하의 벌금에 처한다. <br>
						1. 성매매알선 등 행위를 한 사람 <br> 2. 성을 파는 행위를 할 사람을 모집한 사람 <br>
						3. 성을 파는 행위를 하도록 직업을 소개·알선한 사람 <br> ② 다음 각 호의 어느 하나에 해당하는 사람은
						7년 이하의 징역 또는 7천만원 이하의 벌금에 처한다. <br> 1. 영업으로 성매매알선 등 행위를 한 사람
						<br> 2. 성을 파는 행위를 할 사람을 모집하고 그 대가를 지급받은 사람 <br> 3. 성을 파는
						행위를 하도록 직업을 소개·알선하고 그 대가를 지급받은 사람 <br>
					</p>
					<h6 class="dot3">제 21조(벌칙)</h6>
					<p>
						① 성매매를 한 사람은 1년 이하의 징역이나 300만원 이하의 벌금·구류 또는 과료(科料)에 처한다. <br>
						② 제7조제3항을 위반한 사람은 500만원 이하의 벌금에 처한다.
					</p>
				</div>
			</div>





			<div class="container">
				<p style="margin-top: 50px; font-weight: bold; font-size: 18px;">●
					성매매사범 구속 기준</p>
				<div class="whiteBox_in">
					<h6 class="dot3">제 22조(성매매 사범)</h6>
					<p>
						1. 성매매 피의자에 대한 구속 여부를 판단할 때에는 다음 각 호의 요소를 고려하여야 한다.<br> ①
						인신매매,청소년고용, 감금/갈취 등 가혹 행위 여부, 범행의 규모/기간 등 사안의 중대성<br> ② 범행의
						수단 및 영업성<br> ③ 범행의 태양 및 범행 가담 정도<br> ④ 성매매 피해자와의 관계,
						피해자의 연령<br> ⑤ 범죄 전력 및 범행 후의 정황<br>
					</p>
					<br>
					<h6 class="dot3"></h6>
					<p>
						2. 다음 각 호의 1에 해당하는 피의자는 원칙적으로 구속 대상으로 본다.<br> ① 사람을 감금하거나 단체
						또는 다중의 위력으로 성매매를 강요한 자<br> ② 범죄단체나 그 구성원으로서 성매매를 강요/알선한 자<br>
						③ 마약 등을 사용하거나 폭행/협박 또는 위계로 사람을 곤경에 빠트려 성을 파는 행위를 하게 한 자<br> ④
						성매매 목적의 인신매매를 한 자<br> ⑤ 청소년이나 장애인으로 하여금 성을 파는 행위를 하게 한 자
					</p>
				</div>
			</div>





			<div class="container faq">
				<div class="faqHeader"></div>
				<ul class="faqBody">
					<li class="article" id="a1">
						<p class="q">
							<a href="#a1">Q) 건전마사지 업소에서 마사지사가 은근슬쩍 손님의 성기나 민감한 부위를 터치한
								경우?</a>
						</p>
						<p class="a">A) 성교를 포함한 성적 서비스에 대한 제공 행위인지, 아니면 실제 피부·근육에 자극을
							주어 치료하는 방식의 치료법의 일환으로 보아야 할지에 대해서는 형태의 성적 서비스의 제공행위 중 어느 지점에 어떠한
							규제의 선을 그을것인가 하는 점에 있으므로 매우 난해한 문제입니다.</p>
					</li>
					<li class="article" id="a2">
						<p class="q">
							<a href="#a2">Q) 유사성교행위 및 성추행에 대하여 (마사지샵)</a>
						</p>
						<p class="a">A) 다름 아니라 건전마사지 샵에서 마사지를 받는 도중 관리사가 기습적으로 손님의 성기를
							만지거나 마사지하여 불쾌한 느낌을 받았다면 성추행에 해당하나 마사지 비용에 유사성교 행위에 대한 비용이 일부 포함된
							사실을 마사지사가 인정하는 경우 성매매로 인한 형사처벌을 받을 가능성이 매우 높으므로 주의하셔야 합니다.</p>
					</li>
					<li class="article" id="a3">
						<p class="q">
							<a href="#a3">Q) 성매매 미수(사기)에 관하여</a>
						</p>
						<p class="a">
							A) 출장안마, 랜덤채팅, 왁싱출장 등 다양한 방식의 성매매 사기가 활개를 치고 있습니다. 특히 성매수 남성들의
							성적욕구를 자극하여 이성을 잃게 만들고 금전을 취하는 방식의 사기가 주를 이루는데 그 방식을 보면 먼저 성매수 남성이
							맘에 드는 여성의 프로필을 지목하게 하고 이후 출장비 또는 안전금 명목으로 선금을 송금하도록 요구하고 업체에서는
							ATM 전산오류 또는 이체오류를 거짓으로 이야기 하며 반복적으로 출장비를 요구합니다. <br><br> 이미 출장비를
							선 지급한 피해자는 이를 환급해준다는 업체의 말만 믿고 계속 입금하지만 통장에 원금이 거의 없어져 더 이상 이체를
							하지 못할 때쯤 사기 당했다는 것을 인지합니다. <br><br> 하지만 우리나라는 성매매가 불법이라는 사실을 대부분
							알고 있기에 섯불리 경찰에 신고하지 못하고 그 사이에 업체는 통장에 있는 돈을 착복하여 사라지는 방식으로 성매매사기를
							당하면 바로 경찰에 신고하여 은행에 거래지급정지를 요구하여야 피해를 최소화 할 수 있다는 점을 꼭 유의하시기
							바랍니다.
						</p>
					</li>
					<li class="article" id="a2">
						<p class="q">
							<a href="#a4">Q) 미성년자 성매매 권유·유인에 관하여 ?</a>
						</p>
						<p class="a">A) 상대방이 미성년자임을 인지한 상태에서 조건만남이나 성매매를 시도하였다면 성매매
							미수라 할지라도 형사 처벌을 받을 가능성이 높습니다. 특히 아동·청소년들은 법의 맹점을 악용하여 성인남성들을 성매매로
							유인하여 출장비를 선 지급 받자 마자 본인이 미성년자임을 밝히며 협박까지 하는 사례가 늘어나고 있습니다. 상기와 같은
							경우에 따라서는 곤경에 처할 수 있으니 유의하시기 바랍니다.</p>
					</li>
					<li class="article" id="a2">
						<p class="q">
							<a href="#a5">Q) 미성년자 성매매 사기</a>
						</p>
						<p class="a">A) 미성년자는 랜덤채팅을 이용하여 조건만남(성매매)방을 개설하고 성매수 남성을 기다리다
							채팅방에 참여하면 직접 통화를 하여 의심을 해소시키면서 바로 만남을 하기 위한 장소를 정하고 출장비를 요구합니다.
							돈을 입금하는 순간 상대방은 본인이 미성년자임을 발설하며 합의금을 요구하고 요구사항이 받아지지 않으면 경찰에
							신고한다며 협박을 하게 됩니다.</p>
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

