package com.board.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.board.dto.BoardVO;
import com.board.dto.Criteria;
import com.board.dto.SearchCriteria;

public class BoardDAOImpl implements BoardDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session){
		this.session=session;
	}

	private static final String NAMESPACE="BoardMapper";
	
	@Override
	public void insertBoard(BoardVO board) throws Exception {
		session.update(NAMESPACE+".insertBoard",board);

	}

	@Override
	public BoardVO selectBoardByBNO(int bno) throws Exception {
		BoardVO board=
		(BoardVO)session.selectOne(NAMESPACE+".selectBoardByBNO",bno);
		return board;
	}

	@Override
	public void updateBorad(BoardVO board) throws Exception {
		session.update(NAMESPACE+".updateBoard",board);
	}

	@Override
	public void deleteBoard(int bno) throws Exception {
		session.update(NAMESPACE+".deleteBoard",bno);

	}

	@Override
	public List<BoardVO> selectBoardAll() throws Exception {
		List<BoardVO> boardList=
				session.selectList(NAMESPACE+".selectBoardAll");
		return boardList;
	}

	@Override
	public List<BoardVO> selectBoardPage(int page) throws Exception {
		if(page<=0){
			page=1;
		}
		
		int offset=(page-1)*10;
		int limit=10;
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<BoardVO> boardList=
	session.selectList(NAMESPACE+".selectBoardAll",null,rowBounds);
		return boardList;
	}

	@Override
	public int countBoard() throws Exception {
		int count=(Integer)session.selectOne(NAMESPACE+".countBoard");
		return count;
	}

	@Override
	public List<BoardVO> selectBOardCriteria(Criteria cri) throws Exception {
		int page=cri.getPage();
		int perPageNum=cri.getPerPageNum();
					
		int offset=(page-1)*perPageNum;
		int limit=perPageNum;
		RowBounds rowBounds=new RowBounds(offset,limit);
		List<BoardVO> boardList=
	session.selectList(NAMESPACE+".selectBoardAll",null,rowBounds);
		return boardList;
	}
	@Override
	public List<BoardVO> selectSearchBoardList(SearchCriteria cri) throws Exception {
		int offset=cri.getPageStart();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<BoardVO> boardList=
		session.selectList(NAMESPACE+".selectSearchBoardList",cri,rowBounds);
		return boardList;
	}

	@Override
	public int selectSearchBoardCount(SearchCriteria cri) throws Exception {
		int listCount=(Integer)session.selectOne(NAMESPACE+".selectSearchBoardCount",cri);
		return listCount;
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		session.update(NAMESPACE+".increaseViewCnt",bno);		
	}

}







