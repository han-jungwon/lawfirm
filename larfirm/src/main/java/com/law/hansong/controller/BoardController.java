package com.law.hansong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/boards")
public class BoardController {

    @GetMapping("/counsel")
    public String counsel() {
        return "board/counsel";
    }
    @GetMapping("/agreement")
    public String agreement() {
        return "board/agreement";
    }
    @GetMapping("/apology")
    public String apology() {
        return "board/apology";
    }
    @GetMapping("/report")
    public String report() {
        return "board/report";
    }
    @GetMapping("/notice")
    public String notice() {
        return "board/notice";
    }
    @GetMapping("/petition")
    public String petition() {
        return "board/petition";
    }


}
