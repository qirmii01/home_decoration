package com.hd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hd.domain.Result;
import com.hd.domain.User;
import com.hd.mapper.UserMapper;
import com.hd.service.UserService;
import com.hd.util.MD5Utility;
import com.hd.util.StringUtil;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;

	@Override
	public Result queryUser(User user) {
		if(user == null){
			return Result.buildErrorResult("用户信息为空");
		}
		if(StringUtil.isEmpty(user.getTelphone())){
			return Result.buildErrorResult("手机号不能为空");
		}
		if(StringUtil.isEmpty(user.getPassword())){
			return Result.buildErrorResult("密码不能为空");
		}else{
			try {
				user.setPassword(MD5Utility.getDigest(user.getPassword()));
			} catch (Exception e) {
				e.printStackTrace();
				return Result.buildErrorResult("系统错误");
			}
		}
		List<User> users = userMapper.selectUserBySelective(user);
		if(users.isEmpty()){
			return Result.buildErrorResult("用户名或密码错误");
		}
		
		if(users.size() != 1){
			return Result.buildErrorResult("系统错误");
		}
		return new Result(users.get(0));
	}

	@Override
	public Result registerUer(User user) {
		if(user == null){
			return Result.buildErrorResult("用户信息不能为空");
		}
		String regex;
		if(StringUtil.isEmpty(user.getTelphone())){
			return Result.buildErrorResult("手机号码不能为空");
		}else{
			regex = "^1[3|4|5|7|8]\\d{9}$";
			if(!user.getTelphone().matches(regex)){
				return Result.buildErrorResult("手机号码格式不正确");
			}else{
				User u =  new User();
				u.setTelphone(user.getTelphone());
				List<User> users = userMapper.selectUserBySelective(u);
				if( !users.isEmpty() ){
					return Result.buildErrorResult("该手机号码已被注册");
				}
			}
		}
		if(StringUtil.isEmpty(user.getUserName())){
			return Result.buildErrorResult("用户名不能为空");
		}
		if(StringUtil.isEmpty(user.getPassword())){
			return Result.buildErrorResult("密码不能为空");
		}else{
			String password;
			try {
				password = MD5Utility.getDigest(user.getPassword());
			} catch (Exception e) {
				e.printStackTrace();
				return Result.buildErrorResult("系统错误");
			}
			user.setPassword(password);
		}
		
		int result = userMapper.insertSelective(user);
		if(result<=0){
			return Result.buildErrorResult("系统错误");
		}
		return new Result("注册成功");
	}

	

}
