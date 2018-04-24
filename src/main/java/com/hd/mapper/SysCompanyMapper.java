package com.hd.mapper;

import java.util.List;

import com.hd.domain.SysCompany;
import com.hd.domain.SysCompanyWithBLOBs;

public interface SysCompanyMapper {
    /**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_company
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_company
	 * @mbggenerated
	 */
	int insert(SysCompanyWithBLOBs record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_company
	 * @mbggenerated
	 */
	int insertSelective(SysCompanyWithBLOBs record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_company
	 * @mbggenerated
	 */
	SysCompanyWithBLOBs selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_company
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(SysCompanyWithBLOBs record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_company
	 * @mbggenerated
	 */
	int updateByPrimaryKeyWithBLOBs(SysCompanyWithBLOBs record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_company
	 * @mbggenerated
	 */
	int updateByPrimaryKey(SysCompany record);
    
    /**
     * 查詢所有公司基本信息表(sys_company)数据
     * @return
     */
    List<SysCompanyWithBLOBs> selectAll();
}