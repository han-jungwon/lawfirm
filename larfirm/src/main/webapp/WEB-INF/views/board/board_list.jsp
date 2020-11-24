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

.pagination { 
    place-content: center;
    margin-top: 100px;
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
  <a href ="/hansong/boards/board_write?BOARD_CATEGORY=${BOARD_CATEGORY}" id="add_board_button" 
			class="write btn float-right">글쓰기</a>
 <input type="hidden" id="BOARD_CATEGORY" name ="BOARD_CATEGORY" value="${BOARD_CATEGORY}"> 
  <table class="table">
    <thead>
      <tr>
        <th style="width: 70px">번호</th>
        <th style="width: 300px">제목</th>
        <th style="width: 85px">조회수</th>
        <th style="width: 50px">작성자</th>
        <th style="width: 50px">등록일</th>
      </tr>
      
      <c:forEach var="boardList" items="${boardList}">
      	<tr>
      		<td><c:out value="${boardList.id}"/></td>
      		<td>
      			<a href="/hansong/boards/board_view?id=${boardList.id}"><c:out value="${boardList.board_title}" /></a>
			</td>
      		<td><c:out value="${boardList.board_count}"/></td>
      		<td><c:out value="${boardList.regi_id }"/></td>
      		<td><fmt:formatDate value="${boardList.regi_dt}" pattern="yyyy.MM.dd"/></td>    	
      	</tr>
      </c:forEach>
	 </thead>
    <tbody>
     
    </tbody>
  </table>
</div>


 <c:if test="${listCount > 0 }">		
			<div class="center-block">
				<div class="row">
					<div class="col">
						<ul class="pagination">
							<c:if test="${page <= 1 }">
								<li class="page-item"><a class="page-link" href="#">이전&nbsp;</a>
								</li>
							</c:if>
							<c:if test="${page > 1 }">
								<li class="page-item"><a
									href="/hansong/boards/board_list?page=${page-1}&BOARD_CATEGORY=${BOARD_CATEGORY}" class="page-link">이전</a>
									&nbsp;</li>
							</c:if>

							<c:forEach var="a" begin="${startPage}" end="${endPage}">
								<c:if test="${a == page }">
									<li class="page-item"><a class="page-link" href="#">${a}</a>
									</li>
								</c:if>
								<c:if test="${a != page }">
									<li class="page-item"><a href="/hansong/boards/board_list?page=${a}&BOARD_CATEGORY=${BOARD_CATEGORY}"
										class="page-link">${a}</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${page >= maxPage }">
								<li class="page-item"><a class="page-link" href="#">&nbsp;다음</a>
								</li>
							</c:if>
							<c:if test="${page < maxPage }">
								<li class="page-item"><a
									href="/hansong/boards/board_list?page=${page+1}&BOARD_CATEGORY=${BOARD_CATEGORY}" class="page-link">&nbsp;다음</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</c:if> 
				
	
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

