package com.estate.util.comm;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by IntelliJ IDEA. User: 石铁军 Date: 2008-4-15 Time: 13:07:00 To change
 * this template use File | Settings | File Templates.
 */
public class DateTimeUtil {

	/**
	 * 返回日期字符串
	 * 
	 * @param date1
	 * @param sFormat
	 * @return
	 */
	public static String switchDateToString(Date date1, String sFormat) {
		Date date = new Date();
		String ls_ret = "00";
		SimpleDateFormat df = new SimpleDateFormat(sFormat);
		try {
			if (date1 == null) {
				ls_ret = df.format(date);
			} else {
				ls_ret = df.format(date1);
			}
		} catch (Exception e) {
			ls_ret = "00";
		}
		return ls_ret;
	}

	@SuppressWarnings("static-access")
	public static int getIntYear() {
		Calendar rightNow = Calendar.getInstance();
		int year = rightNow.get(rightNow.YEAR);
		return year;
	}

	@SuppressWarnings("static-access")
	public static String getMonth(String mark) {
		Calendar rightNow = Calendar.getInstance();
		int month = rightNow.get(rightNow.MONTH) + 1;
		if (mark.equals("MM")) {
			String rstr = "0" + String.valueOf(month);
			rstr = String.valueOf(rstr.charAt(rstr.length() - 2))
					+ String.valueOf(rstr.charAt(rstr.length() - 1));
			return rstr;
		} else
			return String.valueOf(month);
	}

	@SuppressWarnings("static-access")
	public static String getDay(String mark) {
		Calendar rightNow = Calendar.getInstance();
		int day = rightNow.get(rightNow.DATE);
		if (mark.equals("dd")) {
			String rstr = "0" + String.valueOf(day);
			rstr = String.valueOf(rstr.charAt(rstr.length() - 2))
					+ String.valueOf(rstr.charAt(rstr.length() - 1));
			return rstr;
		} else
			return String.valueOf(day);
	}

	@SuppressWarnings("static-access")
	public static String getTenday() {
		Calendar rightNow = Calendar.getInstance();
		int day = rightNow.get(rightNow.DATE);
		String rstr = "";
		if (day < 11)
			rstr = "1";
		else if ((day > 10) && (day < 21))
			rstr = "2";
		else if (day > 20)
			rstr = "3";

		return rstr;
	}

	/**
	 * 取得系统当前时间
	 * 
	 * @return String yyyy-mm-dd
	 */
	@SuppressWarnings("static-access")
	public static String getCurrentDate1() {
		Calendar rightNow = Calendar.getInstance();
		int year = rightNow.get(rightNow.YEAR);
		int month = rightNow.get(rightNow.MONTH) + 1;
		int day = rightNow.get(rightNow.DATE);
		return year + "-" + month + "-" + day;
	}

	/**
	 * 取得系统当前时间
	 * 
	 * @return String yyyy-MM-dd hh:mm:ss
	 */
	@SuppressWarnings("static-access")
	public static String getCurrentDate2() {
		Calendar c = Calendar.getInstance();
		c.add(c.SECOND, 0);
		return "" + c.get(c.YEAR) + "-" + (c.get(c.MONTH) + 1) + "-"
				+ c.get(c.DATE) + " " + c.get(c.HOUR_OF_DAY) + ":"
				+ c.get(c.MINUTE) + ":" + c.get(c.SECOND);
	}

	public static String dateFormat(int time) {
		String rTime = String.valueOf(time);
		if (rTime.trim().length() <= 1) {
			rTime = "0" + rTime;
		}
		return rTime;
	}

	/**
	 * 取得系统当前时间前n个月的相对应的一天
	 * 
	 * @param n
	 *            int
	 * @return String yyyy-mm-dd
	 */
	@SuppressWarnings("static-access")
	public static String getNMonthBeforeCurrentDay(int n) {
		Calendar c = Calendar.getInstance();
		c.add(c.MONTH, -n);
		return "" + c.get(c.YEAR) + "-" + (c.get(c.MONTH) + 1) + "-"
				+ c.get(c.DATE);

	}

