<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>법무법인 송한</title>
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
  <h2 style="font-size: 30px;
    font-weight: bold;">공지사항</h2>     
  <table class="table">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>조회수</th>
        <th>등록일</th>
      </tr>
      
      <c:forEach var="list" items="${list}">
      	<tr>
      		<td><c:out value="${list.id}"/></td>
      		<td><c:out value="${list.board_title}"/></td>
      		<td><c:out value="${list.board_count}"/></td>
      		<td><c:out value="${list.regi_dt}"/></td>    	
      	</tr>
      </c:forEach>
	 </thead>
    <tbody>
     
    </tbody>
  </table>
</div>

<div class="container paging">
<ul class="pagination">
  <li class="page-item"><a class="page-link" href="#">이전</a></li>
  <li class="page-item"><a class="page-link" href="#">1</a></li>
  <li class="page-item"><a class="page-link" href="#">2</a></li>
  <li class="page-item"><a class="page-link" href="#">3</a></li>
  <li class="page-item"><a class="page-link" href="#">다음</a></li>
</ul>
</div>

	<jsp:include page="../common/footer.jsp" />
</body>
<script>
$(function(){
	if($("BOARD_CATEGORY").val=="0"){
		$('#h3_category').text("공지사항");			
	}else if($("BOARD_CATEGORY").val()=="1"){
		$('#h3_category').text("언론보도");
	}else if($("BOARD_CATEGORY").val()=="2"){
		$('#h3_category').text("합의서");
	}else if($("BOARD_CATEGORY").val()=="3"){
		$('#h3_category').text("탄원서");
	}else{
		$('#h3_category').text("반성문");
	}
	$("#search_select").val("${search_select}").prop("selected",true);
	$("#search_text").val("#{search_text}");
});




</script>
</html>

