package com.hd.domain;

import java.util.Date;

/**
 * 用户问题及其回答展示对象
 */
public class QuestionAndAnswerVO{
	private String id;
	private String askUserId;
	private String createTime;
	private String question;
	private String answerContent;
	private String answerUserId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAskUserId() {
		return askUserId;
	}
	public void setAskUserId(String askUserId) {
		this.askUserId = askUserId;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswerContent() {
		return answerContent;
	}
	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}
	public String getAnswerUserId() {
		return answerUserId;
	}
	public void setAnswerUserId(String answerUserId) {
		this.answerUserId = answerUserId;
	}
}
