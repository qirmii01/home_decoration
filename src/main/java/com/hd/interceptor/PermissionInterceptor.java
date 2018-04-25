/**
 * 
 */
package com.hd.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 功能描述: 权限认证过滤器	
 */
public class PermissionInterceptor extends HandlerInterceptorAdapter {
	

	@Override
	public boolean preHandle(HttpServletRequest request,  
            HttpServletResponse response, Object o)throws Exception {
		String req = request.getServletPath();
        Object userInfo = request.getSession().getAttribute("userInfo");
        
//        //登录	登出	主页	不用过滤权限
//		if(!req.startsWith("/admin")){
//			return true;
//		}else{
//			if(userInfo==null){
//				response.sendRedirect("adminIndex.jsp");
//				return false;
//			}
//			return true;
//		}
        return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request,  
            HttpServletResponse response, Object o, ModelAndView mav) throws Exception{
	}

}
