package com.inventory.repositories.dao;

import java.util.List;

import com.inventory.repositories.vo.OrderVo;

public interface OrderCheckDao {
	
	public List <OrderVo> getAllList ();
	
	public List<OrderVo> getBranchsList(String id);
	
	public List <OrderVo> getOrderDetail(String id);
}
