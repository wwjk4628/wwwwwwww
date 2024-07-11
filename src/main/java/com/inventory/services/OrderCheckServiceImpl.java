package com.inventory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.repositories.dao.OrderCheckDao;
import com.inventory.repositories.vo.OrderCheckVo;

@Service("OrderCheckService")
public class OrderCheckServiceImpl implements OrderCheckService {

	@Autowired
	private OrderCheckDao OrderCheckDao;
	
	@Override
	public List<OrderCheckVo> getList() {
		List<OrderCheckVo> list = OrderCheckDao.getAllList();
		return list;
	}

	@Override
	public List<OrderCheckVo> getBranchsList(String id) {
		List<OrderCheckVo> list = OrderCheckDao.getBranchsList(id);
		return list;
	}

	@Override
	public List<OrderCheckVo> getOrderDetail(String id) {
		List <OrderCheckVo> list = OrderCheckDao.getOrderDetail(id);
		return list;
	}

	@Override
	public int refuseOrder(String no) {
		return OrderCheckDao.refuseOrder(no);
	}

}
