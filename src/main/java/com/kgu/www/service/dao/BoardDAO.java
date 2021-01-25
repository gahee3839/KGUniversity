package com.kgu.www.service.dao;

import java.util.ArrayList;

import com.kgu.www.vo.BoardCommentVO;
import com.kgu.www.vo.BoardPagingVO;
import com.kgu.www.vo.FreeBoardVO;

public interface BoardDAO {
	ArrayList<FreeBoardVO> FreeboardALL(BoardPagingVO pagingVO);
	FreeBoardVO getFreeboardContent(int contentNum);
	void updateFreeboardHit(int contentNum);
	ArrayList<BoardCommentVO> getFreeboardComment(int contentNum);
	void insertFreeboardComment(BoardCommentVO boardCommentVO);
	void updateFreeboardcommentCnt(int contentNum);
	void deleteFreeboardComment(int contentNum);
	void deleteFreeboardContent(int contentNum);
}
