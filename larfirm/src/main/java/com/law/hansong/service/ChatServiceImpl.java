package com.law.hansong.service;

import com.law.hansong.dao.ChatDao;
import com.law.hansong.exception.BusinessLogicException;
import org.springframework.stereotype.Service;

@Service
public class ChatServiceImpl implements ChatService {
    private final ChatDao chatDao;

    public ChatServiceImpl(ChatDao chatDao) {
        this.chatDao = chatDao;
    }

    // 채팅 생성
   public void createChat(String id) {
        int result = 0;
        // chat방 생성
//        result = chatDao.createChat();
//        if(result < 1) {
//               throw new BusinessLogicException("채팅연결 중 에러가 발생했습니다. 관리자에게 문의바랍니다.", false);
//        }

        // 참가자 추가

   }
}
