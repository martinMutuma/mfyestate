package com.estate.util.framework;

public class TagUtil {
	public  String formatBulidingType(String type){
		if(null != type){
			switch (new Integer(type)) {
			case 0:return "住宅";
			case 1:return "公寓";
			case 2:return "海景房";
			case 3:return "别墅";
			case 4:return "酒店式公寓";
			case 5:return "产权式酒店";
			default:
				return "123";
			}
		}
		return "";
	}
}
