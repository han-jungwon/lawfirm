$(function() {
    var common = {
        init: function () {
            /* --------------------------------------------------------------------------------------
                공통 라이브러리 추가
             --------------------------------------------------------------------------------------*/
            var _this = this;
            <!-- jQuery, Bootstrap -->
            //this.gfn_addJavascript('https://code.jquery.com/jquery-3.5.1.slim.min.js');
            _this.gfn_addJavascript('https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js');
            _this.gfn_addJavascript('https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js');
            <!-- template js -->
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/js/wow.js');
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/js/custom.js');
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/js/hizoom.js');
            <!-- revolution js files -->
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/revolution/js/jquery.themepunch.revolution.min.js');
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/revolution/js/jquery.themepunch.tools.min.js');
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/revolution/js/extensions/revolution.extension.actions.min.js');
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/revolution/js/extensions/revolution.extension.carousel.min.js');
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/revolution/js/extensions/revolution.extension.kenburn.min.js');
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/revolution/js/extensions/revolution.extension.layeranimation.min.js');
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/revolution/js/extensions/revolution.extension.migration.min.js');
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/revolution/js/extensions/revolution.extension.navigation.min.js');
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/revolution/js/extensions/revolution.extension.parallax.min.js');
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/revolution/js/extensions/revolution.extension.slideanims.min.js');
            _this.gfn_addJavascript(_this.gfn_getContextPath() + '/resources/revolution/js/extensions/revolution.extension.video.min.js');
        },
        /**
         * @description ContextPath 를 가져온다.
         * @example /hansong
         * @returns {string}
         */
        gfn_getContextPath: function () {
            const hostIndex = location.href.indexOf(location.host) + location.host.length;
            return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
        },
        /**
         * @description javascript를 추가한다..
         * @example gfn_addJavascript('/contextpath/resources/js/~~.min.js')
         * */
        gfn_addJavascript: function (jsname) {
            var th = document.getElementsByTagName('head')[0];
            var newScript = document.createElement('script');
            //newScript.setAttribute('type','text/javascript');
            newScript.setAttribute('src', jsname);
            th.appendChild(newScript);
        }
    }
    common.init();
});