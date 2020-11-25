package com.law.hansong.common;

import java.io.File;
import java.util.Calendar;
import java.util.Random;

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
    
    public static String gm_fileDbName(String fileName, String saveFolder) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		int date = c.get(Calendar.DATE);

		String homedir = saveFolder + year + "-" + month + "-" + date;
		File path1 = new File(homedir);
		if (!(path1.exists())) {
			path1.mkdir();
		}
		Random r = new Random();
		int random = r.nextInt(100000000);

		int index = fileName.lastIndexOf(".");

		String fileExtension = fileName.substring(index + 1);

		String refileName = "sh" + year + month + date + random + "." + fileExtension;

		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;

		return fileDBName;
	}
}
