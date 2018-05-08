package com.hd.service;

import com.hd.domain.ApplyRecord;
import com.hd.domain.BasePage;
import com.hd.domain.DesignerWithBLOBs;
import com.hd.domain.Message;
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
	Result queryDesignerDetailInfo(String designerId);
	
	/**
	 * 申请设计列表
	 * @param basePage
	 * @param designerId 设计师id
	 * @return
	 */
	Result applyDesignLis(BasePage basePage, String designerId);
	
	/**
	 * 设计师处理装修设计申请
	 * @param applyRecord
	 * @return
	 */
	Result dealApply(ApplyRecord applyRecord);
	
	/**
	 * 查询设计师的设计列表
	 * @param userId 设计师id
	 * @return
	 */
	Result myDesignLis(String userId);
	
	/**
	 * 发送信息
	 * @param receiveId 接收者id
	 * @param userId 发送人id
	 * @param content 发送内容
	 * @return
	 */
	Result sendMsg(String receiveId, String userId, String content);
	
	/**
	 * 查询消息列表
	 * @param userId 用户id
	 * @param basePage 
	 * @return
	 */
	Result queryMsgList(String userId, BasePage basePage);
	
	/**
	 * 统计消息列表
	 * @param userId 用户id
	 * @return
	 */
	Result countMsg(String userId);
	
	/**
	 * 更新消息
	 * @param formData 表单对象
	 * @return
	 */
	Result updateMsg(Message formData);
	
	/**
	 * 查询我的设计风格
	 * @param designerId 设计师id
	 * @return
	 */
	Result queryMyStyles(String designerId);
	
	/**
	 * 查询设计师所有风格的状态
	 * @param designerId 设计师id
	 * @return
	 */
	Result queryAllStyleStatusAboutDesigner(String designerId);
}
