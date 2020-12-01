<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<jsp:include page="../common/header.jsp" />
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

.btn-info {
	background-color: #0B0B3B;
	border-color: #0B0B3B;
}
.btn-info:hover{
	background-color: navy;
	border-color: navy;
}
p {
	margin : 0 0 0 0 !important;
}
@media screen and (max-width:400px) {
	.center {
		display: flex;
	}
	
	 #read_button, #reply_button, #edit_button,#list_button {
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
<input type="hidden" id="loginId" value="${principal.username}">
	<div class="container">
		<h3 id ="h3_category" class="float-left"></h3> 	
		<table class="table table-bordered">
			<thead>
				<tr>
					<td>
						<span style="font-weight:bold">${principal.username}</span>&#32;
						<span style="font-size:9pt"><fmt:formatDate value="${board.regi_dt}" pattern="yyyy.MM.dd"/>에 작성됨</span>
						
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
				<c:if test="${!empty boardFileList}">
				<tr>
					<td>
						<div>첨부파일</div>
						<div>
						<c:forEach var="files" items="${boardFileList}">
							<img src="/hansong/resources/images/down.png" width ="12px">
							<a href="boardFileDown?filename=${files.file_name}&original=${files.file_original}">
								${files.file_original}</a>
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
					<a id ="reply_button" href="/hansong/boards/boardReply?id=${board.id}">
						<button style="background:transparent;vertical-align: middle" data-toggle="tooltip" data-placement="top" title="답변">
						<img src="/hansong/resources/images/reply-fill.svg" width ="25px" class="padding-top2">
						</button>
					</a>
					<c:if test="${board.regi_id == principal.username}">
						<!-- 수정 -->
						<a id ="edit_button" href="/hansong/boards/boardUpdateView?id=${board.id}">
							<button style="background:transparent;vertical-align: middle;" data-toggle="tooltip" data-placement="top" title="수정">
								<img src="/hansong/resources/images/pencil.svg" width ="25px" class="padding-top2">
							</button>
						</a>
						
						<!-- 삭제 -->
						<a id ="delete_button" href="/hansong/boards/deleteBoard?id=${board.id}">
							<button style="background:transparent;vertical-align: middle;" data-toggle="tooltip">
							<img src="/hansong/resources/images/trash.svg" width ="25px" class="padding-top2"></button>
						</a>
					</c:if>
					<a id ="list_button" href="/hansong/boards/boardList">
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
						<td id="comment_length">댓글 (${board.board_comment}개)</td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty commentsList}">
					<c:forEach var="commentsList" items="${commentsList}">
					<tr>
						<td>
							<span>${commentsList.regi_id}</span> &nbsp; &nbsp; &nbsp; &nbsp; 
							<fmt:formatDate value="${commentsList.regi_dt}" pattern="yyyy.MM.dd"/> &nbsp; &nbsp;
							<!-- 수정, 삭제 -->
							<c:if test="${commentsList.regi_id == principal.username}">
								<span class="comment_update" style ="font-size:10pt">
									<img src="/hansong/resources/images/pencil.svg" alt="update" width="14" height="14">
								</span>
								&nbsp;
								<span class="comment_remove" style ="font-size:10pt">
									<img src="/hansong/resources/images/trash.svg" alt="remove" width="14" height="14">
								</span>
							</c:if>
							<hr>
							<span>${commentsList.content}</span>
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
	</div>
<jsp:include page="../common/footer.jsp" />
</body>
<script>

$(function() {
	

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
  

	$("#wirte").click(function() {
		buttonText = $("write").text();
		content = $("#content").val();
		if(common.gfn_isNull($("#loginId").val())) {
			common.gfn_alert('alert', '알림', '로그인을 해주세요.', 'small');
			return false;
		}
		if(common.gfn_isNull((content).val())) {
			common.gfn_alert('alert', '알림', '내용을 입력하세요.', 'small');		
			$("#content").focus();
			return false;
		}
		if(common.gfn_isNull((buttonText).val("등록"))) { // 추가
			url = "/hansong/comments/commentInsert";
			data = {
					"content" : content,
					"member_id" : $("#loginId").val(),
					"board_id" : $("#board_id").val()					
				  };
		}else { // 수정
			url = "/hansong/comments/commentUpdate";
			data = {
					"id" : $("#comment_id").val(),
					"content" : content
				 };
			
			$("#write").text("등록");			
		}		
		$.ajax({
			type : "post",
			url : url,
			data : data,
			success : function(result) {
				$("#content").val('');
				if (result == 1) {
					getList();
				}
			}
		})
	})
				
			
	})






});











</script>
</html>