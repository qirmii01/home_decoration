package com.hd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hd.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
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
		return "jsp/admin/adminLogin";
	}
	/**
	 * 管理员登录
	 * @param userName 用户名(暂时写死 'admin')
	 * @param password 密码(暂时写死 '123456')
	 * @return
	 */
	@RequestMapping("login")
	@ResponseBody
	public Result login(String userName, String password){
		if(StringUtil.isNotEmpty(userName) && userName.equals("admin") 
				&& StringUtil.isNotEmpty(password) && password.equals("123456")){
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", "admin");
			session.setMaxInactiveInterval(30*60);
			return Result.buildResult(Result.SUCCESS, "登录成功");
		}
		return Result.buildErrorResult("账号或密码错误");
	}
	
	@RequestMapping("adminLogout")
	@ResponseBody
	public Result logout(){
		HttpSession session = request.getSession();
		session.invalidate();
		return Result.buildSuccessResult();
	}
	
	/**
	 * 查询菜单列表
	 * @param request
	 * @return
	 */
	@RequestMapping("menuList")
	public String menuList(HttpServletRequest request){
		Result result = adminService.queryMenuList();
		request.setAttribute("menuList", result.getData());
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
	 * 添加公司装修经验管理页面
	 * @return
	 */
	@RequestMapping("addExperiencePage")
	public String experienceInfo(){
		return "jsp/admin/addExperience";
	}
	
	/**
	 * 公司装修经验列表
	 * @return
	 */
	@RequestMapping("experienceListPage")
	public String experienceList(){
		return "jsp/admin/experienceList";
	}
	
	/**
	 * 公司活动列表
	 * @return
	 */
	@RequestMapping("preferentialActivities")
	public String preferentialActivities(){
		return "jsp/admin/preferentialActivities";
	}
	
	/**
	 * 添加公司活动
	 * @return
	 */
	@RequestMapping("addactivities")
	public String addPreferentialActivity(){
		return "jsp/admin/addPreferentialActivities";
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
	 * 装修申请审核页面
	 * @return
	 */
	@RequestMapping("decorationApplyCheckPage")
	public String decorationApplyCheck(){
		return "jsp/admin/decorationApplyCheck";
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
		if(result.getData() == null){
			result = adminService.addBaseInfo(sysCompany);
		}else{
			result = adminService.updateBaseInfo(sysCompany);
		}
		return result;
	}
	
	@RequestMapping("queryExperienceLis")
	@ResponseBody
	public Result queryExperienceLis(){
		Result result = adminService.queryExperienceLis();
		return result;
	}
	
	@RequestMapping("queryExperience")
	@ResponseBody
	public Result queryExperience(@RequestParam("id")String id){
		Result result = adminService.queryExperience(id);
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
	
	@RequestMapping("queryPreferentialActivitiesList")
	@ResponseBody
	public Result queryPreferentialActivities(){
		Result result = adminService.queryPreferentialActivities();
		return result;
	}
	
	@RequestMapping("queryPreferentialActivity")
	@ResponseBody
	public Result queryPreferentialActivities(String id){
		Result result = adminService.queryPreferentialActivity(id);
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

	/**
	 * 查询申请审核的设计师
	 * @param designerCheckInfo
	 * @return
	 */
	@RequestMapping("queryDesignerCheckInfo")
	@ResponseBody
	public Result queryDesignerCheckInfo(DesignerCheckInfo designerCheckInfo){
		Result result = adminService.querySignerCheckInfo(designerCheckInfo);
		return result;
	}
	
	@RequestMapping("checkDesigner")
	@ResponseBody
	public Result checkDesigner(@RequestParam("status")String status, @RequestParam("userId")String userId,@RequestParam("designerId")String designerId){
		Result result = adminService.checkDesigner(status, userId,designerId);
		return result;
	}
	
	@RequestMapping("upload")
	@ResponseBody
	public String upload(HttpServletRequest request){
		Result result = adminService.fileUpload(request);
		return JSON.toJSONString(result);
	}
	
	@RequestMapping("queryDecorApplyCheckLis")
	@ResponseBody
	public Result queryDecorApplyCheckLis(DecorationApply formData){
		Result result = adminService.queryDecorApplyCheckLis(formData);
		return result;
	}
	
	@RequestMapping("decorationApplyCheck")
	@ResponseBody
	public Result decorationApplyCheck(String id,String status){
		Result result = adminService.decorationApplyCheck(id, status);
		return result;
	}
	
	@RequestMapping("uploadImage")
	@ResponseBody
	public Result uploadImage(HttpServletRequest request){
		Result result = adminService.uploadImage(request);
		return result;
	}
}
