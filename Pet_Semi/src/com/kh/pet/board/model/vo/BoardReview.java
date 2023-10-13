package com.kh.pet.board.model.vo;

import java.sql.Date;

public class BoardReview {
	
	private int boardReviewNo;
	private String boardReviewContent;
	private int boardNo;
	private String boardReviewWriter;
	private Date boardReviewDate;
	private String boardReviewStatus;
	public BoardReview() {
		super();
	}
	public BoardReview(int boardReviewNo, String boardReviewContent, int boardNo, String boardReviewWriter,
			Date boardReviewDate, String boardReviewStatus) {
		super();
		this.boardReviewNo = boardReviewNo;
		this.boardReviewContent = boardReviewContent;
		this.boardNo = boardNo;
		this.boardReviewWriter = boardReviewWriter;
		this.boardReviewDate = boardReviewDate;
		this.boardReviewStatus = boardReviewStatus;
	}
	public int getBoardReviewNo() {
		return boardReviewNo;
	}
	public String getBoardReviewContent() {
		return boardReviewContent;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public String getBoardReviewWriter() {
		return boardReviewWriter;
	}
	public Date getBoardReviewDate() {
		return boardReviewDate;
	}
	public String getBoardReviewStatus() {
		return boardReviewStatus;
	}
	@Override
	public String toString() {
		return "BoardReview [boardReviewNo=" + boardReviewNo + ", boardReviewContent=" + boardReviewContent
				+ ", boardNo=" + boardNo + ", boardReviewWriter=" + boardReviewWriter + ", boardReviewDate="
				+ boardReviewDate + ", boardReviewStatus=" + boardReviewStatus + "]";
	}
	
	

}
