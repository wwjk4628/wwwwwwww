package com.inventory.repositories.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.repositories.vo.OrderCheckVo;

@Repository("OrderCheckDao")
public class OrderCheckDaoImpl implements OrderCheckDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<OrderCheckVo> getAllList() {
		List <OrderCheckVo> list = sqlSession.selectList("orderCheck.orderCheckList");
		return list;
	}

	@Override
	public List<OrderCheckVo> getBranchsList(String id) {
		List <OrderCheckVo> list = sqlSession.selectList("orderCheck.orderCheckbranch", id);
		return list;
	}

	@Override
	public List<OrderCheckVo> getOrderDetail(String id) {
		List <OrderCheckVo> list = sqlSession.selectList("orderCheck.selectOrderDetail", id);
		return list;
	}

	@Override
	public int refuseOrder(String no) {
		return sqlSession.update("orderCheck.refuseOrder", no);
	}

}
