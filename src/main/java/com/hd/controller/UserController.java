package com.hd.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hd.domain.PageObj;
import com.hd.domain.Result;
import com.hd.domain.User;
import com.hd.service.AdminService;
import com.hd.service.UserService;
import com.hd.util.CreateImageCodeUtil;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService userService;
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	private HttpServletRequest request;
	
	/**
	 * 跳转主页
	 * @return
	 */
	@RequestMapping("")
	public String index(Integer login){
		HttpSession session = request.getSession();
		//存公司基本信息
		session.setAttribute("baseInfo", adminService.queryAllCompanyInfo().getData());
		session.setMaxInactiveInterval(10*60);
		request.setAttribute("login", login);
		return "index";
	}
	
	/**
	 * 用户登入
	 * @param user
	 * @return
	 */
	@RequestMapping("loginIn")
	@ResponseBody
	public Result loginIn(User user){
		Result result = userService.queryUser(user);
		if(result.noError()){
			HttpSession session = request.getSession();
			//存用户信息
			session.setAttribute("userInfo", result.getData());
			session.setMaxInactiveInterval(10*60);
		}
		return result;
	}
	
	/**
	 * 用户登出
	 * @param user
	 * @return
	 */
	@RequestMapping("logOut")
	@ResponseBody
	public Result logOut(){
		HttpSession session = request.getSession();
		session.invalidate();
		return new Result("退出成功");
	}
	
	@RequestMapping("registerPage")
	public String registerPage(){
		return "register";
	}
	
	@RequestMapping("register")
	@ResponseBody
	public Result useRegister(User user){
		Result result = userService.registerUer(user);
		if(result.noError()){
			User userInfo = (User)result.getData();
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", userInfo);
			session.setMaxInactiveInterval(10*60);
		}
		return result;
	}
	
	 @ResponseBody
	@RequestMapping(value="/getVerificationCode")
	public String saveCheck(HttpServletRequest request,HttpServletResponse response){
    	response.setContentType("image/jpeg");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        HttpSession session = request.getSession();
        

		CreateImageCodeUtil vCode=new CreateImageCodeUtil(120, 33, 1, 4);
    	String sRand=vCode.getCode();
    	session.setAttribute("verificationCode", sRand);
    	
    	try {
			vCode.write(response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
        return null;
	}
	
	@RequestMapping("verifyMatch")
	@ResponseBody
	public Result verifyMatch(@RequestParam("code")String code){
		HttpSession session = request.getSession();
		String verifyCode = (String)session.getAttribute("verificationCode");
		if(!verifyCode.equals(code)){
			return Result.buildErrorResult("");
		}
		return new Result("");
	}
	
	@RequestMapping("personalCenter/{userId}")
	public String goInPersonal(@PathVariable("userId")String userId){
		HttpSession session = request.getSession();
		User userSession = (User)session.getAttribute("userInfo");
		if(userSession == null || !userSession.getId().equals(userId)){
			return "redirect:/user?login=1";
		}
		return "jsp/user/personalCenter";
	}
	
	/**
	 * 查询公司基本信息
	 * @return
	 */
	@RequestMapping("queryBaseInfo")
	@ResponseBody
	public Result queryBaseInfo(){
		Result result = adminService.queryAllCompanyInfo();
		return result;
	}
	
	@RequestMapping("userExist")
	@ResponseBody
	public Result userExist(User user){
		Result result = userService.userExist(user);
		return result;
	}
	
	@RequestMapping("updateUser")
	public Result updateUser(User user){
		Result result = userService.updateUser(user);
		return result;
	}
	
	@RequestMapping("queryDesigner")
	@ResponseBody
	public Result queryDesigner(PageObj pageObj, boolean queryAllInfo ){
		Result result = userService.queryDesigner(queryAllInfo, pageObj);
		return result;
	}
	
	
	
	@RequestMapping("checkDesigner")
	@ResponseBody
	public Result checkDesigner(){
		
		
		return null;
	}
}
