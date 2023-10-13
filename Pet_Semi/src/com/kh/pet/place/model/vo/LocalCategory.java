package com.kh.pet.place.model.vo;

public class LocalCategory {
	private int localCategoryNo;
	private String localCategoryName;
	public LocalCategory() {
		super();
	}
	public LocalCategory(int localCategoryNo, String localCategoryName) {
		super();
		this.localCategoryNo = localCategoryNo;
		this.localCategoryName = localCategoryName;
	}
	public int getLocalCategoryNo() {
		return localCategoryNo;
	}
	public void setLocalCategoryNo(int localCategoryNo) {
		this.localCategoryNo = localCategoryNo;
	}
	public String getLocalCategoryName() {
		return localCategoryName;
	}
	public void setLocalCategoryName(String localCategoryName) {
		this.localCategoryName = localCategoryName;
	}
	@Override
	public String toString() {
		return "LocalCategory [localCategoryNo=" + localCategoryNo + ", localCategoryName=" + localCategoryName + "]";
	}
	
}
