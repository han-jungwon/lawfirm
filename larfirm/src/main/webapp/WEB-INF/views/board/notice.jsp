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
	
	<div id="tab01" class="tab-contents">
	<div class="container">
  <h2 style="font-size: 30px;
    font-weight: bold;">공지사항</h2>     
  <table class="table">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>[공지]</td>
        <td>공지를 알려드립니다.</td>
        <td>26</td>
      </tr>
      	<tr>
        <td>5</td>
        <td>방문안내</td>
        <td>26</td>
      	</tr>
       <tr>
        <td>4</td>
        <td>온라인 상담 오류 안내</td>
        <td>22</td>
      </tr>
       <tr>
        <td>3</td>
        <td>상담관련 안내</td>
        <td>32</td>
      </tr>
      <tr>
        <td>2</td>
        <td>법무법인 송한</td>
        <td>50</td>
      </tr>
      <tr>
        <td>1</td>
        <td>안녕하세요.</td>
        <td>26</td>
      </tr>
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
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>

