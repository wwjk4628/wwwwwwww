package com.inventory.services;

import java.util.List;
import com.inventory.repositories.vo.OrderVo;

public interface OrderService {

	public boolean insert(String branchId);
	public String getMax();
	public boolean insertDetail(OrderVo vo);
	public List<OrderVo> getOrderList();
	public List<OrderVo> getDetailList(String orderId);
}