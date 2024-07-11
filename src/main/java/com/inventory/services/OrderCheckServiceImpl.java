package com.inventory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.repositories.dao.OrderCheckDao;
import com.inventory.repositories.vo.OrderVo;

@Service("OrderCheckService")
public class OrderCheckServiceImpl implements OrderCheckService {

	@Autowired
	private OrderCheckDao OrderCheckDao;
	
	@Override
	public List<OrderVo> getList() {
		List<OrderVo> list = OrderCheckDao.getAllList();
		return list;
	}

	@Override
	public List<OrderVo> getBranchsList(String id) {
		List<OrderVo> list = OrderCheckDao.getBranchsList(id);
		return list;
	}

	@Override
	public List<OrderVo> getOrderDetail(String id) {
		List <OrderVo> list = OrderCheckDao.getOrderDetail(id);
		return list;
	}

}
