package com.hd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.hd.domain.Result;
import com.hd.domain.SysCompanyWithBLOBs;
import com.hd.domain.SysExperienceList;
import com.hd.domain.SysPreferentialActivities;
import com.hd.service.AdminService;
import com.hd.util.StringUtil;

/**
 * 管理员控制层
 */
@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private AdminService adminService;
	
	/**
	 * 进入管理员登录页面
	 */
	@RequestMapping("")
	public String goIn(){
		return "adminIndex";
	}
	/**
	 * 管理员登录
	 * @param userName 用户名(暂时写死 'admin')
	 * @param password 密码(暂时写死 '123456')
	 * @return
	 */
	@RequestMapping("login")
	public String login(String userName, String password){
		if(StringUtil.isNotEmpty(userName) && userName.equals("admin") 
				&& StringUtil.isNotEmpty(password) && password.equals("123456")){
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", "admin");
			session.setMaxInactiveInterval(30*60);
			return "jsp/management";
		}
		request.setAttribute("msg", "账号或密码错误");
		return "adminIndex";
	}
	
	/**
	 * 查询菜单列表
	 * @param request
	 * @return
	 */
	@RequestMapping("menuList")
	public String menuList(HttpServletRequest request){
		Result result = adminService.queryMenuList();
		request.setAttribute("menuList", result.getBody());
		return "adminIndex";
	}
	
	/**
	 * 公司基本信息管理页面
	 * @return
	 */
	@RequestMapping("baseInfoPage")
	public String baseInfo(){
		return "jsp/admin/baseInfo";
	}
	
	/**
	 * 公司装修经验管理页面
	 * @return
	 */
	@RequestMapping("experienceInfo")
	public String experienceInfo(){
		return "jsp/admin/experience";
	}
	
	/**
	 * 公司活动管理页面
	 * @return
	 */
	@RequestMapping("preferentialActivities")
	public String preferentialActivities(){
		return "jsp/admin/preferentialActivities";
	}
	
	/**
	 * 设计师审核管理页面
	 * @return
	 */
	@RequestMapping("designerCheck")
	public String designerCheck(){
		return "jsp/admin/designerCheck";
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
	
	/**
	 * 添加或修改公司基本信息
	 * @param sysCompany
	 * @return
	 */
	@RequestMapping("addOrUpdateBaseInfo")
	@ResponseBody
	public Result addOrUpdateBaseInfo(SysCompanyWithBLOBs sysCompany){
		Result result = adminService.queryAllCompanyInfo();
		if(result.getBody() == null){
			result = adminService.addBaseInfo(sysCompany);
		}else{
			result = adminService.updateBaseInfo(sysCompany);
		}
		return result;
	}
	
	@RequestMapping("queryExperienceLis")
	@ResponseBody
	public Result queryExperienceLis(@RequestParam("pageIndex")int pageIndex, @RequestParam("limit")int limit){
		Result result = adminService.queryValidExperienceLis(pageIndex, limit);
		return result;
	}
	
	@RequestMapping("addExperience")
	@ResponseBody
	public Result addExperience(SysExperienceList experienceList){
		Result result = adminService.addExperience(experienceList);
		return result;
	}
	
	@RequestMapping("updateExperience")
	@ResponseBody
	public Result updateExperience(SysExperienceList experienceList){
		Result result = adminService.updateExperence(experienceList);
		return result;
	}
	
	@RequestMapping("queryPreferentialActivities")
	@ResponseBody
	public Result queryPreferentialActivities(){
		Result result = adminService.queryValidPreferentialActivities();
		return result;
	}
	
	@RequestMapping("addPreferentialActivities")
	@ResponseBody
	public Result addPreferentialActivities(SysPreferentialActivities sysPreferentialActivities){
		Result result = adminService.addPreferentialActivities(sysPreferentialActivities);
		return result;
	}
	
	@RequestMapping("updatePreferentialActivities")
	@ResponseBody
	public Result updatePreferentialActivities(SysPreferentialActivities sysPreferentialActivities){
		Result result = adminService.updatePreferentialActivities(sysPreferentialActivities);
		return result;
	}
	
	@RequestMapping("queryDesignerCheckInfo")
	@ResponseBody
	public Result queryDesignerCheckInfo(){
		Result result = adminService.querySignerCheckInfo();
		return result;
	}
	
	@RequestMapping("checkDesigner")
	@ResponseBody
	public Result checkDesigner(@RequestParam("status")String status, @RequestParam("userId")String userId){
		Result result = adminService.checkDesigner(status, userId);
		return result;
	}
	
	@RequestMapping("upload")
	@ResponseBody
	public String upload(HttpServletRequest request){
		Result result = adminService.fileUpload(request);
		return JSON.toJSONString(result);
	}
}
