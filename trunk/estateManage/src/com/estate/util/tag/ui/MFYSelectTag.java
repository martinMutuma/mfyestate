package com.estate.util.tag.ui;

import java.io.IOException;
import java.util.Map;

import com.estate.util.comm.CodeTableUtil;

public class MFYSelectTag extends AbstractMFYCodeUITag {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3590919080682375642L;

	private String headerKey;
	private String headerValue;

	public String getHeaderKey() {
		return headerKey;
	}

	public void setHeaderKey(String headerKey) {
		this.headerKey = headerKey;
	}

	public String getHeaderValue() {
		return headerValue;
	}

	public void setHeaderValue(String headerValue) {
		this.headerValue = headerValue;
	}

	public void populateParams() {
		super.populateParams();
		try {
			temp = freemarkerConfig.getTemplate("select.ftl");
			Map<String, String> dataMap = CodeTableUtil.bulidDataMap(codeType);
			dynamicAttributes.put("data", dataMap);
			dynamicAttributes.put("headValue", headerValue);
			dynamicAttributes.put("headerKey", headerKey);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
