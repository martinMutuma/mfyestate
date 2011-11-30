package com.estate.domain.member;

import java.util.Date;

import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

@Table("t_s_message")
public class TsMessage extends BaseEntity {

	private Long toId;
	private String toUserName;
	private String toHeadUrl;
	private Long fromId;
	private String fromUserName;
	private String fromHeadUrl;
	private String messageTitle;
	private String messageContent;
	private String phone;
	private String email;
	private String replayFlag;
	private String flag;

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getMessageTitle() {
		return messageTitle;
	}

	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	private String replyContent;
	private Date replayTime;
	private Date createTime;

	public Long getToId() {
		return toId;
	}

	public void setToId(Long toId) {
		this.toId = toId;
	}

	public String getToUserName() {
		return toUserName;
	}

	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}

	public String getToHeadUrl() {
		return toHeadUrl;
	}

	public void setToHeadUrl(String toHeadUrl) {
		this.toHeadUrl = toHeadUrl;
	}

	public Long getFromId() {
		return fromId;
	}

	public void setFromId(Long fromId) {
		this.fromId = fromId;
	}

	public String getFromUserName() {
		return fromUserName;
	}

	public void setFromUserName(String fromUserName) {
		this.fromUserName = fromUserName;
	}

	public String getFromHeadUrl() {
		return fromHeadUrl;
	}

	public void setFromHeadUrl(String fromHeadUrl) {
		this.fromHeadUrl = fromHeadUrl;
	}

	public String getReplayFlag() {
		return replayFlag;
	}

	public void setReplayFlag(String replayFlag) {
		this.replayFlag = replayFlag;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplayTime() {
		return replayTime;
	}

	public void setReplayTime(Date replayTime) {
		this.replayTime = replayTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
