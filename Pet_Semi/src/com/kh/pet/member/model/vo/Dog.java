package com.kh.pet.member.model.vo;

public class Dog {
	
	private int dogNo;
	private String dogName;
	private String dogKind;
	private String dogAge;
	private String photh;
	private String memberNo;
	
	public Dog(int dogNo, String dogName, String dogKind, String dogAge, String photh, String memberNo) {
		super();
		this.dogNo = dogNo;
		this.dogName = dogName;
		this.dogKind = dogKind;
		this.dogAge = dogAge;
		this.photh = photh;
		this.memberNo = memberNo;
	}
	public Dog() {
		super();
	}
	
	public int getDogNo() {
		return dogNo;
	}
	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}
	public String getDogName() {
		return dogName;
	}
	public void setDogName(String dogName) {
		this.dogName = dogName;
	}
	public String getDogKind() {
		return dogKind;
	}
	public void setDogKind(String dogKind) {
		this.dogKind = dogKind;
	}
	public String getDogAge() {
		return dogAge;
	}
	public void setDogAge(String dogAge) {
		this.dogAge = dogAge;
	}
	public String getPhoth() {
		return photh;
	}
	public void setPhoth(String photh) {
		this.photh = photh;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "Dog [dogNo=" + dogNo + ", dogName=" + dogName + ", dogKind=" + dogKind + ", dogAge=" + dogAge
				+ ", photh=" + photh + ", memberNo=" + memberNo + "]";
	}
}
