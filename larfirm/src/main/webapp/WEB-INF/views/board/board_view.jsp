<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<jsp:include page="../common/header.jsp" />
<!-- Site css -->
<link rel="stylesheet" href="../resources/css/joinform.css" />
</head>
<body>
<style>
body {
	padding-top: 70px;
}
button{
	border: none;
}
hr {
	margin : 5px;
}
span {
	width: 20px;
}
#no {
	display: none;
}
#count {
	position: relative;
	top: -10px;
	left: -10px;
	background: orange;
	color: white;
	border-radius: 30%;
}
.container {
	padding-top: 55px;
}
#content {
	width:100%
}
.title {
	font-size : 20pt;
	font-weight : bold;
}
.padding-top {
	padding-top : 10px;
}
.padding-top2 {
	padding-top : 5px;
}
p {
	margin : 0 0 0 0 !important;
}
@media screen and (max-width:400px) {
	.center {
		display: flex;
	}
	
	#reco_button, #read_button, #reply_button, #edit_button, #delete_button, #list_button {
		width : 15%
	}
}
</style>

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
<input type="hidden" id="loginid" value="${board.regi_id}">
	<div class="container">
		<h3 id ="h3_category" class="float-left"></h3> 	
		<table class="table table-bordered">
			<thead>
				<tr>
					<td>
						<span style="font-weight:bold">${board.regi_id}</span>&#32;
						<span style="font-size:9pt"><fmt:formatDate value="${board.regi_dt }" pattern="yyyy.MM.dd"/>에 작성됨</span>
						
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<div class="title">
							<c:if test="${board.board_re_lev !=0}">
								<c:forEach var="a" begin="1" end="${board.board_re_lev}" step="1">
									[re]
								</c:forEach>
							</c:if>
							${board.board_title}
						</div>
						<hr>
						<div>${board.board_content}</div>
					</td>
				</tr>
				<c:if test="${!empty board_file_list}">
				<tr>
					<td>
						<div>첨부파일</div>
						<div>
						<c:forEach var="files" items="${board_file_list}">
							<img src="/pro/resources/Image/down.png" width ="12px">
							<a href="board_file_down?filename=${files.BOARD_FILE}&original=${files.BOARD_FILE_ORIGINAL}">
								${files.BOARD_FILE_ORIGINAL}</a>
							&#32;/&#32;
						</c:forEach>
						</div>
					</td>
				</tr>
				</c:if>
			<tr>
				<!-- 버튼 모음 -->
				<td class="center">
					<!-- 답변 -->
					<a id ="reply_button" href="/hansong/boards/boardReplyView?id=${board_data.BOARD_ID}">
						<button style="background:transparent;vertical-align: middle" data-toggle="tooltip" data-placement="top" title="답변">
						<img src="/hansong/resources/images/reply-fill.svg" width ="25px" class="padding-top2">
						</button>
					</a>
					<c:if test="${board_data.MEMBER_ID == id}">
						<!-- 수정 -->
						<a id ="edit_button" href="/hansong/boards/boardEditView?num=${board_data.BOARD_ID}">
							<button style="background:transparent;vertical-align: middle;" data-toggle="tooltip" data-placement="top" title="수정">
								<img src="/hansong/resources/images/pencil.svg" width ="25px" class="padding-top2">
							</button>
						</a>
						<!-- 삭제 -->
						<a id ="delete_button" href="#">
							<button style="background:transparent;vertical-align: middle;" data-toggle="modal" data-target="#myModal">
							<img src="/hansong/resources/images/trash.svg" width ="25px" class="padding-top2">
							</button>
						</a>
					</c:if> 
					<a id ="list_button" href="/hansong/boards/board_list">
						<button style="background:transparent;vertical-align: middle;" data-toggle="tooltip" data-placement="top" title="목록">
							<img src="/hansong/resources/images/list.svg" width ="25px" class="padding-top2">
						</button>						
					</a>
				</td>
			</tr>
			</tbody>
		</table>
		<div id="comment">
			<table class="table table_striped">
				<thead>
					<tr>
						<td id="comment_length">댓글 (${board_data.BOARD_COMMENT}개)</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty comment_list}">
					<c:forEach var="comments" items="${comment_list}">
					<tr>
						<td>
							<a href="/pro/mypage?MEMBER_ID=${comments.MEMBER_ID}">${comments.MEMBER_NAME}
							<span style ="font-size:10pt">
								<img src="/pro/resources/Image/icon/award.svg" alt="act" width="14" height="14">${comments.MEMBER_ACT}
							</span></a>
							<br>
							<span style="display:none">${comments.BOARD_CO_ID}</span> ${comments.BOARD_CO_DATE}
							<!-- 수정, 삭제 -->
							<c:if test="${comments.MEMBER_ID == id}">
								<span class="comment_update" style ="font-size:10pt">
									<img src="/pro/resources/Image/icon/pencil.svg" alt="update" width="14" height="14">
								</span>
								<span class="comment_remove" style ="font-size:10pt">
									<img src="/pro/resources/Image/icon/trash.svg" alt="remove" width="14" height="14">
								</span>
							</c:if>
							<hr>
							<span>${comments.BOARD_CO_CONTENT}</span>
						</td>
					</tr>
					</c:forEach>
					</c:if>
				</tbody>
				<tfoot>
					<tr>
						<td>
							<span style="color:gray">총 80자까지 가능합니다.</span>
							<textarea class="float-left" rows="2" name="content" id="content" maxLength="80"></textarea>
							<input id ="comment_id" type="hidden"></input>
							<button type="button" id="write" class="btn btn-info float-right">등록</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		
		
		<%-- delete 모달 --%>
	<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">


					<!-- Modal body -->
					<div class="modal-body">
						<form name="deleteForm" action="board_delete_action"
							method="post">
							<div class="form-group">
								<label for="board_password">비밀번호</label> 
								<input type="hidden" name="BOARD_ID" id="board_id" value="${board_data.BOARD_ID}">
								<input type="hidden" name="BOARD_CATEGORY" id="BOARD_CATEGORY" value="${board_data.BOARD_CATEGORY}">
								<input type="password"
									class="form-control" placeholder="Enter password"
									name="BOARD_PASSWORD" id="board_password">
							</div>
							<button type="submit" class="btn btn-primary">삭제</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div> 
	</div>

<%-- <h2>게시판</h2>
<br><br><br>
<div id="outter">
	<table border="1">
		<tr>
			<td>제목: ${board.board_title }</td>
		</tr>
		<tr>
			<td>
				작성자: ${board.regi_id}
				<span style="float: right;"><fmt:formatDate value="${board.regi_dt }" pattern="yyyy.MM.dd"/></span>
			</td>
		</tr>
		<tr>
			<td><div style="height: 300px; margin: 10px; display: inline-block">${board.board_content }</div></td>
		</tr>
	</table>
	<input type="button" value="글 목록" style="float: right;" onclick="location.href='board';"> 
</div> --%>
<jsp:include page="../common/footer.jsp" />>
</body>
</html>