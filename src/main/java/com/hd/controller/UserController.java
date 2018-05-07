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

import com.hd.domain.ApplyRecord;
import com.hd.domain.BasePage;
import com.hd.domain.DesignerWithBLOBs;
import com.hd.domain.Message;
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
	@ResponseBody
	public Result updateUser(User user){
		Result result = userService.updateUser(user);
		if(result.noError()){
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", result.getData());
		}
		return result;
	}
	
	@RequestMapping("queryDesigner")
	@ResponseBody
	public Result queryDesigner(BasePage basePage){
		Result result = userService.queryDesigner(basePage);
		return result;
	}
	
	@RequestMapping("addDesignerPage")
	public String addDesignerPage(){
		return "jsp/user/designerApply";
	}
	
	@RequestMapping("addDesigner")
	@ResponseBody
	public Result addDesigner(DesignerWithBLOBs designerInfo,String telphone){
		Result result = userService.addDesignerCheckInfo(designerInfo, telphone);
		if(result.noError()){
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", result.getData());
		}
		result.setData(((User)result.getData()).getId());
		return result;
	}
	
	@RequestMapping("designerDetailInfo/{designerId}")
	public String designerDetailInfoPage(@PathVariable("designerId")String designerId){
		Result result = userService.queryDesignerDetailInfo(designerId);
		request.setAttribute("designerInfo", result.getData());
		return "jsp/user/designerDetailInfo";
	}
	
	@RequestMapping("showAllEffect")
	public String showAllEffect(){
		return "jsp/user/showAllEffect";
	}
	
	@RequestMapping("showAllApply")
	public String showAllApply(){
		return "jsp/user/showAllApply";
	}
	
	@RequestMapping("showAllDesigner")
	public String showAllDesigner(){
		return "jsp/user/showAllDesigner";
	}
	
	@RequestMapping("showAllDecorExperience")
	public String showAllDecorExperience(){
		return "jsp/user/showAllDecorExperience";
	}
	
	@RequestMapping("showAllPerferActivities")
	public String showAllPerferActivities(){
		return "jsp/user/showAllPerferActivities";
	}
	
	@RequestMapping("companyInfo")
	public String companyInfo(){
		return "jsp/user/companyInfo";
	}
	
	@RequestMapping("countDecorationEffect")
	@ResponseBody
	public Result countDecorEffect(){
		Result result = userService.countAllDecorEffect();
		return result;
	}
	
	@RequestMapping("countDesigner")
	@ResponseBody
	public Result countDesigner(){
		Result result = userService.countDesigner();
		return result;
	}
	
	@RequestMapping("countExperience")
	@ResponseBody
	public Result countExperience(){
		Result result = userService.countExperience();
		return result;
	}
	
	@RequestMapping("countActivities")
	@ResponseBody
	public Result countActivities(){
		Result result = userService.countActivities();
		return result;
	}
	
	@RequestMapping("seeSource")
	@ResponseBody
	public Result seeSource(String id){
		return userService.seeSource(id);
	}
	
	@RequestMapping("queryExperience")
	@ResponseBody
	public Result queryExperience(String id){
		Result result = userService.queryExperience(id);
		return result;
	}
	
	@RequestMapping("queryActivity")
	@ResponseBody
	public Result queryActivity(String id){
		Result result = userService.queryActivity(id);
		return result;
	}
	
	@RequestMapping("queryExperienceLis")
	@ResponseBody
	public Result queryExperienceLis(BasePage basePage){
		Result result = userService.queryExperienceLis(basePage);
		return result;
	}
	
	@RequestMapping("queryActivityLis")
	@ResponseBody
	public Result queryActivityLis(BasePage basePage){
		Result result = userService.queryActivityLis(basePage);
		return result;
	}
	
	@RequestMapping("applyDesignLis")
	@ResponseBody
	public Result applyDesignLis(BasePage basePage){
		HttpSession session = request.getSession();
		User userSession = (User)session.getAttribute("userInfo");
		Result result = userService.applyDesignLis(basePage,userSession.getId());
		return result;
	}
	
	@RequestMapping("dealApply")
	@ResponseBody
	public Result dealApply(ApplyRecord applyRecord){
		Result result = userService.dealApply(applyRecord);
		return result;
	}
	
	@RequestMapping("myDesignLis")
	@ResponseBody
	public Result myDesignLis(){
		HttpSession session = request.getSession();
		User userSession = (User)session.getAttribute("userInfo");
		Result result = userService.myDesignLis(userSession.getId());
		return result;
	}
	
	@RequestMapping("sendMsg")
	@ResponseBody
	public Result sendMsg(String receiveId, String content){
		HttpSession session = request.getSession();
		User userSession = (User)session.getAttribute("userInfo");
		Result result = userService.sendMsg(receiveId, userSession.getId(), content);
		return result;
	}
	
	@RequestMapping("getMsgList")
	@ResponseBody
	public Result getMsgList(BasePage basePage){
		HttpSession session = request.getSession();
		User userSession = (User)session.getAttribute("userInfo");
		Result result = userService.queryMsgList(userSession.getId(), basePage);
		return result;
	}
	
	@RequestMapping("countMsg")
	@ResponseBody
	public Result countMsg(){
		HttpSession session = request.getSession();
		User userSession = (User)session.getAttribute("userInfo");
		Result result = userService.countMsg(userSession.getId());
		return result;
	}
	
	@RequestMapping("updateMsg")
	@ResponseBody
	public Result updateMsg(Message message){
		Result result = userService.updateMsg(message);
		return result;
	}
}