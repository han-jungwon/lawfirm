<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://www.google.com/recaptcha/api.js"></script>
<title>법무법인 송한</title>
</head>
<link rel="stylesheet" href="../resources/css/joinform.css" />
<jsp:include page="../common/header.jsp" />
<jsp:include page="./joinform_account_rule.jsp" />
<jsp:include page="./joinform_info_rule.jsp" />
<style>
body {
	padding-top: 70px;
}
</style>

<body>
	<jsp:include page="../common/navbar.jsp" />
	
	<div>
		<div>
			<form method="post" id="join_member_form" action="/hansong/members">
				<div class="wrap wd668">
					<div class="container">
						<div class="form_txtInput">
							<h2 class="sub_tit_txt">회원가입</h2>
							<div class="join_form">
								<table>
									<colgroup>
										<col width="30%" />
										<col width="auto" />
									</colgroup>
									<tbody>
										<tr>
											<th><span>이메일</span></th>
											<td><input type="email" name="email" id="email"
												placeholder="Email을 입력하세요."></td>
										</tr>
										<tr>
											<th><span>이름</span></th>
											<td><input type="text" name="name" id="name"
												placeholder=""></td>
										</tr>
										<tr>
											<th><span>비밀번호</span></th>
											<td><input type="password" name="password" id="password"
												value="" placeholder="비밀번호를 입력해주세요."></td>
										</tr>
										<tr>
											<th><span>비밀번호 확인</span></th>
											<td><input type="password" id="password2" value=""
												placeholder="비밀번호를 확인하세요"></td>
										</tr>
										<!--            <tr class="email">
                                    <th><span>이메일</span></th>
                                    <td>
                                        <input type="text"  class="email" placeholder=""><span class="mar10">@</span>
                                        <input type="text"  class="email email2" placeholder="">
                                        <a href="javascript:;" class="btn_confirm">인증번호 발송</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>인증번호 확인</span></th>
                                    <td><input type="text" class="send_number" placeholder="10:00">
                                        <a href="javascript:;" class="btn_confirm">인증번호 확인</a>
                                    </td>
                                </tr> -->
										<tr>
											<th><span>휴대폰 번호</span></th>
											<td><input type="tel" name="phone" id="phone"
												placeholder="휴대폰 번호를 입력하세요."></td>
										</tr>
									</tbody>
								</table>
								<div class="exform_txt">
									<span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span>
								</div>
							</div>
							<!-- join_form E  -->
							<div class="form-group">
								<b>약관 확인</b>
								<div class="progress">
									<div class="progress-bar" style="width: 0%">0%</div>
								</div>
							</div>
							<div class="form-group">
								<button id="account_rule_btn" type="button" class="btn btn-info"
									data-toggle="modal" data-target="#account_rule">회원가입
									약관</button>
								<button id="info_rule_btn" type="button" class="btn btn-info"
									data-toggle="modal" data-target="#info_rule">개인정보처리방침</button>
							</div>


							<div class="agree_wrap">
								<div class="checkbox_wrap">
									<input type="checkbox" id="news_letter" name="news_letter"
										class="agree_chk"> <label for="news_letter">[선택]뉴스레터
										수신동의</label>
								</div>
								<div class="checkbox_wrap mar27">
									<input type="checkbox" id="marketing" name="marketing"
										class="agree_chk"> <label for="marketing">[선택]마케팅
										목적 개인정보 수집 및 이용에 대한 동의</label>
									<ul class="explan_txt">
										<li><span class="red_txt">항목 : 성별, 생년월일</span></li>
										<li>고객님께서는 위의 개인정보 및 회원정보 수정 등을 통해 추가로 수집하는 개인정보에<br />
											대해 동의하지 않거나 개인정보를 기재하지 않음으로써 거부하실 수 있습니다.<br /> 다만 이때 회원 대상
											서비스가 제한될 수 있습니다.
										</li>
									</ul>
								</div>

							</div>
							
						 	<div class="form-group">
									<div class="g-recaptcha" 
										data-sitekey="6LcnB94ZAAAAAJyGmoNL2E4Mp7pcBwtz_AeP63xb"></div>	
							</div> 
							
							<div class="btn_wrap">
								<button id=join type="button"
									style="height: 60px; width: 170px; margin-bottom: 100px;">가입하기</button>
							</div>
						</div>
						<!-- form_txtInput E -->
					</div>
					<!-- content E-->
				</div>
				<!-- container E -->
			</form>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
