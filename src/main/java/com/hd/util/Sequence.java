package com.hd.util;


/**
 * @author admin
 *
 */
public interface Sequence {

	public String getNextValue(String seqName)throws Exception;
	
	public String getCommonID();
}
