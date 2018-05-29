package com.board.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.board.dto.Criteria;
import com.board.dto.ReplyVO;


public class ReplyDAOImpl implements ReplyDAO{
	
	private SqlSession session;
	public void setSession(SqlSession session){
		this.session=session;
		
	}
	
	private String namespace;
	public void setNamespace(String namespace){
		this.namespace=namespace;
	}

	
	@Override
	public List<ReplyVO> selectReplyList(int bno) throws Exception {
		List<ReplyVO> replyList=
				session.selectList(namespace+".selectReplyList",bno);
		
		return replyList;
	}

	@Override
	public void insertReply(ReplyVO reply) throws Exception {
		session.update(namespace+".insertReply",reply);		
	}

	@Override
	public void updateReply(ReplyVO reply) throws Exception {
		session.update(namespace+".updateReply",reply);		
	}

	@Override
	public void deleteReply(int rno) throws Exception {
		session.update(namespace+".deleteReply",rno);
		
	}

	@Override
	public List<ReplyVO> selectReplyListPage(int bno, Criteria cri) throws Exception {
		int offset=cri.getPageStart();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<ReplyVO> replyList=
	session.selectList(namespace+".selectReplyList",bno,rowBounds);
		return replyList;
	}

	@Override
	public int countReply(int bno) throws Exception {
		int count=
		(Integer)session.selectOne(namespace+".countReply",bno);
		return count;
	}

}


