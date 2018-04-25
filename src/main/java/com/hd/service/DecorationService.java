package com.hd.service;

import com.hd.domain.ApplyAttachment;
import com.hd.domain.DecorationApply;
import com.hd.domain.DecorationEffectDTO;
import com.hd.domain.PageObj;
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
	 * @param queryAll 是否查询所有
	 * @return
	 */
	public Result queryDecorationEffectLis(PageObj pageObj);
	
	/**
	 * 添加装修申请附件
	 * @param formData 表单数据
	 * @return
	 */
	public Result addAttachment(ApplyAttachment formData);
	
	/**
	 * 添加装修效果相关信息
	 * @param formData
	 * @return
	 */
	public Result addDecorationEffect(DecorationEffectDTO formData);
	
	/**
	 * 更新装修效果相关信息
	 * @param formData 
	 * @return
	 */
	public Result updateDecorationEffect(DecorationEffectDTO formData);
}
