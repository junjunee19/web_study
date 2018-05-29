package com.board.service;

import com.board.dto.MemberVO;

public interface MemberService {
	
	MemberVO getMember(String userid) throws Exception;
	
}
