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
    background: #f2f2f2 url('/hansong/resources/images/anklet1.png')
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

.anklet_map > div {
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
.medium{
    font-weight: bold !important;
}


.dot p {
    line-height: 28px;
    padding-left: 12px;
    position: relative;
    letter-spacing: -0.5pt;
    text-align: left;
}

.dot3{
	margin-left: 10px;
	font-weight: bold;
	font-size: 16px;
	

}

td.dot.left{
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
.faq{border-bottom:0px solid #ddd;margin:1em 0;}
.faq .faqHeader{position:relative;zoom:1}
.faq .faqHeader .showAll{position:absolute;bottom:0;right:0;border:0;padding:0;overflow:visible;background:none;cursor:pointer}
.faq .faqBody{margin:0;padding:0}
.faq .faqBody .article{list-style:none}
.faq .q{margin:}
.faq .q a{display:block;text-align:left; 
    background:url("faq1_icon_q.png") no-repeat 0 0;
    padding:0 0 0 35px;
    font-size:18px;
    color:#5e5e5e;
    font-weight:bold;
    line-height: 27px;
    cursor:pointer;
    margin: 10px 0 !important;
    margin-top: 50px !important;}
.faq .q a:hover, .faq .q a:active, .faq .q a:focus{}
.faq .a{background:#f8f8f8 url("faq1_icon_a.png") no-repeat 40px 10px;padding: 10px 75px 10px 75px;
    font-size: 16px;
    color: #444444;
    line-height: 22px;
    border-top: 1px solid #bdbdbd;
    margin:5px 0 0 0;
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
			  	<span class="font_navy">전자감독제도</span>
			  		(전자발찌)			  
			  </h4>	
			  
			  <p class="sub_txt">
			  재범위험성이 높은 특정 범죄자의 신체에 전자장치를 부착하여 24시간 대상자의 위치, 이동경로를 파악하여
			 <br>
			  보호관찰관의 지도 감독에 활용함으로써 재범을 억제시키는 것입니다.
			 </p>
			 <p class="font_orange sub_txt mtop20">
			 ※ 특정 범죄자에 대한 보호관찰 및 전자장치 부착 등에 관한 법률 (약칭:전자장치부착법) 
			 </p>
		</dd>
	 </dl>	 
			
		<div class="container whiteBox">
			<div class="whiteBox_in">
				<h6 class="dot3">제 17조(부착명령의 가해제 신청 등)</h6>
				<p>
				① 보호관찰소의 장 또는 피부착자 및 그 법정대리인은 해당 보호관찰소를 관할하는 심사위원회에 부착명령의 가해제를 신청할 수 있다.
				<br>
				② 제1항의 신청은 부착명령의 집행이 개시된 날부터 3개월이 경과한 후에 하여야 한다. 신청이 기각된 경우에는 기각된 날부터 3개월이 경과한 후에 다시 신청할 수 있다.
				<br>
				③ 제2항에 따라 가해제의 신청을 할 때에는 신청서에 가해제의 심사에 참고가 될 자료를 첨부하여 제출하여야 한다.				
				</p>
				<br>
				<h6 class="dot3">제 19조(가해제의 취소 등)</h6>
				<p>
				① 보호관찰소의 장은 부착명령이 가해제된 자가 특정범죄를 저지르거나 주거이전 상황 등의 보고에 불응하는 등 재범의 위험성이 있다고 판단되는 때에는 심사위원회에 가해제의 취소를 신청할 수 있다. 
				이 경우 심사위원회는 가해제된 자의 재범의 위험성이 현저하다고 인정될 때에는 가해제를 취소하여야 한다.[ 개정 2009. 5. 8. ]
				<br>
				② 제1항에 따라 가해제가 취소된 자는 잔여 부착명령기간 동안 전자장치를 부착하여야 하고, 부착명령할 때 개시된 보호관찰을 받아야 하며, 
				부과된 준수사항(준수기간이 종료되지 않은 경우에 한정한다)을 준수하여야 한다. 이 경우 가해제기간은 부착명령기간에 산입하지 아니한다.
				<br>	
				</p>
				<h6 class="dot3">제 21조(벌칙)</h6>
				<p>
				① 성매매를 한 사람은 1년 이하의 징역이나 300만원 이하의 벌금·구류 또는 과료(科料)에 처한다.
				<br>
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
						<span class="medium black">관할소재지</span>
						: 서울,부산,대구,광주,대전 등 5개
						<span class="font_navy2 medium">고등검찰청 소재지</span>
					</p>
				
				<div class="dot">
					<p>
					ㆍ 위원장을 포함한
					<span class="font_navy2 medium">5~9 이내 위원</span>
					으로 구성
					</p>
					<p>
					ㆍ 위원장은 고등검찰청 검사장 또는 고등검찰청 소속 검사중에서 법무부장관이 임명
					</p>						
				</div>										
			</div>
		</div>
		<h5 class="dep_tit">● 전자장치의 구성</h5>
   <table class="table_style"><colgroup><col width="248" /><col width="182" /><col width="" /></colgroup>
      <thead>
         <tr>
            <th>이미지</th>
            <th>명칭</th>
            <th>기능</th>
            </tr>
         </thead>
      <tbody>
         <tr>
            <td><img src="/hansong/resources/images/anklet_img01.jpg" alt="부착장치" /></td>
            <td class="black medium">부착장치</td>
            <td class="dot left">
               <p>ㆍ 피부착자의 발목에 부착</p>
               <p>ㆍ 휴대용 추적 장치 소지여부 감독</p>
               <p>ㆍ 본체 및 스트랩 훼손 감지</p>
               </td>
            </tr>
         <tr>
            <td><img src="/hansong/resources/images/anklet_img02.jpg" alt="휴대용 추적장치" /></td>
            <td class="black medium">휴대용 추적장치</td>
            <td class="dot left">
               <p>ㆍ 위치를 실제 측위하여 관제센터로 전송</p>
               <p>ㆍ 필요에 따라 보호관찰관 및 관제센터와 음성통화</p>
               <p>ㆍ 장치훼손 감지</p>
               </td>
            </tr>
         <tr>
            <td><img src="/hansong/resources/images/anklet_img03.jpg" alt="재택감독장치" /></td>
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
    <div class="faqHeader">
  
    </div>
    <ul class="faqBody">
        <li class="article" id="a1">
            <p class="q"><a href="#a1">Q) 재범위험성평가도구란?</a></p>
            <p class="a"> A) 특정범죄자를 대상으로 재범 위험성 평가도구를 이용하여 범죄 경력과 성습관,
            	 사회성 등을 분석하여 재범을 예측하는 도구이며,항목은 "성범죄 횟수", " 피해자 나이와의 관계", "최초 경찰입건 나이", "범행의 책임수용", "혼인관계" 등 문항으로 나뉘어져 있습니다. </p>
        </li>
        <li class="article" id="a2">
            <p class="q"><a href="#a2">Q) 특정범죄 중 전자발찌 가해제의 인용률이 왜 낮을까?</a></p>
            <p class="a"> A) 전자발찌 가해제에 대하여 전자장치부착법 제17조는 3개월 이후 피부착자를 담당하는 보호관찰소장 또는 피부착자 및 법정대리인은 가해제를 신청할 수 있다고 규정하고 있습니다.<br>
			그러나 특정범죄 중 성범죄만 유독 가해제 신청률도 낮을 뿐만 아니라 가해제 인용률도 다른 범죄에 비해 현저히 낮게 나타나고 있습니다.</p>
        </li>
        <li class="article" id="a3">
            <p class="q"><a href="#a3">Q) 가해제 인용률이 낮기 때문에 부착명령기간을 온전히 준수하여야 하는가?</a></p>
            <p class="a"> A) 부착명령 기간을 짧게면 짧게 길게면 길게 받았어도 본인에게 차갑게 돌아오는 주변의 시선을 감수하고 사회생활을 정상적으로 할 수 있다면 가해제 신청을 신청하지 않고 부착명령 기간을 준수하시면 됩니다.</p>
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

