package com.hd.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hd.domain.ApplyRecord;
import com.hd.domain.BasePage;
import com.hd.domain.DecorationApply;
import com.hd.domain.DesignerInfo;
import com.hd.domain.DesignerStyle;
import com.hd.domain.DesignerStyleInfo;
import com.hd.domain.DesignerWithBLOBs;
import com.hd.domain.ImgSource;
import com.hd.domain.Message;
import com.hd.domain.Result;
import com.hd.domain.SysExperienceList;
import com.hd.domain.SysPreferentialActivities;
import com.hd.domain.User;
import com.hd.mapper.ApplyRecordMapper;
import com.hd.mapper.DecorationApplyMapper;
import com.hd.mapper.DecorationEffectMapper;
import com.hd.mapper.DesignerMapper;
import com.hd.mapper.DesignerStyleMapper;
import com.hd.mapper.ImgSourceMapper;
import com.hd.mapper.MessageMapper;
import com.hd.mapper.SysExperienceListMapper;
import com.hd.mapper.SysPreferentialActivitiesMapper;
import com.hd.mapper.UserMapper;
import com.hd.service.UserService;
import com.hd.util.MD5Utility;
import com.hd.util.Sequence;
import com.hd.util.StringUtil;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;

	@Autowired
	DesignerMapper designerMapper;
	
	@Autowired
	Sequence sequence;
	
	@Autowired
	ImgSourceMapper imgSourceMapper;
	
	@Autowired
	DecorationEffectMapper decorationEffectMapper;
	
	@Autowired
	SysExperienceListMapper sysExperienceListMapper;
	
	@Autowired
	SysPreferentialActivitiesMapper sysPreferentialActivitiesMapper;
	
	@Autowired
	DecorationApplyMapper decorationApplyMapper;
	
	@Autowired
	ApplyRecordMapper applyRecordMapper;
	
	@Autowired
	MessageMapper messageMapper;
	
	@Autowired
	DesignerStyleMapper designerStyleMapper;
	
	@Override
	public Result queryUser(User user) {
		if(user == null){
			return Result.buildErrorResult("用户信息为空");
		}
		if(StringUtil.isEmpty(user.getTelphone())){
			return Result.buildErrorResult("手机号不能为空");
		}
		if(StringUtil.isEmpty(user.getPassword())){
			return Result.buildErrorResult("密码不能为空");
		}else{
			try {
				user.setPassword(MD5Utility.getDigest(user.getPassword()));
			} catch (Exception e) {
				e.printStackTrace();
				return Result.buildErrorResult("系统错误");
			}
		}
		
		user.setStatus(0);
		List<User> users = userMapper.selectUserBySelective(user);
		if(users.isEmpty()){
			return Result.buildErrorResult("用户名或密码错误");
		}
		
		if(users.size() != 1){
			return Result.buildErrorResult("系统错误");
		}
		return new Result(users.get(0));
	}

	
	@Override
	public Result userExist(User user) {
		if(user == null || StringUtil.isEmpty(user.getTelphone())){
			return Result.buildErrorResult("请输入手机号");
		}
		
		if(user.getTelphone().length() != 11){
			return Result.buildErrorResult("请输入正确手机号");
		}
		
		int i = userMapper.userExists(user.getTelphone());
		if(i > 1){
			return Result.buildErrorResult("系统异常");
		}
		if(i == 0){
			return new Result(false);
		}else{
			return new Result(true);
		}
	}

	@Override
	public Result registerUer(User user) {
		if(user == null){
			return Result.buildErrorResult("用户信息不能为空");
		}
		
		if(StringUtil.isEmpty(user.getType())){
			return Result.buildErrorResult("请选择用户类型");
		}
		String regex;
		if(StringUtil.isEmpty(user.getTelphone())){
			return Result.buildErrorResult("手机号码不能为空");
		}else{
			regex = "^1[3|4|5|7|8]\\d{9}$";
			if(!user.getTelphone().matches(regex)){
				return Result.buildErrorResult("手机号码格式不正确");
			}else{
				User u =  new User();
				u.setTelphone(user.getTelphone());
				List<User> users = userMapper.selectUserBySelective(u);
				if( !users.isEmpty() ){
					return Result.buildErrorResult("该手机号码已被注册");
				}
			}
		}

		if(StringUtil.isEmpty(user.getPassword())){
			return Result.buildErrorResult("密码不能为空");
		}else{
			String password;
			try {
				password = MD5Utility.getDigest(user.getPassword());
			} catch (Exception e) {
				e.printStackTrace();
				return Result.buildErrorResult("系统错误");
			}
			user.setPassword(password);
		}
		user.setId(sequence.getCommonID());
		user.setStatus(0);
		user.setUserName(user.getTelphone());
		
		int result = userMapper.insertSelective(user);
		if(result<=0){
			return Result.buildErrorResult("系统错误");
		}
		return new Result(user);
	}


	@Override
	public Result queryDesigner(BasePage basePage) {
		List<DesignerInfo> designerInfos = designerMapper.queryDesigner(basePage);
		int count = designerMapper.countDesigner();
		return new Result(designerInfos, count);
	}


	@Override
	public Result addDesignerCheckInfo(DesignerWithBLOBs designerInfo, String telphone) {
		if(StringUtil.isEmpty(telphone)){
			return Result.buildErrorResult("手机号不能为空");
		}
		User u1 = new User();
		u1.setTelphone(telphone);
		List<User> u_r1  = userMapper.selectUserBySelective(u1);
		
		if(!u_r1.isEmpty()){
			return Result.buildErrorResult("该手机号已注册");
			
		}
		if(StringUtil.isEmpty(designerInfo.getServiceAddress())){
			return Result.buildErrorResult("服务地址不能为空");
		}
		
		String userId = sequence.getCommonID();
		String password;
		try {
			password = MD5Utility.getDigest(telphone.substring(5, 11));
		} catch (Exception e) {
			e.printStackTrace();
			return Result.buildErrorResult("系统错误");
		}
		/*
		 * 插入用户信息表信息
		 */
		User user = new User();
		user.setId(userId);
		user.setCreateTime(new Date());
		user.setTelphone(telphone);
		user.setType("1");
		user.setStatus(0);
		user.setPassword(password);
		int i = userMapper.insertSelective(user);
		if(i<=0){
			return Result.buildErrorResult("数据插入失败");
		}
		
		/*
		 * 插入设计师表信息
		 */
		DesignerWithBLOBs designer = designerInfo;
		designer.setId(sequence.getCommonID());
		designer.setStatus("0");
		designer.setUserId(userId);
		int j = designerMapper.insertSelective(designer);
		if(j<=0){
			return Result.buildErrorResult("数据插入失败");
		}
		return new Result(user);
	}

	@Override
	public Result updateDesignerInfo() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Result updateUser(User formData) {
		if(StringUtil.isEmpty(formData.getId())){
			return Result.buildErrorResult("用户id不能为空");
		}
		
		User user = userMapper.selectByPrimaryKey(formData.getId());
		if(user == null){
			return Result.buildErrorResult("数据库异常");
		}
		
		try {
			if(formData.getAvatar() != null && formData.getAvatar().equals(user.getAvatar())
				&& formData.getAvatarPath() != null && formData.getAvatarPath().equals(user.getAvatarPath())	
				&& formData.getCaseExample() != null && formData.getCaseExample().equals(user.getCaseExample()) 
				&& formData.getSex() != null && formData.getSex().equals(user.getSex())
				&& formData.getStatus() != null && formData.getStatus().equals(user.getStatus())
				&& formData.getTelphone() != null && formData.getTelphone().equals(user.getTelphone())
				&& formData.getType() != null && formData.getType().equals(user.getType())
				&& formData.getUserName() != null && formData.getUserName().equals(user.getUserName())
				&& formData.getPassword() != null && MD5Utility.getDigest(formData.getPassword()).equals(user.getPassword())
				){
				return Result.buildErrorResult("未作任何改变");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return Result.buildErrorResult("系统异常");
		}
		
		int i = userMapper.updateByPrimaryKeySelective(formData);
		if(i<=0){
			return Result.buildErrorResult("数据更新失败");
		}
		
		User u =new User();
		u.setId(formData.getId());
		u.setStatus(0);
		User result = userMapper.selectUserBySelective(u).get(0);
		
		return new Result(result);
	}

	@Override
	public Result countAllDecorEffect() {
		int count = decorationEffectMapper.countAllDecorEffect();
		return new Result(count);
	}

	@Override
	public Result seeSource(String id) {
		ImgSource imgSource = imgSourceMapper.selectByPrimaryKey(id);
		return new Result(imgSource);
	}

	@Override
	public Result countDesigner() {
		int count = designerMapper.countDesigner();
		return new Result(count);
	}

	@Override
	public Result countExperience() {
		int count = sysExperienceListMapper.countExperience();
		return new Result(count);
	}

	@Override
	public Result countActivities() {
		int count = sysPreferentialActivitiesMapper.countActivities();
		return new Result(count);
	}

	@Override
	public Result queryExperienceLis(BasePage basePage) {
		List<SysExperienceList> sysExperienceLists=sysExperienceListMapper.selectExperienceLis(basePage,"0");// 0-正常
		return new Result(sysExperienceLists);
	}

	@Override
	public Result queryActivityLis(BasePage basePage) {
		List<SysPreferentialActivities> sysPreferentialActivities=sysPreferentialActivitiesMapper.selectActivityLis(basePage,"0");// 0-正常
		return new Result(sysPreferentialActivities);
	}


	@Override
	public Result queryExperience(String id) {
		SysExperienceList sysExperienceList = sysExperienceListMapper.selectByPrimaryKey(id);
		return new Result(sysExperienceList);
	}


	@Override
	public Result queryActivity(String id) {
		SysPreferentialActivities sysPreferentialActivities = sysPreferentialActivitiesMapper.selectByPrimaryKey(id);
		return new Result(sysPreferentialActivities);
	}

	@Override
	public Result queryDesignerDetailInfo(String designerId) {
		List<DesignerWithBLOBs> designerWithBLOBs = designerMapper.queryDesignerInfo(designerId, "1");
		return new Result(designerWithBLOBs);
	}

	@Override
	public Result applyDesignLis(BasePage basePage, String designerId) {
		List<DecorationApply> decorationApplies = decorationApplyMapper.queryApplyDesignLis(basePage, designerId);
		return new Result(decorationApplies);
	}

	@Override
	public Result dealApply(ApplyRecord applyRecord) {
		if(StringUtil.isEmpty(applyRecord.getApplyId())){
			return Result.buildErrorResult("装修申请id不能为空");
		}
		if(StringUtil.isEmpty(applyRecord.getStatus())){
			return Result.buildErrorResult("处理状态不能为空");
		}
		
		if(!"1".equals(applyRecord.getStatus()) && !"2".equals(applyRecord.getStatus())){
			return Result.buildErrorResult("处理状态有误");
		}
		
		ApplyRecord record = new ApplyRecord();
		record.setApplyId(applyRecord.getApplyId());
		record.setStatus("0");
		List<ApplyRecord> applyRecords=applyRecordMapper.selectBySelective(record);
		if(applyRecords.size() != 1){
			return Result.buildErrorResult("数据库错误");
		}
		
		int i = applyRecordMapper.updateSelectiveByApplyId(applyRecord);
		if( i <= 0 ){
			return Result.buildErrorResult("处理装修申请失败");
		}
		
		if("1".equals(applyRecord.getStatus())){
			DecorationApply decorationApply = new DecorationApply();
			decorationApply.setId(applyRecord.getApplyId());
			decorationApply.setAcceptTime(new Date());
			decorationApply.setAcceptId(applyRecord.getDesignerId());
			decorationApply.setStatus("3");
			int j = decorationApplyMapper.updateByPrimaryKeySelective(decorationApply);
			if( j<= 0){
				return Result.buildErrorResult("数据更新失败");
			}
		}
		
		return Result.buildSuccessResult();
	}

	@Override
	public Result myDesignLis(String userId) {
		List<DecorationApply> decorationApplies = decorationApplyMapper.queryDesignLis(userId);
		return new Result(decorationApplies);
	}

	@Override
	public Result sendMsg(String receiveId, String userId, String content) {
		if(StringUtil.isEmpty(receiveId)){
			return Result.buildErrorResult("接收人id不能为空");
		}
		if(StringUtil.isEmpty(content)){
			return Result.buildErrorResult("发送内容不能为空");
		}
		
		Message record =new Message();
		record.setContent(content);
		record.setId(sequence.getCommonID());
		record.setReceiveId(receiveId);
		record.setSenderId(userId);
		record.setStatus("0");
		record.setCreateTime(new Date());
		int i = messageMapper.insert(record);
		if( i<= 0 ){
			return Result.buildErrorResult("数据插入失败");
		}
		
		return Result.buildSuccessResult();
	}

	@Override
	public Result queryMsgList(String userId, BasePage basePage) {
		List<Message> messages = messageMapper.selectMsgList(userId, basePage);
		return new Result(messages);
	}

	@Override
	public Result countMsg(String userId) {
		int count = messageMapper.countMyMsg(userId);
		return new Result(count);
	}

	@Override
	public Result updateMsg(Message formData) {
		if(StringUtil.isEmpty(formData.getId())){
			return Result.buildErrorResult("消息id不能为空");
		}
		
		if(StringUtil.isEmpty(formData.getContent()) 
				&&StringUtil.isEmpty(formData.getReceiveId())
				&&StringUtil.isEmpty(formData.getSenderId())
				&&StringUtil.isEmpty(formData.getStatus())
				&&formData.getCreateTime() == null){
			return Result.buildErrorResult("更新参数不能为空");
		}
		
		int i = messageMapper.updateByPrimaryKeySelective(formData);
		if( i<=0 ){
			return Result.buildErrorResult("数据更新失败");
		}
		return Result.buildSuccessResult();
	}


	@Override
	public Result queryMyStyles(String designerId) {
		List<DesignerStyleInfo> designerStyleInfos = designerStyleMapper.queryStyles(designerId);
		return new Result(designerStyleInfos);
	}


	@Override
	public Result queryAllStyleStatusAboutDesigner(String designerId) {
		List<DesignerStyleInfo> designerStyleInfos = designerStyleMapper.queryAllStyleStatus(designerId);
		return new Result(designerStyleInfos);
	}
}
