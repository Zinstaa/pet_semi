package com.kh.pet.member.model.vo;

public class FindPwd {
	
	private String MemberId;
	private String MemberPwd;
	private String email;
	private String phone;
	@Override
	public String toString() {
		return MemberPwd;
	}
	public String getMemberId() {
		return MemberId;
	}
	public void setMemberId(String memberId) {
		MemberId = memberId;
	}
	public String getMemberPwd() {
		return MemberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		MemberPwd = memberPwd;
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
	public FindPwd() {
		super();
	}
	public FindPwd(String memberId, String memberPwd, String email, String phone) {
		super();
		MemberId = memberId;
		MemberPwd = memberPwd;
		this.email = email;
		this.phone = phone;
	}
}
