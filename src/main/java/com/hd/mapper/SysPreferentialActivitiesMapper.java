package com.hd.mapper;

import java.util.List;

import com.hd.domain.SysPreferentialActivities;

public interface SysPreferentialActivitiesMapper {
    /**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_preferential_activities
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_preferential_activities
	 * @mbggenerated
	 */
	int insert(SysPreferentialActivities record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_preferential_activities
	 * @mbggenerated
	 */
	int insertSelective(SysPreferentialActivities record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_preferential_activities
	 * @mbggenerated
	 */
	SysPreferentialActivities selectByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_preferential_activities
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(SysPreferentialActivities record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_preferential_activities
	 * @mbggenerated
	 */
	int updateByPrimaryKeyWithBLOBs(SysPreferentialActivities record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table sys_preferential_activities
	 * @mbggenerated
	 */
	int updateByPrimaryKey(SysPreferentialActivities record);

    /**
     * 查询所有有效的活动表数据
     * @return
     */
    List<SysPreferentialActivities> selectPreferentialActivities();
}