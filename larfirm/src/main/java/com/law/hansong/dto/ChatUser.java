package com.law.hansong.dto;

import lombok.Builder;
import lombok.Data;

import javax.websocket.Session;

@Data
@Builder
public class ChatUser {
    private Session session;
    private Long chatId;
}
