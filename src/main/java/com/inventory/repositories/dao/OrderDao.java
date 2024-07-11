package com.inventory.repositories.dao;

import java.util.List;

import com.inventory.repositories.vo.OrderBasketVo;
import com.inventory.repositories.vo.OrderVo;

public interface OrderDao {

	public int insert(String branchId);
	
	public String getMax();
	
	public int insertDetail(OrderBasketVo vo);
	
	public List<OrderVo> getOrderList();
}
