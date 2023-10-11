package com.kh.pet.notice.vo;

import java.sql.Date;

public class NoticeFile {
	private int noticeFileNo;	
	private String noticeFileOriginName;	
	private String noticeFileChangeName;	
	private String noticeFilePath;	
	private Date noticeFileUploadDate;	
	private int noticeFileLevel;	
	private String status;	
	private int noticeNo;
	public NoticeFile() {
		super();
	}
	public NoticeFile(int noticeFileNo, String noticeFileOriginName, String noticeFileChangeName, String noticeFilePath,
			Date noticeFileUploadDate, int noticeFileLevel, String status, int noticeNo) {
		super();
		this.noticeFileNo = noticeFileNo;
		this.noticeFileOriginName = noticeFileOriginName;
		this.noticeFileChangeName = noticeFileChangeName;
		this.noticeFilePath = noticeFilePath;
		this.noticeFileUploadDate = noticeFileUploadDate;
		this.noticeFileLevel = noticeFileLevel;
		this.status = status;
		this.noticeNo = noticeNo;
	}
	public int getNoticeFileNo() {
		return noticeFileNo;
	}
	public void setNoticeFileNo(int noticeFileNo) {
		this.noticeFileNo = noticeFileNo;
	}
	public String getNoticeFileOriginName() {
		return noticeFileOriginName;
	}
	public void setNoticeFileOriginName(String noticeFileOriginName) {
		this.noticeFileOriginName = noticeFileOriginName;
	}
	public String getNoticeFileChangeName() {
		return noticeFileChangeName;
	}
	public void setNoticeFileChangeName(String noticeFileChangeName) {
		this.noticeFileChangeName = noticeFileChangeName;
	}
	public String getNoticeFilePath() {
		return noticeFilePath;
	}
	public void setNoticeFilePath(String noticeFilePath) {
		this.noticeFilePath = noticeFilePath;
	}
	public Date getNoticeFileUploadDate() {
		return noticeFileUploadDate;
	}
	public void setNoticeFileUploadDate(Date noticeFileUploadDate) {
		this.noticeFileUploadDate = noticeFileUploadDate;
	}
	public int getNoticeFileLevel() {
		return noticeFileLevel;
	}
	public void setNoticeFileLevel(int noticeFileLevel) {
		this.noticeFileLevel = noticeFileLevel;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	@Override
	public String toString() {
		return "NoticeFile [noticeFileNo=" + noticeFileNo + ", noticeFileOriginName=" + noticeFileOriginName
				+ ", noticeFileChangeName=" + noticeFileChangeName + ", noticeFilePath=" + noticeFilePath
				+ ", noticeFileUploadDate=" + noticeFileUploadDate + ", noticeFileLevel=" + noticeFileLevel
				+ ", status=" + status + ", noticeNo=" + noticeNo + "]";
	}	
	
	
}
