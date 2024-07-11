package com.inventory.services;

import java.util.List;

import com.inventory.repositories.vo.OrderCheckVo;

public interface OrderCheckService {

	public List <OrderCheckVo> getList ();
	
	public List <OrderCheckVo> getBranchsList(String id);
	
	public List <OrderCheckVo> getOrderDetail(String id);
	
	public int refuseOrder(String no);
}
