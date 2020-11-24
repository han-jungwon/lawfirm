package com.law.hansong.service;

import com.law.hansong.dto.Chat;

import java.util.List;

public interface ChatService {
     void createChat(String id);

     void onMessage(String message, String participantId);

     void endChat(String id);

     List<Chat> getAllChat();
}
