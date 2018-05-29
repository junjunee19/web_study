package com.board.service;

import java.util.List;

import com.board.dto.Criteria;
import com.board.dto.ReplyVO;

public interface ReplyService {
	
	List<ReplyVO> getReplyList(int bno)throws Exception;
	void createReply(ReplyVO reply)throws Exception;
	void modifyReply(ReplyVO reply)throws Exception;
	void deleteReply(int rno)throws Exception;
	
	List<ReplyVO> getReplyListPage(int bno,Criteria cri)
							throws Exception;
	int countReply(int bno) throws Exception;
	
}













