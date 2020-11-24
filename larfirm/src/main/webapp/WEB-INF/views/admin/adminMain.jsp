<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal" />
<!DOCTYPE html>
<html>
<head>
    <title>법무법인 한송</title>
    <meta name="keywords" content="법무법인 한송">
    <meta name="description" content="법무법인 한송 관리자페이지">
    <meta name="author" content="Team. hansong">
    <jsp:include page="../common/header.jsp" />

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
<main role="main">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>번호</th>
                <th>신청자</th>
                <th>시간</th>
                <th>상태</th>
            </tr>
        </thead>
        <tbody id = "chatTableBody">

        </tbody>
    </table>
    <button type="button" class="btn btn-outline-white chat chat_normal" id="btnChatNormal" ><!-- data-toggle="modal" data-target="#mdlChatNormal" -->
        <svg id = "imgChatNormal" width="50px" height="50px" viewBox="0 0 16 16" class="bi bi-chat-dots" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
            <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
        </svg>
        <span id = "spanChatNormal" style="display: none;" class="spinner-border spinner-border-sm"></span>
    </button>
    <!-- /.container -->
    <jsp:include page="../common/footer.jsp" />

</main>
<div class="modal fade" id ="mdlChatNormal">
    <div class="modal-dialog  modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h1 class="modal-title" style="font-size: large">실시간 상담</h1>
                <button type="button" class="close" data-dismiss="modal">×</button>
            </div>

            <!-- messages -->
            <div class="modal-body" style="overflow-x: hidden; overflow-y: auto; height: 400px; word-break: break-all;">
                <ul>
                </ul>
            </div>

            <!-- message-input -->
            <div class="modal-footer">
                <div class="form-group" style="display: contents;">
                    <textarea class="form-control" rows="2" id="txtChatContent" placeholder="내용을 입력하세요."></textarea>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        const adminMain = {
            ws : null,
            init: function () {
                const _this = this;
                _this.initChatBoard();
                /*
                const _this = this;
                // 관리자는 관리자페이지 접속과 동시에 소켓연결
                ws = new WebSocket("ws://localhost:8088/hansong/boot?admin");

                // 웹 소켓 연결 시 호출되는 이벤트
                this.ws.open = function (event) {
                    if(common.gfn_isNull(event.data)) {
                        console.log(event.data);
                    }
                }
                // 웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트이다.
                this.ws.onmessage = function (event) {
                    main.chatResponse(event.data);
                }

                // 웹 소켓이 닫혔을 때 호출되는 이벤트입니다.
                this.ws.onclose = function(event) {
                    common.gfn_alert('c','알림',"상담이 종료되었습니다.",'small');
                }


                $("#btnChatNormal").click(function () {
                    _this.btnChatNormalClick();
                })
                // modal out -> socket close
                $("#mdlChatNormal").on("hidden.bs.modal",function (e) {
                    common.gfn_alert('confirm','알림',"정말로 나가시겠습니까?",'small', null, false, true, _this.chatClose);
                })

                // enter 입력 시 채팅 보내기
                $(window).on('keyup',function (e) {
                    if(e.which == 13) {
                        var message = _this.newMessage();
                        if(common.gfn_isNotNull(message)) {
                            _this.chatSend(message);
                        }
                        return false;
                    }
                })

                */
            },
            // 채팅방 초기화
            initChatBoard : function() {
                $.ajax({
                    url : common.gfn_getContextPath()+"/v1/chats",
                    cache : false,
                    dataType : "json",
                    method : "GET",
                    async : false
                })
                    .done(function (chat) {
                        let chatBodyHtml =  "<tbody>             ";
                        for(const key in chat) {
                                chatBodyHtml += "   <tr>             ";
                                chatBodyHtml += "      <td>          ";
                                chatBodyHtml +=           chat[key].id;
                                chatBodyHtml += "      </td>         ";
                                chatBodyHtml += "      <td>          ";
                                chatBodyHtml +=           chat[key].regi_id;
                                chatBodyHtml += "      </td>         ";
                                chatBodyHtml += "      <td>          ";
                                chatBodyHtml +=           chat[key].regi_dt;
                                chatBodyHtml += "      </td>         ";
                                chatBodyHtml += "      <td>          ";
                                chatBodyHtml +=           chat[key].condition;
                                chatBodyHtml += "      </td>         ";
                                chatBodyHtml += "   </tr>            ";
                        }

                        chatBodyHtml += "</tbody>            ";
                        $("#chatTableBody").html(chatBodyHtml);

                    })
                    .fail(function (xhr, status, errorThrown) {
                        console.log('실패1');
                    })
                    .always(function (xhr, status) {
                        console.log('실패2');
                    })
            },

            // 상담 나가기 시
            chatClose : function(result, json) {
                if(result) {
                    main.chatSend(common.gfn_getUserId()+"님이 퇴장하셨습니다.");
                    main.ws.close();
                }
            },

            // 일반상담 클릭 시 socket open
            btnChatNormalClick : function() {
                $("#imgChatNormal").hide();
                $("#spanChatNormal").show();
                if(common.gfn_isNull(common.gfn_getUserId())) {
                    common.gfn_alert('c','알림',"로그인을 먼저 해주세요.",'small');
                    $("#imgChatNormal").show();
                    $("#spanChatNormal").hide();
                    return;
                }




                $("#mdlChatNormal").modal('show');
                $("#imgChatNormal").show();
                $("#spanChatNormal").hide();


            },
            /**
             * @description message 보냄
             * @param sMessage(String)
             */
            chatSend : function(sMessage) {
                this.ws.send(sMessage);
            },

            chatResponse : function(rtext) {
                var arr = rtext.split('&');
                var message = arr[1];

                var out = "님이 퇴장하셨습니다.";
                var inin = "님이 입장하셨습니다.";
                var output = "";
                // 입장과 퇴장의 경우 css가 가운데로 위치해야 함.
                console.log(message);
                if(message.indexOf(out) > -1 || message.indexOf(inin) > -1) {
                    var index = message.lastIndexOf('.');
                    output = "<li class = 'inout'><p></p></li>";
                    message = message.substring(0, index);
                } else {
                    var name = arr[0];
                    output = "<li class = 'replies'>"
                        +"<sup>" + name + "</sup><p></p></li>";
                }
                $(".modal-body > ul").append(output);
                $('.modal-body > ul > li').last().find('p').text(message);

            },

            newMessage : function() {
                var message = $("#txtChatContent").val();

                if(common.gfn_isNull($.trim(message))) {
                    return false;
                }

                var output = "<li class='sent'>"
                    +"<p></p></li>";
                $(".modal-body > ul").append(output);
                $('.modal-body > ul > li').last().find('p').text(message);
                $("#txtChatContent").val(null);

                return message;
            }
        }
        adminMain.init();

    })
</script>
</body>
</html>