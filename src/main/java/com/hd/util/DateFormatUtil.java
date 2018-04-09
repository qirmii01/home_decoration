package com.hd.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

/**
 * @author zero zhong
 *
 */
public final class DateFormatUtil {

	private static final Logger logger = LoggerFactory.getLogger(DateFormatUtil.class);
	private static final String DEFAULT_DATE_PANTTEN="yyyyMMdd";
	private static final String DEFAULT_TIME_PANTTEN="hhmmss";
	private static final String DEFAULT_TIME_MSTTEN="hhmmssSSS";

	/**
	 * 
	 */
	private DateFormatUtil() {
	}

	/**
	 * 将日期类型转为字符串类型
	 * @param date
	 * @param patten
	 * @return
	 */
	public static String DateToString(Date date,String patten){
		SimpleDateFormat format = new SimpleDateFormat(patten);
		return format.format(date);
	}


	/**
	 * 将字符串转为日期类型
	 * @param strDate
	 * @param patten
	 * @return
	 * @throws ParseException
	 */
	public static Date StringToDate(String strDate,String patten){
		SimpleDateFormat format = new SimpleDateFormat(patten);
		try {
			return format.parse(strDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}


	/**
	 * @return
	 * @throws ParseException
	 */
	public static Date getCurrentDate(){
		try {
			return getCurrentDate(DEFAULT_DATE_PANTTEN);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			
		}
	}

	/**
	 * @param patten
	 * @return
	 * @throws ParseException
	 */
	public static Date getCurrentDate(String patten) throws ParseException{
		SimpleDateFormat format = new SimpleDateFormat(patten);
		String strDate = format.format(new Date());
		return format.parse(strDate);
	}

	/**
	 * @return
	 */
	public static String getCurrentTime(){
		return getCurrentTime(DEFAULT_TIME_PANTTEN);
	}

	/**
	 * @param patten
	 * @return
	 */
	public static String getCurrentTime(String patten){
		SimpleDateFormat format = new SimpleDateFormat(patten);
		return format.format(new Date());
	}

	/**
	 * @return
	 * @throws ParseException
	 */
	public static String getCurrentDateStr(){
		return getCurrentStringDate(DEFAULT_DATE_PANTTEN);
	}
	
	/**
	 * @param patten
	 * @return
	 * @throws ParseException
	 */
	public static String getCurrentStringDate(String patten){
		SimpleDateFormat format = new SimpleDateFormat(patten);
		return format.format(new Date());
	}

	/**
	 * 默认将显示字符串类型转为2009-01-01格式
	 * @param strDate
	 * @return
	 */
	public static String showFormatDate(String strDate){
		String patten = "yyyy-MM-dd";
		return DateToString(StringToDate(strDate,patten),patten);
	}
	
	

	/**
	 * 得到格式化之后的时间，精确到三位毫秒
	 * @return
	 */
	public static String getMSTime(){
		return getCurrentTime(DEFAULT_TIME_MSTTEN);
	}


	/**
	 *
	 * @param date_mode
	 *            :yyyyMMddHHmmss
	 * @return
	 */
	public static String getDate(String date_mode) {
		Date d = new Date();
		SimpleDateFormat date = new SimpleDateFormat(date_mode);
		date.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
		String datename = date.format(d).toString();
		return datename;
	}


	/**
	 * 格式化指定字符串日期
	 * @param dateStr
	 * @param dateStr
	 * @return
	 */
	public static Date formatDate(String dateStr) {
		if (dateStr == null) {
			return null;
		}
		dateStr = dateStr.replaceAll("[^0-9]", "");
		dateStr = rightZero(dateStr, 17);
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		try {
			return df.parse(dateStr);
		} catch (ParseException e) {
			logger.error("formatting date error -dateStr:{} - error message:", dateStr, e);
		}
		return null;
	}


	/**
	 * 字符串右补0
	 *
	 * @param str
	 * @param length
	 *            包含 str 在内字符串总长度
	 * @return
	 */
	private static String rightZero(String str, int length) {
		if (str == null) {
			return null;
		}
		int zeroLength = length - str.length();
		if (zeroLength <= 0) {
			return str;
		}
		for (int i = 0; i < zeroLength; i++) {
			str += "0";
		}
		return str;
	}

}