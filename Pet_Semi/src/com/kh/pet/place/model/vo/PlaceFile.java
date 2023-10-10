package com.kh.pet.place.model.vo;

public class PlaceFile {
	private int placeFileNo; //PLACE_FILE_NO	NUMBER
	private String placeFileOriginName; //PLACE_FILE_ORIGIN_NAME	VARCHAR2(100 BYTE)
	private String placeFileChangeName; //PLACE_FILE_CHANGE_NAME	VARCHAR2(100 BYTE)
	private String placeFilePath; //PLACE_FILE_PATH	VARCHAR2(100 BYTE)
	private String placeFileUploadDate; //PLACE_FILE_UPLOAD_DATE	DATE
	private int placeFileLevel; //PLACE_FILE_LEVEL	NUMBER
	private String status; //STATUS	VARCHAR2(1 BYTE)
	private int placeNo; //OPLACE_NO	NUMBER
		
	public PlaceFile() {
		super();
	}
	
	public PlaceFile(int placeFileNo, String placeFileOriginName, String placeFileChangeName, String placeFilePath,
			String placeFileUploadDate, int placeFileLevel, String status, int placeNo) {
		super();
		this.placeFileNo = placeFileNo;
		this.placeFileOriginName = placeFileOriginName;
		this.placeFileChangeName = placeFileChangeName;
		this.placeFilePath = placeFilePath;
		this.placeFileUploadDate = placeFileUploadDate;
		this.placeFileLevel = placeFileLevel;
		this.status = status;
		this.placeNo = placeNo;
	}
	
	public int getPlaceFileNo() {
		return placeFileNo;
	}
	
	public void setPlaceFileNo(int placeFileNo) {
		this.placeFileNo = placeFileNo;
	}
	
	public String getPlaceFileOriginName() {
		return placeFileOriginName;
	}
	
	public void setPlaceFileOriginName(String placeFileOriginName) {
		this.placeFileOriginName = placeFileOriginName;
	}
	
	public String getPlaceFileChangeName() {
		return placeFileChangeName;
	}
	
	public void setPlaceFileChangeName(String placeFileChangeName) {
		this.placeFileChangeName = placeFileChangeName;
	}
	
	public String getPlaceFilePath() {
		return placeFilePath;
	}
	
	public void setPlaceFilePath(String placeFilePath) {
		this.placeFilePath = placeFilePath;
	}
	
	public String getPlaceFileUploadDate() {
		return placeFileUploadDate;
	}
	
	public void setPlaceFileUploadDate(String placeFileUploadDate) {
		this.placeFileUploadDate = placeFileUploadDate;
	}
	
	public int getPlaceFileLevel() {
		return placeFileLevel;
	}
	
	public void setPlaceFileLevel(int placeFileLevel) {
		this.placeFileLevel = placeFileLevel;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getPlaceNo() {
		return placeNo;
	}
	
	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}
	
	@Override
	public String toString() {
		return "PlaceFile [placeFileNo=" + placeFileNo + ", placeFileOriginName=" + placeFileOriginName
				+ ", placeFileChangeName=" + placeFileChangeName + ", placeFilePath=" + placeFilePath
				+ ", placeFileUploadDate=" + placeFileUploadDate + ", placeFileLevel=" + placeFileLevel + ", status="
				+ status + ", placeNo=" + placeNo + "]";
	}
}
