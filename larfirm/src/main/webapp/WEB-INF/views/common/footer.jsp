<%--
  Created by IntelliJ IDEA.
  User: dkask
  Date: 2020-09-30
  Time: 오전 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- FOOTER -->
<footer class="container">
    
   	<strong>법무법인 한송</strong>
   	&nbsp;&nbsp;&nbsp; 대표자 : 한정원 &nbsp;&nbsp;&nbsp; 사업자등록번호 : 
   	<span>123-12-12345</span>
    &nbsp;&nbsp;&nbsp; 주소 : 서울특별시 강남구 테헤란로 &nbsp;&nbsp;&nbsp;
   	<strong>TEL: 02-123-1234</strong>
    &nbsp;&nbsp;&nbsp;
   	<span>FAX: 02-142-2345</span>
   	<p>COPYRIGHT(C) HANSONG.KR. ALL RIGHTS RESERVED.</p>
   	<p class="float-right"><a href="#">Back to top</a></p>
</footer>
<!-- end footer -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/hansong/resources/js/jquery.modal.min.js"></script>
<script src="/hansong/resources/js/common.js?ver=7"></script>
<script>
	$(function () {
		const navbar = {
			init: function () {
				const _this = this;
				$("#mypage").click(function () {
					common.gfn_alert('confirm', '알림', '로그아웃 하시겠습니까?', 'small', null, false, true, _this.callback_mypage)
				});
				$.when(common.gfn_getUserInfo()).done(function (data, textStatus, jqXHR) {
					if(common.gfn_isNotNull(data)) {
						$("#navUserName").val(data.name);
					}
				});
			},
			callback_mypage : function (result) {
				if (result === true) {
					location.href = common.gfn_getContextPath() + "/logout";
				}

			}
		}
		navbar.init();
	});
</script>