package com.inventory.repositories.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inventory.repositories.vo.BookInventoryVo;

@Repository("BookInventoryDao")
public class BookInventoryDaoImpl implements BookInventoryDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BookInventoryVo> list(String id) {
		List <BookInventoryVo> list = sqlSession.selectList("bookInventory.selectInventory", id);
		return list;
	}

}
