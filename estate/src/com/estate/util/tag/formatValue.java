package com.estate.util.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.taglibs.standard.lang.support.ExpressionEvaluatorManager;

import com.estate.util.comm.StringUtil;

public class formatValue extends TagSupport {
	private static final long serialVersionUID = 1L;
	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) throws JspException {
		if (null != value)
			this.value = (String) ExpressionEvaluatorManager.evaluate("value",
					value.toString(), String.class, this, pageContext);
	}

	@SuppressWarnings("unchecked")
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			out.print(StringUtil.formatValue(value));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
}
