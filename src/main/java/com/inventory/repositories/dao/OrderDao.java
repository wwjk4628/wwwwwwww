package com.inventory.repositories.dao;

import com.inventory.repositories.vo.OrderBasketVo;

public interface OrderDao {

	public int insert(String orderId);
	
	public String getMax();
	
	public int insertDetail(OrderBasketVo vo);
}
