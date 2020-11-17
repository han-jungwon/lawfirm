<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal" />
<!DOCTYPE html>
<html>
<head>
<title>법무법인 한송</title>
<meta name="keywords" content="법무법인 한송">
<meta name="description" content="법무법인 한송 메인페이지">
<meta name="author" content="Team. hansong">
<jsp:include page="./common/header.jsp" />
<!-- Site css -->
<link rel="stylesheet" href="/hansong/resources/css/carousel.css" >
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/carousel/"/>
<style>

/* 반응형 화면  */
@media screen and (max-width: 1680px) {


	}

@media screen and (max-width: 1280px) {



	}

@media screen and (max-width: 980px) {
	.camera{
		margin-left: 0px !important; 
		margin-right: 0px !important;
		}


	}

@media screen and (max-width: 736px) {
		.bd-placeholder-img-lg {
			font-size: 3.5rem;
		}
		ul.business_icon{
			margin-left: 60px !important;
		} 
				.camera{
		margin-left: 0px !important; 
		margin-right: 0px !important;
		}


	}

@media screen and (max-width: 480px) {
		ul.business_icon{
			margin-left: 50px !important;
		} 
		.camera{
		margin-left: 0px !important; 
		margin-right: 0px !important;
		}	

	}


/* 전문분야  */

.business_icon {
	position: Relative;
	overflow: hidden;
}

.business_icon li {
	float: left;
	margin-right: 20px;
	text-align: center;
}

.business_icon li:last-child {
	margin-right: 0
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
	background: #f2f2f2 url('./resources/images/anklet1.png') center center
		no-repeat;
	margin-bottom: 20px;
	transition: all 0.3s ease-out;
}

.business_icon li:nth-child(2) span {
	background-image: url('./resources/images/camera1.png');
}

.business_icon li:nth-child(3) span {
	background-image: url('./resources/images/prostitution1.png');
	background-position: 49px center
}

ul.business_icon {
	margin-left: 200px;
}

.business_icon li a:hover {
	transition: all 0.3s ease-out;
	color: #182952;
}

.business_icon li a:hover span {
	transition: all 0.3s ease-out;
	background-color: #182952;
	background-image: url('./resources/images/anklet2.png')
}

.business_icon li:nth-child(2) a:hover span {
	background-image: url('./resources/images/camera2.png')
}

.business_icon li:nth-child(3) a:hover span {
	background-image: url('./resources/images/prostitution2.png')
}
ul {
    list-style-type: none;
}
.specially {
	font-size: 35px;
	line-height: 100%;
	font-weight: 700;
	letter-spacing: -1.5pt;
	color: #262626;
	margin-bottom: 24px;
	text-align: center;
	position: relative;
}

.specially {
	letter-spacing: inherit;
	line-height: inherit;
	font-weight: 300
}

.specially-1 {
	font-size: 16px;
	letter-spacing: -0.5pt;
	line-height: 25px;
	text-align: center;
	margin-bottom: 40px;
}

.featurette-heading{
	margin-top: 80px;

}
.camera{
	margin-left: 100px; margin-right: 100px;
}

/* 채팅영역 */
.chat {
	float: right;
	position: fixed;
	right: 0;
	z-index: 999 !important
}
.chat_kakao {
	bottom: 8em;
	margin-right: 50px;
}
.chat_normal {
	bottom: 5em;
	margin-right: 60px;
}

.image {
	cursor: pointer;
    border-radius: 10%;
    margin-left: 100px;
    margin-right: 80px;
	width: 180px;
	height: 240px;
}

