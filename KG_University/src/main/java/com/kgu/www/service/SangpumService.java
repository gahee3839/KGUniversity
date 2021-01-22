package com.kgu.www.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.kgu.www.vo.PagingVO;
import com.kgu.www.vo.SangpumVO;

public interface SangpumService {
	

	
	//게시물 목록
	 ArrayList<SangpumVO> SangpumAll();

	

	//게시물등록
	public void SangpumInsert(SangpumVO vo);
	
	//게시글 상세보기
	public SangpumVO SangpumDetail(int bno);
		
	//조회수 올리기
	public boolean plusCnt(int bno);
	
	//게시글 삭제
	public boolean SangpumDel(int bno);
	
	//게시글 개수
		public int count();
		
	//게시글 목록+페이징
		

		public ArrayList<SangpumVO> selectBoard(PagingVO vo);
}
