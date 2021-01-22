package com.kgu.www.service.impl;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kgu.www.service.SangpumService;
import com.kgu.www.service.dao.SangpumDAO;
import com.kgu.www.vo.PagingVO;
import com.kgu.www.vo.SangpumVO;

@Service("SangpumService")
public class SangpumServiceImpl implements SangpumService {

	@Autowired
	private SangpumDAO sangpumDAO;
	
	
	@Override
	@Transactional
	public ArrayList<SangpumVO> SangpumAll() {
		// TODO Auto-generated method stub
		return sangpumDAO.SangpumAll();
	}



	@Override
	public void SangpumInsert(SangpumVO vo) {
		sangpumDAO.SangpumInsert(vo);
		
	}
	
	@Override
	public SangpumVO SangpumDetail(int bno) {
		return sangpumDAO.SangpumDetail(bno);
	}
	
	@Override
	public boolean plusCnt(int bno) {
		return sangpumDAO.plusCnt(bno);
	}
	
	@Override
	public boolean SangpumDel(int bno) {
		return sangpumDAO.SangpumDel(bno);
	}
	
	@Override
	public int count() {
		return sangpumDAO.count();
	}



	@Override
	public ArrayList<SangpumVO> selectBoard(PagingVO vo) {
		// TODO Auto-generated method stub
		return sangpumDAO.selectBoard(vo);
	}
	

	

}
