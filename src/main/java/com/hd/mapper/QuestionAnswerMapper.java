package com.hd.mapper;

import com.hd.domain.QuestionAnswer;

public interface QuestionAnswerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table question_answer
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table question_answer
     *
     * @mbg.generated
     */
    int insert(QuestionAnswer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table question_answer
     *
     * @mbg.generated
     */
    int insertSelective(QuestionAnswer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table question_answer
     *
     * @mbg.generated
     */
    QuestionAnswer selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table question_answer
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(QuestionAnswer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table question_answer
     *
     * @mbg.generated
     */
    int updateByPrimaryKeyWithBLOBs(QuestionAnswer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table question_answer
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(QuestionAnswer record);
}