	/**
	 * 取得系统当前时间后n个月的相对应的一天
	 * 
	 * @param n
	 *            int
	 * @return String yyyy-mm-dd
	 */
	@SuppressWarnings("static-access")
	public static String getNMonthAfterCurrentDay(int n) {
		Calendar c = Calendar.getInstance();
		c.add(c.MONTH, n);
		return "" + c.get(c.YEAR) + "-" + (c.get(c.MONTH) + 1) + "-"
				+ c.get(c.DATE);

	}

	/**
	 * 取得系统当前时间前n天
	 * 
	 * @param n
	 *            int
	 * @return String yyyy-mm-dd
	 */
	@SuppressWarnings("static-access")
	public static String getNDayBeforeCurrentDate(int n) {
		Calendar c = Calendar.getInstance();
		c.add(c.DAY_OF_MONTH, -n);
		String day = String.valueOf(c.get(c.DATE));
		String month = String.valueOf(c.get(c.MONTH) + 1);
		if (day.length() == 1) {
			day = "0" + day;
		}
		if (month.length() == 1) {
			month = "0" + month;
		}
		return "" + c.get(c.YEAR) + "-" + month + "-" + day;
	}

	/**
	 * 取得系统当前时间后n天
	 * 
	 * @param n
	 *            int
	 * @return String yyyy-mm-dd
	 */
	@SuppressWarnings("static-access")
	public static String getNDayAfterCurrentDate(int n) {
		Calendar c = Calendar.getInstance();
		c.add(c.DAY_OF_MONTH, n);
		return "" + c.get(c.YEAR) + "-" + (c.get(c.MONTH) + 1) + "-"
				+ c.get(c.DATE);
	}

	/**
	 * 取得系统当前时间后n天
	 * 
	 * @param n
	 *            int
	 * @return String yyyy.mm.dd
	 */
	@SuppressWarnings("static-access")
	public static String getNDayAfterCurrentDate2(int n) {
		Calendar c = Calendar.getInstance();
		c.add(c.DAY_OF_MONTH, n);
		// 判断月份和日期是否为1位，如果就为就补"0"
		String month = String.valueOf(c.get(c.MONTH) + 1);
		if (month.length() == 1) {
			month = "0" + month;
		}
		String date = String.valueOf(c.get(c.DATE));
		if (date.length() == 1) {
			date = "0" + date;
		}
		return "" + c.get(c.YEAR) + "-" + month + "-" + date;
	}

	// ---------------------------------------------------------------------
	// 取过去一个时间对应的系统当年的一天
	@SuppressWarnings("static-access")
	public static String getCurrentDateAfterPastDate(String sPastDate) {
		if (sPastDate != null && !sPastDate.equals("")) {
			Date date = switchStringToDate1(sPastDate);
			Calendar c = Calendar.getInstance();
			c.setTime(date);
			int iPastYear = c.get(c.YEAR);
			Calendar c1 = Calendar.getInstance();
			int iCurrentYear = c1.get(c1.YEAR);
			c.add(c.YEAR, iCurrentYear - iPastYear);
			return "" + c.get(c.YEAR) + "-" + (c.get(c.MONTH) + 1) + "-"
					+ c.get(c.DATE);
		} else {
			return null;
		}
	}

