<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
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
					class="form-control" placeholder="Enter email" id="email" required>
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label> <input type="password"
					class="form-control" placeholder="Enter password" id="pwd" required>
			</div>
			<div class="form-group form-check">
				<label class="form-check-label"> <input
					class="form-check-input" type="checkbox"> Remember me
				</label>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">로그인</button>
				<button type="submit" class="btn btn-primary">회원가입</button>
			</div>

			<div class="form-group">
				<div id="google-login">
					<button type="submit" class="btn btn-primary">구글계정으로 로그인</button>
				</div>
			</div>
			<div class="form-group">
				<div id="google-login">
					<button type="submit" class="btn btn-primary">카카오톡계정으로 로그인</button>
				</div>
			</div>
		</fieldset>
	</form>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>