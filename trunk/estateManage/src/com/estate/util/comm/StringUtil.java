package com.estate.util.comm;

import java.text.Collator;

/**
 * Created by IntelliJ IDEA. User: 石铁军 Date: 2008-4-15 Time: 11:49:22 To change
 * this template use File | Settings | File Templates.
 */
public class StringUtil {
	/**
	 * 产生上级区划国标
	 * 
	 * @param zoneCode
	 *            行政区划编码
	 * @return 上级 区划国标
	 */
	public static String getParentZoneCode(String zoneCode) {
		String s = getShortZoneGB(zoneCode);
		s = s.substring(0, s.length() - 2);
		s = s + "0000000000";
		s = s.substring(0, 10);
		return s;
	}

	/**
	 * 产生下级区划国标查询串
	 * 
	 * @param zoneCode
	 * @return 产生下级区划国标查询串 oracle中单字匹配符号_
	 */
	public static String getChildZoneCode(String zoneCode) {
		String s = StringUtil.getShortZoneGB(zoneCode);
		s = s + "__0000000000";
		s = s.substring(0, 10);
		return s;
	}

	/**
	 * 去除传入的行政区划国标编码两位零
	 * 
	 * @param zoneCode
	 *            行政区划编码
	 * @return string
	 */
	public static String getShortZoneGB(String zoneCode) {
		if (zoneCode.length() != 10) {
			return zoneCode;
		} else {
			if (zoneCode.substring(zoneCode.length() - 2).equals("00")) {
				zoneCode = zoneCode.substring(0, 8);
			}
			if (zoneCode.substring(zoneCode.length() - 2).equals("00")) {
				zoneCode = zoneCode.substring(0, 6);
			}
			if (zoneCode.substring(zoneCode.length() - 2).equals("00")) {
				zoneCode = zoneCode.substring(0, 4);
			}
			if (zoneCode.substring(zoneCode.length() - 2).equals("00")) {
				zoneCode = zoneCode.substring(0, 2);
			}
			return zoneCode;
		}
	}

	/**
	 * 去除传入的行政区划国标编码两位零
	 * 
	 * @param zoneCode
	 *            行政区划编码
	 * @return string
	 */
	public static String getShortZoneGB1(String zoneCode) {
		if (zoneCode.length() != 10) {
			return zoneCode;
		} else {
			if (zoneCode.substring(zoneCode.length() - 2).equals("00")) {
				zoneCode = zoneCode.substring(0, 8);
			}
			if (zoneCode.substring(zoneCode.length() - 2).equals("00")) {
				zoneCode = zoneCode.substring(0, 6);
			}
			if (zoneCode.substring(zoneCode.length() - 2).equals("00")) {
				zoneCode = zoneCode.substring(0, 4);
			}
			if (zoneCode.substring(zoneCode.length() - 2).equals("00")) {
				zoneCode = zoneCode.substring(0, 2);
			}
			if (zoneCode.substring(zoneCode.length() - 2).equals("00")) {
				zoneCode = "";
			}
			return zoneCode;
		}
	}

	/**
	 * 比较两个String 是否相等
	 * 
	 * @param s1
	 *            String1
	 * @param s2
	 *            String2
	 * @return true 相等 false 不等
	 */
	public static boolean compareString(String s1, String s2) {
		Collator myCollator = Collator.getInstance();
		if (myCollator.compare(s1, s2) == 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 根据传入的行政区划国标编码取得地区级别
	 * 
	 * @param zoneCode
	 *            行政区划国标编码
	 * @return String 0处理错误 1国家，2省市，3地市，4县区、5乡镇 、6 社区
	 */
	public static int getZoneLevel(String zoneCode) {
		int returnValue = 0;
		if (zoneCode.length() != 10) {
			returnValue = 0;
		} else {
			returnValue = 6;
			if (zoneCode.substring(zoneCode.length() - 2).equals("00")) {
				zoneCode = zoneCode.substring(0, 8);
				returnValue = 5;
			}
			if (zoneCode.substring(zoneCode.length() - 2).equals("00")) {
				zoneCode = zoneCode.substring(0, 6);
				returnValue = 4;
			}
			if (zoneCode.substring(zoneCode.length() - 2).equals("00")) {
				zoneCode = zoneCode.substring(0, 4);
				returnValue = 3;
			}
			if (zoneCode.substring(zoneCode.length() - 2).equals("00")) {
				// zoneCode = zoneCode.substring(0, 2);
				returnValue = 2;
			}
		}
		return returnValue;
	}

	/**
	 * 
	 * @param str
	 * @return
	 */
	public static String formatValue(Object str) {
		String strTemp = str.toString();
		strTemp = strTemp.indexOf(".") == -1 ? strTemp : strTemp.substring(0,
				strTemp.indexOf("."));
		return "0".equals(strTemp) ? "" : strTemp;
	}
}
