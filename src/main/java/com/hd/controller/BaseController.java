package com.hd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hd.domain.Result;

public class BaseController {
	/**
	 * 用户会话验证
	 * @param request
	 * @return
	 */
	public Result sessionIsValid(HttpServletRequest request){
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") == null){
			return Result.buildResult(Result.sessionInvalid,"会话失效，请重新登录");
		}
		return null;
	}
	
	public Object getSessionInfo(HttpServletRequest request,String attr){
		HttpSession session = request.getSession();
		return session.getAttribute(attr);
	}
}
