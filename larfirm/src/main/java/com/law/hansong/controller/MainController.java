package com.law.hansong.controller;

import com.law.hansong.exception.BusinessLogicException;
import com.law.hansong.exception.ObjectNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    @GetMapping("/test")
    public String test() {
        if(true)
        throw new ObjectNotFoundException("회원",false);

        return "menu/lawyer";
    }

}