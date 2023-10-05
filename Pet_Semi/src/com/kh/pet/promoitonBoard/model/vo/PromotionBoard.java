package com.kh.pet.promoitonBoard.model.vo;

import java.sql.Date;

public class PromotionBoard {
	
	private int promotionNumber; //PROMOTION_NUMBER	NUMBER
	private String promotionTitle; //PROMOTION_TITLE	VARCHAR2(100 BYTE)
	private String promotionContent; //PROMOTION_CONTENT	VARCHAR2(4000 BYTE)
	private Date promotionDate; //PROMOTION_DATE	DATE
	private int promotionView; //PROMOTION_VIEW	NUMBER
	private String status; //STATUS	VARCHAR2(1 BYTE)
	private Date eventStartDate; //EVENT_START_DATE	DATE
	private Date eventFinishDate; //EVENT_FINISH_DATE	DATE
	private int agentNo; //AGENT_NO	NUMBER
	
	public PromotionBoard() {
		super();
	}

	public PromotionBoard(int promotionNumber, String promotionTitle, String promotionContent, Date promotionDate,
			int promotionView, String status, Date eventStartDate, Date eventFinishDate, int agentNo) {
		super();
		this.promotionNumber = promotionNumber;
		this.promotionTitle = promotionTitle;
		this.promotionContent = promotionContent;
		this.promotionDate = promotionDate;
		this.promotionView = promotionView;
		this.status = status;
		this.eventStartDate = eventStartDate;
		this.eventFinishDate = eventFinishDate;
		this.agentNo = agentNo;
	}

	public int getPromotionNumber() {
		return promotionNumber;
	}

	public void setPromotionNumber(int promotionNumber) {
		this.promotionNumber = promotionNumber;
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

	public Date getEventStartDate() {
		return eventStartDate;
	}

	public void setEventStartDate(Date eventStartDate) {
		this.eventStartDate = eventStartDate;
	}

	public Date getEventFinishDate() {
		return eventFinishDate;
	}

	public void setEventFinishDate(Date eventFinishDate) {
		this.eventFinishDate = eventFinishDate;
	}

	public int getAgentNo() {
		return agentNo;
	}

	public void setAgentNo(int agentNo) {
		this.agentNo = agentNo;
	}

	@Override
	public String toString() {
		return "PromotionBoard [promotionNumber=" + promotionNumber + ", promotionTitle=" + promotionTitle
				+ ", promotionContent=" + promotionContent + ", promotionDate=" + promotionDate + ", promotionView="
				+ promotionView + ", status=" + status + ", eventStartDate=" + eventStartDate + ", eventFinishDate="
				+ eventFinishDate + ", agentNo=" + agentNo + "]";
	}
	
	
	
	

}
