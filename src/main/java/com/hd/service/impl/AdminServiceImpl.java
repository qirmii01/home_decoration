package com.hd.service.impl;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hd.domain.DecorationApply;
import com.hd.domain.DesignerCheckInfo;
import com.hd.domain.DesignerWithBLOBs;
import com.hd.domain.ImageObj;
import com.hd.domain.ImgSource;
import com.hd.domain.Result;
import com.hd.domain.SysCompanyWithBLOBs;
import com.hd.domain.SysExperienceList;
import com.hd.domain.SysMenuListInfo;
import com.hd.domain.SysPreferentialActivities;
import com.hd.domain.User;
import com.hd.mapper.DecorationApplyMapper;
import com.hd.mapper.DesignerMapper;
import com.hd.mapper.ImgSourceMapper;
import com.hd.mapper.SysCompanyMapper;
import com.hd.mapper.SysExperienceListMapper;
import com.hd.mapper.SysMenuMapper;
import com.hd.mapper.SysPreferentialActivitiesMapper;
import com.hd.mapper.UserMapper;
import com.hd.service.AdminService;
import com.hd.util.FileUtil;
import com.hd.util.RandomSequence;
import com.hd.util.StringUtil;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private SysCompanyMapper sysCompanyMapper;
	
	@Autowired
	private SysExperienceListMapper sysExperienceListMapper;
	
	@Autowired
	private SysPreferentialActivitiesMapper sysPreferentialActivitiesMapper;
	       
	@Autowired
	private RandomSequence sequence;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private DesignerMapper designerMapper;
	
	@Autowired
	private SysMenuMapper sysMenuMapper;
	
	@Autowired
	private FileUtil fileUtil;
	
	@Autowired
	private ImgSourceMapper imgSourceMapper;
	
	@Autowired
	private DecorationApplyMapper decorationApplyMapper;
	
	@Override
	public Result queryAllCompanyInfo(){
		List<SysCompanyWithBLOBs> companyLis = sysCompanyMapper.selectAll();
		if(companyLis.size() > 1){
			return Result.buildErrorResult("系统错误");
		}
		
		return new Result(companyLis.get(0));
	}
	
	@Override
	public Result addBaseInfo(SysCompanyWithBLOBs companyInfo) {
		if(companyInfo == null){
			return Result.buildErrorResult("信息为空");
		}
		if(StringUtil.isEmpty(companyInfo.getAddress()) 
			&& StringUtil.isEmpty(companyInfo.getBannerImg())
			&& StringUtil.isEmpty(companyInfo.getLogoImg())
			&& StringUtil.isEmpty(companyInfo.getName())
			&& StringUtil.isEmpty(companyInfo.getPhone())
			&& StringUtil.isEmpty(companyInfo.getQualificationsImg())
			&& StringUtil.isEmpty(companyInfo.getCompanyIntroduce())
			&& StringUtil.isEmpty(companyInfo.getServiceArea())){
			return Result.buildErrorResult("信息为空");
		}
		companyInfo.setId(1);
		int i =sysCompanyMapper.insert(companyInfo);
		if(i <= 0){
			return Result.buildErrorResult("数据插入失败");
		}
		return new Result("数据添加成功");
	}
	
	@Override
	public Result updateBaseInfo(SysCompanyWithBLOBs companyInfo) {
		int i = sysCompanyMapper.updateByPrimaryKeySelective(companyInfo);
		if(i <= 0){
			return Result.buildErrorResult("数据更新失败");
		}
		return new Result("数据更新成功");
	}

	@Override
	public Result queryExperienceLis() {
		List<SysExperienceList> experienceLis = sysExperienceListMapper
				.selectExperienceList();
		return new Result(experienceLis);
	}
	
	@Override
	public Result queryExperience(String id) {
		SysExperienceList sysExperienceList = sysExperienceListMapper.selectByPrimaryKey(id);
		if(sysExperienceList == null){
			return Result.buildErrorResult("未查询到相关数据");
		}
		return new Result(sysExperienceList);
	}

	@Override
	public Result addExperience(SysExperienceList experienceList) {
		if(StringUtil.isEmpty(experienceList.getTitle())){
			return Result.buildErrorResult("标题不能为空");
		}if( StringUtil.isEmpty(experienceList.getContent())){
			return Result.buildErrorResult("内容不能为空");
		}
		experienceList.setId(sequence.getCommonID());
		experienceList.setCreateTime(new Date());
		experienceList.setStatus("0");
		int i = sysExperienceListMapper.insert(experienceList);
		if(i <= 0){
			return Result.buildErrorResult("数据插入失败");
		}
		return new Result("数据添加成功");
	}

	@Override
	public Result updateExperence(SysExperienceList experienceList) {
		int i = sysExperienceListMapper.updateByPrimaryKeySelective(experienceList);
		if(i <= 0){
			return Result.buildErrorResult("數據更新失敗");
		}
		return new Result("数据更新成功");
	}

	@Override
	public Result queryPreferentialActivities(){
		List<SysPreferentialActivities> preferentialActivitiesLis = 
				sysPreferentialActivitiesMapper.selectPreferentialActivities();
		return new Result(preferentialActivitiesLis);
	}
	
	@Override
	public Result queryPreferentialActivity(String id) {
		SysPreferentialActivities sysPreferentialActivities = sysPreferentialActivitiesMapper.selectByPrimaryKey(id);
		if(sysPreferentialActivities == null){
			return Result.buildErrorResult("未查询到相关数据");
		}
		return new Result(sysPreferentialActivities);
	}

	@Override
	public Result addPreferentialActivities(
			SysPreferentialActivities sysPreferentialActivities) {
		if(StringUtil.isEmpty(sysPreferentialActivities.getTitile())){
			return Result.buildErrorResult("标题不能为空");
		}if( StringUtil.isEmpty(sysPreferentialActivities.getContent())){
			return Result.buildErrorResult("内容不能为空");
		}
		sysPreferentialActivities.setId(sequence.getCommonID());
		sysPreferentialActivities.setCreateTime(new Date());
		sysPreferentialActivities.setStatus("0");
		int i = sysPreferentialActivitiesMapper.insert(sysPreferentialActivities);
		if(i <= 0){
			return Result.buildErrorResult("数据插入失败");
		}
		return new Result("数据添加成功");
	}

	@Override
	public Result updatePreferentialActivities(
			SysPreferentialActivities sysPreferentialActivities) {
		int i = sysPreferentialActivitiesMapper.updateByPrimaryKeySelective(sysPreferentialActivities);
		if(i <= 0){
			return Result.buildErrorResult("數據更新失敗");
		}
		return new Result("数据更新成功");
	}

	@Override
	public Result querySignerCheckInfo(DesignerCheckInfo designerCheckInfo) {
		List<DesignerCheckInfo> checkInfos = userMapper.queryAllDesignerCheckInfo(designerCheckInfo);
		Integer count =userMapper.queryCountAllDesignerCheckInfo(designerCheckInfo);
		return new Result(checkInfos,count);
	}

	@Override
	public Result checkDesigner(String status, String userId,String designerId) {
		if(StringUtil.isEmpty(status)){
			return Result.buildErrorResult("选择结果不能为空");
		}
		
		if(StringUtil.isEmpty(userId)){
			return Result.buildErrorResult("用户id不能为空");
		}
		DesignerWithBLOBs designer = new DesignerWithBLOBs();
		if(status.equals("1")){
			User user =  new User();
			user.setId(userId);
			user.setStatus(0);
			int i =userMapper.updateByPrimaryKeySelective(user);
			if(i<=0){
				return Result.buildErrorResult("数据更新失败");
			}
			
		}else if( ! status.equals("2")){
			return Result.buildErrorResult("选择结果不是正常值");
		}
		designer.setId(designerId);
		designer.setStatus(status);
		designerMapper.updateByPrimaryKeySelective(designer);
		return new Result("审核完成");
	}

	@Override
	public Result queryMenuList() {
		List<SysMenuListInfo> menuList = sysMenuMapper.queryMenuList();
		return new Result(menuList);
	}

	@Override
	public Result fileUpload(HttpServletRequest request) {
		ImgSource imgSource;
		String path;
		try {
			path = fileUtil.fileUpload(request);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return Result.buildErrorResult("文件上传失败");
		} catch (IOException e) {
			e.printStackTrace();
			return Result.buildErrorResult("文件上传失败");
		}
		imgSource = new ImgSource();
		imgSource.setId(sequence.getCommonID());
		imgSource.setCreateTime(new Date());
		imgSource.setPath(path);
		int i =imgSourceMapper.insert(imgSource);
		if(i<=0){
			return Result.buildErrorResult("数据插入失败");
		}
		return new Result(imgSource);
	}

	@Override
	public Result queryDecorApplyCheckLis(DecorationApply formData) {
		List<DecorationApply> decorationApplies = decorationApplyMapper.queryDecorationApplyCheckLis(formData);
		return new Result(decorationApplies);
	}

	@Override
	public Result decorationApplyCheck(String applyId, String status) {
		if(StringUtil.isEmpty(applyId) || StringUtil.isEmpty(status)){
			return Result.buildErrorResult("参数不能为空");
		}
		DecorationApply record = new DecorationApply();
		record.setId(applyId);
		record.setStatus(status);
		int i = decorationApplyMapper.updateByPrimaryKeySelective(record);
		if(i<=0){
			return Result.buildErrorResult("数据更新失败");
		}
		return Result.buildSuccessResult();
	}

	@Override
	public Result uploadImage(HttpServletRequest request) {
		String path;
		try {
			path =fileUtil.fileUpload(request);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return Result.buildErrorResult("图片上传错误");
		} catch (IOException e) {
			e.printStackTrace();
			return Result.buildErrorResult("图片上传错误");
		}
		ImageObj iamgeObj = new ImageObj();
		String filePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
		iamgeObj.setSrc(filePath+path);
		return new Result(iamgeObj);
	}
}
