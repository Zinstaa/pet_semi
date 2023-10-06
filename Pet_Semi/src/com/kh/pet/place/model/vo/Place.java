package com.kh.pet.place.model.vo;

public class Place {
	private int placeNo; // PLACE_NO	NUMBER
	private String placePhoto; // PLACE_PHOTO	VARCHAR2(500 BYTE)
	private String placeName; // PLACE_NAME	VARCHAR2(20 BYTE)
	private String placeAddress; // PLACE_ADDRESS	VARCHAR2(100 BYTE)
	private String placePhone; // PLACE_PHONE	VARCHAR2(13 BYTE)
	private String placrTimes; // PLACE_TIMES	VARCHAR2(30 BYTE)
	private String placeUrl; // PLACE_URL	VARCHAR2(100 BYTE)
	private String placeInfo; // PLACE_INFO	VARCHAR2(2000 BYTE)
	private String placeAround; // PLACE_AROUND	VARCHAR2(200 BYTE)
	private String placePrice; // PLACE_PRICE	VARCHAR2(30 BYTE)
	private String placeCaution; // PLACE_CAUTION	VARCHAR2(100 BYTE)
	private String placeMap; // PLACE_MAP	VARCHAR2(500 BYTE)
	private String placAtatus; // PLACE_STATUS	CHAR(1 BYTE)
	private int memberNo; // MEMBER_NO	NUMBER
	private int placeCategoryNo; // PLACE_CATEGORY_NO	NUMBER
	private int localCategoryNo; // LOCAL_CATEGORY_NO	NUMBER
	public Place() {
		super();
	}
	
	public Place(int placeNo, String placePhoto, String placeName, String placeAddress, String placePhone,
			String placrTimes, String placeUrl, String placeInfo, String placeAround, String placePrice,
			String placeCaution, String placeMap, String placAtatus, int memberNo, int placeCategoryNo,
			int localCategoryNo) {
		super();
		this.placeNo = placeNo;
		this.placePhoto = placePhoto;
		this.placeName = placeName;
		this.placeAddress = placeAddress;
		this.placePhone = placePhone;
		this.placrTimes = placrTimes;
		this.placeUrl = placeUrl;
		this.placeInfo = placeInfo;
		this.placeAround = placeAround;
		this.placePrice = placePrice;
		this.placeCaution = placeCaution;
		this.placeMap = placeMap;
		this.placAtatus = placAtatus;
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
	
	public String getPlacePhoto() {
		return placePhoto;
	}

	public void setPlacePhoto(String placePhoto) {
		this.placePhoto = placePhoto;
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
	
	public String getPlacrTimes() {
		return placrTimes;
	}
	
	public void setPlacrTimes(String placrTimes) {
		this.placrTimes = placrTimes;
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
	
	public String getPlacAtatus() {
		return placAtatus;
	}
	
	public void setPlacAtatus(String placAtatus) {
		this.placAtatus = placAtatus;
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	
	public void setMemberNo(int memberNo) {
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
		return "Place [placeNo=" + placeNo + ", placePhoto=" + placePhoto + ", placeName=" + placeName
				+ ", placeAddress=" + placeAddress + ", placePhone=" + placePhone + ", placrTimes=" + placrTimes
				+ ", placeUrl=" + placeUrl + ", placeInfo=" + placeInfo + ", placeAround=" + placeAround
				+ ", placePrice=" + placePrice + ", placeCaution=" + placeCaution + ", placeMap=" + placeMap
				+ ", placAtatus=" + placAtatus + ", memberNo=" + memberNo + ", placeCategoryNo=" + placeCategoryNo
				+ ", localCategoryNo=" + localCategoryNo + "]";
	}
}
