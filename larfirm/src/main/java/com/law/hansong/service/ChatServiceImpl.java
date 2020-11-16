package com.law.hansong.service;

import com.law.hansong.dao.ChatDao;
import com.law.hansong.dao.MemberRoleDao;
import com.law.hansong.dto.MemberRole;
import com.law.hansong.exception.BusinessLogicException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatServiceImpl implements ChatService {
    private final ChatDao chatDao;
    private final MemberRoleDao memberRoleDao;

    public ChatServiceImpl(ChatDao chatDao, MemberRoleDao memberRoleDao) {
        this.chatDao = chatDao;
        this.memberRoleDao = memberRoleDao;
    }

    // 채팅 생성
    public void createChat(String id) {
        int result = 0;

        List<MemberRole> rolesByEmail = memberRoleDao.getRolesByEmail(id);

        // 권한 여부 체크(계정 비활성화 exception)
        if(rolesByEmail != null) {
            throw new DisabledException("권한 정보가 없습니다.");
        }

        if(rolesByEmail.size() < 2) {
            // chat방 생성
            result = chatDao.createChat();
            if (result < 1) {
                throw new BusinessLogicException("채팅연결 중 에러가 발생했습니다. 관리자에게 문의바랍니다.(1)", false);
            }
        }


        // 참가자 추가
        result += chatDao.createParticipant(id);
        if (result < 2) {
            throw new BusinessLogicException("채팅연결 중 에러가 발생했습니다. 관리자에게 문의바랍니다.(2)", false);
        }

    }
}
