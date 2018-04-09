/**
 * 
 */
package com.hd.util;

import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * @author admin
 *
 */
public class RandomSequence implements Sequence {

	/**
	 * 业务-机器代码
	 */
	private String mNo = "6700";

	/**
	 * 当前系统时间下一分钟的时间戳
	 */
	private static long NEXT_MINUTE_TIMESTAMP = 0L;
	/**
	 * 当前系统时间字符串缓存（yyyyMMddHHmm精确到分钟）
	 */
	private static String CURRENT_MINUTE_STR = null;
	/**
	 * 计数器最大值
	 */
	private final static int SEQ_MAX = 99999999;
	/**
	 * 计数器最大值的长度
	 */
	private final static int SEQ_LENGTH = String.valueOf(SEQ_MAX).length();
	/**
	 * 通用流水号计数器
	 */
	private static int CURRENT_SEQ = new Random().nextInt(SEQ_MAX/2);

	/**
	 * 
	 */
	public RandomSequence() {
	}

	@Override
	public String getNextValue(String seqName) {
		UUID randomUUID = UUID.randomUUID();
		String string = randomUUID.toString();
		int leng = string.length();
		return string.substring(leng-32);
	}

	public String getCommonID() {
		StringBuffer seqSb = new StringBuffer(32);
		seqSb.append(getTimeStr()); // 时间前缀
		seqSb.append(mNo); // 机器编号
		String seqStr = String.valueOf(this.nextSeq());
		seqStr = StringUtil.leftZero(seqStr, SEQ_LENGTH);
		seqSb.append(seqStr);
		return seqSb.toString();
	}

	/**
	 * 获取时间yyyyMMddHHmmss字符串
	 * @return
	 */
	private String getTimeStr() {
		if (System.currentTimeMillis() >= NEXT_MINUTE_TIMESTAMP) {
			// 生成新的时间字符串及下一分钟的时间戳缓存
			String timeTemp = DateFormatUtil.getDate("yyyyMMddHHmm");
			Date currMin = DateFormatUtil.formatDate(timeTemp);
			CURRENT_MINUTE_STR = timeTemp;
			NEXT_MINUTE_TIMESTAMP = currMin.getTime() + 60000;
		}
		return CURRENT_MINUTE_STR;
	}

	/**
	 * 获取通用流水号的序列
	 * @return
	 */
	private synchronized int nextSeq() {
		if (++CURRENT_SEQ > SEQ_MAX) {
			CURRENT_SEQ = new Random().nextInt(SEQ_MAX);
		}
		return CURRENT_SEQ;
	}
}