<script>
$(function(){
	let rule_value = 0;
	const joinform = {
		init: function () {			
			const _this = this;
			// 약관 확인
			$("#account_rule_btn").click(function() {
				rule_value += 50;
				$(".progress-bar").css("width", rule_value + "%");
				$(".progress-bar").text(rule_value + "%");
				$("#account_rule_btn").off('click');
			});
			$("#info_rule_btn").click(function() {
				rule_value += 50;
				$(".progress-bar").css("width", rule_value + "%");
				$(".progress-bar").text(rule_value + "%");
				$("#info_rule_btn").off('click');
			});
			
			
			//비밀번호 확인
			$('#password2').blur(function(){
				if($('#password').val() != $('#password2').val()){
					if($('#password2').val()!=''){
						 common.gfn_alert('alert', '알림', '비밀번호가 틀립니다.', 'small');
						$('#password2').val('');
						$('#password2').focus();
					}
				}
			});
			
			/* 가입하기 버튼 눌렀을 때 */
			$('#join').click(function() {
				_this.joinClick();
			});
			
		},

		joinClick : function () { 
			
			if(rule_value != 100){
				common.gfn_alert('alert', '알림', '약관을 읽어주세요.', 'small');
				return false;
			}
			
			if(common.gfn_isNull($('#email').val())){
				common.gfn_alert('alert', '알림', '이메일을 입력하세요.', 'small');
				$('#email').focus();
				return false;

			}
			var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!checkEmail.test($('#email').val())){
				common.gfn_alert('alert', '알림', '적합하지 않은 이메일 형식입니다.', 'small');
				$('#email').focus();
				return false;
			}
			

			if (common.gfn_isNull($('#name').val())) {
				common.gfn_alert('alert', '알림', '이름을 입력하세요.', 'small');
				$('#name').focus();
				return false;
			}

			if(common.gfn_isNull($('#password').val())){
				common.gfn_alert('alert', '알림', '비밀번호를 입력하세요.', 'small');
				$('#password').focus();
				return false;
			}

			var checkPassword = /^\w{4,15}$/;
			if(!checkPassword.test($('#password').val())){
				common.gfn_alert('alert', '알림', '비밀번호를 4~15자리의 영문 대소문자와 숫자로만 입력해주세요.', 'small');
				$('#password').focus();
				return false;
			}

			if(common.gfn_isNull($('#password2').val())){
				common.gfn_alert('alert', '알림', '비밀번호를 확인해주세요.', 'small');
				$('#password2').focus();
				return false;
			}

			if(common.gfn_isNull($('#phone').val())){
				common.gfn_alert('alert', '알림', '휴대폰 번호를 입력하세요.', 'small');
				$('#phone').focus();
				return false;
			}

			$.ajax({
	            url: common.gfn_getContextPath()+"/members/VerifyRecaptcha",
	            type: 'post',
	            data: {
	                recaptcha: $("#g-recaptcha-response").val()
	            },
	            success: function(data) {   
	                switch (data) {
	                    case 0:
	                        console.log("자동 가입 방지 봇 통과");
	                        $('#join_member_form').submit();
	                		break;
	                    case 1:
	                    	common.gfn_alert('alert', '알림', '자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.', 'small');
	                        break;
	                    default:
	                    	common.gfn_alert('alert', '알림', '자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : '
	                    		+ Number(data) +']','small');
	                   		break;
	                }
	            }, error : function(){
	            	console.log('captcha 에러');
	            }
			});   

			
		}
		
		
	}
	
	joinform.init();

});
	


</script>
</html>
