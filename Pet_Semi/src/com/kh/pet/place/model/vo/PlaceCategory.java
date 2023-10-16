package com.kh.pet.place.model.vo;

public class PlaceCategory {
	private int placeCategoryNo;
	private String placeCategoryName;
	public PlaceCategory() {
		super();
	}
	public PlaceCategory(int placeCategoryNo, String placeCategoryName) {
		super();
		this.placeCategoryNo = placeCategoryNo;
		this.placeCategoryName = placeCategoryName;
	}
	public int getPlaceCategoryNo() {
		return placeCategoryNo;
	}
	public void setPlaceCategoryNo(int placeCategoryNo) {
		this.placeCategoryNo = placeCategoryNo;
	}
	public String getPlaceCategoryName() {
		return placeCategoryName;
	}
	public void setPlaceCategoryName(String placeCategoryName) {
		this.placeCategoryName = placeCategoryName;
	}
	@Override
	public String toString() {
		return "PlaceCategory [placeCategoryNo=" + placeCategoryNo + ", placeCategoryName=" + placeCategoryName + "]";
	}
	
}
