package com.board.dao;

import java.util.List;

import com.board.dto.Criteria;
import com.board.dto.ReplyVO;

public interface ReplyDAO {
	
	List<ReplyVO> selectReplyList(int bno)throws Exception;
	void insertReply(ReplyVO reply)throws Exception;
	void updateReply(ReplyVO reply)throws Exception;
	void deleteReply(int rno)throws Exception;
	
	List<ReplyVO> selectReplyListPage(int bno,Criteria cri)
							throws Exception;
	int countReply(int bno) throws Exception;
}






