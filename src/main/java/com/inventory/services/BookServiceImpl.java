package com.inventory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.repositories.dao.BookDao;
import com.inventory.repositories.vo.BookVo;



@Repository("BookService")
public class BookServiceImpl implements BookService{

	@Autowired
	BookDao bookDao;

	@Override
	public List<BookVo> getbookList() {
		List<BookVo> list = bookDao.selectAll();
		System.out.println(list);
		return list;
	}

	@Override
	public boolean writebook(BookVo vo) {
		int insertedCount = bookDao.insert(vo);
		return 1 == insertedCount;
	}

	@Override
	public boolean deletebook(String book_code) {
		int deletedCount = bookDao.delete(book_code);
		System.out.println("service" + book_code + "count" + deletedCount);
		return 1 == deletedCount;
	}

	@Override
	public boolean updatebook(BookVo vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<BookVo> search(String book_name) {
		System.out.println("ser" + book_name);
		List<BookVo> list = bookDao.search(book_name);
		return list;
	}

	
	
	
	
}
