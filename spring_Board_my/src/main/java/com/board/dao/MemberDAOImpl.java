package com.board.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.board.dto.MemberVO;


public class MemberDAOImpl implements MemberDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session){
		this.session=session;
	}
	
	private static final String NAMESPACE="MemberMapper";

	@Override
	public String getTime() throws Exception {
		return (String)session.selectOne(NAMESPACE+".getTime");
	}

	@Override
	public void inserMember(MemberVO member) throws Exception {
		session.insert(NAMESPACE+".insertMember",member);		
	}

	@Override
	public MemberVO readMember(String userid) throws Exception {
		return (MemberVO)session.selectOne(NAMESPACE+".selectMember",userid);
	}

	@Override
	public MemberVO readWithPW(String userid, String userpw) throws Exception {		
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("userid",userid);
		paramMap.put("userpw",userpw);
		
		return 
			(MemberVO)session.selectOne(NAMESPACE+".readWithPW",paramMap);
	}
	
	
}





