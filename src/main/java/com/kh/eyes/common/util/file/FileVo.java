package com.kh.eyes.common.util.file;

import java.sql.Date;

import com.kh.eyes.common.code.Code;

public class FileVo {
	
	private int fIdx;
	private String fTypeIdx;
	private String fOriginName;
	private String fReName;
	private String fSavePath;
	private Date fRegDate;
	private int fIsDel;
	
	public String getFullPath() {
		return Code.UPLOAD + fSavePath;
	}

	public int getfIdx() {
		return fIdx;
	}

	public void setfInx(int fIdx) {
		this.fIdx = fIdx;
	}

	public String getfTypeIdx() {
		return fTypeIdx;
	}

	public void setfTypeIdx(String fTypeIdx) {
		this.fTypeIdx = fTypeIdx;
	}

	public String getfOriginName() {
		return fOriginName;
	}

	public void setfOriginName(String fOriginName) {
		this.fOriginName = fOriginName;
	}

	public String getfReName() {
		return fReName;
	}

	public void setfReName(String fReName) {
		this.fReName = fReName;
	}

	public String getfSavePath() {
		return fSavePath;
	}

	public void setfSavePath(String fSavePath) {
		this.fSavePath = fSavePath;
	}

	public Date getfRegDate() {
		return fRegDate;
	}

	public void setfRegDate(Date fRegDate) {
		this.fRegDate = fRegDate;
	}

	public int getfIsDel() {
		return fIsDel;
	}

	public void setfIsDel(int fIsDel) {
		this.fIsDel = fIsDel;
	}

	@Override
	public String toString() {
		return "FileVo [fIdx=" + fIdx + ", fTypeIdx=" + fTypeIdx + ", fOriginName=" + fOriginName + ", fReName="
				+ fReName + ", fSavePath=" + fSavePath + ", fRegDate=" + fRegDate + ", fIsDel=" + fIsDel + "]";
	}
	
}
