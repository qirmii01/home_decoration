package com.hd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hd.domain.BasePage;
import com.hd.domain.Question;
import com.hd.domain.QuestionAnswer;
import com.hd.domain.Result;
import com.hd.domain.User;
import com.hd.service.UserQuestionService;

@RequestMapping("question")
@Controller
public class UserQuestionController {
	@Autowired
	private UserQuestionService userQuestionService;
	
	@Autowired
	private HttpServletRequest request;
	
	/**
	 * 查询问题及答案
	 * @return
	 */
	@RequestMapping("queryQuestionAndAnswer")
	@ResponseBody
	public Result queryQuestionAndAnswer(BasePage basePage){
		return userQuestionService.queryQuestions(basePage);
	}
	
	/**
	 * 添加问题
	 * @param question
	 * @return
	 */
	@RequestMapping("addQuestion")
	@ResponseBody
	public Result addQuestion(Question question){
		HttpSession session = request.getSession();
		User userSession = (User)session.getAttribute("userInfo");
		question.setUserId(userSession.getId());
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
		HttpSession session = request.getSession();
		User userSession = (User)session.getAttribute("userInfo");
		questionAnswer.setUserId(userSession.getId());
		return userQuestionService.addAnswer(questionAnswer);
	}
}
