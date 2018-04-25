package com.hd.service;

import javax.servlet.http.HttpServletRequest;

import com.hd.domain.DecorationApply;
import com.hd.domain.DesignerCheckInfo;
import com.hd.domain.Result;
import com.hd.domain.SysCompanyWithBLOBs;
import com.hd.domain.SysExperienceList;
import com.hd.domain.SysPreferentialActivities;

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
	 * @return
	 */
	public Result queryExperienceLis();
	
	/**
	 * 查询装修经验
	 * @param id 经验id
	 * @return
	 */
	public Result queryExperience(String id);
	
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
	public Result queryPreferentialActivities();
	
	/**
	 * 查询优惠活动
	 * @param id 活动id
	 * @return
	 */
	public Result queryPreferentialActivity(String id);
	
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
	
	/**
	 * 查询装修申请审核列表
	 * @param formData 表单数据
	 * @return
	 */
	public Result queryDecorApplyCheckLis(DecorationApply formData);
	
	/**
	 * 装修申请审核
	 * @param applyId 申请id
	 * @param status 审核状态
	 * @return
	 */
	public Result decorationApplyCheck(String applyId, String status);
	
	/**
	 * layuiedit上传图片
	 * @param request
	 * @return
	 */
	public Result uploadImage(HttpServletRequest request);
}
