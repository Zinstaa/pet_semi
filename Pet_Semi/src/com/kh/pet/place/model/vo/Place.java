package com.kh.pet.place.model.vo;

public class Place {
	private int placeNo; // PLACE_NO	NUMBER
	private String placeName; // PLACE_NAME	VARCHAR2(20 BYTE)
	private String placeAddress; // PLACE_ADDRESS	VARCHAR2(100 BYTE)
	private String placePhone; // PLACE_PHONE	VARCHAR2(13 BYTE)
	private String placeTimes; // PLACE_TIMES	VARCHAR2(30 BYTE)
	private String placeUrl; // PLACE_URL	VARCHAR2(100 BYTE)
	private String placeInfo; // PLACE_INFO	VARCHAR2(2000 BYTE)
	private String placeAround; // PLACE_AROUND	VARCHAR2(200 BYTE)
	private String placePrice; // PLACE_PRICE	VARCHAR2(30 BYTE)
	private String placeCaution; // PLACE_CAUTION	VARCHAR2(100 BYTE)
	private String placeMap; // PLACE_MAP	VARCHAR2(500 BYTE)
	private String placeStatus; // PLACE_STATUS	CHAR(1 BYTE)
	private String memberNo; // MEMBER_NO	NUMBER
	private int placeCategoryNo; // PLACE_CATEGORY_NO	NUMBER
	private int localCategoryNo; // LOCAL_CATEGORY_NO	NUMBER
	private String titleImg;
	
	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public Place() {
		super();
	}
	
	public Place(int placeNo, String placeName, String placeAddress, String placePhone,
			String placeTimes, String placeUrl, String placeInfo, String placeAround, String placePrice,
			String placeCaution, String placeMap, String placeStatus, String memberNo, int placeCategoryNo,
			int localCategoryNo) {
		super();
		this.placeNo = placeNo;
		this.placeName = placeName;
		this.placeAddress = placeAddress;
		this.placePhone = placePhone;
		this.placeTimes = placeTimes;
		this.placeUrl = placeUrl;
		this.placeInfo = placeInfo;
		this.placeAround = placeAround;
		this.placePrice = placePrice;
		this.placeCaution = placeCaution;
		this.placeMap = placeMap;
		this.placeStatus = placeStatus;
		this.memberNo = memberNo;
		this.placeCategoryNo = placeCategoryNo;
		this.localCategoryNo = localCategoryNo;
	}
	
	public int getPlaceNo() {
		return placeNo;
	}
	
	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}
	
	public String getPlaceName() {
		return placeName;
	}
	
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	
	public String getPlaceAddress() {
		return placeAddress;
	}
	
	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}
	
	public String getPlacePhone() {
		return placePhone;
	}
	
	public void setPlacePhone(String placePhone) {
		this.placePhone = placePhone;
	}
	
	public String getPlaceTimes() {
		return placeTimes;
	}
	
	public void setPlaceTimes(String placeTimes) {
		this.placeTimes = placeTimes;
	}
	
	public String getPlaceUrl() {
		return placeUrl;
	}
	
	public void setPlaceUrl(String placeUrl) {
		this.placeUrl = placeUrl;
	}
	
	public String getPlaceInfo() {
		return placeInfo;
	}
	
	public void setPlaceInfo(String placeInfo) {
		this.placeInfo = placeInfo;
	}
	
	public String getPlaceAround() {
		return placeAround;
	}
	
	public void setPlaceAround(String placeAround) {
		this.placeAround = placeAround;
	}
	
	public String getPlacePrice() {
		return placePrice;
	}
	
	public void setPlacePrice(String placePrice) {
		this.placePrice = placePrice;
	}
	
	public String getPlaceCaution() {
		return placeCaution;
	}
	
	public void setPlaceCaution(String placeCaution) {
		this.placeCaution = placeCaution;
	}
	
	public String getPlaceMap() {
		return placeMap;
	}
	
	public void setPlaceMap(String placeMap) {
		this.placeMap = placeMap;
	}
	
	public String getPlaceStatus() {
		return placeStatus;
	}
	
	public void setPlaceStatus(String placeStatus) {
		this.placeStatus = placeStatus;
	}
	
	public String getMemberNo() {
		return memberNo;
	}
	
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	
	public int getPlaceCategoryNo() {
		return placeCategoryNo;
	}
	
	public void setPlaceCategoryNo(int placeCategoryNo) {
		this.placeCategoryNo = placeCategoryNo;
	}
	
	public int getLocalCategoryNo() {
		return localCategoryNo;
	}
	
	public void setLocalCategoryNo(int localCategoryNo) {
		this.localCategoryNo = localCategoryNo;
	}
	
	public String toString() {
		return "Place [placeNo=" + placeNo + ", placeName=" + placeName
				+ ", placeAddress=" + placeAddress + ", placePhone=" + placePhone + ", placeTimes=" + placeTimes
				+ ", placeUrl=" + placeUrl + ", placeInfo=" + placeInfo + ", placeAround=" + placeAround
				+ ", placePrice=" + placePrice + ", placeCaution=" + placeCaution + ", placeMap=" + placeMap
				+ ", placeStatus=" + placeStatus + ", memberNo=" + memberNo + ", placeCategoryNo=" + placeCategoryNo
				+ ", localCategoryNo=" + localCategoryNo + "]";
	}
}
