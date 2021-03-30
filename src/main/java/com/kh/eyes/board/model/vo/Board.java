package com.kh.eyes.board.model.vo;

import java.sql.Date;

public class Board {
	
	private String sugIdx;
	private String sugTitle;
	private String sugContent;
	private Date sugRegDate;
	private int sugIsDel;
	private String userId;
	
	public String getSugIdx() {
		return sugIdx;
	}
	
	public void setSugIdx(String sugIdx) {
		this.sugIdx = sugIdx;
	}
	
	public String getSugTitle() {
		return sugTitle;
	}
	
	public void setSugTitle(String sugTitle) {
		this.sugTitle = sugTitle;
	}
	
	public String getSugContent() {
		return sugContent;
	}
	
	public void setSugContent(String sugContent) {
		this.sugContent = sugContent;
	}
	
	public Date getSugRegDate() {
		return sugRegDate;
	}
	
	public void setSugRegDate(Date sugRegDate) {
		this.sugRegDate = sugRegDate;
	}
	
	public int getSugIsDel() {
		return sugIsDel;
	}
	
	public void setSugIsDel(int sugIsDel) {
		this.sugIsDel = sugIsDel;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "Board [sugIdx=" + sugIdx + ", sugTitle=" + sugTitle + ", sugContent=" + sugContent + ", sugRegDate="
				+ sugRegDate + ", sugIsDel=" + sugIsDel + ", userId=" + userId + "]";
	}
	
}