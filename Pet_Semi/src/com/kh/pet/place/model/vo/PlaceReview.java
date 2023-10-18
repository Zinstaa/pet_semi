package com.kh.pet.place.model.vo;

public class PlaceReview {
	private int placeReviewNo; // PLACE_REVIEW_NO	NUMBER
	private String placeReviewDate; //PLACE_REVIEW_DATE	VARCHAR2(20 BYTE)
	private String placeReviewModidate; //PLACE_REVIEW_MODIDATE	VARCHAR2(20 BYTE)
	private String placeReviewContent; //PLACE_REVIEW_CONTENT	VARCHAR2(500 BYTE)
	private String placeReviewStatus; //PLACE_REVIEW_STATUS	CHAR(1 BYTE)
	private String placeReviewWriter; //PLACE_REVIEW_WRITER	VARCHAR2(20 BYTE)
	private int placeNo; //PLACE_NO	NUMBER
	
	public PlaceReview() {
		super();
	}
	
	public PlaceReview(int placeReviewNo, String placeReviewDate, String placeReviewContent, String placeReviewWriter) {
		super();
		this.placeReviewNo = placeReviewNo;
		this.placeReviewDate = placeReviewDate;
		this.placeReviewContent = placeReviewContent;
		this.placeReviewWriter = placeReviewWriter;
	}

	public PlaceReview(int placeReviewNo, String placeReviewDate, String placeReviewModidate, String placeReviewContent,
			String placeReviewStatus, String placeReviewWriter, int placeNo) {
		super();
		this.placeReviewNo = placeReviewNo;
		this.placeReviewDate = placeReviewDate;
		this.placeReviewModidate = placeReviewModidate;
		this.placeReviewContent = placeReviewContent;
		this.placeReviewStatus = placeReviewStatus;
		this.placeReviewWriter = placeReviewWriter;
		this.placeNo = placeNo;
	}
	public int getPlaceReviewNo() {
		return placeReviewNo;
	}
	public void setPlaceReviewNo(int placeReviewNo) {
		this.placeReviewNo = placeReviewNo;
	}
	public String getPlaceReviewDate() {
		return placeReviewDate;
	}
	public void setPlaceReviewDate(String placeReviewDate) {
		this.placeReviewDate = placeReviewDate;
	}
	public String getPlaceReviewModidate() {
		return placeReviewModidate;
	}
	public void setPlaceReviewModidate(String placeReviewModidate) {
		this.placeReviewModidate = placeReviewModidate;
	}
	public String getPlaceReviewContent() {
		return placeReviewContent;
	}
	public void setPlaceReviewContent(String placeReviewContent) {
		this.placeReviewContent = placeReviewContent;
	}
	public String getPlaceReviewStatus() {
		return placeReviewStatus;
	}
	public void setPlaceReviewStatus(String placeReviewStatus) {
		this.placeReviewStatus = placeReviewStatus;
	}
	public String getPlaceReviewWriter() {
		return placeReviewWriter;
	}
	public void setPlaceReviewWriter(String placeReviewWriter) {
		this.placeReviewWriter = placeReviewWriter;
	}
	public int getPlaceNo() {
		return placeNo;
	}
	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}
	@Override
	public String toString() {
		return "PlaceReview [placeReviewNo=" + placeReviewNo + ", placeReviewDate=" + placeReviewDate
				+ ", placeReviewModidate=" + placeReviewModidate + ", placeReviewContent=" + placeReviewContent
				+ ", placeReviewStatus=" + placeReviewStatus + ", placeReviewWriter=" + placeReviewWriter + ", placeNo="
				+ placeNo + "]";
	}
}
