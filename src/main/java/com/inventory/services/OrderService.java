package com.inventory.services;

import com.inventory.repositories.vo.OrderBasketVo;

public interface OrderService {

	public boolean insert(String branchId);
	public String getMax();
	public boolean insertDetail(OrderBasketVo vo);
}