</style>
</head>
<body>

	<jsp:include page="./common/navbar.jsp" />
	<main role="main">

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="bd-placeholder-img" width="100%" height="100%" src="./resources/images/banner1.jpg" border="0">
					<div class="container">
						<div class="carousel-caption text-left">
							<h1 style="font-weight:bold;">LAW FIRM SONGHAN</h1>
							<p style="font-weight:bold;">
							법무법인 송한은 다년간의 전문적인 경험과 정직으로 <br>최상의 법률서비스를 제공해드립니다.
							</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="bd-placeholder-img" width="100%" height="100%" src="./resources/images/banner2.jpg" border="0">
					<div class="container">
						<div class="carousel-caption">
							<h1>LAW FIRM SONGHAN</h1>
							<p>2500건 이상의 사건 수임과 다양한 성공사례가 증명합니다.</p>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<img class="bd-placeholder-img" width="100%" height="100%" src="./resources/images/banner3.jpg" border="0"
							style="cursor: pointer">
					<div class="container">
						<div class="carousel-caption text-right">
							<img  src="./resources/images/banner3-1.png" style="margin-right: 500px">
							<h1>LAW FIRM SONGHAN</h1>
							<p>법무법인 송한은 언제나 의뢰인의 입장에서 생각하겠습니다.</p>
						</div>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#myCarousel" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#myCarousel" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>


		<!-------------- 전문분야 -------------->

		<div class="container marketing">

			<div class="contents">
				<h3 class="specially">전문분야</h3>
				<p class="specially-1">한송만의 노하우가 담긴 전략과 기획으로 형사법 분야의 최고가 되겠습니다.</p>
				<ul class="business_icon">
					<li><a href="/hansong/main/anklet"> <span class="icon"></span> 전자발찌
					</a></li>
			
					<li><a class="camera" href="/hansong/main/camera"> <span class="icon"></span> 카메라 촬영죄
					</a></li>

					<li><a href="/hansong/main/prostitution"> <span class="icon"></span> 성매매
					</a></li>
				</ul>
			</div>
		



			<!------------ 변호사 소개 ------------>

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7 order-md-2">
					<h2 class="featurette-heading">대표 변호사  한정원</h2>
					
					<p class="lead">사법시험 45회, 사법연수원 36기 수료 <br> 
									前 법무법인 가든 소속변호사<br>
									現  KH 자문변호사<br>
									現 법무법인 송한 대표변호사</p>
				</div>
				<div>
					<div>
						<img class="image" src="/hansong/resources/images/jungwon.png" border="0"
							 onclick="location.href='/hansong/main/lawyer'">
					</div>
				</div>
			</div>

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7 order-md-2">
					<h2 class="featurette-heading">대표 변호사  송민준</h2>
					
					<p class="lead">사법시험 45회, 사법연수원 36기 수료 <br> 
									前 법무법인 가든 소속변호사<br>
									現  KH 자문변호사<br>
									現 법무법인 송한 대표변호사</p>
				</div>
				<div>
					<div>
						<img class="image" src="/hansong/resources/images/song.jpg" border="0"
							 onclick="location.href='/hansong/main/lawyer'">
					</div>
				</div>
			</div>

			<hr class="featurette-divider">

			<!-- /END THE FEATURETTES -->

		</div>
		<button type="button" class="btn btn-outline-white chat chat_kakao" id="btnChatKaKao">
			<img src="/hansong/resources/images/kakao.png" height="70px" width="70px">
		</button>
		<br>
		<button type="button" class="btn btn-outline-white chat chat_normal" id="btnChatNormal" ><!-- data-toggle="modal" data-target="#mdlChatNormal" -->
			<svg id = "imgChatNormal" width="50px" height="50px" viewBox="0 0 16 16" class="bi bi-chat-dots" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				<path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
				<path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
			</svg>
			<span id = "spanChatNormal" style="display: none;" class="spinner-border spinner-border-sm"></span>
		</button>
		<button type="button" id="test2"></button>
		<!-- /.container -->
		<jsp:include page="./common/footer.jsp" />

	</main>
	<div class="modal fade" id ="mdlChatNormal">
		<div class="modal-dialog  modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h1 class="modal-title" style="font-size: large">실시간 상담</h1>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- messages -->
				<div class="modal-body" style="overflow-x: hidden; overflow-y: auto; height: 400px; word-break: break-all;">
					<ul>
					</ul>
				</div>

				<!-- message-input -->
				<div class="modal-footer">
					<div class="form-group" style="display: contents;">
						<textarea class="form-control" rows="2" id="txtChatContent" placeholder="내용을 입력하세요."></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	$(function () {
		const main = {
			ws : null,
			init: function () {

				const _this = this;

				$("#btnChatNormal").click(function () {
					_this.btnChatNormalClick();
				})
				// modal out -> socket close
				$("#mdlChatNormal").on("hidden.bs.modal",function (e) {
					common.gfn_alert('confirm','알림',"정말로 나가시겠습니까?",'small', null, false, true, _this.chatClose);
				})

				// enter 입력 시 채팅 보내기
				$(window).on('keyup',function (e) {
					if(e.which == 13) {
						var message = _this.newMessage();
						if(common.gfn_isNotNull(message)) {
							_this.chatSend(message);
						}
						return false;
					}
				})

				$("#test2").click(function () {
					//common.alertBox("gd",test,'gd');

					let modalContent = "";
					modalContent += "<div>";
					modalContent += "	<button id = \"odd\">gd</button>";
					modalContent += "	<button id = \"odd\">gd</button>";
					modalContent += "	<strong>로그인이 되었습니다.</strong>";
					modalContent += "</div>";
					common.gfn_alert('c','알림',modalContent,'normal', null, false, true, _this.test, {val:'test'});

				});
				/**
				 *  ~~
				 */
				// 동적 리소스
				$(document).on("click", "#odd", function () {
					console.log("정워나 알러뷰");
				});
			},

			// 상담 나가기 시
			chatClose : function(result, json) {
				if(result) {
					main.chatSend(common.gfn_getUserId()+"님이 퇴장하셨습니다.");
					main.ws.close();
				}
			},

			// 일반상담 클릭 시 socket open
			btnChatNormalClick : function() {
				$("#imgChatNormal").hide();
				$("#spanChatNormal").show();
				if(common.gfn_isNull(common.gfn_getUserId())) {
					common.gfn_alert('c','알림',"로그인을 먼저 해주세요.",'small');
					$("#imgChatNormal").show();
					$("#spanChatNormal").hide();
					return;
				}


				this.ws = new WebSocket("ws://localhost:8088/hansong/boot");

				$("#mdlChatNormal").modal('show');
				$("#imgChatNormal").show();
				$("#spanChatNormal").hide();

				// 웹 소켓 연결 시 호출되는 이벤트
				this.ws.open = function (event) {
					if(common.gfn_isNull(event.data)) {
						console.log(event.data);
					}
				}
				// 웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트이다.
				this.ws.onmessage = function (event) {
					main.chatResponse(event.data);
				}

				// 웹 소켓이 닫혔을 때 호출되는 이벤트입니다.
				this.ws.onclose = function(event) {
					common.gfn_alert('c','알림',"상담이 종료되었습니다.",'small');
				}
			},
			/**
			 * @description message 보냄
			 * @param sMessage(String)
			 */
			chatSend : function(sMessage) {
				this.ws.send(sMessage);
			},

			chatResponse : function(rtext) {
				var arr = rtext.split('&');
				var message = arr[1];

				var out = "님이 퇴장하셨습니다.";
				var inin = "님이 입장하셨습니다.";
				var output = "";
				// 입장과 퇴장의 경우 css가 가운데로 위치해야 함.
				console.log(message);
				if(message.indexOf(out) > -1 || message.indexOf(inin) > -1) {
					var index = message.lastIndexOf('.');
					output = "<li class = 'inout'><p></p></li>";
					message = message.substring(0, index);
				} else {
					var name = arr[0];
					output = "<li class = 'replies'>"
							+"<sup>" + name + "</sup><p></p></li>";
				}
				$(".modal-body > ul").append(output);
				$('.modal-body > ul > li').last().find('p').text(message);

			},

			newMessage : function() {
				var message = $("#txtChatContent").val();

				if(common.gfn_isNull($.trim(message))) {
					return false;
				}

				var output = "<li class='sent'>"
							+"<p></p></li>";
				$(".modal-body > ul").append(output);
				$('.modal-body > ul > li').last().find('p').text(message);
				$("#txtChatContent").val(null);

				return message;
			},

			/**
			 *
			 */
			test : function (result, jsonData) {
				location.href=common.gfn_getContextPath()+"/main";
				if(result == true) {
					console.log(result);
				}
				if(jsonData.val == 'test') {
					console.log(jsonData);
				}
			}
		}
		main.init();

		/*  common 참고용
		$("#test2").click(function () {
			//common.alertBox("gd",test,'gd');

			let modalContent = "";
			modalContent += "<div>";
			modalContent += "	<button id = \"odd\">gd</button>";
			modalContent += "	<button id = \"odd\">gd</button>";
			modalContent += "	<strong>로그인이 되었습니다.</strong>";
			modalContent += "</div>";
			common.gfn_alert('c','알림',modalContent,'normal', null, false, true, test, {val:'test'});

		});
		// 동적 리소스
		$(document).on("click", "#odd", function () {
			console.log("정워나 알러뷰");
		});
		function test(result,jsonData) {
			location.href=common.gfn_getContextPath()+"/main";
			if(result == true) {
				console.log(result);
			}
			if(jsonData.val == 'test') {
				console.log(jsonData);
			}
		}
		 common 참고용 end */
	})
</script>
</body>
</html>