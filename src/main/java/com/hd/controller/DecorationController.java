package com.hd.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hd.domain.ApplyAttachment;
import com.hd.domain.BasePage;
import com.hd.domain.DecorationApply;
import com.hd.domain.DecorationEffectDTO;
import com.hd.domain.Result;
import com.hd.domain.User;
import com.hd.service.DecorationService;

/**
 * 装修控制层
 */
@RequestMapping("decoration")
@Controller
public class DecorationController extends BaseController{
	@Autowired
	private DecorationService decorationService;
	
	@Autowired
	private HttpServletRequest request;
	
	/**
	 * 主页装修列表
	 * @param queryAll 查询所有标志
	 * @return
	 */
	@RequestMapping("decorationApplyLis")
	@ResponseBody
	public Result queryDecorationLis(boolean queryAll){
		Result result =decorationService.queryDecorationApplyLis(queryAll);
		return result;
	}
	
	@RequestMapping("allApply")
	public String allApply(){
		return "jsp/showAllApply";
	}
	
	/**
	 * 用户装修申请查询decorationApply
	 * @param decorationApply 装修申请对象
	 * @return
	 */
	@RequestMapping("userDecorationApply")
	@ResponseBody
	public Result queryUserDecoration(DecorationApply decorationApply){
		Result result = decorationService.queryDecorationApply(decorationApply);
		return result;
	}
	
	/**
	 * 装修申请页面
	 * @return
	 */
	@RequestMapping("decorationApplyPage")
	public String decorationApplyPage(){
		return "jsp/user/decorationApply";
	}
	
	/**
	 * 添加装修申请
	 * @param decorationApply 装修申请对象
	 * @return
	 */
	@RequestMapping("addDecorationApply")
	@ResponseBody
	public Result addDecorationApply(DecorationApply decorationApply){
		String userId = ((User)super.getSessionInfo(request, "userInfo")).getId();
		decorationApply.setUserId(userId);
		Result result = decorationService.addDecorationApply(decorationApply);
		return result;
	}
	
	/**
	 * 更新装修申请
	 * @param decorationApply 装修申请对象
	 * @return
	 */
	@RequestMapping("updateDecorationApply")
	@ResponseBody
	public Result updateDecorationApply(DecorationApply decorationApply){
		Result result = decorationService.updateDecorationApply(decorationApply);
		return result;
	}
	
	/**
	 * 添加装修申请附件
	 * @param applyAttachment
	 * @return
	 */
	@RequestMapping("addAttachment")
	public Result addAttachment(ApplyAttachment applyAttachment){
		Result result = decorationService.addAttachment(applyAttachment);
		return result;
	}
	
	/**
	 * 查询主页装修效果展示信息
	 * @param basePage 参数对象
	 * @return
	 */
	@RequestMapping("queryDecoEffect")
	@ResponseBody
	public Result queryDecoEffect(BasePage basePage){
		Result result = decorationService.queryDecorationEffectLis(basePage);
		return result;
	}
	
	/**
	 * 添加装修效果数据
	 * @param formData 装修效果数据对象
	 * @return
	 */
	@RequestMapping("addDecoEffect")
	@ResponseBody
	public Result addDecoEffect(DecorationEffectDTO formData){
		Result result = decorationService.addDecorationEffect(formData);
		return result;
	}
	
	/**
	 * 更新装修效果数据
	 * @param formData 装修效果数据对象
	 * @return
	 */
	public Result updateDecoEffect(DecorationEffectDTO formData){
		Result result = decorationService.updateDecorationEffect(formData);
		return result;
	}
}
