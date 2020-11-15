package com.law.hansong.dao;

import com.law.hansong.dto.Board;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class ChatDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 채팅방 생성
	public int createChat() {
		return sqlSession.insert("Chat.createChat");
	}
	
	
}
