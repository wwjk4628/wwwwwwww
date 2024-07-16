package com.inventory.repositories.dao;

import java.util.List;

import com.inventory.repositories.vo.BookInventoryVo;

public interface BookInventoryDao {
	
	public List <BookInventoryVo> list(String id);
	public List <BookInventoryVo> search(String id, String keyword);
	
	public int getInventory(BookInventoryVo vo);
	
	public List <BookInventoryVo> checkedList(String id);
	public List <BookInventoryVo> checkedSearch(String id, String keyword);
}
