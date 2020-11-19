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
					<button id ="read_button"style="background:transparent">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-eye" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path fill-rule="evenodd" d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.134 13.134 0 0 0 1.66 2.043C4.12 11.332 5.88 12.5 8 12.5c2.12 0 3.879-1.168 5.168-2.457A13.134 13.134 0 0 0 14.828 8a13.133 13.133 0 0 0-1.66-2.043C11.879 4.668 10.119 3.5 8 3.5c-2.12 0-3.879 1.168-5.168 2.457A13.133 13.133 0 0 0 1.172 8z"/>
						  <path fill-rule="evenodd" d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
						</svg>${board.board_count}
					</button>
					<!-- 답변 -->
					<a id ="reply_button" href="/pro/board_reply_view?id=${board_data.BOARD_ID}">
						<button style="background:transparent;vertical-align: middle" data-toggle="tooltip" data-placement="top" title="답변">
						<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-reply-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						  <path d="M9.079 11.9l4.568-3.281a.719.719 0 0 0 0-1.238L9.079 4.1A.716.716 0 0 0 8 4.719V6c-1.5 0-6 0-7 8 2.5-4.5 7-4 7-4v1.281c0 .56.606.898 1.079.62z"/>
						</svg>
						</button>
					</a>
					<c:if test="${board_data.MEMBER_ID == id}">
						<!-- 수정 -->
						<a id ="edit_button" href="/pro/board_edit_view?num=${board_data.BOARD_ID}">
							<button style="background:transparent;vertical-align: middle;" data-toggle="tooltip" data-placement="top" title="수정"><img src="/pro/resources/Image/icon/pencil.svg" width ="25px" class="padding-top2"></button>
						</a>
						<!-- 삭제 -->
						<a id ="delete_button" href="#">
							<button style="background:transparent;vertical-align: middle;" data-toggle="modal" data-target="#myModal">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
							</svg>
							</button>
						</a>
					</c:if> 
					<a id ="list_button" href="/pro/board_list">
						<button style="background:transparent;vertical-align: middle;" data-toggle="tooltip" data-placement="top" title="목록">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  		<path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
							</svg>
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