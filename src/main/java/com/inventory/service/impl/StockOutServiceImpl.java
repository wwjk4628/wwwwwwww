package com.inventory.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.inventory.dao.StockOutDAO;
import com.inventory.service.StockOutService;
import com.inventory.vo.StockOutVo;

@Service
public class StockOutServiceImpl implements StockOutService {

    @Autowired
    private StockOutDAO stockOutDAO;

    @Override
    public List<StockOutVo> getAllStockOuts() {
        return stockOutDAO.getAllStockOuts();
    }
}
