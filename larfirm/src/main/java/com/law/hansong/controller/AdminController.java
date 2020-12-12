package com.law.hansong.controller;

import com.law.hansong.service.ChatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admins")
public class AdminController {
    private Logger log = LoggerFactory.getLogger(getClass());

    private final ChatService chatService;

    public AdminController(ChatService chatService) {
        this.chatService = chatService;
    }

    @GetMapping(value = "/main")
    public String mainform() {
        return "admin/adminMain";
    }
}
