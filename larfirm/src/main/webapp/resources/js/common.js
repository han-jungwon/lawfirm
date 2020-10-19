
    const common = {
        /** 공통 변수 */
        gS_siteDomain : "songhan.kr",

        /**
         * 최초 실행
         */
        init : function () {
            /* --------------------------------------------------------------------------------------
                공통 라이브러리 추가
             --------------------------------------------------------------------------------------*/
            var _this = this;
            <!-- jQuery, Bootstrap -->
            _this.gfn_addJavascript('https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js');
            _this.gfn_addJavascript('https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js');
            //_this.gfn_addJavascript('resources/js/~~.min.js');
            $("#navBtnSearch").click(function () {
                _this.gfn_googleSearch();
            });
            $("#navInputSearch").keydown(function (key) {
                if(key.keyCode == 13) {
                    _this.gfn_googleSearch();
                }
            });
        },
        /**
         * nav 검색 실행
         * */
        gfn_googleSearch : function() {
            let sSearchParam = $("#navInputSearch").val();
            location.href = "https://www.google.com/search?qt="+sSearchParam+"&q=site%3A"+this.gS_siteDomain+"+"+sSearchParam;
        },

        /**
         * import 파일 : jquery.modal.css , jquery.modal.min.js
         * @description alert 커스텀  (ex. common.gfn_alert('alert','제목','내용','large', null, false, true, callback, param)
         * @param sType          타입 결정( alert | confirm | prompt| success | warning | error | info | inverted | primary)
         * @param sTitle         제목 ( default : 알림 )
         * @param sTxt           내용 ( default : 저장되었습니다. )
         * @param sSize          사이즈 ( normal | large | small ) , default : normal
         * @param aButtons       sType이 alert, confirm, prompt 아니면 커스텀 적용됨, array 타입이고 하단 defaultButton 양식 참고
         * @param bAutoclose     자동으로 닫힘 ( default : false )
         * @param bCloseClick    Modal 바깥 클릭 시 닫힘 ( default : true )
         * @param callbackMethod alert callback ( 없으면 실행 안됨 )
         * @param jsonData       callback에 활용될 파라미터 json 타입
         *
         * @create by MIT https://github.com/CreativeDream/jquery.modal
         */
        gfn_alert : function(sType, sTitle, sTxt, sSize, aButtons, bAutoclose, bCloseClick, callbackMethod, jsonData){
            const defaultButton = [{text:'Cancel', val : '0', eKey : false, addClass : 'btn-light-red', onClick: function(dialog) {console.log("dd"+dialog.val); return true}},
                                   {text:'Ok', val : '1', eKey : true, addClass : 'btn-light-blue', onClick: function(dialog) {console.log("dd"+dialog.val); return true}},];
            modal({
                type:  this.gfn_isNull(sType)   ? 'alert':sType,
                title: this.gfn_isNull(sTitle)  ? '알림':sTitle,
                text:  this.gfn_isNull(sTxt)    ? '저장되었습니다.':sTxt ,
                size:  this.gfn_isNull(sSize)   ? 'normal':sSize,
                buttons:this.gfn_isNull(aButtons)? defaultButton:aButtons,
                center : true,
                autoclose: this.gfn_isNull(bAutoclose)? false:bAutoclose,
                closeClick : this.gfn_isNull(bCloseClick)? true:bCloseClick,
                //background:'rgba(0,0,0,0.35)',  //  배경색
                //animate: false,           // Slide Animation 선택
                //closable: false,          // 닫을 수 있고 없고 선택
                // onShow: function(r) {},  // Modal 열린 후 이벤트
                callback: function(result){
                    if(callbackMethod){
                        callbackMethod(result,jsonData);
                    }
                }
            });
        },
         /**
         * @description 빈값을 체크함.( 0은 제외, 빈 배열 or 빈 객체도 체크함 )
         * @param value
         * @returns {boolean|boolean} 빈값은 true
         */
        gfn_isNull : function(value) {
            return value === "" || value === undefined || value === null || (typeof value == "number" && isNaN(value)) || (typeof value == "object" && !Object.keys(value).length)
        },
        /**
         * @description 빈값이 아닌지 체크함.( 0은 제외, 빈 배열 or 빈 객체도 체크함 )
         * @param value
         * @returns {boolean|boolean} 빈값은 false
         */
        gfn_isNotNull : function(value) {
            return !this.gfn_isNull(value);
        },
        /**
         * @description ContextPath 를 가져온다.
         * @example /hansong
         * @returns {string}
         */
        gfn_getContextPath : function () {
            const hostIndex = location.href.indexOf(location.host) + location.host.length;
            return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
        },

        /**
         * @description javascript를 추가한다..
         * @param jsname
         * @example gfn_addJavascript('/contextpath/resources/js/~~.min.js')
         * */
        gfn_addJavascript : function (jsname) {
            var th = document.getElementsByTagName('head')[0];
            var newScript = document.createElement('script');
            newScript.setAttribute('type','text/javascript');
            newScript.setAttribute('src', jsname);
            th.appendChild(newScript);
        },

        /**
         * @description 유효한(존재하는) '월'인지 체크
         * @param mm
         * @returns {boolean|boolean}
         */
        gfn_isValidMonth : function (mm) {
            var m = parseInt(mm,10);
            return (1 <= m && m <= 12);
        },

        /**
         * @description 유효한(존재하는) '일'인지 체크
         * @param yyyy
         * @param mm
         * @param dd
         * @returns {boolean|boolean}
         */
        gfn_isValidDay : function (yyyy, mm, dd) {
            const m = parseInt(mm, 10) - 1;
            const d = parseInt(dd, 10);

            var end = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
            if ((yyyy % 4 == 0 && yyyy % 100 != 0) || yyyy % 400 == 0) {
                end[1] = 29;
            }
            return (1 <= d && d <= end[m]);
        }
    }
    common.init();
