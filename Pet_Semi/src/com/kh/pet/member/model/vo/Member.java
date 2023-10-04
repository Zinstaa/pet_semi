package com.kh.pet.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int memberNo; // MEMBER_NO	NUMBER
	private String memberId; // MEMBER_ID	VARCHAR2(20 BYTE)
	private String memberPwd; // MEMBER_PWD	VARCHAR2(15 BYTE)
	private String memberName; // MEMBER_NAME	VARCHAR2(15 BYTE)
	private String email; // EMAIL	VARCHAR2(30 BYTE)
	private String phone; // PHONE	VARCHAR2(13 BYTE)
	private String nickName; // NICKNAME	VARCHAR2(20 BYTE)
	private String address; // ADDRESS	VARCHAR2(100 BYTE)
	private String age; // AGE	NUMBER
	private String gender; // GENDER	CHAR(1 BYTE)
	private Date enrollDate; // ENROLL_DATE	DATE
	private String status; // STATUS	CHAR(1 BYTE)
	
	
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", email=" + email + ", phone=" + phone + ", nickName=" + nickName + ", address="
				+ address + ", age=" + age + ", gender=" + gender + ", enrollDate=" + enrollDate + ", status=" + status
				+ "]";
	}

	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}


	public Member(int memberNo, String memberId, String memberPwd, String memberName, String email, String phone,
			String nickName, String address, String age, String gender, Date enrollDate, String status) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.email = email;
		this.phone = phone;
		this.nickName = nickName;
		this.address = address;
		this.age = age;
		this.gender = gender;
		this.enrollDate = enrollDate;
		this.status = status;
	}

	
	public Member(String memberId, String memberPwd, String memberName, String email, String phone, String nickName,
			String address, String age, String gender) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.email = email;
		this.phone = phone;
		this.nickName = nickName;
		this.address = address;
		this.age = age;
		this.gender = gender;
	}

	
	public Member() {
		super();
	}
	
}
