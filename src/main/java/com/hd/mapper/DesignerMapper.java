package com.hd.mapper;

import com.hd.domain.Designer;
import com.hd.domain.DesignerWithBLOBs;

public interface DesignerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table designer
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table designer
     *
     * @mbg.generated
     */
    int insert(DesignerWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table designer
     *
     * @mbg.generated
     */
    int insertSelective(DesignerWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table designer
     *
     * @mbg.generated
     */
    DesignerWithBLOBs selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table designer
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(DesignerWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table designer
     *
     * @mbg.generated
     */
    int updateByPrimaryKeyWithBLOBs(DesignerWithBLOBs record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table designer
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Designer record);
}