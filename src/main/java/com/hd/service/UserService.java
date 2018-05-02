package com.hd.service;

import com.hd.domain.BasePage;
import com.hd.domain.DesignerWithBLOBs;
import com.hd.domain.Result;
import com.hd.domain.User;


public interface UserService {
	/**
	 * 查询用户信息
	 * @param user
	 * @return
	 */
	Result queryUser(User user);
	
	/**
	 * 判断用户是否存在
	 * @param user
	 * @return
	 */
	Result userExist(User user);

	/**
	 * 用户注册
	 * @param user
	 * @return
	 */
	Result registerUer(User user);
	
	/**
	 * 查询设计师信息
	 * @param basePage 传输page ,limit的值
	 * @return
	 */
	Result queryDesigner(BasePage basePage);
	
	/**
	 * 添加设计师基本信息审核
	 * @param designerInfo 设计师基本信息
	 * @param telphone 手机号
	 * @return
	 */
	Result addDesignerCheckInfo(DesignerWithBLOBs designerInfo, String telphone);
	
	/**
	 * 待定
	 * @return
	 */
	Result updateDesignerInfo();
	
	/**
	 * 更新用户信息
	 * @param formData 表单数据对象
	 * @return
	 */
	Result updateUser(User formData);
	
	/**
	 * 统计所有的装修效果
	 * @return
	 */
	Result countAllDecorEffect();
	
	/**
	 * 统计所有的装修效果
	 * @return
	 */
	Result countDesigner();
	
	/**
	 * 统计所有的装修效果
	 * @return
	 */
	Result countExperience();

	/**
	 * 统计所有的装修效果
	 * @return
	 */
	Result countActivities();
	
	/**
	 * 查询资源信息
	 * @param id
	 * @return
	 */
	Result seeSource(String id);
	
	/**
	 * 查询经验列表
	 * @param basePage
	 * @return
	 */
	Result queryExperienceLis(BasePage basePage);
	
	/**
	 * 查询经验内容
	 * @param id 经验id
	 * @return
	 */
	Result queryExperience(String id);
	
	/**
	 * 查询活动列表
	 * @param basePage
	 * @return
	 */
	Result queryActivityLis(BasePage basePage);
	
	/**
	 * 查询优惠活动内容
	 * @param id 活动id
	 * @return
	 */
	Result queryActivity(String id);
	
	/**
	 * 查询设计师详细信息
	 * @param designerId 设计师id
	 * @return
	 */
	DesignerWithBLOBs queryDesignerDetailInfo(String designerId);
}
