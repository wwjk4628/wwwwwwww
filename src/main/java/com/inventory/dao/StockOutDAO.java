package com.inventory.dao;

import java.util.List;
import com.inventory.vo.StockOutVo;

public interface StockOutDAO {
    List<StockOutVo> getAllStockOuts();
}
