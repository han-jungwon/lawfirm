<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <title>회원정보 확인 </title>
  </head>
  <jsp:include page="../common/header.jsp" />
  <link rel="stylesheet" href="../resources/css/joinform.css" />
  <style>
  body {
	padding-top: 70px;
	}
  
  
  </style>
  
   <body>
  <jsp:include page="../common/navbar.jsp" />
      <div>
        <div class="wrap wd668">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">회원정보 </h2>        
                    <div class="join_form">
                        <table>
                            <colgroup>
                                <col width="30%"/>
                                <col width="auto"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th><span>이메일</span></th>
                                    <td>${member.id}</td>
                                </tr>
                                <tr>
                                    <th><span>이름</span></th>
                                    <td>${member.name}</td>
                                </tr>
                                <tr>
                                    <th><span>비밀번호</span></th>
                                    <td>${member.password}</td>
                                </tr>

                                <tr>
                                    <th><span>등록일</span></th>
                                    <td>${member.createDate}</td>
                                </tr>
                                <tr>
                                    <th><span>수정일</span></th>
                                    <td>${member.modifyDate}</td>
                                </tr>
                            </tbody>
                        </table>
                      
                    
                
                    <div class="btn_wrap">
                        <a href="javascript:;" style="height: 60px; width: 170px; margin-bottom: 100px;">수정하기</a>
                    </div>
                </div> <!-- form_txtInput E -->
            </div><!-- content E-->
        </div> <!-- container E -->
      </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
  </body>
</html>
