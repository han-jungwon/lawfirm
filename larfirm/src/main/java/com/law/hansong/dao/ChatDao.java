package com.law.hansong.dao;

import com.law.hansong.dto.Board;
import com.law.hansong.dto.Chat;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public class ChatDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 채팅방 생성
	public int createChat(String id) {
		return sqlSession.insert("Chat.createChat", id);
	}

	// 참가자 생성
	public int createParticipant(Map<String, String> map) {
		return sqlSession.insert("Chat.createParticipant", map);
	}

	// 관리자 참가자 추가
	public int addParticipant(Map<String, String> map) {
		return sqlSession.insert("Chat.addParticipant", map);
	}
	// 채팅상태 변경(상담대기 -> 상담중)
	public int updateChatCondition(Map<String, String> map) {
		return sqlSession.update("Chat.updateChatCondition", map);
	}
	// 메시지 전송
	public int sendMessage(Map<String, String> map) {
		return sqlSession.insert("Chat.sendMessage", map);
	}

	// 참가중인 채팅방 있는지 체크
	public int checkJoinChat(String id) {
		return sqlSession.selectOne("Chat.joinChat", id);
	}

	// 메시지 전송 대상 가져오기
	public String getParticipantId(Map<String, String> map) {
		return sqlSession.selectOne("Chat.getParticipantId", map);
	}

	// 채팅 종료(정상)
	public int endChat(String id) {
		return sqlSession.selectOne("Chat.endChat", id);
	}

	// 채팅 정보(전체)
	public List<Chat> getAllChat() {
		return sqlSession.selectList("Chat.getAllChat");
	}
}
