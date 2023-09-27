package com.kh.pet.board.model.vo;

import java.sql.Date;

public class Board {
	
	private int boardNo;
	private String boardName;
	private String boardContent;
	private Date boardDate; 
	private int boardView;
	private String status;
	private int memberNo;
	
	public Board() {
		super();
	}
	
	public Board(int boardNo, String boardName, String boardContent, Date boardDate, int boardView, String status,
			int memberNo) {
		super();
		this.boardNo = boardNo;
		this.boardName = boardName;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardView = boardView;
		this.status = status;
		this.memberNo = memberNo;
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardView() {
		return boardView;
	}
	public void setBoardView(int boardView) {
		this.boardView = boardView;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardName=" + boardName + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", boardView=" + boardView + ", status=" + status + ", memberNo="
				+ memberNo + "]";
	}
	
	
	
	
	
	
	
	
	
	

}
