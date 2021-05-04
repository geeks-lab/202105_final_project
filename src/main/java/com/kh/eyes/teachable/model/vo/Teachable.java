package com.kh.eyes.teachable.model.vo;

import java.sql.Date;

import com.kh.eyes.common.code.Code;

public class Teachable {
	private String queDataIdx;
	private String queCategory;
	private String queSavePath;
	private Date queRegDate;
	private String queResult;
	private String queFileName;
	private String userId;
	
	public String getFullPath() {
		return Code.TEACHABLE + queSavePath;
	}
	
	public String getQueDataIdx() {
		return queDataIdx;
	}
	
	public void setQueDataIdx(String queDataIdx) {
		this.queDataIdx = queDataIdx;
	}
	
	public String getQueCategory() {
		return queCategory;
	}
	
	public void setQueCategory(String queCategory) {
		this.queCategory = queCategory;
	}
	public String getQueSavePath() {
		return queSavePath;
	}
	
	public void setQueSavePath(String queSavePath) {
		this.queSavePath = queSavePath;
	}
	
	public Date getQueRegDate() {
		return queRegDate;
	}
	
	public void setQueRegDate(Date queRegDate) {
		this.queRegDate = queRegDate;
	}
	
	public String getQueResult() {
		return queResult;
	}
	
	public void setQueResult(String queResult) {
		this.queResult = queResult;
	}
	
	public String getQueFileName() {
		return queFileName;
	}

	public void setQueFileName(String queFileName) {
		this.queFileName = queFileName;
	}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Teachable [queDataIdx=" + queDataIdx + ", queCategory=" + queCategory + ", queSavePath=" + queSavePath
				+ ", queRegDate=" + queRegDate + ", queResult=" + queResult + ", queFileName=" + queFileName
				+ ", userId=" + userId + "]";
	}
	
}
