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
		String path = request.getServletPath();
        Object userInfo = request.getSession().getAttribute("userInfo");
        
//        //登录	登出	主页	不用过滤权限
		if(path.startsWith("/admin")){
			if( !path.equals("/admin/login") && !path.equals("/admin") && userInfo==null){
				response.sendRedirect("adminIndex.jsp");
				return false;
			}
		}else{
			if( userInfo==null && !path.equals("/admin/login")){
				response.sendRedirect("adminIndex.jsp");
				return false;
			}
		}
        return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request,  
            HttpServletResponse response, Object o, ModelAndView mav) throws Exception{
	}

}
