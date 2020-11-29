package com.law.hansong.controller;

import com.law.hansong.dto.ChatUser;
import com.law.hansong.exception.BadRequestException;
import com.law.hansong.service.ChatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.server.standard.SpringConfigurator;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@ServerEndpoint(value = "/boot", configurator = SpringConfigurator.class)
public class ChatController {
    private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

    public static final List<ChatUser> userList
            = Collections.synchronizedList(new ArrayList<ChatUser>());
    public static final List<ChatUser> adminList
            = Collections.synchronizedList(new ArrayList<ChatUser>());

    private final ChatService chatService;

    public ChatController(ChatService chatService) {
        this.chatService = chatService;
        logger.info("Web Socket init...");
    }

    @OnOpen
    public void onOpen(Session session) {
        chatService.createChat(session);
    }

    @OnError
    public void onError(Throwable e, Session session) {
        logger.info("error socket..."+e.getMessage());
        remove(session);
    }

    @OnClose
    public void onClose(Session session) throws InvocationTargetException {
        logger.info("Session " + session.getId()+ "has ended");
        remove(session);
    }

    private void remove(Session session) {
        chatService.endChat(session);
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        logger.info("onMessage : " + message);
        chatService.onMessage(message, session);
    }


}
