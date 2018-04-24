package com.hd.service;

import javax.servlet.http.HttpServletRequest;

import com.hd.domain.*;

/**
 * 管理员服务接口
 */
public interface AdminService {
	/**
	 * 查詢所有公司信息记录
	 * @return
	 */
	public Result queryAllCompanyInfo();
	
	/**
	 * 添加公司基本信息
	 * @param companyInfo 公司基本信息对象
	 * @return
	 */
	public Result addBaseInfo(SysCompanyWithBLOBs companyInfo);
	
	/**
	 * 更新公司基本信息
	 * @param companyInfo 公司基本信息对象
	 * @return
	 */
	public Result updateBaseInfo(SysCompanyWithBLOBs companyInfo);
	
	/**
	 * 查询装修经验列表
	 * @param pageIndex 第几页
	 * @param limit 每次查询条数
	 * @return
	 */
	public Result queryValidExperienceLis(int pageIndex, int limit);
	
	/**
	 * 添加装修经验
	 * @param experienceList 装修经验对象
	 * @return
	 */
	public Result addExperience(SysExperienceList experienceList);
	
	/**
	 * 修改装修经验
	 * @param experienceList 装修经验对象
	 * @return
	 */
	public Result updateExperence(SysExperienceList experienceList);
	
	/**
	 * 查询优惠活动列表
	 * @return
	 */
	public Result queryValidPreferentialActivities();
	
	/**
	 * 添加优惠活动
	 * @param sysPreferentialActivities 优惠活动对象
	 * @return
	 */
	public Result addPreferentialActivities(SysPreferentialActivities sysPreferentialActivities);
	
	/**
	 * 更新优惠活动
	 * @param sysPreferentialActivities 优惠活动对象
	 * @return
	 */
	public Result updatePreferentialActivities(SysPreferentialActivities sysPreferentialActivities);
	
	/**
	 * 查询设计师申请信息
	 * @return
	 */
	public Result querySignerCheckInfo(DesignerCheckInfo designerCheckInfo);
	
	/**
	 * 设计师审核
	 * @param status 审核结果
	 * @param userId 被审核的用户id
	 * @return
	 */
	public Result checkDesigner(String status, String userId,String designerId);
	
	/**
	 * 查询菜单信息
	 * @return
	 */
	public Result queryMenuList();
	
	/**
	 * 文件上传
	 * @param request 
	 * @return
	 */
	public Result fileUpload(HttpServletRequest request);
}
