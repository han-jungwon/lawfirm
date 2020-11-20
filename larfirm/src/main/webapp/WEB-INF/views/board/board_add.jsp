<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<jsp:include page="../common/header.jsp" />
<style>
body {
	padding-top: 100px;
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
	<div class="container">
		<form id="board_form" action="/hansong/boards/board_add_action" method="post"
			enctype="multipart/form-data" name="boardform">
			<h3 id="h3_category">게시판 글쓰기</h3>
			<input id="board_category" type="hidden" name="BOARD_CATEGORY"
				value="${BOARD_CATEGORY}"> <input type="hidden"
				name="REGI_ID" value="${board.regi_id}">
			<div class="form-group">
				<label for="board_name">글쓴이</label> <input name="REGI_ID"
					id="board_name" value="${board.regi_id}" readOnly type="text"
					class="form-control">
			</div>

			<div class="form-group">
				<label for="board_subject">제목</label> <input name="BOARD_TITLE"
					id="board_subject" type="text" size="50" maxlength="100"
					class="form-control" placeholder="Enter board_subject" value="">
			</div>


			<div class="form-group">
				<label for="BOARD_CONTENT">내용</label>
				<textarea name="editordata" id="summernote"></textarea>
			</div>

 			<div class="form-group">
				<label style="display: inline" for="board_file">파일 첨부</label> <label
					style="display: inline" for="upfile" data-toggle="tooltip"
					data-placement="top" title="최대 용량 : 10MB"> <img
					style="vertical-align: bottom" id=ig
					src="#" width="10px" alt="파일첨부">
				</label> <input multiple="multiple" type="file" id="upfile"
					name="uploadfile"> <span id="filevalue"></span> <img
					style="vertical-align: bottom"
					src="#" alt="파일삭제"
					width="10px" class="remove">
			</div>
			<!-- <div class="form-group">
				<div class="g-recaptcha" data-sitekey=key></div>
			</div> -->
			<div class="form-group">
				<button id="add_board_button" type="button" class="btn"
					style="background: rgb(83, 133, 193); color: white;">등록</button>
				<button type="button" class="btn btn-secondary"
					onClick='history.back(); return false;'>취소</button>
			</div>

		</form>
	</div>

	<jsp:include page="../common/footer.jsp" />
	<!-- summernote -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> 
</body>
<script>
	$(document)
			.ready(
					function() {
						//여기 아래 부분
						$('#summernote')
								.summernote(
										{
											height : 300, // 에디터 높이
											minHeight : null, // 최소 높이
											maxHeight : null, // 최대 높이
											focus : true, // 에디터 로딩후 포커스를 맞출지 여부
											lang : "ko-KR", // 한글 설정
											placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정

											toolbar : [
													[ 'fontname',
															[ 'fontname' ] ],
													[ 'fontsize',
															[ 'fontsize' ] ],
													[
															'style',
															[
																	'bold',
																	'italic',
																	'underline',
																	'strikethrough',
																	'clear' ] ],
													[
															'color',
															[ 'forecolor',
																	'color' ] ],
													[ 'table', [ 'table' ] ],
													[
															'para',
															[ 'ul', 'ol',
																	'paragraph' ] ],
													[ 'height', [ 'height' ] ],
													[
															'insert',
															[ 'picture',
																	'link',
																	'video' ] ],
													[
															'view',
															[ 'fullscreen',
																	'help' ] ] ],
											fontNames : [ 'Arial',
													'Arial Black',
													'Comic Sans MS',
													'Courier New', '맑은 고딕',
													'궁서', '굴림체', '굴림', '돋음체',
													'바탕체' ],
											fontSizes : [ '8', '9', '10', '11',
													'12', '14', '16', '18',
													'20', '22', '24', '28',
													'30', '36', '50', '72' ]

										});

						$('[data-toggle="tooltip"]').tooltip();
					});
</script>
</html>