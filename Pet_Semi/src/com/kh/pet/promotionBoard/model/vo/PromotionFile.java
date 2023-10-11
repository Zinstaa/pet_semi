package com.kh.pet.promotionBoard.model.vo;

public class PromotionFile {
	
	private int promotionFile; // PROMOTION_FILE_NO	NUMBER
	private String promotionFileOriginName; //PROMOTION_FILE_ORIGIN_NAME	VARCHAR2(100 BYTE)
	private String promotionFileChangeName; //PROMOTION_FILE_CHANGE_NAME	VARCHAR2(100 BYTE)
	private String promotionFilePath; //PROMOTION_FILE_PATH	VARCHAR2(100 BYTE)
	private String promotionFileUploadDate; //PROMOTION_FILE_UPLOAD_DATE	DATE
	private int promotionFileLevel; //PROMOTION_FILE_LEVEL	NUMBER
	private String status; //STATUS	VARCHAR2(1 BYTE)
	private int promotionNumber; //PROMOTION_NUMBER	NUMBER
	
	public PromotionFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PromotionFile(int promotionFile, String promotionFileOriginName, String promotionFileChangeName,
			String promotionFilePath, String promotionFileUploadDate, int promotionFileLevel, String status,
			int promotionNumber) {
		super();
		this.promotionFile = promotionFile;
		this.promotionFileOriginName = promotionFileOriginName;
		this.promotionFileChangeName = promotionFileChangeName;
		this.promotionFilePath = promotionFilePath;
		this.promotionFileUploadDate = promotionFileUploadDate;
		this.promotionFileLevel = promotionFileLevel;
		this.status = status;
		this.promotionNumber = promotionNumber;
	}

	public int getPromotionFile() {
		return promotionFile;
	}

	public void setPromotionFile(int promotionFile) {
		this.promotionFile = promotionFile;
	}

	public String getPromotionFileOriginName() {
		return promotionFileOriginName;
	}

	public void setPromotionFileOriginName(String promotionFileOriginName) {
		this.promotionFileOriginName = promotionFileOriginName;
	}

	public String getPromotionFileChangeName() {
		return promotionFileChangeName;
	}

	public void setPromotionFileChangeName(String promotionFileChangeName) {
		this.promotionFileChangeName = promotionFileChangeName;
	}

	public String getPromotionFilePath() {
		return promotionFilePath;
	}

	public void setPromotionFilePath(String promotionFilePath) {
		this.promotionFilePath = promotionFilePath;
	}

	public String getPromotionFileUploadDate() {
		return promotionFileUploadDate;
	}

	public void setPromotionFileUploadDate(String promotionFileUploadDate) {
		this.promotionFileUploadDate = promotionFileUploadDate;
	}

	public int getPromotionFileLevel() {
		return promotionFileLevel;
	}

	public void setPromotionFileLevel(int promotionFileLevel) {
		this.promotionFileLevel = promotionFileLevel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPromotionNumber() {
		return promotionNumber;
	}

	public void setPromotionNumber(int promotionNumber) {
		this.promotionNumber = promotionNumber;
	}

	@Override
	public String toString() {
		return "PromotionFile [promotionFile=" + promotionFile + ", promotionFileOriginName=" + promotionFileOriginName
				+ ", promotionFileChangeName=" + promotionFileChangeName + ", promotionFilePath=" + promotionFilePath
				+ ", promotionFileUploadDate=" + promotionFileUploadDate + ", promotionFileLevel=" + promotionFileLevel
				+ ", status=" + status + ", promotionNumber=" + promotionNumber + "]";
	}
	
	

	

	}
	
	
	
	

	

	
	

