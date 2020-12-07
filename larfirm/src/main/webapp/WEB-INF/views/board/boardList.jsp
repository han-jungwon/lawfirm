<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 리스트</title>
<jsp:include page="../common/header.jsp" />

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


#icon {
	margin-left: 50px;
}

#business_icon {
	position: Relative;
	overflow: hidden;
}

#business_icon li {
	float: left;
	margin-right: 20px;
	text-align: center;
}

#business_icon li a {
	display: block;
	font-size: 16px;
	line-height: 100%;
	color: #262626;
	font-weight: 500;
	letter-spacing: -0.5pt;
	transition: all 0.3s ease-out;
}

ul {
	list-style: none;
	padding-left: 0px;
}

#business_icon li span {
	display: block;
	width: 150px;
	height: 150px;
	border-radius: 50%;
	margin-bottom: 20px;
	transition: all 0.3s ease-out;
	background: #f2f2f2;
	
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
  <div class="contents">
  	<ul id="business_icon">
  	<li><span id="icon"></span></li>
  	<li id="title" style="font-weight: bold; font-size: 20px;"></li>
  	<br>
  	<br>
  	<br>
  	<li><p id="content1" style="text-align : left"></p></li>
  	<li><p id="content2" style="text-align : left"></p></li>
  	</ul>
  </div>
  <a href ="/hansong/boards/boardWrite?BOARD_CATEGORY=${BOARD_CATEGORY}" id="add_board_button" 
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
      			<a href="/hansong/boards/boardView?id=${boardList.id}"><c:out value="${boardList.board_title}" /></a>
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
									href="/hansong/boards/boardList?page=${page-1}&BOARD_CATEGORY=${BOARD_CATEGORY}" class="page-link">이전</a>
									&nbsp;</li>
							</c:if>

							<c:forEach var="a" begin="${startPage}" end="${endPage}">
								<c:if test="${a == page }">
									<li class="page-item"><a class="page-link" href="#">${a}</a>
									</li>
								</c:if>
								<c:if test="${a != page }">
									<li class="page-item"><a href="/hansong/boards/boardList?page=${a}&BOARD_CATEGORY=${BOARD_CATEGORY}"
										class="page-link">${a}</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${page >= maxPage }">
								<li class="page-item"><a class="page-link" href="#">&nbsp;다음</a>
								</li>
							</c:if>
							<c:if test="${page < maxPage }">
								<li class="page-item"><a
									href="/hansong/boards/boardList?page=${page+1}&BOARD_CATEGORY=${BOARD_CATEGORY}" class="page-link">&nbsp;다음</a>
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
				$('#business_icon').prepend('<img id="agreement.png" src="/hansong/resources/images/agreement.png" /> ');
				$('#title').text("● 형사사건 합의서가 재판에 미치는 영향");
				
				var obj = $("#content1").text('형사 사건의 특성상 가해자에게 처벌 면제의 기회를 부여하거나 형량을 감면해주는 특수한 역할을 하는 합의서는\n 다양하게 하게 안전장치를 기재해야 향후 분쟁에 휘말리지 않을 수 있는데 반의사 불벌죄나 친고죄의 경우 피해자의\n의사에 따라 공소권(형사처벌)의 유무가 결정되는 만큼 결코 합의서 영향이 적지 않음을 확인할 수 있습니다');
				obj.html(obj.html().replace(/\n/g,'<br/>'));
				var obj = $("#content2").text('> 하지만 단순하게 일반적인 합의서와 같이 피의자로 하여금 자신의 반성을 뉘우친다는 의사만 피해자에게 전달하면 된다는\n인식을 가지고 합의가 쉽사리 이루어질 것으로 예단하여 처절한 준비를 하지 않은 채 인터넷이나 관공서에 비치되어 있는\n양식을 이용하는경우가 많은데 이런 안일한 자세로 임하다 보면 합의 조율자체가 어긋나 합의서를 작성할 기회조차 얻지\n못하는 상황이 초래될 수 있습니다. 따라서 합의서를 작성하셔야 하는 분들은 하단의 게시물을 꼭 확인하시어 사전에\n 준비하시기 바랍니다.');
				obj.html(obj.html().replace(/\n/g,'<br/>')); 

			}else if($("#BOARD_CATEGORY").val()=="4"){
				$('#h3_category').text("탄원서");
			}else{
				$('#h3_category').text("반성문");
			}
			
			

});




</script> 
</html>

