package com.hd.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.log4j.Logger;

public class MD5Utility {
	public static final String REVISION = "$Revision: 1.1 $";
	private static Logger _log = Logger.getLogger(MD5Utility.class);

	private static MessageDigest dig = null;

	static {
		try {
			if (dig == null) {
				dig = MessageDigest.getInstance("MD5");
			}
		}catch (NoSuchAlgorithmException e) {
			_log.error("MD5Utility error:"+e.getMessage());
		}
	}

	public static String getRandomDigest() throws Exception {
		return getDigest(String.valueOf(System.currentTimeMillis()));
	}

	/**
	 * Pass in a string and return the MD5 digest of it.
	 * @param inputString String to gen digest
	 * @return String - Digest in BASE64 form
	 */
	public static String getDigest(String s) throws Exception {
		String s1 = null;
		try {
			s1 = byte2hex(dig.digest(s.getBytes()));
		}
		catch (Exception e) {
			throw new Exception(e.getMessage());
		}
		return s1;
	}
	
	public static String byte2hex(byte[] b)
    {
        String hs = "";
        String stmp = "";
        for (int n = 0; n < b.length; n++)
        {
            stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
            if (stmp.length() == 1)
                hs = hs + "0" + stmp;
            else
                hs = hs + stmp;
        }
        return hs.toUpperCase();
    }

	/**
	 * Recursively search in the src string to find a match of the input string
	 * @param inString Input String to find the match
	 * @param src source string which might contain the target string.
	 * @return boolean - true if found.
	 */
	public static boolean findMatch(String in, String src) {
		return findMatch(in, src, " ");
	}

	/**
	 * @param inString Target string which might be found in the source string
	 * @param src Source string which might contain the target string
	 * @param dlm String - Delimiter
	 * @return boolean - true if inString found in src
	 */
	public static boolean findMatch(String in, String src, String dlm) {
		in = in.trim();
		if (src.equals("")) {
			return false;
		}
		if (src.indexOf(dlm) == -1) {
			return false;
		}
		String s1 = src.substring(0, src.indexOf(dlm)).trim();
		if (s1.equals(in))
			return true;
		else
			return findMatch(in, src.substring(src.indexOf(dlm) + 1), dlm);
	}


	public static void main(String argc[]) {
		
		try {
			System.out.println(getDigest("123456"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
