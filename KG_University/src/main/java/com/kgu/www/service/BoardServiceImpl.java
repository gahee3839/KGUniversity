package com.kgu.www.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kgu.www.service.dao.BoardDAO;
import com.kgu.www.vo.BoardCommentVO;
import com.kgu.www.vo.BoardPagingVO;
import com.kgu.www.vo.FreeBoardVO;

@Service("KguBoardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO kguBoardDAO;

	@Override
	@Transactional
	public ArrayList<FreeBoardVO> FreeboardALL(BoardPagingVO pagingVO) {
		return kguBoardDAO.FreeboardALL(pagingVO);
	}

	@Override
	@Transactional
	public FreeBoardVO getFreeboardContent(int contentNum) {
		return kguBoardDAO.getFreeboardContent(contentNum);
	}

	@Override
	@Transactional
	public void updateFreeboardHit(int contentNum) {
		kguBoardDAO.updateFreeboardHit(contentNum);
		
	}

	@Override
	@Transactional
	public ArrayList<BoardCommentVO> getFreeboardComment(int contentNum) {
		return kguBoardDAO.getFreeboardComment(contentNum);
	}

	@Override
	@Transactional
	public void insertFreeboardComment(BoardCommentVO boardCommentVO) {
		kguBoardDAO.insertFreeboardComment(boardCommentVO);
	}

	@Override
	@Transactional
	public void updateFreeboardcommentCnt(int contentNum) {
		kguBoardDAO.updateFreeboardcommentCnt(contentNum);
	}

	@Override
	@Transactional
	public void deleteFreeboardComment(int contentNum) {
		kguBoardDAO.deleteFreeboardComment(contentNum);
	}

	@Override
	@Transactional
	public void deleteFreeboardContent(int contentNum) {
		kguBoardDAO.deleteFreeboardContent(contentNum);
	}
}
