package com.kh.eyes.voice.model.vo;

public class Voice {
	private String voiceSyId;
	private String voiceSyLength;
	private String voiceSyText;
	private String queDataIdx;
	
	public String getVoiceSyId() {
		return voiceSyId;
	}
	
	public void setVoiceSyId(String voiceSyId) {
		this.voiceSyId = voiceSyId;
	}
	
	public String getVoiceSyLength() {
		return voiceSyLength;
	}
	
	public void setVoiceSyLength(String voiceSyLength) {
		this.voiceSyLength = voiceSyLength;
	}
	
	public String getVoiceSyText() {
		return voiceSyText;
	}
	
	public void setVoiceSyText(String voiceSyText) {
		this.voiceSyText = voiceSyText;
	}
	
	public String getQueDataIdx() {
		return queDataIdx;
	}
	
	public void setQueDataIdx(String queDataIdx) {
		this.queDataIdx = queDataIdx;
	}
	
	@Override
	public String toString() {
		return "Voice [voiceSyId=" + voiceSyId + ", voiceSyLength=" + voiceSyLength + ", voiceSyText=" + voiceSyText
				+ ", queDataIdx=" + queDataIdx + "]";
	}
	
}
