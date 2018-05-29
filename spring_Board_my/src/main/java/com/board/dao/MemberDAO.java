package com.board.dao;

import com.board.dto.MemberVO;

public interface MemberDAO {
	
	public String getTime() throws Exception;
	public void inserMember(MemberVO member) throws Exception;
	
	public MemberVO readMember(String userid)throws Exception;
	public MemberVO readWithPW(String userid, String userpw)
		throws Exception;
}
