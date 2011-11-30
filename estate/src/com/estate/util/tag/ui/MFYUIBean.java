package com.estate.util.tag.ui;

import java.util.HashMap;
import java.util.Map;

public class MFYUIBean {

	protected String id;
	protected String name;
	protected String value;
	protected String cssClass;
	protected String cssStyle;
	protected String cssErrorClass;
	protected String cssErrorStyle;
	protected String disabled;
	protected String label;
	protected String labelPosition;
	protected String labelSeparator;
	protected String requiredposition;
	protected String required;
	protected String tabindex;
	protected String title;
	
	protected String codeType;
	protected String defaultValue;

	// HTML scripting events attributes
	protected String onclick;
	protected String ondblclick;
	protected String onmousedown;
	protected String onmouseup;
	protected String onmouseover;
	protected String onmousemove;
	protected String onmouseout;
	protected String onfocus;
	protected String onblur;
	protected String onkeypress;
	protected String onkeydown;
	protected String onkeyup;
	protected String onselect;
	protected String onchange;
	protected Map<String, Object> dynamicAttributes = new HashMap<String, Object>();
	
	//templeteUrl
	protected String uiTempleteUrl;

	public String getUiTempleteUrl() {
		return uiTempleteUrl;
	}

	public void setUiTempleteUrl(String uiTempleteUrl) {
		this.uiTempleteUrl = uiTempleteUrl;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public String getCssStyle() {
		return cssStyle;
	}

	public void setCssStyle(String cssStyle) {
		this.cssStyle = cssStyle;
	}

	public String getCssErrorClass() {
		return cssErrorClass;
	}

	public void setCssErrorClass(String cssErrorClass) {
		this.cssErrorClass = cssErrorClass;
	}

	public String getCssErrorStyle() {
		return cssErrorStyle;
	}

	public void setCssErrorStyle(String cssErrorStyle) {
		this.cssErrorStyle = cssErrorStyle;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getLabelPosition() {
		return labelPosition;
	}

	public void setLabelPosition(String labelPosition) {
		this.labelPosition = labelPosition;
	}

	public String getLabelSeparator() {
		return labelSeparator;
	}

	public void setLabelSeparator(String labelSeparator) {
		this.labelSeparator = labelSeparator;
	}

	public String getRequiredposition() {
		return requiredposition;
	}

	public void setRequiredposition(String requiredposition) {
		this.requiredposition = requiredposition;
	}

	public String getRequired() {
		return required;
	}

	public void setRequired(String required) {
		this.required = required;
	}

	public String getTabindex() {
		return tabindex;
	}

	public void setTabindex(String tabindex) {
		this.tabindex = tabindex;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getOnclick() {
		return onclick;
	}

	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}

	public String getOndblclick() {
		return ondblclick;
	}

	public void setOndblclick(String ondblclick) {
		this.ondblclick = ondblclick;
	}

	public String getOnmousedown() {
		return onmousedown;
	}

	public void setOnmousedown(String onmousedown) {
		this.onmousedown = onmousedown;
	}

	public String getOnmouseup() {
		return onmouseup;
	}

	public void setOnmouseup(String onmouseup) {
		this.onmouseup = onmouseup;
	}

	public String getOnmouseover() {
		return onmouseover;
	}

	public void setOnmouseover(String onmouseover) {
		this.onmouseover = onmouseover;
	}

	public String getOnmousemove() {
		return onmousemove;
	}

	public void setOnmousemove(String onmousemove) {
		this.onmousemove = onmousemove;
	}

	public String getOnmouseout() {
		return onmouseout;
	}

	public void setOnmouseout(String onmouseout) {
		this.onmouseout = onmouseout;
	}

	public String getOnfocus() {
		return onfocus;
	}

	public void setOnfocus(String onfocus) {
		this.onfocus = onfocus;
	}

	public String getOnblur() {
		return onblur;
	}

	public void setOnblur(String onblur) {
		this.onblur = onblur;
	}

	public String getOnkeypress() {
		return onkeypress;
	}

	public void setOnkeypress(String onkeypress) {
		this.onkeypress = onkeypress;
	}

	public String getOnkeydown() {
		return onkeydown;
	}

	public void setOnkeydown(String onkeydown) {
		this.onkeydown = onkeydown;
	}

	public String getOnkeyup() {
		return onkeyup;
	}

	public void setOnkeyup(String onkeyup) {
		this.onkeyup = onkeyup;
	}

	public String getOnselect() {
		return onselect;
	}

	public void setOnselect(String onselect) {
		this.onselect = onselect;
	}

	public String getOnchange() {
		return onchange;
	}

	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}

	public Map<String, Object> getDynamicAttributes() {
		return dynamicAttributes;
	}

	public void setDynamicAttributes(Map<String, Object> dynamicAttributes) {
		this.dynamicAttributes = dynamicAttributes;
	}

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

}
