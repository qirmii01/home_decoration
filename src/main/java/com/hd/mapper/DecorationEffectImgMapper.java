package com.hd.mapper;

import java.util.List;

import com.hd.domain.DecorationEffectImg;
import com.hd.domain.ImageObj;

public interface DecorationEffectImgMapper {
    /**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table decoration_effect_img
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table decoration_effect_img
	 * @mbggenerated
	 */
	int insert(DecorationEffectImg record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table decoration_effect_img
	 * @mbggenerated
	 */
	int insertSelective(DecorationEffectImg record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table decoration_effect_img
	 * @mbggenerated
	 */
	DecorationEffectImg selectByPrimaryKey(String id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table decoration_effect_img
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(DecorationEffectImg record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table decoration_effect_img
	 * @mbggenerated
	 */
	int updateByPrimaryKey(DecorationEffectImg record);
	
	/**
	 * 查询所有效果图
	 * @param effectId 装修效果id
	 * @return
	 */
	List<ImageObj> queryAllEffectImg(String effectId);
}