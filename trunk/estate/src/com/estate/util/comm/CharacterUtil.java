package com.estate.util.comm;

import java.net.URLDecoder;

import com.estate.util.file.XmlUtil;

public class CharacterUtil {
	public static String encode(String strvalue) {
		try {
			if (null == strvalue || "".equals(strvalue.trim())) {
				return "";
			} else {
				if ("1".equals(XmlUtil.getValue("encodingType", "sysConfig")
						.trim()))
					strvalue = new String(strvalue.getBytes("ISO8859_1"),
							"utf-8");
				else
					strvalue = URLDecoder.decode(strvalue, "utf-8");
				return strvalue;
			}
		} catch (Exception e) {
			return "";
		}
	}
}
