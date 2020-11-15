<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>

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