package com.inventory.repositories.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.repositories.vo.StockVo;

@Repository("StockDao")
public class StockDaoImpl implements StockDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<StockVo> getStockInList(String branchId) {
		List <StockVo> list = sqlSession.selectList("stock.stockInList", branchId);
		return list;
	}

	@Override
	public List<StockVo> getStockInDetail(String inId) {
		List<StockVo>list = sqlSession.selectList("stock.stockInDetail", inId);
		return list;
	}

}
