package com.hd.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hd.domain.ApplyAttachment;
import com.hd.domain.ApplyRecord;
import com.hd.domain.BasePage;
import com.hd.domain.DecorationApply;
import com.hd.domain.DecorationEffect;
import com.hd.domain.DecorationEffectDTO;
import com.hd.domain.DecorationEffectImg;
import com.hd.domain.DecorationEffectKey;
import com.hd.domain.DecorationStyle;
import com.hd.domain.ImageObj;
import com.hd.domain.ImgPreview;
import com.hd.domain.Result;
import com.hd.mapper.ApplyAttachmentMapper;
import com.hd.mapper.ApplyRecordMapper;
import com.hd.mapper.DecorationApplyMapper;
import com.hd.mapper.DecorationEffectImgMapper;
import com.hd.mapper.DecorationEffectKeyMapper;
import com.hd.mapper.DecorationEffectMapper;
import com.hd.mapper.DecorationStyleMapper;
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
	
	@Autowired
	private ApplyRecordMapper applyRecordMapper;
	
	@Autowired
	private ApplyAttachmentMapper applyAttachmentMapper;
	
	@Autowired
	private DecorationStyleMapper decorationStyleMapper;
	
	@Override
	public Result queryDecorationApply(DecorationApply decorationApply) {
		List<DecorationApply> decorationApplies = decorationApplyMapper
				.queryDecorationApplyBySelective(decorationApply);
		if(decorationApply.getId()!= null && "0".equals(decorationApply.getStatus()) && decorationApplies.size() != 1){
			return Result.buildErrorResult("系统错误");
		}
		
		return new Result(decorationApplies);
	}

	@Override
	public Result delAttachment(String id) {
		int i = applyAttachmentMapper.deleteByPrimaryKey(id);
		if( i<= 0 ){
			return Result.buildErrorResult("删除失败");
		}
		return Result.buildSuccessResult();
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
		
		DecorationApply decorationApply2 = decorationApplyMapper.selectByPrimaryKey(decorationApply.getId());
		if( ("1".equals(decorationApply.getStatus()) && !"4".equals(decorationApply2.getStatus()) ) || "2".equals(decorationApply.getStatus())){
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
	public Result addAttachment(List<ApplyAttachment> formData) {
		ApplyAttachment applyAttachment;
		List<String> result = new ArrayList<String>();
		for (int i = 0; i < formData.size(); i++) {
			applyAttachment = formData.get(i);
			if(StringUtil.isEmpty(applyAttachment.getApplyId()) || StringUtil.isEmpty(applyAttachment.getSourceId())){
				result.add("第"+(i+1)+"条数据参数有误");
				continue;
			}
			
			applyAttachment.setId(sequence.getCommonID());
			applyAttachment.setStatus("0");
			applyAttachment.setCreateTime(new Date());
			int j = applyAttachmentMapper.insert(applyAttachment);
			if(j<=0){
				result.add("第"+(i+1)+"条数据插入数据库失败");
				continue;
			}
		}
		
		if(result.isEmpty()){
			return Result.buildSuccessResult();
		}else{
			return Result.buildErrorResult(result);
		}
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
			return Result.buildErrorResult("请输入效果图标题");
		}
		if(formData.getDecorationEffectImgs().isEmpty()){
			return Result.buildErrorResult("请上传效果图片");
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

	@Override
	public Result decorationApplyRecord(ApplyRecord formData) {
		if( StringUtil.isEmpty(formData.getApplyId()) ){
			return Result.buildErrorResult("装修申请id不能为空");
		}
		
		ApplyRecord record = new ApplyRecord();
		record.setApplyId(formData.getApplyId());
		record.setStatus("0");
		List<ApplyRecord> applyRecordList = applyRecordMapper.selectBySelective(record);
		if(applyRecordList.size() != 1){
			return Result.buildErrorResult("系统错误");
		}
		ApplyRecord applyRecord = applyRecordList.get(0);
		if(applyRecord == null && StringUtil.isNotEmpty(formData.getStatus())){
			return Result.buildErrorResult("申请记录不存在");
		}
		
		if(applyRecord != null && StringUtil.isEmpty(formData.getStatus())){
			return Result.buildErrorResult("参数status不能为空");
		}
		
		if(applyRecord == null && StringUtil.isEmpty(formData.getStatus())){
			DecorationApply decorationApply = decorationApplyMapper.selectByPrimaryKey(formData.getApplyId());
			if(decorationApply == null){
				return Result.buildErrorResult("装修申请不存在");
			}
			
			formData.setId(sequence.getCommonID());
			formData.setTime(new Date());
			formData.setUserId(decorationApply.getUserId());
			formData.setStatus("0");
			int i = applyRecordMapper.insert(formData);
			if(i<=0){
				return Result.buildErrorResult("数据插入失败");
			}
		}else {
			applyRecord.setStatus(formData.getStatus());
			applyRecord.setTime(new Date());
			int i = applyRecordMapper.updateByPrimaryKeySelective(formData);
			if(i<=0){
				return Result.buildErrorResult("数据更新失败");
			}
			
			if("1".equals(formData.getStatus())){
				DecorationApply decorationApply = decorationApplyMapper.selectByPrimaryKey(formData.getApplyId());
				decorationApply.setAcceptTime(new Date());
				decorationApply.setAcceptId(formData.getDesignerId());
				decorationApplyMapper.updateByPrimaryKeySelective(decorationApply);
			}
		}
		
		return Result.buildSuccessResult();
	}

	@Override
	public Result queryAttachment(ApplyAttachment formData) {
		List<ApplyAttachment> applyAttachments = applyAttachmentMapper.selectBySelective(formData);
		return new Result(applyAttachments);
	}

	@Override
	public Result queryStyles() {
		List<DecorationStyle> decorationStyles = decorationStyleMapper.queryAll();
		return new Result(decorationStyles);
	}

	@Override
	public Result queryDesignResult(String applyId) {
		ApplyAttachment applyAttachment = new ApplyAttachment();
		applyAttachment.setApplyId(applyId);
		applyAttachment.setStatus("0");
		applyAttachment.setType("1");
		List<ApplyAttachment> applyAttachments = applyAttachmentMapper.selectBySelective(applyAttachment);
		return new Result(applyAttachments);
	}

	@Override
	public Result queryMyApplyLis(String userId) {
		List<DecorationApply> decorationApplies = decorationApplyMapper.selectByUserId(userId);
		return new Result(decorationApplies);
	}

	@Override
	public Result chooseDesigner(List<String> applyIds, String designerId, String userId) {
		if(StringUtil.isEmpty(designerId)){
			return Result.buildErrorResult("设计师id不能为空");
		}
		
		ApplyRecord applyRecord =null;
		for (String applyId : applyIds) {
			if(decorationApplyMapper.selectByPrimaryKey(applyId) == null){
				continue;
			}
			applyRecord = new ApplyRecord();
			applyRecord.setApplyId(applyId);
			applyRecord.setDesignerId(designerId);
			applyRecord.setId(sequence.getCommonID());
			applyRecord.setStatus("0");
			applyRecord.setTime(new Date());
			applyRecord.setUserId(userId);
			applyRecordMapper.insert(applyRecord);
		}
		
		return Result.buildSuccessResult();
	}

	@Override
	public Result queryDecorationApplyBaseInfo(DecorationApply formData) {
		List<DecorationApply> decorationApplies = decorationApplyMapper.queryBaseBySelective(formData);
		return new Result(decorationApplies);
	}

	@Override
	public Result queryAllEffectImg(String effectId, String title) {
		List<ImageObj> imageObjs = decorationEffectImgMapper.queryAllEffectImg(effectId);
		ImgPreview imgPreview = new ImgPreview();
		imgPreview.setId(sequence.getCommonID());
		imgPreview.setImageObjs(imageObjs);
		imgPreview.setTitle(title);
		return new Result(imgPreview);
	}
}
