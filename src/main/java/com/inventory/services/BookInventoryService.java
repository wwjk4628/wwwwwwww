package com.inventory.services;

import java.util.List;

import com.inventory.repositories.vo.BookInventoryVo;

public interface BookInventoryService {

	public List <BookInventoryVo> getList (String id);
	public List <BookInventoryVo> search (String id, String keyword);
	
	public List <BookInventoryVo> checkedGetList(String id);
	public List <BookInventoryVo> checkedSearch (String id, String keyword);
}
