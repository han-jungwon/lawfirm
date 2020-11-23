package com.law.hansong.service;

import com.law.hansong.common.CommonUtil;
import com.law.hansong.controller.ChatController;
import com.law.hansong.dao.ChatDao;
import com.law.hansong.dao.MemberRoleDao;
import com.law.hansong.dto.Chat;
import com.law.hansong.dto.ChatUser;
import com.law.hansong.dto.MemberRole;
import com.law.hansong.exception.BadRequestException;
import com.law.hansong.exception.BusinessLogicException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.DisabledException;
import org.springframework.stereotype.Service;

import javax.websocket.Session;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.law.hansong.controller.ChatController.adminList;
import static com.law.hansong.controller.ChatController.userList;

@Service
public class ChatServiceImpl implements ChatService {
    private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

    private final ChatDao chatDao;
    private final MemberRoleDao memberRoleDao;

    public ChatServiceImpl(ChatDao chatDao, MemberRoleDao memberRoleDao) {
        this.chatDao = chatDao;
        this.memberRoleDao = memberRoleDao;
    }

    // 채팅 생성
    @Override
    public void createChat(String id) {
        int result = 0;

        List<MemberRole> rolesByEmail = memberRoleDao.getRolesByEmail(id);

        // 권한 여부 체크(계정 비활성화 exception)
        if(rolesByEmail == null) {
            throw new DisabledException("권한 정보가 없습니다.");
        }

        // 기존에 상담중인 채팅방이 있는지 체크
        result = chatDao.checkJoinChat(id);
        if (result > 0) {
            throw new BadRequestException("이미 상담중인 채팅방이 존재합니다.", true);
        }
        // 채팅방 생성
        result = chatDao.createChat(id);
        if (result < 1) {
            throw new BusinessLogicException("채팅연결 중 에러가 발생했습니다. 관리자에게 문의바랍니다.(1)", true);
        }

        Map<String,String> map = new HashMap<>();
        map.put("id", id);

        // 참가자 추가
        result = chatDao.createParticipant(map);
        if (result < 1) {
            throw new BusinessLogicException("채팅연결 중 에러가 발생했습니다. 관리자에게 문의바랍니다.(2)", true);
        }

    }
    @Override
    public void onMessage(String message, String participantId) {
        message = CommonUtil.gm_xssFilter(message);
        String[] messageArray = message.split("&");
        Map<String, String> paramMap = new HashMap<String, String>();
        int result = 0;

        // 1.유저,관리자가 보내는 채팅기능  2. 관리자가 방 선택해서 참가
        if("1".equals(messageArray[0])) {
            paramMap.put("content", messageArray[1]);
            paramMap.put("participantId", participantId);
            result = chatDao.sendMessage(paramMap);
            if(result < 1) {
                throw new BusinessLogicException("메시지를 보내는 과정에서 에러가 발생했습니다. 관리자에게 문의바랍니다.", true);
            }
            String toParticipantId = chatDao.getParticipantId(paramMap);

            // userList 탐색
            send(messageArray, toParticipantId, userList);
            // adminList 탐색
            send(messageArray, toParticipantId, adminList);
        } else if("2".equals(messageArray[0])) {
            paramMap.put("chatId", messageArray[1]);
            paramMap.put("participantId", participantId);

            // 채팅방 참가자 추가
            result = chatDao.addParticipant(paramMap);
            if(result < 1) {
                throw new BusinessLogicException("존재하지 않는 채팅방입니다. 관리자에게 문의바랍니다.", true);
            }

            // 채팅방 상태 업뎃 ( 대기 -> 상담중 )
            result = chatDao.updateChatCondition(paramMap);
            if(result < 1) {
                throw new BusinessLogicException("이미 상담중인 채팅방입니다. 관리자에게 문의바랍니다.(2)", true);
            }
        } else {
            throw new BadRequestException();
        }
    }

    private void send(String[] messageArray, String toParticipantId, List<ChatUser> userList) {
        synchronized(userList) {
            try {
                for(ChatUser user : userList) {
                    Session s = user.getSession();
                    if(s.getUserPrincipal().getName().equals(toParticipantId)) {
                        s.getBasicRemote().sendText(messageArray[1]);
                    }
                }
            }catch(Exception e) {
                logger.info("send 오류" + e.getMessage());
            }
        }
    }

    @Override
    public void endChat(String id) {

        synchronized (userList) {
            for(int i = 0; i <userList.size(); i++) {
                Session s = userList.get(i).getSession();
                if(id.equals(s.getId())) {
                    int result = chatDao.endChat(id);
                    if(result < 1) {
                        throw new BusinessLogicException("상담종료중 에러가 발생했습니다. 관리자에게 문의바랍니다.", true);
                    }
                    userList.remove(i);
                }
            }
        }
        synchronized (adminList) {
            for(int i = 0; i <adminList.size(); i++) {
                Session s = adminList.get(i).getSession();
                if(id.equals(s.getId())) {
                    adminList.remove(i);
                }
            }
        }
    }

    @Override
    public List<Chat> getAllChat() {
        return chatDao.getAllChat();
    }
}
