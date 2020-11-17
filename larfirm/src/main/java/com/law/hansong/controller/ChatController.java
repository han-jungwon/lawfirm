package com.law.hansong.controller;

import com.law.hansong.dto.ChatUser;
import com.law.hansong.service.ChatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;
import org.springframework.web.socket.server.standard.SpringConfigurator;

import javax.annotation.PostConstruct;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@ServerEndpoint(value = "/boot", configurator = SpringConfigurator.class)
public class ChatController {
    public static final List<ChatUser> sessionList
            = Collections.synchronizedList(new ArrayList<ChatUser>());
    private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

    private final ChatService chatService;

    public ChatController(ChatService chatService) {
        this.chatService = chatService;
        logger.info("Web Socket init...");
    }

    @OnOpen
    public void onOpen(Session session) {
        String participantId = session.getQueryString();
        String id = session.getUserPrincipal().getName();

        logger.info("id = " + id);
        ChatUser user = ChatUser.builder()
               .id(id)
               .session(session)
               .build();
        sessionList.add(user);

        chatService.createChat(id, participantId);
        String message = id + "님이 입장하셨습니다.";
        sendAllSessionToMessage(session, message);
    }

    @OnError
    public void onError(Throwable e, Session session) {
        e.printStackTrace();
        logger.info("error socket...");
        remove(session);
    }

    @OnClose
    public void onClose(Session session) throws InvocationTargetException {
        logger.info("Session " + session.getId()+ "has ended");
        remove(session);
    }

    private void remove(Session session) {
        synchronized (sessionList) {
            for(int i = 0; i <sessionList.size(); i++) {
                Session s = sessionList.get(i).getSession();
                if(session.getId().equals(s.getId())) {
                    sessionList.remove(i);
                }
            }
        }
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        logger.info("onMessage : " + message);
        sendAllSessionToMessage(session, message);
    }

    private void sendAllSessionToMessage(Session self, String message) {
        String info = getinfo(self);

        synchronized(sessionList) {
            try {
                for(ChatUser user : ChatController.sessionList) {
                    Session s = user.getSession();
                    if(!self.getId().equals(s.getId())) { //나를 제외한 사람에게
                        // 1234님이 들어옵니다.
                        logger.info("나를 제외한 모든 사람에게 보내는 메시지:" + info + "&" + message);
                        s.getBasicRemote().sendText(info +"&"+ message);
                    }
                }
            }catch(Exception e) {
                logger.info("sendAllSessionToMessage 오류" + e.getMessage());
            }
        }
    }

    private String getinfo(Session self) {
        String information = "";
        synchronized(sessionList) {

            for(ChatUser user : ChatController.sessionList) {
                Session s = user.getSession();
                if(self.getId().equals(s.getId())) {
                    information = user.getId();
                    // 보낸 사람의 정보 : 1234
                    logger.info("보낸 사람의 정보:" + information);
                    break;
                }
            }

        }
        return information;
    }
}
