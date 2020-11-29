package com.law.hansong.service;

import com.law.hansong.dto.Chat;

import javax.websocket.Session;
import java.util.List;

public interface ChatService {
     void createChat(Session session);

     void onMessage(String message, Session session);

     void endChat(Session session);

     List<Chat> getAllChat();
}
