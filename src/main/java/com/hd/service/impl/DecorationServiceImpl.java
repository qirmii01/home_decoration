package com.hd.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hd.domain.ApplyAttachment;
import com.hd.domain.BasePage;
import com.hd.domain.DecorationApply;
import com.hd.domain.DecorationEffect;
import com.hd.domain.DecorationEffectDTO;
import com.hd.domain.DecorationEffectImg;
import com.hd.domain.DecorationEffectKey;
import com.hd.domain.Result;
import com.hd.mapper.DecorationApplyMapper;
import com.hd.mapper.DecorationEffectImgMapper;
import com.hd.mapper.DecorationEffectKeyMapper;
import com.hd.mapper.DecorationEffectMapper;
import com.hd.service.DecorationService;
import com.hd.util.Sequence;
import com.hd.util.StringUtil;
@Service
public class DecorationServiceImpl implements DecorationService {
	@Autowired
	private DecorationApplyMapper decorationApplyMapper;
	
	@Autowired
	private DecorationEffectMapper decorationEffectMapper;
	
	@Autowired
	private DecorationEffectKeyMapper decorationEffectKeyMapper;
	
	@Autowired
	private DecorationEffectImgMapper decorationEffectImgMapper;
	
	@Autowired
	private Sequence sequence;
	
	@Override
	public Result queryDecorationApply(DecorationApply decorationApply) {
		List<DecorationApply> decorationApplies = decorationApplyMapper
				.queryDecorationApplyBySelective(decorationApply);
		if(decorationApplies.size()!=0 && "0".equals(decorationApply.getStatus()) && decorationApplies.size() != 1){
			return Result.buildErrorResult("系统错误");
		}
		
		return new Result(decorationApplies);
	}

	@Override
	public Result queryDecorationApplyLis(boolean queryAll) {
		List<HashMap<String,Object>> decorationApplies = decorationApplyMapper
				.queryDecorationApplyLis(queryAll, 8);
		return new Result(decorationApplies, 8);
	}

	@Override
	public Result addDecorationApply(DecorationApply decorationApply) {
		if(StringUtil.isEmpty(decorationApply.getUserId())){
			return Result.buildErrorResult("用户名不能为空");
		}
		if(StringUtil.isEmpty(decorationApply.getType())){
			return Result.buildErrorResult("请选择装修类型");
		}
		if(StringUtil.isEmpty(decorationApply.getBudgetAmount())){
			return Result.buildErrorResult("请选择装修预算");
		}
		if(decorationApply.getArea() == null){
			return Result.buildErrorResult("请选输入预算范围");
		}
		decorationApply.setCreateTime(new Date());
		decorationApply.setId(sequence.getCommonID());
		decorationApply.setStatus("0");
		int i = decorationApplyMapper.insertSelective(decorationApply);
		if(i <= 0){
			return Result.buildErrorResult("数据插入失败");
		}
		return new Result(decorationApply.getId());
	}

	@Override
	public Result updateDecorationApply(DecorationApply decorationApply) {
		if(StringUtil.isEmpty(decorationApply.getId())){
			return Result.buildErrorResult("申请id为空");
		}
		if("1".equals(decorationApply.getStatus()) || "2".equals(decorationApply.getStatus())){
			decorationApply.setCheckTime(new Date());
		}else if("3".equals(decorationApply.getStatus())){
			decorationApply.setAcceptTime(new Date());
		}else if("4".equals(decorationApply.getStatus())){
			decorationApply.setRefuseTime(new Date());
		}else if("6".equals(decorationApply.getStatus())){
			decorationApply.setFinishTime(new Date());
		}
		int i = decorationApplyMapper.updateByPrimaryKeySelective(decorationApply);
		if(i <= 0){
			return Result.buildErrorResult("数据更新失败");
		}
		return new Result("数据更新成功");
	}
	
	@Override
	public Result addAttachment(ApplyAttachment formData) {
		if(StringUtil.isEmpty(formData.getApplyId())){
			return Result.buildErrorResult("装修申请id不能为空");
		}
		
		if(StringUtil.isEmpty(formData.getSourceId())){
			return Result.buildErrorResult("资源路径不能为空");
		}
		
		formData.setId(sequence.getCommonID());
		formData.setCreateTime(new Date());
		return new Result("添加成功");
	}

