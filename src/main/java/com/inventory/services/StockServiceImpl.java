package com.inventory.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inventory.repositories.dao.StockDao;
import com.inventory.repositories.vo.StockVo;

@Service("StockService")
public class StockServiceImpl implements StockService {

	@Autowired
	StockDao stockDao;
	
	@Override
	public List<StockVo> getStockInList(String branchId) {
		List<StockVo>list = stockDao.getStockInList(branchId); 
		return list;
	}

	@Override
	public List<StockVo> getStockInDetail(String inId) {
		List<StockVo>list = stockDao.getStockInDetail(inId);
		return list;
	}
	
	@Override
	public boolean stockInCheck(String inId) {
		return stockDao.stockInCheck(inId);
	}

	@Override
	public boolean confirnStockIn(StockVo vo) {
		return stockDao.confirmStockIn(vo);
	}
}
