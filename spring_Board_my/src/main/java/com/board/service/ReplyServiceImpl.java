package com.board.service;

import java.util.List;

import com.board.dao.ReplyDAO;
import com.board.dto.Criteria;
import com.board.dto.ReplyVO;

public class ReplyServiceImpl implements ReplyService{
	
	private ReplyDAO dao;
	public void setDao(ReplyDAO dao){
		this.dao=dao;
	}

	@Override
	public List<ReplyVO> getReplyList(int bno) throws Exception {
		return dao.selectReplyList(bno);
	}

	@Override
	public void createReply(ReplyVO reply) throws Exception {
		dao.insertReply(reply);		
	}

	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		dao.updateReply(reply);		
	}

	@Override
	public void deleteReply(int rno) throws Exception {
		dao.deleteReply(rno);		
	}

	@Override
	public List<ReplyVO> getReplyListPage(int bno, Criteria cri) throws Exception {
		return dao.selectReplyListPage(bno, cri);
	}

	@Override
	public int countReply(int bno) throws Exception {		
		return dao.countReply(bno);
	}

}
