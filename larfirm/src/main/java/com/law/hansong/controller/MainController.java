package com.law.hansong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/main")
public class MainController {
    @GetMapping()
    public String main(){
        return "main";
    }

    
    @GetMapping("/lawyer")
    public String lawyer(){
        return "menu/lawyer";
    }

    @GetMapping("/office")
    public String office() {
        return "menu/office";
    }
    @GetMapping("/directions")
    public String directions() {
        return "menu/directions";
    }

    @GetMapping("/anklet")
    public String anklet() {
        return "specialized/anklet";
    }

    @GetMapping("/camera")
    public String camera() {
        return "specialized/camera";
    }

    @GetMapping("/prostitution")
    public String prostitution() {
        return "specialized/prostitution";
    }


}