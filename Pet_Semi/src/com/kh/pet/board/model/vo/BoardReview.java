package com.kh.pet.board.model.vo;

import java.sql.Date;

public class BoardReview {
	
	private int boardReviewNo;
	private String boardReviewContent;
	private int boardNo;
	private String boardReviewWriter;
	private String boardReviewDate;
	private String boardReviewStatus;
	
	public BoardReview() {
		super();
	}
	
	public BoardReview(int boardReviewNo, String boardReviewContent, String boardReviewWriter, String boardReviewDate) {
		super();
		this.boardReviewNo = boardReviewNo;
		this.boardReviewContent = boardReviewContent;
		this.boardReviewWriter = boardReviewWriter;
		this.boardReviewDate = boardReviewDate;
	}



	public BoardReview(int boardReviewNo, String boardReviewContent, int boardNo, String boardReviewWriter,
			String boardReviewDate, String boardReviewStatus) {
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

	public void setBoardReviewNo(int boardReviewNo) {
		this.boardReviewNo = boardReviewNo;
	}

	public String getBoardReviewContent() {
		return boardReviewContent;
	}

	public void setBoardReviewContent(String boardReviewContent) {
		this.boardReviewContent = boardReviewContent;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardReviewWriter() {
		return boardReviewWriter;
	}

	public void setBoardReviewWriter(String boardReviewWriter) {
		this.boardReviewWriter = boardReviewWriter;
	}

	public String getBoardReviewDate() {
		return boardReviewDate;
	}

	public void setBoardReviewDate(String boardReviewDate) {
		this.boardReviewDate = boardReviewDate;
	}

	public String getBoardReviewStatus() {
		return boardReviewStatus;
	}

	public void setBoardReviewStatus(String boardReviewStatus) {
		this.boardReviewStatus = boardReviewStatus;
	}

	@Override
	public String toString() {
		return "BoardReview [boardReviewNo=" + boardReviewNo + ", boardReviewContent=" + boardReviewContent
				+ ", boardNo=" + boardNo + ", boardReviewWriter=" + boardReviewWriter + ", boardReviewDate="
				+ boardReviewDate + ", boardReviewStatus=" + boardReviewStatus + "]";
	}
	
	

}
