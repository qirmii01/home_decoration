package com.hd.domain;
/**
 * 结果返回对象
 * @author Administrator
 *
 */
public class Result {
	/**
	 * 执行成功代码
	 */
	public final static String SUCCESS = "0";
	/**
	 * 执行失败代码
	 */
	public final static String FAIL = "1";
	private String code;
	private String msg;
	private Object body;
	
	public Result(){}
	
	public Result(Object body){
		this.code = SUCCESS;
		this.body = body;
	}
	
	public static Result buildResult(String code, String msg){
		return new Result(code, msg);
	}
	
	public static Result buildErrorResult(String msg){
		return new Result(FAIL, msg);
	}
	
	public Result(String code, String msg){
		this.code = code;
		this.msg = msg;
	}
	
	public boolean hasError(){
		return code.equals(FAIL);
	}
	
	public boolean noError(){
		return code.equals(SUCCESS);
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getBody() {
		return body;
	}
	public void setBody(Object body) {
		this.body = body;
	}
}
