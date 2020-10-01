$(function() {
    var common = {
        init : function () {
            /* --------------------------------------------------------------------------------------
                공통 라이브러리 추가
             --------------------------------------------------------------------------------------*/
            var _this = this;
            <!-- jQuery, Bootstrap -->
            //this.gfn_addJavascript('https://code.jquery.com/jquery-3.5.1.slim.min.js');
            _this.gfn_addJavascript('https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js');
            _this.gfn_addJavascript('https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js');
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
});