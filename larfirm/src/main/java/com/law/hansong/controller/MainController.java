package com.law.hansong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
    @RequestMapping("/main")
    public String main(){
        return "main";
    }
    
    @RequestMapping("/memberinfo")
    public String memberinfo(){
        return "members/memberinfo";
    }

}