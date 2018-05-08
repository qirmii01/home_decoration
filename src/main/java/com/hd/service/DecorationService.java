package com.hd.service;

import java.util.List;

import com.hd.domain.ApplyAttachment;
import com.hd.domain.ApplyRecord;
import com.hd.domain.BasePage;
import com.hd.domain.DecorationApply;
import com.hd.domain.DecorationEffect;
import com.hd.domain.DecorationEffectDTO;
import com.hd.domain.DecorationEffectImg;
import com.hd.domain.DecorationEffectKey;
import com.hd.domain.Result;

/**
 * 装修相关服务层
 */
public interface DecorationService {
	/**
	 * 查询装修申请信息
	 * @param decorationApply 装修申请对象
	 * @return 
	 */
	public Result queryDecorationApply(DecorationApply decorationApply);
	
	/**
	 * 删除附件
	 * @param id 附件id
	 * @return
	 */
	public Result delAttachment(String id);
	
	/**
	 * 查询装修申请列表
	 * @param queryAll 查询所有标志
	 * @return
	 */
	public Result queryDecorationApplyLis(boolean queryAll);
	
	/**
	 * 添加装修申请信息
	 * @param decorationApply 装修申请对象
	 * @return
	 */
	public Result addDecorationApply(DecorationApply decorationApply);
	
	/**
	 * 更新装修申请
	 * @param decorationApply 装修申请对象
	 * @return
	 */
	public Result updateDecorationApply(DecorationApply decorationApply);
	
	/**
	 * 查询装修效果列表
	 * @param basePage 查询参数
	 * @return
	 */
	public Result queryDecorationEffectLis(BasePage basePage);
	
	/**
	 * 添加装修申请附件
	 * @param formData 表单数据
	 * @return
	 */
	public Result addAttachment(List<ApplyAttachment> formData);
	
	/**
	 * 添加装修效果相关信息
	 * @param decorationEffect 装修效果基本信息
	 * @param decorationEffectKey 装修效果关键字 
	 * @param decorationEffectImg 装修效果图片
	 * @return
	 */
	public Result addDecorationEffect(DecorationEffect decorationEffect, List<DecorationEffectKey> decorationEffectKey, List<DecorationEffectImg> decorationEffectImg);
	
	/**
	 * 更新装修效果相关信息
	 * @param formData 
	 * @return
	 */
	public Result updateDecorationEffect(DecorationEffectDTO formData);
	
	/**
	 * 装修申请结果记录
	 * @param formData
	 * @return
	 */
	public Result decorationApplyRecord(ApplyRecord formData);
	
	/**
	 * 查询附件内容
	 * @param formData 表单数据
	 * @return
	 */
	public Result queryAttachment(ApplyAttachment formData);
	
	/**
	 * 查询装修风格
	 * @return
	 */
	public Result queryStyles();
	
	/**
	 * 查询装修设计产品
	 * @param applyId 
	 * @return
	 */
	public Result queryDesignResult(String applyId);
	
	/**
	 * 查询我的装修申请
	 * @param userId 用户id
	 * @return
	 */
	public Result queryMyApplyLis(String userId);
	
	/**
	 * 选择设计师
	 * @param applyIds 装修申请id列表
	 * @param designerId 设计师id
	 * @param userId 用户id
	 * @return
	 */
	public Result chooseDesigner(List<String> applyIds,String designerId, String userId);
	
	/**
	 * 查询装修申请基本信息
	 * @param formData 表单数据
	 * @return
	 */
	public Result queryDecorationApplyBaseInfo(DecorationApply formData);
	
	/**
	 * 查询所有效果图
	 * @param effectId 装修效果id
	 * @param title 装修效果标题
	 * @return
	 */
	public Result queryAllEffectImg(String effectId, String title);
}