	/**
	 * 将一个日期字符串转化成日期
	 * 
	 * @param sDate
	 *            String
	 * @return Date yyyy-mm-dd
	 */
	public static Date switchStringToDate1(String sDate) {
		Date date = null;
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			date = df.parse(sDate);
		} catch (Exception e) {
		}
		return date;
	}

	public static Date switchStringToDate3(String sDate) {
		Date date = null;
		if (sDate == null || sDate.equals("")) {
			return date;
		} else {
			try {
				SimpleDateFormat df = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				date = df.parse(sDate);
			} catch (Exception e) {
			}
			return date;
		}
	}

	/**
	 * 将一个日期字符串转化成日期
	 * 
	 * @return Date yyyy-mm-dd
	 */
	public static Date getCurrentDateTime() {
		Date date = null;
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			date = df.parse(DateTimeUtil.getCurrentDate2());
		} catch (Exception e) {
			// System.out.println("日期转换失败:" + e.getMessage());
		}
		return date;
	}

	public static Date getSystemDate() {
		Date date = null;
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			date = df.parse(DateTimeUtil.getCurrentDate1());
		} catch (Exception e) {
			// System.out.println("日期转换失败:" + e.getMessage());
		}
		return date;
	}

	/**
	 * 输入两个字符串型的日期，比较两者的大小
	 * 
	 * @param fromDate
	 *            String
	 * @param toDate
	 *            String
	 * @return boolean before为true
	 */
	public static boolean compareTwoDateBigOrSmall(String fromDate,
			String toDate) {
		Date dateFrom = DateTimeUtil.switchStringToDate1(fromDate);
		Date dateTo = DateTimeUtil.switchStringToDate1(toDate);
		if (dateFrom.before(dateTo)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 将一个日期字符串转化成Calendar
	 * 
	 * @param sDate
	 *            String
	 * @return Calendar
	 */
	public static Calendar switchStringToCalendar(String sDate) {
		Date date = DateTimeUtil.switchStringToDate1(sDate);
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c;
	}

	/**
	 * 将一个日期转化成Calendar
	 * 
	 * @param date
	 *            Date
	 * @return Calendar
	 */
	public static Calendar switchStringToCalendar(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c;
	}

	public static String getChineseStringDate(Date date)
			throws java.lang.Exception {
		SimpleDateFormat newk = new SimpleDateFormat("yyyy年MM月dd日");
		return newk.format(date);
	}

	/**
	 * 取得某个时间前n个月的相对应的一天
	 * 
	 * @param sDate
	 *            String
	 * @param n
	 *            int
	 * @return String yyyy-mm-dd
	 */
	@SuppressWarnings("static-access")
	public static String getNMonthBeforeOneDay(String sDate, int n) {
		Calendar c = switchStringToCalendar(sDate);
		c.add(c.MONTH, -n);
		return "" + c.get(c.YEAR) + "-" + (c.get(c.MONTH) + 1) + "-"
				+ c.get(c.DATE);

	}

	// 取得某个时间后n个月的相对应的一天
	@SuppressWarnings("static-access")
	public static String getNMonthAfterOneDay(String sDate, int n) {
		Calendar c = switchStringToCalendar(sDate);
		c.add(c.MONTH, n);
		return "" + c.get(c.YEAR) + "-" + (c.get(c.MONTH) + 1) + "-"
				+ c.get(c.DATE);

	}

	// 取得某个时间前n天,格式为yyyy-mm-dd
	@SuppressWarnings("static-access")
	public static String getNDayBeforeOneDate(String sDate, int n) {
		Calendar c = switchStringToCalendar(sDate);
		c.add(c.DAY_OF_MONTH, -n);
		return "" + c.get(c.YEAR) + "-" + (c.get(c.MONTH) + 1) + "-"
				+ c.get(c.DATE);
	}

	// 取得某个时间后n天,格式为yyyy-mm-dd
	@SuppressWarnings("static-access")
	public static String getNDayAfterOneDate(String sDate, int n) {
		Calendar c = switchStringToCalendar(sDate);
		c.add(c.DAY_OF_MONTH, n);
		return "" + c.get(c.YEAR) + "-" + (c.get(c.MONTH) + 1) + "-"
				+ c.get(c.DATE);
	}

	// 判断系统当前时间是不是润年
	@SuppressWarnings("static-access")
	public static boolean isRunNian() {
		java.util.Calendar rightNow = java.util.Calendar.getInstance();
		int year = rightNow.get(rightNow.YEAR);
		if (0 == year % 4 && (year % 100 != 0 || year % 400 == 0)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 取得某个时间的月的最后一天
	 * 
	 * @param sDate
	 *            String
	 * @return String yyyy-mm-dd
	 */
	@SuppressWarnings("static-access")
	public static String getLastDayMonth(String sDate) {
		Calendar c = switchStringToCalendar(sDate);
		return "" + c.get(c.YEAR) + "-" + (c.get(c.MONTH) + 1) + "-"
				+ c.DAY_OF_MONTH;

	}

	/**
	 * 返回传入的日期是哪个季度
	 * 
	 * @param sDate
	 *            日期字串
	 * @return 季度 1 2 3 4
	 */
	@SuppressWarnings("static-access")
	public static int getQuarter(String sDate) {
		int a = 0;
		Calendar c = switchStringToCalendar(sDate);
		switch (c.get(c.MONTH)) {
		case 1:
		case 2:
		case 3: {
			a = 1;
			break;
		}
		case 4:
		case 5:
		case 6: {
			a = 2;
			break;
		}
		case 7:
		case 8:
		case 9: {
			a = 3;
			break;
		}
		case 10:
		case 11:
		case 12: {
			a = 4;
			break;
		}
		}
		return a;
	}

	/**
	 * Get the date of monday in this week
	 * 
	 * @return yyyy-MM-dd
	 */
	public static String getMondayOfThisWeek() {
		String strTemp = "";
		Calendar c = Calendar.getInstance();
		int dayofweek = c.get(Calendar.DAY_OF_WEEK) - 1;
		if (dayofweek == 0)
			dayofweek = 7;
		c.add(Calendar.DATE, -dayofweek + 1);
		strTemp = c.get(1) + "-";
		if (c.get(2) + 1 < 10)
			strTemp += "0";
		strTemp = strTemp + (c.get(2) + 1) + "-";
		if (c.get(5) < 10)
			strTemp += "0";
		strTemp += c.get(5);
		return strTemp;
	}

	/**
	 * Get the date of Friday in this week
	 * 
	 * @return yyyy-MM-dd
	 */
	public static String getFridayOfThisWeek() {
		String strTemp = "";
		Calendar c = Calendar.getInstance();
		int dayofweek = c.get(Calendar.DAY_OF_WEEK) - 1;
		if (dayofweek == 0)
			dayofweek = 7;
		c.add(Calendar.DATE, -dayofweek + 5);
		strTemp = c.get(1) + "-";
		if (c.get(2) + 1 < 10)
			strTemp += "0";
		strTemp = strTemp + (c.get(2) + 1) + "-";
		if (c.get(5) < 10)
			strTemp += "0";
		strTemp += c.get(5);
		return strTemp;
	}

	/**
	 * Get the date of sunday in this week
	 * 
	 * @return yyyy-MM-dd
	 */
	public static String getSundayOfThisWeek() {
		String strTemp = "";
		Calendar c = Calendar.getInstance();
		int dayofweek = c.get(Calendar.DAY_OF_WEEK) - 1;
		if (dayofweek == 0)
			dayofweek = 7;
		c.add(Calendar.DATE, -dayofweek + 7);
		strTemp = c.get(1) + "-";
		if (c.get(2) + 1 < 10)
			strTemp += "0";
		strTemp = strTemp + (c.get(2) + 1) + "-";
		if (c.get(5) < 10)
			strTemp += "0";
		strTemp += c.get(5);
		return strTemp;
	}

	public static long getDateDiff(Date d1, Date d2) {
		long diff = d2.getTime() - d1.getTime();
		return (diff / (1000 * 60 * 60 * 24));
	}

	/**
	 * 根据传入的日期和格式进行日期变化
	 * 
	 * @param date
	 * @param sFormat
	 * @return
	 */
	public static String getDateToString(Date date, String sFormat) {
		String sRe = "";
		try {
			SimpleDateFormat df = new SimpleDateFormat(sFormat);
			if (date == null) {
				sRe = df.format(getCurrentDateTime());
			} else {
				sRe = df.format(date);
			}
		} catch (Exception e) {
			// System.out.println("日期转换失败:" + e.getMessage());
		}
		return sRe;
	}

	/**
	 * 
	 * @param text
	 *            yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static Date parseStandardDate(String text) {
		Date date = null;
		SimpleDateFormat standardDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			date = standardDateFormat.parse(text);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	/**
	 * 
	 * @param text
	 *            yyyy
	 * @return
	 */
	public static Date parseDate(String text) {
		Date date = null;
		SimpleDateFormat standardDateFormat = new SimpleDateFormat("yyyy年");
		try {
			date = standardDateFormat.parse(text);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	public static void main(String[] args) {
		
	}
}
