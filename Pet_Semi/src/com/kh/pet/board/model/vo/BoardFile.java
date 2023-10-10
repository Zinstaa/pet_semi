package com.kh.pet.board.model.vo;

import java.sql.Date;

public class BoardFile {
	
	private int boardFileNo;
	private String boardFileOriginName;
	private String boardFileChangeName;
	private String boardfilePath;
	private Date BoardFileUploadDate;
	private int boardFileLevel;
	private String boardStatus;
	private int boardNo;
	public BoardFile() {
		super();
	}
	public BoardFile(int boardFileNo, String boardFileOriginName, String boardFileChangeName, String boardfilePath,
			Date boardFileUploadDate, int boardFileLevel, String boardStatus, int boardNo) {
		super();
		this.boardFileNo = boardFileNo;
		this.boardFileOriginName = boardFileOriginName;
		this.boardFileChangeName = boardFileChangeName;
		this.boardfilePath = boardfilePath;
		BoardFileUploadDate = boardFileUploadDate;
		this.boardFileLevel = boardFileLevel;
		this.boardStatus = boardStatus;
		this.boardNo = boardNo;
	}
	public int getBoardFileNo() {
		return boardFileNo;
	}
	public void setBoardFileNo(int boardFileNo) {
		this.boardFileNo = boardFileNo;
	}
	public String getBoardFileOriginName() {
		return boardFileOriginName;
	}
	public void setBoardFileOriginName(String boardFileOriginName) {
		this.boardFileOriginName = boardFileOriginName;
	}
	public String getBoardFileChangeName() {
		return boardFileChangeName;
	}
	public void setBoardFileChangeName(String boardFileChangeName) {
		this.boardFileChangeName = boardFileChangeName;
	}
	public String getBoardfilePath() {
		return boardfilePath;
	}
	public void setBoardfilePath(String boardfilePath) {
		this.boardfilePath = boardfilePath;
	}
	public Date getBoardFileUploadDate() {
		return BoardFileUploadDate;
	}
	public void setBoardFileUploadDate(Date boardFileUploadDate) {
		BoardFileUploadDate = boardFileUploadDate;
	}
	public int getBoardFileLevel() {
		return boardFileLevel;
	}
	public void setBoardFileLevel(int boardFileLevel) {
		this.boardFileLevel = boardFileLevel;
	}
	public String getBoardStatus() {
		return boardStatus;
	}
	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	@Override
	public String toString() {
		return "BoardFile [boardFileNo=" + boardFileNo + ", boardFileOriginName=" + boardFileOriginName
				+ ", boardFileChangeName=" + boardFileChangeName + ", boardfilePath=" + boardfilePath
				+ ", BoardFileUploadDate=" + BoardFileUploadDate + ", boardFileLevel=" + boardFileLevel
				+ ", boardStatus=" + boardStatus + ", boardNo=" + boardNo + "]";
	}
	
	
}
