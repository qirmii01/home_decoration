package com.hd.service;

import com.hd.domain.Question;
import com.hd.domain.QuestionAnswer;
import com.hd.domain.Result;

public interface UserQuestionService {
	/**
	 * 查询问答信息
	 * @param pageIndex 页码
	 * @param limit 查询记录条数 
	 * @return
	 */
	public Result queryQuestions(int pageIndex , int limit);
	
	/**
	 * 添加问题
	 * @param question 问题对象
	 * @return
	 */
	public Result addQuestion(Question question);
	
	/**
	 * 回答问题
	 * @param questionAnswer 回答问题对象
	 * @return
	 */
	public Result addAnswer(QuestionAnswer questionAnswer);
}
