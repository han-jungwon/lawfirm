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
<style>
    ul {
        list-style-type: none;
    }
    .message-body > ul {
        padding-left : 0px;
    }
    .sent > p{
        text-align: right;
    }
    .inout > p {
        text-align: center;
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
<main role="main">
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">신청자</th>
                <th scope="col">시간</th>
                <th scope="col">상태</th>
            </tr>
        </thead>
        <tbody id = "chatTableBody">

        </tbody>
    </table>
    <!-- /.container -->
    <jsp:include page="../common/footer.jsp" />

</main>
<div class="modal fade" id ="mdlChatNormal">
    <div class="modal-dialog  modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h1 class="modal-title2" style="font-size: large">실시간 상담(관리자)</h1>
                <button type="button" class="close" data-dismiss="modal">×</button>
                <input id="inputChatId" type="hidden">
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

                // 관리자는 관리자페이지 접속과 동시에 소켓연결
                _this.ws = new WebSocket(common.gS_wsContextPath+"?admin");

                // 웹 소켓 연결 시 호출되는 이벤트
                _this.ws.open = function (event) {
                    if(common.gfn_isNull(event.data)) {
                        console.log(event.data);
                    }
                }
                // 웹 소켓에서 메시지가 날라왔을 때 호출되는 이벤트이다.
                _this.ws.onmessage = function (event) {
                    _this.chatResponse(event.data);
                }

                // 웹 소켓이 닫혔을 때 호출되는 이벤트입니다.
                _this.ws.onclose = function(event) {
                    //common.gfn_alert('c','알림',"상담이 종료되었습니다.",'small');
                }

                $(".btnJoinChat").click(function () {
                    const chatId = $(this).parent().prev().prev().prev().text().trim();
                    $("#inputChatId").val(chatId);
                    _this.btnJoinChatClick(chatId);
                })
                // 페이지 언로드 시 socket close
                $(window).on("beforeunload", function(){
                    _this.ws.close();
                });
                // modal out -> socket close
                $("#mdlChatNormal").on("hidden.bs.modal",function (e) {
                    common.gfn_alert('confirm','알림',"정말로 나가시겠습니까?",'small', null, false, true, _this.chatClose);
                })

                // enter 입력 시 채팅 보내기
                $(window).on('keyup',function (e) {
                    if(e.which == 13) {
                        const message = _this.newMessage();
                        if(common.gfn_isNotNull(message)) {
                            _this.chatSend("1&"+message);
                        }
                        return false;
                    }
                })


            },
            // 채팅방 초기화
            initChatBoard : function() {
                $.ajax({
                    url : common.gfn_getContextPath()+"/v1/chats",
                    cache : false,
                    dataType : "json",
                    method : "GET",
                })
                    .done(function (chat) {
                        let chatBodyHtml =  "";
                        for(const key in chat) {
                                chatBodyHtml += "   <tr>             ";
                                chatBodyHtml += "      <td scope='row' class = 'tdChatId'>          ";
                                chatBodyHtml +=           chat[key].id;
                                chatBodyHtml += "      </td>         ";
                                chatBodyHtml += "      <td>          ";
                                chatBodyHtml +=           chat[key].regi_id;
                                chatBodyHtml += "      </td>         ";
                                chatBodyHtml += "      <td>          ";
                                chatBodyHtml +=           chat[key].regi_dt;
                                chatBodyHtml += "      </td>         ";
                                chatBodyHtml += "      <td>          ";
                                if(chat[key].condition === 0) {
                                    chatBodyHtml += "<button class = 'btnJoinChat btn btn-info'>상담</button>";
                                } else if(chat[key].condition === 1) {
                                    chatBodyHtml += "<span style='color:#0094ff'>상담중</span>";
                                } else if(chat[key].condition === 2) {
                                    chatBodyHtml += "<span style='color:#0094ff'>상담완료</span>";
                                } else if(chat[key].condition === 3){
                                    chatBodyHtml += "<span style='color:red'>상담중지</span>";
                                }
                                chatBodyHtml += "      </td>         ";
                                chatBodyHtml += "   </tr>            ";
                        }

                        $("#chatTableBody").html(chatBodyHtml);

                    })
                    .fail(function (xhr, status, errorThrown) {

                    })
                    .always(function (xhr, status) {

                    })
            },

            // 상담 나가기 시
            chatClose : function(result, json) {
                if(result) {
                    adminMain.chatSend("1&상담사가 상담을 종료했습니다.");
                    const chatId = $("#inputChatId").val();
                    $("#inputChatId").val("");
                    adminMain.chatSend("3&"+chatId)
                    $(".modal-body > ul").html("");
                    this.initChatBoard();
                }
            },

            // 상담 클릭 시 상담시작
            btnJoinChatClick : function(chatId) {
                const _this = this;
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

                _this.chatSend("2&"+chatId)
            },
            /**
             * @description message 보냄
             * @param sMessage(String)
             */
            chatSend : function(sMessage) {
                this.ws.send(sMessage);
            },

            chatResponse : function(rtext) {
                const separatorIndex = rtext.indexOf("&");
                const fromId = rtext.substring(0,separatorIndex);
                const message = rtext.substring(separatorIndex+1);
                // 새로운 채팅방 생성 시 관리자들 채팅리스트 다시 그려줌
                if(fromId ==="*") {
                    this.initChatBoard();
                } else {
                    const out = "님이 퇴장하셨습니다.";
                    const come = "님이 입장하셨습니다.";
                    let output = "";

                    // 입장과 퇴장의 경우 css가 가운데로 위치해야 함.
                    if(message.indexOf(out) > -1 || message.indexOf(come) > -1) {

                        output = "<li class = 'inout'><p></p></li>";

                    } else {
                        output = "<li class = 'replies'>"
                            +"<sup>"+fromId+"</sup><p></p></li>";
                    }
                    $(".modal-body > ul").append(output);
                    $('.modal-body > ul > li').last().find('p').text(message);
                }
            },

            newMessage : function() {
                const message = $("#txtChatContent").val();

                if(common.gfn_isNull($.trim(message))) {
                    return false;
                }

                let output = "<li class='sent'>"
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