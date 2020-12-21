<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://www.google.com/recaptcha/api.js"></script>
    <title>게시판 작성</title>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <jsp:include page="../common/header.jsp"/>


    <style>

        #h3_category {
            margin-top: 50px;
            margin-bottom: 30px;
        }


        #add_button {
            background: #0B0B3B;
            color: white;
        }

        #upfile {
            display: none;
        }


    </style>
</head>

<body>
<jsp:include page="../common/navbar.jsp"/>

<div id="demo" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="/hansong/resources/images/lawyer.jpg"
                 style="height: 250px; width: 2200px;">
            <div class="container">
                <div class="carousel-caption text-left">
                    <h1 style="font-weight: bold; font-size: 25px; color: white;">
                        LAW FIRM SONGHAN</h1>
                    <br>
                    <p style="font-weight: bold; color: white; margin-top: 30px;">
                        의뢰인 중심 법률 서비스, 여기는 법무법인 한송입니다.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <form id="board_form" action="/hansong/boards" method="post"
          enctype="multipart/form-data" name="boardform">
        <h3 id="h3_category" style="font-size: 30px; font-weight: bold;"></h3>
        <input id="BOARD_CATEGORY" type="hidden" name="board_category" value="${BOARD_CATEGORY}">
        <div class="form-group">
            <label for="board_title">제목</label>
            <input type="text" class="form-control" name="board_title" id="board_title"
                   placeholder="제목을 입력해 주세요">
        </div>
        <div class="form-group">
            <label for="regi_id">작성자</label>
            <input name="regi_id" id="regi_id" value="${principal.username}" readOnly type="text" class="form-control">
        </div>
        <div class="form-group">
            <label for="board_content">내용</label>

            <textarea name="board_content" id="board_content"></textarea>

        </div>

        <div class="form-group">
            <label style="display: inline" for="board_file">파일 첨부</label>
            <label
                    style="display: inline" for="upfile" data-toggle="tooltip"
                    data-placement="top" title="최대 용량 : 10MB"> <img
                    style="vertical-align: bottom" id=ig
                    src="/hansong/resources/images/paperclip.svg" width="30px"
                    alt="파일첨부">
            </label>
            <input multiple="multiple" type="file" id="upfile" name="uploadFile">
            <span id="filevalue"> </span>
            <img src="/hansong/resources/images/trash.svg" alt="파일삭제" width="32" height="32" class="remove">
        </div>

        <div class="form-group">
            <div class="g-recaptcha"
                 data-sitekey="6LcnB94ZAAAAAJyGmoNL2E4Mp7pcBwtz_AeP63xb"></div>
        </div>

        <div class="form-group" style="margin-top:50px; margin-bottom: 100px;">
            <button type="button" class="btn" id="add_button">등록</button>
            <button type="button" class="btn btn-secondary" onclick='history.back(); return false;'>취소</button>
        </div>
    </form>
</div>

