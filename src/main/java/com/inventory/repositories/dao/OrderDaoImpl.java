package com.inventory.repositories.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.repositories.vo.OrderBasketVo;

@Repository("OrderDao")
public class OrderDaoImpl implements OrderDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int insert(String orderId) {
		int insertedCount = sqlSession.insert("order.insert", orderId);
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

	
	
	
}

