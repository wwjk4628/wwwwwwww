package com.inventory.services;

import java.util.List;

import com.inventory.repositories.vo.OrderVo;

public interface OrderCheckService {

	public List <OrderVo> getList ();
	
	public List <OrderVo> getBranchsList(String id);
	
	public List <OrderVo> getOrderDetail(String id);
	
	public long getCount();
	
	public int refuseOrder(String no);
}
