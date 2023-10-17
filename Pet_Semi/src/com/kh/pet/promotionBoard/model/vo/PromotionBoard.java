package com.kh.pet.promotionBoard.model.vo;

import java.sql.Date;

public class PromotionBoard {
	
	private int promotionNo; //PROMOTION_NUMBER	NUMBER
	private String promotionTitle; //PROMOTION_TITLE	VARCHAR2(100 BYTE)
	private String promotionContent; //PROMOTION_CONTENT	VARCHAR2(4000 BYTE)
	private Date promotionDate; // PROMOTION_DATE	DATE
	private int promotionView; //PROMOTION_VIEW	NUMBER
	private String status; //STATUS	VARCHAR2(1 BYTE)
	private int agentNo; //AGENT_NO	NUMBER
	private String PromotionWriter; //
	private String titleImg;
	private String promotionEventDate;
	
	public PromotionBoard() {
		super();
	}
	public PromotionBoard(int promotionNo, String promotionTitle, String promotionContent, Date promotionDate,
			int promotionView, String status, int agentNo, String promotionWriter, String titleImg,
			String promotionEventDate) {
		super();
		this.promotionNo = promotionNo;
		this.promotionTitle = promotionTitle;
		this.promotionContent = promotionContent;
		this.promotionDate = promotionDate;
		this.promotionView = promotionView;
		this.status = status;
		this.agentNo = agentNo;
		PromotionWriter = promotionWriter;
		this.titleImg = titleImg;
		this.promotionEventDate = promotionEventDate;
	}
	public int getPromotionNo() {
		return promotionNo;
	}
	public void setPromotionNo(int promotionNo) {
		this.promotionNo = promotionNo;
	}
	public String getPromotionTitle() {
		return promotionTitle;
	}
	public void setPromotionTitle(String promotionTitle) {
		this.promotionTitle = promotionTitle;
	}
	public String getPromotionContent() {
		return promotionContent;
	}
	public void setPromotionContent(String promotionContent) {
		this.promotionContent = promotionContent;
	}
	public Date getPromotionDate() {
		return promotionDate;
	}
	public void setPromotionDate(Date promotionDate) {
		this.promotionDate = promotionDate;
	}
	public int getPromotionView() {
		return promotionView;
	}
	public void setPromotionView(int promotionView) {
		this.promotionView = promotionView;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getAgentNo() {
		return agentNo;
	}
	public void setAgentNo(int agentNo) {
		this.agentNo = agentNo;
	}
	public String getPromotionWriter() {
		return PromotionWriter;
	}
	public void setPromotionWriter(String promotionWriter) {
		PromotionWriter = promotionWriter;
	}
	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	public String getPromotionEventDate() {
		return promotionEventDate;
	}
	public void setPromotionEventDate(String promotionEventDate) {
		this.promotionEventDate = promotionEventDate;
	}
	@Override
	public String toString() {
		return "PromotionBoard [promotionNo=" + promotionNo + ", promotionTitle=" + promotionTitle
				+ ", promotionContent=" + promotionContent + ", promotionDate=" + promotionDate + ", promotionView="
				+ promotionView + ", status=" + status + ", agentNo=" + agentNo + ", PromotionWriter=" + PromotionWriter
				+ ", titleImg=" + titleImg + ", promotionEventDate=" + promotionEventDate + "]";
	}
	
	
	

	
	
	

	
	}
	
	
	
	


