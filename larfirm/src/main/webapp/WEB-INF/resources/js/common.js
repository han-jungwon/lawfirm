var common = {
    init : function() {
        /* --------------------------------------------------------------------------------------
            공통 라이브러리 추가
         --------------------------------------------------------------------------------------*/
        var _this = this;
        _this.gfn_addJavascript('https://code.jquery.com/jquery-latest.min.js');
        _this.gfn_addJavascript(_this.gfn_getContextPath()+'/resources/js/bootstrap.min.js');
        _this.gfn_addJavascript(_this.gfn_getContextPath()+'/resources/js/custom.js');
        _this.gfn_addJavascript(_this.gfn_getContextPath()+'/resources/js/hizoom.js');
        _this.gfn_addJavascript(_this.gfn_getContextPath()+'/resources/js/wow.js');
    },
    /**
     * @description ContextPath 를 가져온다.
     * @example /hansong
     * @returns {string}
     */
    gfn_getContextPath : function() {
        const hostIndex = location.href.indexOf( location.host ) + location.host.length;
        return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
    },
    /**
     * @description javascript를 추가한다..
     * @example gfn_addJavascript('/contextpath/resources/js/bootstrap.min.js')
     * */
    gfn_addJavascript : function() {
        var th = document.getElementsByTagName('head')[0];
        var newScript = document.createElement('script');
        newScript.setAttribute('type','text/javascript');
        newScript.setAttribute('src',jsname);
        th.appendChild(newScript);
    }
}
common.init();