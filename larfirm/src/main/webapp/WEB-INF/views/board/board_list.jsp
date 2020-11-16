<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 리스트</title>
<jsp:include page="../common/header.jsp" />
<!-- Site css -->
<link rel="stylesheet" href="../resources/css/joinform.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<style>

.tab-contents{
    margin-top: 50px;
    margin-bottom: 200px;
}

.page-link{
	color: navy !important;
}

.paging{
	justify-content: center;
    display: flex;
	margin-top: 50px;
}

#add_board_button {
	background : #0B0B3B !important;
	color : white !important;
	margin-bottom: 10px;
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
	

	<div id="tab01" class="tab-contents">
	<div class="container">
  <h3 id="h3_category" style="font-size: 30px; font-weight: bold;"></h3>
  <a href ="/hansong/members/board_add?BOARD_CATEGORY=${BOARD_CATEGORY}" id="add_board_button" 
			class="write btn float-right">글쓰기</a>
 <input type="hidden" id="BOARD_CATEGORY" name ="BOARD_CATEGORY" value="${BOARD_CATEGORY}"> 
  <table class="table">
    <thead>
      <tr>
        <th style="width: 70px">번호</th>
        <th style="width: 300px">제목</th>
        <th style="width: 50px">조회수</th>
        <th style="width: 50px">작성자</th>
        <th style="width: 50px">등록일</th>
      </tr>
      
      <c:forEach var="board_list" items="${board_list}">
      	<tr>
      		<td><c:out value="${board_list.id}"/></td>
      		<td>
      			<a href="/hansong/boards/board_view?id=${board_list.id}"><c:out value="${board_list.board_title}" /></a>
			</td>
      		<td><c:out value="${board_list.board_count}"/></td>
      		<td><c:out value="${board_list.regi_id }"/></td>
      		<td><fmt:formatDate value="${board_list.regi_dt}" pattern="yyyy.MM.dd"/></td>    	
      	</tr>
      </c:forEach>
	 </thead>
    <tbody>
     
    </tbody>
  </table>
</div>

<!-- <div class="container paging">
<ul class="pagination">
  <li class="page-item"><a class="page-link" href="#">이전</a></li>
  <li class="page-item"><a class="page-link" href="#">1</a></li>
  <li class="page-item"><a class="page-link" href="#">2</a></li>
  <li class="page-item"><a class="page-link" href="#">3</a></li>
  <li class="page-item"><a class="page-link" href="#">다음</a></li>
</ul>
</div> -->


	<!-- 페이징 처리 -->
<%-- 				<div class="container paging">
				<c:if test="${ pi.currentPage eq 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage ne 1 }">
					<c:url var="before" value="/hansong/boards/board_list">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="/hansong/boards/board_list">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage eq pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage ne pi.maxPage }">
					<c:url var="after" value="/hansong/boards/board_list">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
				</div>
		 --%>
				
	
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
<script>

$(function(){

			
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
			
			

});




</script> 
</html>

