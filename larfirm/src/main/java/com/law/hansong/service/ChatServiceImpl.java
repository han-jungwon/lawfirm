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
    public void createChat(Session session) {
        String adminYn = session.getQueryString();
        String id = session.getUserPrincipal().getName();

        ChatUser user = ChatUser.builder()
                .session(session)
                .build();

        if("admin".equals(adminYn)) {
            adminList.add(user);
        } else {
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
            Map<String, Object> paramMap = new HashMap<String, Object>();
            paramMap.put("id", id);

            result = chatDao.createChat(paramMap);
            if (result < 1) {
                throw new BusinessLogicException("채팅연결 중 에러가 발생했습니다. 관리자에게 문의바랍니다.(1)", true);
            }

            // 참가자 추가
            result = chatDao.createParticipant(paramMap);
            if (result < 1) {
                throw new BusinessLogicException("채팅연결 중 에러가 발생했습니다. 관리자에게 문의바랍니다.(2)", true);
            }
            user.setChatId(Long.parseLong(paramMap.get("chatId").toString()));
            userList.add(user);
        }



    }
    @Override
    public void onMessage(String message, Session session) {

        String[] messageArray = message.split("&");
        Map<String, Object> paramMap = new HashMap<String, Object>();

        int result = 0;

        // 1.유저,관리자가 보내는 채팅기능
        if("1".equals(messageArray[0])) {
            String userMessage =  CommonUtil.gm_xssFilter(messageArray[1]);
            paramMap.put("content", userMessage);
            paramMap.put("participantId", session.getUserPrincipal().getName());
            result = chatDao.sendMessage(paramMap);
            if(result < 1) {
                throw new BusinessLogicException("메시지를 보내는 과정에서 에러가 발생했습니다. 관리자에게 문의바랍니다.", true);
            }
            String toParticipantId = chatDao.getParticipantId(paramMap);

            // userList 탐색
            send(messageArray, toParticipantId, userList);
            // adminList 탐색
            send(messageArray, toParticipantId, adminList);
            // 2. 관리자가 방 선택해서 참가
        } else if("2".equals(messageArray[0])) {
            paramMap.put("chatId", messageArray[1]);
            paramMap.put("participantId", session.getUserPrincipal().getName());

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

            synchronized (adminList) {
                for(int i = 0; i <adminList.size(); i++) {
                    Session s = adminList.get(i).getSession();
                    if(session.getId().equals(s.getId())) {
                        adminList.get(i).setChatId(Long.parseLong(messageArray[1]));
                        System.out.println("chat은 이게 들어갇나 : "+adminList.get(i).getChatId());
                    }
                }
            }
            // 관리자 채팅 종료시
        } else if("3".equals(messageArray[0])) {
            paramMap.put("chatId", messageArray[1]);
            paramMap.put("participantId", session.getUserPrincipal().getName());
            result = chatDao.updateParticipantStatus(paramMap);
            if(result < 1) {
                throw new BusinessLogicException("상담 종료에 실패했습니다.", true);
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
                        s.getBasicRemote().sendText(CommonUtil.gm_xssFilter(messageArray[1]));
                    }
                }
            }catch(Exception e) {
                logger.info("send 오류" + e.getMessage());
            }
        }
    }

    @Override
    public void endChat(Session session) {
        synchronized (userList) {
            for(int i = 0; i <userList.size(); i++) {
                Session s = userList.get(i).getSession();
                if(session.getId().equals(s.getId())) {
                    Chat chat = Chat.builder()
                            .id(userList.get(i).getChatId())
                            .regi_id(session.getUserPrincipal().getName())
                            .build();
                    int result = 0;
                    result = chatDao.endChat(chat);
                    if(result < 1) {
                        throw new BusinessLogicException("상담종료중 에러가 발생했습니다. 관리자에게 문의바랍니다.", true);
                    }

                    result = chatDao.endParticipant(chat);
                    if(result < 1) {
                        throw new BusinessLogicException("상담종료중 에러가 발생했습니다. 관리자에게 문의바랍니다.(2)", true);
                    }

                    userList.remove(i);
                    break;
                }
            }
        }
        synchronized (adminList) {
            for(int i = 0; i <adminList.size(); i++) {
                Session s = adminList.get(i).getSession();
                if(session.getId().equals(s.getId())) {
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
