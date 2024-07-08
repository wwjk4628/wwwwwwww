package com.inventory.dao.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.inventory.dao.StockOutDAO;
import com.inventory.vo.StockOutVo;

@Repository
public class StockOutDAOImpl implements StockOutDAO {

    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "com.inventory.dao.StockOutDAO";

    @Override
    public List<StockOutVo> getAllStockOuts() {
        return sqlSession.selectList(NAMESPACE + ".getAllStockOuts");
    }
}