	@Override
	public Result queryDecorationEffectLis(BasePage basePage) {
		List<HashMap<String, Object>> decorationEffects = decorationEffectMapper
				.queryDecorationEffectLis(basePage);
		if(decorationEffects.isEmpty()){
			return new Result("无数据");
		}
		for (HashMap<String, Object> hashMap : decorationEffects) {
			String effeId = (String)hashMap.get("id");
			List<DecorationEffectKey> decorationEffectKeys = decorationEffectKeyMapper.queryKeyByEffectId(effeId);
			if( !decorationEffectKeys.isEmpty()){
				hashMap.put("decorationEffectKeys", decorationEffectKeys);
			}
		}
		return new Result(decorationEffects);
	}

	@Override
	public Result addDecorationEffect(DecorationEffectDTO formData) {
		if(StringUtil.isEmpty(formData.getApplyId())){
			return Result.buildErrorResult("装修申请id不能为空");
		}
		if(StringUtil.isEmpty(formData.getDesignerId())){
			return Result.buildErrorResult("设计师不能为空");
		}
		if(StringUtil.isEmpty(formData.getTitle())){
			return Result.buildErrorResult("效果标题不能为空");
		}
		if(formData.getDecorationEffectImgs().isEmpty()){
			return Result.buildErrorResult("效果图片补鞥呢为空");
		}
		DecorationEffect decorationEffect = formData;
		
		//插入装修效果表数据
		String effectId = sequence.getCommonID();
		decorationEffect.setId(effectId);
		decorationEffect.setCreateTime(new Date());
		int i = decorationEffectMapper.insertSelective(decorationEffect);
		if(i <= 0){
			return Result.buildErrorResult("数据插入失败");
		}
		
		//插入效果图关键字
		List<DecorationEffectKey> decorationEffectKeys = formData.getDecorationEffectKeys();
		for (DecorationEffectKey decorationEffectKey : decorationEffectKeys) {
			decorationEffectKey.setId(sequence.getCommonID());
			decorationEffectKey.setEffectId(effectId);
			i = decorationEffectKeyMapper.insert(decorationEffectKey);
			if(i <= 0){
				return Result.buildErrorResult("数据插入失败");
			}
		}
		
		//插入效果图记录
		List<DecorationEffectImg> decorationEffectImgs = formData.getDecorationEffectImgs();
		for (DecorationEffectImg decorationEffectImg : decorationEffectImgs) {
			decorationEffectImg.setId(sequence.getCommonID());
			decorationEffectImg.setEffectId(effectId);
			i = decorationEffectImgMapper.insert(decorationEffectImg);
			if(i <= 0){
				return Result.buildErrorResult("数据插入失败");
			}
		}
		return new Result("添加成功");
	}

	@Override
	public Result updateDecorationEffect(DecorationEffectDTO formData) {
		if(StringUtil.isEmpty(formData.getId())){
			return Result.buildErrorResult("id不能为空");
		}
		if(StringUtil.isNotEmpty(formData.getTitle())){
			DecorationEffect decorationEffect = formData;
			int i =decorationEffectMapper.updateByPrimaryKeySelective(decorationEffect);
			if(i <= 0){
				return Result.buildErrorResult("数据更新失败");
			}
		}
		
		if(!formData.getDecorationEffectImgs().isEmpty()){
			List<DecorationEffectImg> decorationEffectImgs = formData.getDecorationEffectImgs();
			for (DecorationEffectImg decorationEffectImg : decorationEffectImgs) {
				int i = decorationEffectImgMapper.updateByPrimaryKeySelective(decorationEffectImg);
				if(i <= 0){
					return Result.buildErrorResult("数据更新失败");
				}
			}
		}
		
		if(!formData.getDecorationEffectKeys().isEmpty()){
			List<DecorationEffectKey> decorationEffectKeys  =formData.getDecorationEffectKeys();
			for (DecorationEffectKey decorationEffectKey : decorationEffectKeys) {
				int i = decorationEffectKeyMapper.updateByPrimaryKeySelective(decorationEffectKey);
				if(i <= 0){
					return Result.buildErrorResult("数据更新失败");
				}
			}
		}
		return new Result("更新成功");
	}
}
