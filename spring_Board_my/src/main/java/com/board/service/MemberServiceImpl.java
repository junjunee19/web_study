package com.board.service;

import com.board.dao.MemberDAO;
import com.board.dto.MemberVO;

public class MemberServiceImpl implements MemberService{
	
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO){
		this.memberDAO=memberDAO;
	}
	
	@Override
	public MemberVO getMember(String userid) throws Exception {		
		return memberDAO.readMember(userid);
	}
	

}
