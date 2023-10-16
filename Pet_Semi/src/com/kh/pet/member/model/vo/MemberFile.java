package com.kh.pet.member.model.vo;

import java.sql.Date;

public class MemberFile {
	
	private int memberFileNo;
	private String memberFileOriginName;
	private String memberFileChangeName;
	private String memberFilePath;
	private Date memberFileUploadDate;
	private int memberFileLevel;
	private String status;
	private int dogNo;
	
	public MemberFile() {
		super();
	}
	
	public MemberFile(int memberFileNo, String memberFileOriginName, String memberFileChangeName, String memberFilePath,
			Date memberFileUploadDate, int memberFileLevel, String status, int dogNo) {
		super();
		this.memberFileNo = memberFileNo;
		this.memberFileOriginName = memberFileOriginName;
		this.memberFileChangeName = memberFileChangeName;
		this.memberFilePath = memberFilePath;
		this.memberFileUploadDate = memberFileUploadDate;
		this.memberFileLevel = memberFileLevel;
		this.status = status;
		this.dogNo = dogNo;
	}
	
	public int getMemberFileNo() {
		return memberFileNo;
	}
	public void setMemberFileNo(int memberFileNo) {
		this.memberFileNo = memberFileNo;
	}
	public String getMemberFileOriginName() {
		return memberFileOriginName;
	}
	public void setMemberFileOriginName(String memberFileOriginName) {
		this.memberFileOriginName = memberFileOriginName;
	}
	public String getMemberFileChangeName() {
		return memberFileChangeName;
	}
	public void setMemberFileChangeName(String memberFileChangeName) {
		this.memberFileChangeName = memberFileChangeName;
	}
	public String getMemberFilePath() {
		return memberFilePath;
	}
	public void setMemberFilePath(String memberFilePath) {
		this.memberFilePath = memberFilePath;
	}
	public Date getMemberFileUploadDate() {
		return memberFileUploadDate;
	}
	public void setMemberFileUploadDate(Date memberFileUploadDate) {
		this.memberFileUploadDate = memberFileUploadDate;
	}
	public int getMemberFileLevel() {
		return memberFileLevel;
	}
	public void setMemberFileLevel(int memberFileLevel) {
		this.memberFileLevel = memberFileLevel;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getDogNo() {
		return dogNo;
	}
	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}
	
	@Override
	public String toString() {
		return "MemberFile [memberFileNo=" + memberFileNo + ", memberFileOriginName=" + memberFileOriginName
				+ ", memberFileChangeName=" + memberFileChangeName + ", memberFilePath=" + memberFilePath
				+ ", memberFileUploadDate=" + memberFileUploadDate + ", memberFileLevel=" + memberFileLevel
				+ ", status=" + status + ", dogNo=" + dogNo + "]";
	}
	
	 
}
