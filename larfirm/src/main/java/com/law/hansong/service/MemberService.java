package com.law.hansong.service;

import java.util.List;

import com.law.hansong.dto.Member;
import com.law.hansong.service.security.UserDbService;
import com.law.hansong.service.security.UserEntity;

public interface MemberService extends UserDbService{

	   UserEntity getUser(String loginUserId);
	   List<Member> getUserList();
	   //String addMember(Member member, boolean bool);
	   //Member getMemberByEmail(String loginId);
	
	   int addMember(Member member);
	

	   
	
	
	}
