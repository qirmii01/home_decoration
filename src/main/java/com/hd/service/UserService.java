package com.hd.service;

import com.hd.domain.DesignerWithBLOBs;
import com.hd.domain.PageObj;
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
	 * @param queryAllInfo 是否查询所有字段内容
	 * @param pageObj
	 * @return
	 */
	Result queryDesigner(boolean queryAllInfo, PageObj pageObj);
	
	/**
	 * 添加设计师基本信息审核
	 * @param designer 设计师基本信息
	 * @return
	 */
	Result addDesignerCheckInfo(DesignerWithBLOBs designerInfo, String telphone, String userName);
	
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
}
