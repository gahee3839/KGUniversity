package com.kgu.www.Book.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kgu.www.Book.paging.PurPaging;
import com.kgu.www.Book.paging.Search;
import com.kgu.www.Book.paging.SupPaging;
import com.kgu.www.Book.paging.UserPurchase;
import com.kgu.www.Book.persistence.BookDAO;
import com.kgu.www.Book.vo.BookVO;
import com.kgu.www.Book.vo.PurchaseVO;

@Service
public class BookServiceImpl implements BookService {
	
	private final BookDAO bookDAO;
	
	@Inject
	public BookServiceImpl(BookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}
	
	@Override
	public void bookInsertForm(BookVO bvo) throws Exception{
		bookDAO.bookInsertForm(bvo);
	}
	
	@Override
	public BookVO getBookInfo(BookVO bvo) throws Exception {
		return bookDAO.getBookInfo(bvo);
	}
	
	@Override
	public BookVO getBookInfoN(int book_num) throws Exception {
		return bookDAO.getBookInfoN(book_num);
	}
	
	@Override
	public void updateBook(BookVO bvo) throws Exception {
		bookDAO.updateBook(bvo);
	}
	
	@Override
	public void updateInventory(BookVO bvo) throws Exception{
		bookDAO.updateInventory(bvo);
	}
	
	@Override
	public void deleteBook(String book_name) throws Exception{
		bookDAO.deleteBook(book_name);
	}
	
	@Override
	public List<BookVO> bookAll() throws Exception {
		return bookDAO.bookAll();
	}
	
	@Override
	public List<BookVO> supPaging(SupPaging supPaging) throws Exception {
		return bookDAO.supPaging(supPaging);
	}
	
	@Override
	public int countBook(SupPaging supPaging) throws Exception {
		return bookDAO.countBook(supPaging);
	}
	
	@Override
	public List<BookVO> searchBook(Search search) throws Exception {
		return bookDAO.searchBook(search);
	}
	
	@Override
	public int countSearchedBook(Search search) throws Exception {
		return bookDAO.countSearchedBook(search);
	}
	
	@Override
	public void purchaseInsertForm(PurchaseVO pvo) throws Exception {
		bookDAO.purchaseInsertForm(pvo);
	}
	
	@Override
	public List<PurchaseVO> purchaseList(String user_id) throws Exception{
		return bookDAO.purchaseList(user_id);
	}
	
	@Override
	public List<PurchaseVO> purPaging(PurPaging purPaging) throws Exception {
		return bookDAO.purPaging(purPaging);
	}
	
	@Override
	public int countPurchase(PurPaging purPaging) throws Exception {
		return bookDAO.countPurchase(purPaging);
	}
	
	@Override
	public List<PurchaseVO> userPurchase(UserPurchase userPurchase) throws Exception {
		return bookDAO.userPurchase(userPurchase);
	}
	
	@Override
	public int countSearchedPurchase(UserPurchase userPurchase) throws Exception {
		return bookDAO.countSearchedPurchase(userPurchase);
	}

}
