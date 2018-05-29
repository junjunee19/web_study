package com.board.service;

import java.util.List;

import com.board.dao.BoardDAO;
import com.board.dto.BoardVO;
import com.board.dto.Criteria;
import com.board.dto.SearchCriteria;

public class BoardServiceImpl implements BoardService{
	
	private BoardDAO boardDAO;
	public void setBoardDAO(BoardDAO boardDAO){
		this.boardDAO=boardDAO;
	}	
	
	public BoardDAO getBoardDAO() {
		return boardDAO;
	}


	@Override
	public void create(BoardVO board) throws Exception {
		boardDAO.insertBoard(board);
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		BoardVO board=boardDAO.selectBoardByBNO(bno);
		boardDAO.increaseViewcnt(bno);
		return board;
	}

	@Override
	public void modify(BoardVO board) throws Exception {
		boardDAO.updateBorad(board);
		
	}

	@Override
	public void remove(int bno) throws Exception {
		boardDAO.deleteBoard(bno);		
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		List<BoardVO> boardList=boardDAO.selectBoardAll();
		return boardList;
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		List<BoardVO> boardList=boardDAO.selectBOardCriteria(cri);
		return boardList;
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		List<BoardVO> boardList=boardDAO.selectSearchBoardList(cri);		
		System.out.println("Service"+boardList);
		
		return boardList;
	}

	@Override
	public int readSearchBoardCount(SearchCriteria cri) throws Exception {
		
		int count=boardDAO.selectSearchBoardCount(cri);
		return count;
	}

	@Override
	public BoardVO readByBno(int bno) throws Exception {
		BoardVO board=boardDAO.selectBoardByBNO(bno);
		return board;
	}

}




