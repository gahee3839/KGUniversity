package com.kgu.www.Book.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kgu.www.Book.paging.PurPaging;
import com.kgu.www.Book.paging.Search;
import com.kgu.www.Book.paging.SupPaging;
import com.kgu.www.Book.paging.UserPurchase;
import com.kgu.www.Book.vo.BookVO;
import com.kgu.www.Book.vo.PurchaseVO;

@Repository
public class BookDAOImpl implements BookDAO {
	
	private static final String NAMESPACE = "com.kgu.www.mapper.Book.BookMapper";
	
	private final SqlSession sqlSession;
	
	@Inject
	public BookDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void bookInsertForm(BookVO bvo) throws Exception{
		sqlSession.insert(NAMESPACE+".bookInsertForm", bvo);
	}
	
	@Override
	public BookVO getBookInfo(BookVO bvo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getBookInfo", bvo);
	}
	
	@Override
	public BookVO getBookInfoN(int book_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getBookInfoN", book_num);
	}
	
	@Override
	public void updateBook(BookVO bvo) throws Exception {
		sqlSession.update(NAMESPACE+".updateBook", bvo);
	}
	
	@Override
	public void updateInventory(BookVO bvo) throws Exception{
		sqlSession.update(NAMESPACE+".updateInventory", bvo);
	}
	
	@Override
	public void deleteBook(String book_name) throws Exception {
		sqlSession.delete(NAMESPACE+".deleteBook", book_name);
	}
	
	@Override
	public List<BookVO> bookAll() throws Exception {
		return sqlSession.selectList(NAMESPACE+".bookAll");
	}
	
	@Override
	public List<BookVO> supPaging(SupPaging supPaging) throws Exception {
		return sqlSession.selectList(NAMESPACE+".supPaging", supPaging);
	}
	
	@Override
	public int countBook(SupPaging supPaging) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countBook", supPaging);
	}
	
	@Override
	public List<PurchaseVO> purPaging(PurPaging purPaging) throws Exception {
		return sqlSession.selectList(NAMESPACE+".purPaging", purPaging);
	}
	
	@Override
	public int countPurchase(PurPaging purPaging) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countBook", purPaging);
	}
	
	@Override
	public List<BookVO> searchBook(Search search) throws Exception {
		return sqlSession.selectList(NAMESPACE+".searchBook", search);
	}
	
	@Override
	public int countSearchedBook(Search search) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countSearchedBook", search);
	}
	
	@Override
	public void purchaseInsertForm(PurchaseVO pvo) throws Exception {
		sqlSession.insert(NAMESPACE+".purchaseInsertForm", pvo);
	}

	@Override
	public List<PurchaseVO> purchaseList(String user_id) throws Exception{
		return sqlSession.selectList(NAMESPACE+".purchaseList", user_id);
	}
	
	@Override
	public List<PurchaseVO>	userPurchase(UserPurchase userPurchase) throws Exception {
		return sqlSession.selectList(NAMESPACE+".userPurchase", userPurchase);
	}
	
	@Override
	public int countSearchedPurchase(UserPurchase userPurchase) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countSearchedPurchase", userPurchase);
	}


}
