package com.hd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hd.domain.Question;
import com.hd.domain.QuestionAnswer;
import com.hd.domain.Result;
import com.hd.service.UserQuestionService;

@RequestMapping("question")
@Controller
public class UserQuestionController {
	@Autowired
	private UserQuestionService userQuestionService;
	
	/**
	 * 查询问题及答案
	 * @param start
	 * @param end
	 * @return
	 */
	@RequestMapping("queryQuestionAndAnswer")
	@ResponseBody
	public Result queryQuestionAndAnswer(@RequestParam("pageIndex")int pageIndex, @RequestParam("limit")int limit){
		return userQuestionService.queryQuestions(pageIndex, limit);
	}
	
	/**
	 * 添加问题
	 * @param question
	 * @return
	 */
	@RequestMapping("addQuestion")
	@ResponseBody
	public Result addQuestion(Question question){
		return userQuestionService.addQuestion(question);
	}
	
	/**
	 * 添加回答
	 * @param questionAnswer
	 * @return
	 */
	@RequestMapping("addAnswer")
	@ResponseBody
	public Result addAnswer(QuestionAnswer questionAnswer){
		return userQuestionService.addAnswer(questionAnswer);
	}
}
