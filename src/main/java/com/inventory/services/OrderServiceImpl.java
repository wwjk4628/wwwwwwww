package com.inventory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.repositories.dao.OrderDao;
import com.inventory.repositories.vo.OrderVo;

@Service("OrderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderDao orderDao;
	
	@Override
	public boolean insert(String branchId) {
		System.out.println(branchId);
		int insertedCount = orderDao.insert(branchId);
		return 1 == insertedCount;
	}

	@Override
	public String getMax() {
		
		return orderDao.getMax();
	}

	@Override
	public boolean insertDetail(OrderVo vo) {
		int insertedCount = orderDao.insertDetail(vo);
		return 1 == insertedCount;
	}

	@Override
	public List<OrderVo> getOrderList() {
		List<OrderVo> list = orderDao.getOrderList();
		return list;
	}

	@Override
	public List<OrderVo> getDetailList(String orderId) {
		List<OrderVo> list = orderDao.getDetailList(orderId);
		return list;
	}
	
	
	
	

}
