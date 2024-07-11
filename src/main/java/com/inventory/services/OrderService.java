package com.inventory.services;

import java.util.List;

import com.inventory.repositories.vo.OrderBasketVo;
import com.inventory.repositories.vo.OrderDetailVo;
import com.inventory.repositories.vo.OrderVo;

public interface OrderService {

	public boolean insert(String branchId);
	public String getMax();
	public boolean insertDetail(OrderBasketVo vo);
	public List<OrderVo> getOrderList();
	public List<OrderDetailVo> getDetailList(String orderId);
}
