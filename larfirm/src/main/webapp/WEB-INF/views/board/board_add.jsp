<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<jsp:include page="../common/header.jsp" />
<!-- Site css -->
<link rel="stylesheet" href="../resources/css/joinform.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
<script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>
</head>
<body>
<div class="container">
		<form id="board_form"action="/pro/board_add_action" method="post"
			enctype="multipart/form-data" name="boardform">
			<h3 id="h3_category">게시판 글쓰기</h3>
			<input id="board_category" type="hidden" name="BOARD_CATEGORY" value="${BOARD_CATEGORY}">
			<input type="hidden" name="MEMBER_ID" value="${id}">
			<div class="form-group">
				<label for="board_name">글쓴이</label> 
				<input name="MEMBER_NAME"
					id="board_name" value="${nickname}" readOnly type="text" class="form-control">
			</div>

			<div class="form-group">
				<label for="board_pass">비밀번호</label> <input name="BOARD_PASSWORD"
					id="board_pass" type="password" size="4" maxlength="4"
					class="form-control" placeholder="Enter password(숫자 4자리)" value="">
			</div>

			<div class="form-group">
				<label for="board_subject">제목</label> <input name="BOARD_SUBJECT"
					id="board_subject" type="text" size="50" maxlength="100"
					class="form-control" placeholder="Enter board_subject" value="">
			</div>

			<div class="form-group">
				<label for="board_content">내용</label>
				<textarea name="BOARD_CONTENT" id="board_content"></textarea>
			</div>

			<div class="form-group">
				<label style ="display:inline" for="board_file">파일 첨부</label> 
				<label style ="display:inline" for="upfile" data-toggle="tooltip" data-placement="top" title="최대 용량 : 10MB"> 
					<img style="vertical-align: bottom" id=ig src="/pro/resources/Image/attach.png" width ="10px" alt="파일첨부">
				</label> 
				<input  multiple ="multiple" type="file" id="upfile" name="uploadfile">
				<span id="filevalue"></span>
				<img style="vertical-align: bottom" src="/pro/resources/Image/icon/x-circle.svg" alt="파일삭제" width="10px" class="remove">
			</div>
			<div class="form-group">
				<div class="g-recaptcha" data-sitekey=key>
				</div>
			</div>
			<div class="form-group">
				<button id="add_board_button"type="button" class="btn" style="background : rgb(83, 133, 193); color:white;">등록</button>
				<button type="button" class="btn btn-secondary" onClick='history.back(); return false;'>취소</button>
			</div>

		</form>
	</div>
		<jsp:include page="../common/footer.jsp" />
	
</body>
</html>