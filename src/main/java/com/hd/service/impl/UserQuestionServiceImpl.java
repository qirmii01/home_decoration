package com.hd.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hd.domain.Question;
import com.hd.domain.QuestionAndAnswerVO;
import com.hd.domain.QuestionAnswer;
import com.hd.domain.Result;
import com.hd.mapper.QuestionAnswerMapper;
import com.hd.mapper.QuestionMapper;
import com.hd.service.UserQuestionService;
import com.hd.util.Sequence;
import com.hd.util.StringUtil;
@Service
public class UserQuestionServiceImpl implements UserQuestionService {
	@Autowired
	private QuestionMapper questionMapper;
	
	@Autowired
	private QuestionAnswerMapper questionAnswerMapper;
	
	@Autowired
	Sequence sequence;
	
	@Override
	public Result queryQuestions(int pageIndex, int limit) {
		if(pageIndex<0){
			return Result.buildErrorResult("记录查询参数错误");
		}
		List<QuestionAndAnswerVO> questionAndAnswerVO = questionMapper.queryQuestionAndAnswer((pageIndex-1)*limit,limit);
		return new Result(questionAndAnswerVO);
	}

	@Override
	public Result addQuestion(Question question) {
		if(StringUtil.isEmpty(question.getContent())){
			return Result.buildErrorResult("问题内容不能为空");
		}
		if(StringUtil.isEmpty(question.getUserId())){
			return Result.buildErrorResult("用户名不能为空");
		}
		
		question.setCreateTime(new Date());
		question.setId(sequence.getCommonID());
		int i = questionMapper.insert(question);
		if(i <= 0 ){
			return Result.buildErrorResult("数据添加失败");
		}
		return new Result("数据添加成功");
	}

	@Override
	public Result addAnswer(QuestionAnswer questionAnswer) {
		if(StringUtil.isEmpty(questionAnswer.getAnswerContent())){
			return Result.buildErrorResult("回答内容不能为空");
		}
		if(StringUtil.isEmpty(questionAnswer.getUserId())){
			return Result.buildErrorResult("用户id不能为空");
		}
		int i = questionAnswerMapper.insert(questionAnswer);
		if(i <= 0 ){
			return Result.buildErrorResult("数据添加失败");
		}
		return new Result("数据添加成功");
	}

}
