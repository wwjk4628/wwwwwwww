package com.inventory.repositories.dao;

import java.util.List;

import com.inventory.repositories.vo.UserVo;

public interface UserDao {
	public int insert(UserVo vo);
	public UserVo selectUser(String name);
	public UserVo selectUser(String name, String password);
	public List<UserVo> getList();
	public long getCount();
}
