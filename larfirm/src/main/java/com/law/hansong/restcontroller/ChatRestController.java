package com.law.hansong.restcontroller;

import com.law.hansong.dto.Chat;
import com.law.hansong.service.ChatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/v1/chats", produces = "application/json;charset=UTF-8")
public class ChatRestController {
    private Logger log = LoggerFactory.getLogger(getClass());
    private final ChatService chatService;

    public ChatRestController(ChatService chatService) {
        this.chatService = chatService;
    }

    @GetMapping
    public List<Chat> getAllChat() {
        return chatService.getAllChat();
    }
}
