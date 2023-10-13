package com.kh.pet.member.model.vo;

public class FindId {
	
	private String MemberId;
	private String email;
	private String phone;
	
	
	
	@Override
	public String toString() {
		return MemberId ;
	}

	public String getMemberId() {
		return MemberId;
	}

	public void setMemberId(String memberId) {
		MemberId = memberId;
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

	public FindId(String memberId, String email, String phone) {
		super();
		MemberId = memberId;
		this.email = email;
		this.phone = phone;
	}

	public FindId() {
		super();
	}
	
	
	

}
