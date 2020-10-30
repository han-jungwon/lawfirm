<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<jsp:include page="../common/header.jsp" />


<style>
body {
	padding-top: 70px;
}

#login {
	width: 40%;
	border: 1px solid lightgray;
	padding: 20px;
	margin-top: 80px;
	margin-bottom: 200px;
}
</style>
</head>
<jsp:include page="../common/navbar.jsp" />

<div id="login" class="container">
	<form method="post" action="/hansong/authenticate">
		<fieldset>
			<legend> 로그인</legend>
			<div class="form-group">
				<label for="email">이메일</label> <input type="email"
					class="form-control" placeholder="Enter email" id="email" name = "email" required>
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label> <input type="password"
					class="form-control" placeholder="Enter password" id="pwd" name = "pwd"required>
			</div>
			<div class="form-group form-check">
				<label class="form-check-label"> <input
					class="form-check-input" type="checkbox"> Remember me
				</label>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">로그인</button>
				<button type="submit" class="btn btn-primary" onclick="location.href='/hansong/members/joinform'">회원가입</button>
			</div>

			<div class="form-group">
				<div id="google-login">
					<button type="submit" class="btn btn-primary">구글계정으로 로그인</button>
				</div>
			</div>
			<div class="form-group">
				<a id="kakao-login-btn"></a>
			</div>
		</fieldset>
	</form>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
<script>

// 사용할 앱의 JavaScript 키를 설정해 주세요. 
Kakao.init('ef00ed0db2057c8b32419a7a16ca7795'); 
//여기서 아까 발급받은 키 중 javascript키를 사용해준다. 
// 카카오 로그인 버튼을 생성합니다. 
Kakao.Auth.createLoginButton({ 
	container: '#kakao-login-btn',
	success: function(authObj) { 
	alert(JSON.stringify(authObj)); 
	},
		fail: function(err) {
			alert(JSON.stringify(err));
			} 
	});








</script>
</html>