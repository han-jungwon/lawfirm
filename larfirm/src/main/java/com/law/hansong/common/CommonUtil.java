package com.law.hansong.common;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CommonUtil {
    private static final Logger logger = LoggerFactory.getLogger(CommonUtil.class);

    public static String gm_xssFilter(String value) {
        if(!gm_isNull(value)) {
            return Jsoup.clean(value, Whitelist.basic()).replaceAll("[\"]", "&#34;")
                    .replaceAll("[\']", "&#39;");
        }
        return value;
    }

    public static boolean gm_isNull(String value) {
        if(value.trim().isEmpty() || value == null) {
            return true;
        }
        return false;
    }
}
