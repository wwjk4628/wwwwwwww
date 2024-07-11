package com.inventory.repositories.dao;

import java.util.List;

import com.inventory.repositories.vo.OrderCheckVo;

public interface OrderCheckDao {
	
	public List <OrderCheckVo> getAllList ();
	
	public List<OrderCheckVo> getBranchsList(String id);
	
	public List <OrderCheckVo> getOrderDetail(String id);
	
	public int refuseOrder(String no);
}
