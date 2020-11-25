<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<jsp:include page="../common/header.jsp" />

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<style>
#h3_category {
	margin-top: 50px;
    margin-bottom: 30px;
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
		<form id = "boardUpdateForm" action = "/hansong/boards/boardUpdate" method="post" name="boardForm" enctype="mutipart/form-data">
		<input id = "board_id" type="hidden" name="board_id" value="${board.id}">
		
		<input type="hidden" name="email" value="${member.email}">
		<input type="hidden" id="board_category" name="BOARD_CATEGORY" value="${board.board_category}">
		<h3 id="h3_category">수정</h3>
		<div class="form-group">
			<label for="boardTitle">제목</label>
	                                                                                                                                                                                                     		<input type = "text"  class="form-control"  name="board_title" id="board_title" value="${board.board_title}" placeholder="제목을 입력해 주세요.">		
		</div>
		
		<div class="form-group">
			<label for="boardName">작성자</label>
			<input name="updt_id" id="updt_id" value="${board.regi_id}" readOnly type = "text" class="form-control">		
		</div>   
		
		<div class="form-group">
			<label for="boardContent">내용</label>
			<textarea name="board_content" id="board_content"></textarea>	
		</div>
		
		 <div class="form-group">
	      <button id ="boardEditBtn" type="submit" class="btn btn-primary">수정</button>
	      <button type="reset" class="btn btn-primary" onClick="history.go(-1)">취소</button>
	    </div>     			
		</form>		
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	<!-- summernote -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</body>

<script>


$(function() {
	//여기 아래 부분
	$('#board_content')
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

$('#board_content').summernote('code', '${board.board_content}');

// 카테고리


if($("#BOARD_CATEGORY").val()=="0"){
$('#h3_category').text("공지사항");	
}else if($("#BOARD_CATEGORY").val()=="1"){
$('#h3_category').text("온라인 상담");
}else if($("#BOARD_CATEGORY").val()=="2"){
$('#h3_category').text("언론보도");
}else if($("#BOARD_CATEGORY").val()=="3"){
$('#h3_category').text("합의서");
}else if($("#BOARD_CATEGORY").val()=="4"){
$('#h3_category').text("탄원서");
}else{
$('#h3_category').text("반성문");
}







</script>	
</html>