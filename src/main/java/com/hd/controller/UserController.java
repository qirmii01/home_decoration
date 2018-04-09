package com.hd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hd.domain.Result;
import com.hd.domain.User;
import com.hd.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService userService;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("login")
	@ResponseBody
	public Result login(User user){
		Result result = userService.queryUser(user);
		if(result.noError()){
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", result.getBody());
			session.setMaxInactiveInterval(10*60);
		}
		return result;
	}
}
