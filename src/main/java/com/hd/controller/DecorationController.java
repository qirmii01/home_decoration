package com.hd.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hd.domain.ApplyRecord;
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
	 * 用户装修申请查询
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
	public Result addAttachment(String applyAttachments){
		try {
			JSONArray jsonArray = new JSONArray(applyAttachments);
		} catch (JSONException e) {
			System.out.println("????????");
			e.printStackTrace();
		}
		//Result result = decorationService.addAttachment(applyAttachments);
		return null;
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
	@RequestMapping("updateDecoEffect")
	@ResponseBody
	public Result updateDecoEffect(DecorationEffectDTO formData){
		Result result = decorationService.updateDecorationEffect(formData);
		return result;
	}
	
	/**
	 * 更新装修申请结果记录
	 * @param formData 装修效果申请记录对象
	 * @return
	 */
	@RequestMapping("applyRecord")
	@ResponseBody
	public Result applyRecord(ApplyRecord formData){
		Result result = decorationService.decorationApplyRecord(formData);
		return result;
	}
	
	/**
	 * 查询装修风格名字
	 * @return
	 */
	@RequestMapping("queryStyles")
	@ResponseBody
	public Result queryStyles(){
		Result result = decorationService.queryStyles();
		return result;
	}
	
	/**
	 * 查看设计产品
	 * @param applyId 装修申请id
	 * @return
	 */
	@RequestMapping("queryDesignResult")
	@ResponseBody
	public Result queryDesignResult(String applyId){
		Result result = decorationService.queryDesignResult(applyId);
		return result;
	}
	
	/**
	 * 查看我的装修申请
	 * @return
	 */
	@RequestMapping("myApplyLis")
	@ResponseBody
	public Result myApplyLis(){
		String userId = ((User)request.getSession().getAttribute("userInfo")).getId();
		Result result = decorationService.queryMyApplyLis(userId);
		return result;
	}
	
	/**
	 * 选择设计师
	 * @param applyId 装修申请id
	 * @return
	 */
	@RequestMapping("chooseDesigner")
	@ResponseBody
	public Result chooseDesigner(ApplyRecord applyRecord){
		String userId = ((User)request.getSession().getAttribute("userInfo")).getId();
		Result result = decorationService.chooseDesigner(applyRecord.getApplyIds(), applyRecord.getDesignerId(), userId);
		return result;
	}
	
	/**
	 * 查询装修申请基本信息
	 * @param decorationApply 装修申请条件
	 * @return
	 */
	@RequestMapping("applyBaseInfo")
	@ResponseBody
	public Result applyBaseInfo(DecorationApply decorationApply){
		Result result = decorationService.queryDecorationApplyBaseInfo(decorationApply);
		return result;
	}
	
	/**
	 * 查询装修效果图的所有图片
	 * @param id 装修效果id
	 * @return
	 */
	@RequestMapping("allEffectImgs")
	@ResponseBody
	public Result allEffectImgs(String id,String title){
		Result result = decorationService.queryAllEffectImg(id,title);
		return result;
	}
}
