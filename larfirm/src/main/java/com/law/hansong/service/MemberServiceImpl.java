package com.law.hansong.service;

import java.util.ArrayList;
import java.util.List;

import com.law.hansong.exception.BusinessLogicException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.law.hansong.dao.MemberDao;
import com.law.hansong.dao.MemberRoleDao;
import com.law.hansong.dto.Member;
import com.law.hansong.dto.MemberRole;
import com.law.hansong.service.security.UserEntity;
import com.law.hansong.service.security.UserRoleEntity;

@Service
public class MemberServiceImpl implements MemberService {
    private Logger log = LoggerFactory.getLogger(getClass());
    // 생성자에 위해 주입되는 객체이고, 해당 객체를 초기화할 필요가 이후에 없기 때문에 final로 선언하였다.
    // final로 선언하고 초기화를 안한 필드는 생성자에서 초기화를 해준다.
    // private final MemberDao memberDao;
    // private final MemberRoleDao memberRoleDao;
    @Autowired
    private MemberDao memberDao;
    @Autowired
    private MemberRoleDao memberRoleDao;

    // @Service가 붙은 객체는 스프링이 자동으로 Bean으로 생성하는데
    // 기본생성자가 없고 아래와 같이 인자를 받는 생성자만 있을 경우 자동으로 관련된 타입이 Bean으로 있을 경우 주입해서 사용하게 된다.
    /*
     * public MemberServiceImpl(MemberDao memberDao, MemberRoleDao memberRoleDao) {
     * this.memberDao = memberDao; this.memberRoleDao = memberRoleDao; }
     */

    @Override
    public UserEntity getUser(String loginUserId) {
        Member member = memberDao.getMemberByEmail(loginUserId);
        return new UserEntity(member.getEmail(), member.getPassword());
    }

    @Override
    public List<UserRoleEntity> getUserRoles(String loginUserId) {
        List<MemberRole> memberRoles = memberRoleDao.getRolesByEmail(loginUserId);
        List<UserRoleEntity> list = new ArrayList<>();

        for (MemberRole memberRole : memberRoles) {
            log.info(memberRole.toString());
            list.add(new UserRoleEntity(loginUserId, memberRole.getRole_name()));
        }
        return list;
    }

    @Override
    public List<Member> getUserList() {
        List<Member> memberList = memberDao.getMemberList();
        return memberList;
    }

    @Override
    public int addMember(Member member) {
        int result = memberDao.checkMail(member.getEmail());
        if (result > 0) { // id가 이미 존재
            return -1;
        }
        result = memberDao.addMember(member);
        result += memberRoleDao.addMemberRole();

        if (result < 2) { // 뭔가 하나 실패함
            throw new BusinessLogicException("회원 등록 중 문제가 발생했습니다. 관리자에게 문의 바랍니다.", true);
        }

        return result;
    }





/*	@Override
	@Transactional 
	public String addMember(Member member, boolean b) {
		String msg = ""; 
		String chk = memberDao.idCheck(member.getEmail());
		if(chk.equals("Y") ) { memberDao.addMember(member);
		memberDao.addMemberRole(member.getId()); 
		return "회원가입 완료되었습니다."; 
		} else { 
			return msg; 
	
		}*/

    public Member getMemberByEmail(String email) {
        Member member = memberDao.getMemberByEmail(email);
        return member;
    }
}
