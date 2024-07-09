package com.inventory.repositories.dao;

import java.util.List;

import com.inventory.repositories.vo.BookInventoryVo;

public interface BookInventoryDao {
	
	public List <BookInventoryVo> list(String id);
}
