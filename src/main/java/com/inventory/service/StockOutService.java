package com.inventory.service;

import java.util.List;
import com.inventory.vo.StockOutVo;

public interface StockOutService {
    List<StockOutVo> getAllStockOuts();
}
