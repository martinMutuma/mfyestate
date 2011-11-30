package com.estate.domain.member;

import java.util.Map;

public class Hononr {
	private String type;// 类型
	private String name;// 名称
	private String score;// 分值
	private Map<String, Hononr> children;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public Map<String, Hononr> getChildren() {
		return children;
	}

	public void setChildren(Map<String, Hononr> children) {
		this.children = children;
	}

}
