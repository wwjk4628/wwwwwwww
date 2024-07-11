package com.inventory.repositories.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.repositories.vo.OrderVo;

@Repository("OrderCheckDao")
public class OrderCheckDaoImpl implements OrderCheckDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<OrderVo> getAllList() {
		List <OrderVo> list = sqlSession.selectList("orderCheck.orderCheckList");
		return list;
	}

	@Override
	public List<OrderVo> getBranchsList(String id) {
		List <OrderVo> list = sqlSession.selectList("orderCheck.orderCheckBranch", id);
		return list;
	}

	@Override
	public List<OrderVo> getOrderDetail(String id) {
		List <OrderVo> list = sqlSession.selectList("orderCheck.selectOrderDetail", id);
		return list;
	}

	@Override
	public long getCount() {
		long count = sqlSession.selectOne("orderCheck.countNewOrder");
		return count;
	}
	
	@Override
	public int refuseOrder(String no) {
		return sqlSession.update("orderCheck.refuseOrder", no);
	}

}
