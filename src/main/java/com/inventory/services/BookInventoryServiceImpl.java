package com.inventory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.repositories.dao.BookInventoryDao;
import com.inventory.repositories.vo.BookInventoryVo;

@Service("BookInventoryService")
public class BookInventoryServiceImpl implements BookInventoryService {
	
	@Autowired
	private BookInventoryDao bookInventoryDao;

	@Override
	public List<BookInventoryVo> getList(String id) {
		List<BookInventoryVo> list = bookInventoryDao.list(id);
		return list;
	}

	@Override
	public List<BookInventoryVo> search(String id, String keyword) {
		List <BookInventoryVo> list = bookInventoryDao.search(id, keyword);
		return list;
	}

	@Override
	public List<BookInventoryVo> checkedGetList(String id) {
		List<BookInventoryVo> list = bookInventoryDao.checkedList(id);
		return list;
	}

	@Override
	public List<BookInventoryVo> checkedSearch(String id, String keyword) {
		List <BookInventoryVo> list = bookInventoryDao.checkedSearch(id, keyword);
		return list;
	}

	@Override
	public int getInventory(BookInventoryVo vo) {
		int inventory = bookInventoryDao.getInventory(vo);
		return inventory;
	}

	
}
