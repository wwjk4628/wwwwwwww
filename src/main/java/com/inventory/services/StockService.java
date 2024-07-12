package com.inventory.services;

import java.util.List;

import com.inventory.repositories.vo.StockVo;

public interface StockService {
	
	public List <StockVo> getStockInList (String branchId);
	
	public List <StockVo> getStockInDetail (String inId);
	
	public boolean stockInCheck(String inId);
	public boolean confirnStockIn(StockVo vo);
}
