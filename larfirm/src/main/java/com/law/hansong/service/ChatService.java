package com.law.hansong.service;

public interface ChatService {
     void createChat(String id, String chatId);

     String sendMessage(String message, String participantId);
}
