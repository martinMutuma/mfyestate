package com.estate.util.tag.ui;

import java.io.IOException;
import java.util.Map;

import com.estate.util.comm.CodeTableUtil;

public class MFYRadioTag extends AbstractMFYCodeUITag {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3590919080682375642L;

	public void populateParams() {
		super.populateParams();
		try {
			temp = freemarkerConfig.getTemplate("radio.ftl");
			Map<String, String> dataMap = CodeTableUtil.bulidDataMap(codeType);
			dynamicAttributes.put("data", dataMap);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