<jsp:include page="../common/footer.jsp"/>
<!-- summernote -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</body>
<script>
$(function(){
    const boardAdd = {
        init : function() {
            const _this = this;
            // 카테고리
            if ($("#BOARD_CATEGORY").val() == "0") {
                $('#h3_category').text("공지사항");
            } else if ($("#BOARD_CATEGORY").val() == "1") {
                $('#h3_category').text("온라인 상담");
            } else if ($("#BOARD_CATEGORY").val() == "2") {
                $('#h3_category').text("언론보도");
            } else if ($("#BOARD_CATEGORY").val() == "3") {
                $('#h3_category').text("합의서");
            } else if ($("#BOARD_CATEGORY").val() == "4") {
                $('#h3_category').text("탄원서");
            } else {
                $('#h3_category').text("반성문");
            }

            // summernote
                _this.summernoteInit();
            // 파일 수정
            $('#upfile').change(function(){
                _this.upfile($(this));
            });

            // 파일 삭제
            $('.remove').click(function() {
                _this.removeFile();
            });

            // 등록 버튼 클릭
            $('#add_button').click(function() {
                _this.addClick();
            });
        },
        summernoteInit : function() {
            //여기 아래 부분
            $('#board_content').summernote({
                height: 300, // 에디터 높이
                focus: true, // 에디터 로딩후 포커스를 맞출지 여부
                lang: "ko-KR", // 한글 설정
                placeholder: '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
                callbacks: {
                    onImageUpload: function (files, editor, welEditable) {
                        for (var i = files.length - 1; i >= 0; i--) {
                            boardAdd.sendFile(files[i], this);
                        }

                    }
                },
                toolbar: [
                    ['fontname', ['fontname']],
                    ['fontsize', ['fontsize']],
                    ['style', ['bold',
                        'italic',
                        'underline',
                        'strikethrough',
                        'clear']],
                    ['color', ['forecolor',
                        'color']],
                    ['table', ['table']],
                    ['para', ['ul',
                        'ol',
                        'paragraph']],
                    ['height', ['height']],
                    ['insert', ['picture',
                        'link',
                        'video']],
                    ['view', ['fullscreen',
                        'help']]
                ],
                fontNames: ['Arial',
                    'Arial Black',
                    'Comic Sans MS',
                    'Courier New', '맑은 고딕',
                    '궁서', '굴림체', '굴림', '돋음체',
                    '바탕체'],
                fontSizes: ['8', '9', '10', '11',
                    '12', '14', '16', '18',
                    '20', '22', '24', '28',
                    '30', '36', '50', '72']

            });
        },


        //썸머노트에 첨부된 이미지를 서버에 저장한다.
        sendFile : function (file, el) {
            var form_data = new FormData();
            form_data.append('file', file);
            $.ajax({
                data: form_data,
                type: "post",
                url: '/hansong/boards/summerImage',
                cache: false,
                contentType: false,
                enctype: 'multipart/form-data',
                processData: false,
                success: function (img_name) {
                    console.log(img_name);
                    $(el).summernote('editor.insertImage', img_name);
                }
            });
        },

        upfile : function(_this) {
            var array = $(_this).get(0).files;
            console.log(array);
            var strArray ="";
            for(var i=0; i < array.length; i++) {
                strArray += array[i].name;
                if(i < array.length-1) {
                    strArray += ", ";
                }
            }
            $('#filevalue').text(strArray);
            boardAdd.show();
        },
        show : function() {
            if ($('#filevalue').text() == '') {
                // 파일 이름이 있는 경우 remove 이미지를 보이게 하고 없는 경우는 보이지 않게 한다.
                $(".remove").css('display', 'none');
                console.log("하이요");
            } else {
                $(".remove").css('display', 'inline-block');
                console.log("하이요2");
            }

        },
        removeFile : function() {
            $('#filevalue').text('');

            $(this).css('display', 'none');
        },

        addClick : function() {
            if (common.gfn_isNull($('#board_title').val())) {
                common.gfn_alert('alert', '알림', '제목을 입력하세요.', 'small');
                $('#board_title').focus();
                return false;
            }

            if (common.gfn_isNull($('#board_content').val())) {
                common.gfn_alert('alert', '알림', '내용을 입력하세요.', 'small');
                $('#board_content').focus();
                return false;
            }

            $.ajax({
                url: common.gfn_getContextPath() + "/boards/VerifyRecaptcha",
                type: 'post',
                data: {
                    recaptcha: $("#g-recaptcha-response").val()
                },
                success: function (data) {
                    switch (data) {
                        case 0:
                            console.log("자동 가입 방지 봇 통과");
                            $('#board_form').submit();
                            break;
                        case 1:
                            common.gfn_alert('alert', '알림', '자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.', 'small');
                            break;
                        default:
                            common.gfn_alert('alert', '알림', '자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : '
                                + Number(data) + ']', 'small');
                            break;
                    }
                }, error: function () {
                    console.log('captcha 에러');
                }
            }); // 통과

        }
    }


    boardAdd.init();


});










</script>
</html>