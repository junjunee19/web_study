package com.board.service;

import java.util.List;

import com.board.dto.BoardVO;
import com.board.dto.Criteria;
import com.board.dto.SearchCriteria;

public interface BoardService {
	
	public void create(BoardVO board)throws Exception;
	public BoardVO read(int bno)throws Exception;
	public BoardVO readByBno(int bno)throws Exception;
	
	public void modify(BoardVO board)throws Exception;
	public void remove(int bno)throws Exception;
	
	public List<BoardVO> listAll()throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	public List<BoardVO> listSearch(SearchCriteria cri)
										throws Exception;
	int readSearchBoardCount(SearchCriteria cri)
										throws Exception;
	
	
	
}





