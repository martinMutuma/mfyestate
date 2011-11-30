package com.estate.util.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.taglibs.standard.lang.support.ExpressionEvaluatorManager;

import com.estate.util.comm.CodeTableUtil;

public class convertCode2NameTag extends TagSupport {

	private static final long serialVersionUID = 1L;
	private String codeType;
	private String code;

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) throws JspException {
		if (null != code)
			this.code = (String) ExpressionEvaluatorManager.evaluate("value",
					code.toString(), String.class, this, pageContext);
	}

	@SuppressWarnings("unchecked")
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			String value = CodeTableUtil.bulidDataValue(codeType, code);
			out.print(value);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

}
