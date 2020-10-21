package com.law.hansong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
    @GetMapping("/boards")
    public String boards() {

        return "board/counsel";
    }
}
