package com.law.hansong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/commons")
public class CommonController {
    @Autowired
    Environment env;

    @GetMapping("/keys")
    public Map<String, String> getKeys(@RequestParam("authProvider") String authProvider) {
        Map<String, String> returnValue = new HashMap<String, String>();
        switch (authProvider) {
            case "kakao":
                returnValue.put("key",env.getProperty("kakaokey"));
                break;
            case "google":
                returnValue.put("key",env.getProperty("googlekey"));
                break;
            default:
                break;
        }
        return returnValue;
    }
}
