package com.hd.service;

import java.util.List;

import com.hd.domain.Result;
import com.hd.domain.User;


public interface UserService {
	/**
	 * 查询用户信息
	 * @param user
	 * @return
	 */
	Result queryUser(User user);

	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	Result registerUer(User user);
	
}
