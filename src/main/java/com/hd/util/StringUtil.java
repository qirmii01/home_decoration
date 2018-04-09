package com.hd.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;


/**
 * String 工具类
 * @author hjzhou
 *
 */
public class StringUtil {
	
	public static final String EMPTY = "";
	
	// 随机字符集
	private static final char[] chars = { 
		'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 
		'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
		'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 
		'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
	// 随机数字字符集
	private static final char[] numberChars = { 
		'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
	
	/**
	 * 字符串左边补零
	 * @param oriStr 原始字符串
	 * @param length 字符串总长度
	 * @return
	 */
	public static String leftZero (String oriStr, int length) {
		if (oriStr == null) {
			return null;
		}
		StringBuffer temp = new StringBuffer();
		int zeroLength = length - oriStr.length();
		for (int i = 0; i < zeroLength; i++) {
			temp.append("0");
		}
		temp.append(oriStr);
		return temp.toString();
	}
	
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return
	 */
	public static boolean isEmpty (String str) {
		return str == null || "".equals(str.trim());
	}
	
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty (String str) {
		return str != null && !"".equals(str.trim());
	}
	
	/**
	 * null 转 ''
	 * @param str
	 * @return
	 */
	public static String null2Empty(String str) {
		return str == null ? "" : str.trim();
	}
	
	/**
	 * 将字符串根据指定分隔符转为list
	 * @param str
	 * @param seperater
	 * @return
	 */
	public static List<String> getList(String str, String seperater) {
		List<String> list = new ArrayList<String>();
		String[] arr = str.split(seperater);
		for (String s : arr) {
			list.add(s);
		}
		return list;
	}
	
	/**
	 * 判断两个字符串是否相等  如果都为 null 返回 true
	 * @param str1
	 * @param str2
	 * @return
	 */
	public static boolean equal(String str1, String str2) {
		return str1 == null ? str2 == null : str1.equals(str2);
	}
	
	/**
	 * 生成指定长度的随机数字字符串
	 * @param length
	 * @return
	 */
	public static String getRandomNumber(int length) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			sb.append(numberChars[new Random().nextInt(numberChars.length)]);
		}
		return sb.toString();
	}
	
	/**
	 * 生成指定长度的随机字母数字字符串
	 * @param length
	 * @return
	 */
	public static String getRandomStr(int length) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			sb.append(chars[new Random().nextInt(chars.length)]);
		}
		return sb.toString();
	}
	
	/**
	 * 手机号中间四位变*
	 * @param phoneNum
	 * @return 188*****1234
	 */
	public static String phoneNumStarFormat(String phoneNum) {
		if (StringUtil.isEmpty(phoneNum) || phoneNum.length() < 11) {
			return phoneNum;
		}
		return phoneNumStarFormat(phoneNum, 3, 7, 4);
	}
	
	/**
	 * 手机号变*
	 * @param phoneNum 手机号
	 * @param starBeginIndex *开始位号
	 * @param starEndIndex *结束位号
	 * @param starNum *数量
	 * @return
	 */
	public static String phoneNumStarFormat(String phoneNum, int starBeginIndex, int starEndIndex, int starNum) {
		if (StringUtil.isEmpty(phoneNum) && phoneNum.length() < 11) {
			return phoneNum;
		}
		starBeginIndex = starBeginIndex < 0 ? 0 : starBeginIndex;
		starEndIndex = starEndIndex > phoneNum.length() ? phoneNum.length() : starEndIndex;
		if (starEndIndex - starBeginIndex <= 0) {
			return phoneNum;
		}
		String starStr = "";
		for (int i = 0; i < starNum; i++) {
			starStr += "*";
		}
		return phoneNum.substring(0, starBeginIndex) + starStr + phoneNum.substring(starEndIndex);
	}
	
	/**
	 * 只显示字符串第一位，后面全用  "*" 代替
	 * @param oriStr 原始字符串
	 * @return
	 */
	public static String hiddenLastName(String oriStr){
		if(StringUtil.isEmpty(oriStr)){
			return null;
		}
		return String.valueOf(oriStr.charAt(0))+"*";
	}
	
	/**
	 * 字符串是否为数字型
	 * @param oriStr 要判断的字符串
	 * @return
	 */
	public static boolean isNumber(String oriStr){
		if(StringUtil.isEmpty(oriStr)){
			return false;
		}
		if(oriStr.matches("[0-9]+")){
			return true;
		}
		return false;
	}
	public static void main(String[] args) {
		System.out.println(isNumber("354"));
	}
	
}
