package com.inventory.repositories.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.repositories.vo.OrderBasketVo;
import com.inventory.repositories.vo.OrderDetailVo;
import com.inventory.repositories.vo.OrderVo;

@Repository("OrderDao")
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int insert(String branchId) {
		int insertedCount = sqlSession.insert("order.insert", branchId);
		return insertedCount;
	}

	@Override
	public String getMax() {

		return sqlSession.selectOne("order.getMax");
	}

	@Override
	public int insertDetail(OrderBasketVo vo) {

		return sqlSession.insert("order.insertDetail", vo);
	}

	@Override
	public List<OrderVo> getOrderList() {
		List<OrderVo> list = sqlSession.selectList("order.selectOrderList");
		return list;
	}

	@Override
	public List<OrderDetailVo> getDetailList(String orderId) {
		List<OrderDetailVo> list = sqlSession.selectList("order.selectDetailList", orderId);
		return list;
	}
	
	

}
