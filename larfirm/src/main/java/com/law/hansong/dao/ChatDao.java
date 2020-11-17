package com.law.hansong.dao;

import com.law.hansong.dto.Board;
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
	
}
