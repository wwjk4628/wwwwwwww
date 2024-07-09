package com.inventory.services;

import java.util.List;

import com.inventory.repositories.vo.BookInventoryVo;

public interface BookInventoryService {

	public List <BookInventoryVo> getList (String id);
}
