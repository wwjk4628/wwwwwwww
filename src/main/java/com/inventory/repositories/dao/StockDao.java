package com.inventory.repositories.dao;

import java.util.List;

import com.inventory.repositories.vo.StockVo;

public interface StockDao {

	public List <StockVo> getStockInList (String branchId);
	
	public List <StockVo> getStockInDetail(String inId);
	
	public boolean stockInCheck(String inId);
	public boolean confirmStockIn(StockVo vo);
	
	public int getInId (String branchId);
}
