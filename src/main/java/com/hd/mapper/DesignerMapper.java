package com.hd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hd.domain.BasePage;
import com.hd.domain.Designer;
import com.hd.domain.DesignerInfo;
import com.hd.domain.DesignerWithBLOBs;

public interface DesignerMapper {
    /**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table designer
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table designer
	 * @mbggenerated
	 */
	int insert(DesignerWithBLOBs record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table designer
	 * @mbggenerated
	 */
	int insertSelective(DesignerWithBLOBs record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table designer
	 * @mbggenerated
	 */
	DesignerWithBLOBs selectByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table designer
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(DesignerWithBLOBs record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table designer
	 * @mbggenerated
	 */
	int updateByPrimaryKeyWithBLOBs(DesignerWithBLOBs record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table designer
	 * @mbggenerated
	 */
	int updateByPrimaryKey(Designer record);

	/**
	 * 查询设计师信信息
	 * @param basePage 参数对象
	 * @return
	 */
    List<DesignerInfo> queryDesigner(BasePage basePage);
    
    /**
     * 通过用户id和状态查询设计师信息
     * @param designerId 设计师id
     * @param status 状态
     * @return
     */
    List<DesignerWithBLOBs> queryDesignerInfo(@Param("designerId") String designerId, @Param("status") String status);
    
    /**
     * 统计设计师数量
     * @return
     */
    int countDesigner();
}