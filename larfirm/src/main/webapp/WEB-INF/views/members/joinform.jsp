<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
  <html>
    <head>
      <title>회원가입 </title>
      <jsp:include page="../common/header.jsp" />
	  <!-- Site css -->
	  <link rel="stylesheet" href="../resources/css/joinform.css" />
	  <link rel="stylesheet" href="resources/css/carousel.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$('.big_tab li').first().addClass("activeClass");
$(".tab-contents").not(':first').hide();

  $('.big_tab li').on('click',function(){
    $(this).addClass("activeClass").siblings().removeClass("activeClass");
    var link = $(this).find("a").attr("href");
    var link_num = link.substr(link.length-1);
    $("select#tabmenu option").eq(link_num-1).prop("selected", "selected");
    $(".tab-contents").hide();
    $(link).show();
  });
  
  $("select#tabmenu").on("change",function(){
    var select_link = $("select#tabmenu").val();
    var select_num = $(this).prop('selectedIndex');
    $('.big_tab li').eq(select_num).addClass("activeClass").siblings().removeClass('activeClass');
    $(".tab-contents").hide();
    $(select_link).show();
    console.log(select_link);
  });
 
</script>
	 
	<style>
.big_tab ul{overflow: hidden; width: 100%;}
.big_tab ul li{width: 25%; box-sizing: border-box; float: left; list-style-type: none; border: 1px solid #ccc; text-align: center; line-height: 40px;}
.big_tab ul li.activeClass{font-weight: bold; font-size: 20px;}
.sm_select {display: none;}
.sm_select select {width:100%; height: 40px; }


@media (max-width:500px){
      .sm_select {display: block;}
      .big_tab{display: none;}
 }
	</style>
    </head>
  <body>	
  <jsp:include page="../common/navbar.jsp" />
<div id="demo" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/hansong/resources/images/변호사소개.jpg">
      <div class="container">
      	<div class="carousel-caption text-left">
      		<h1 style="font-weight: bold;">LAW FIRM SONGHAN</h1><br>
      		<p style="font-weight:bold;">
				의뢰인 중심 법률 서비스, 여기는 법무법인 한송입니다.</p>      	
      	</div>
      </div>
    </div>
  </div>
  </div>
<!-- <div class="tabmenu">
    <div class="big_tab">
      <ul>
        <li><a href="#tab01">tab1</a></li>
        <li><a href="#tab02">tab2</a></li>
        <li><a href="#tab03">tab3</a></li>
        <li><a href="#tab04">tab4</a></li>
      </ul>
    </div>
    <div class="sm_select">
      <select name="" id="tabmenu">
        <option value="#tab01">tab1</option>
        <option value="#tab02">tab2</option>
        <option value="#tab03">tab3</option>
        <option value="#tab04">tab4</option>
      </select>
    </div>
  </div>
  <div id="tab01" class="tab-contents">
    <h2>Tab 1</h2>
  </div>
  <div id="tab02" class="tab-contents">
    <h2>Tab 2</h2>
  </div>
  <div id="tab03" class="tab-contents">
    <h2>Tab 3</h2>
  </div>
  <div id="tab04" class="tab-contents">
    <h2>Tab 4</h2>
  </div>
  <div id="tab05" class="tab-contents">
    <h2>Tab 5</h2>
  </div>
   -->
  
  
  
  
  <div class="tabmenu">
  	<div class="big_tab">
  <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#home">변호사 소개</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#menu1">사무실 소개</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#menu2">찾아오시는 길</a>
  </li>
</ul>
</div>
 <div class="sm_select">
      <select name="" id="tabmenu">
        <option value="#home">변호사 소개</option>
        <option value="#menu1">사무실 소개</option>
        <option value="#menu2">찾아오시는 길</option>
      </select>
    </div>
    </div>


<!-- Tab panes -->
<div class="tab-content tab-contents">
  <div class="tab-pane container active tab-contents" id="home">변호사 소개합니다.</div>
  <div class="tab-pane container fade tab-contents" id="menu1">사무실 소개합니다.</div>
  <div class="tab-pane container fade tab-contents" id="menu2">찾아오는 길입니다.</div>
</div>


    <jsp:include page="../common/footer.jsp" />
  </body>
</html>

