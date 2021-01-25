package com.kgu.www.vo;

public class BoardCommentVO {
	private int contentNum;
	private int FBC_seq;
	private String id;
	private String nickname;
	private String fbComment;
	private String regDate;
	private String commentPW;
	
	public BoardCommentVO() {}
	public BoardCommentVO(int contentNum, String id, String nickname, String fbComment, String regDate, String commentPW) {
		this.contentNum = contentNum;
		this.id = id;
		this.nickname = nickname;
		this.fbComment = fbComment;
		this.regDate = regDate;
		this.commentPW = commentPW;
	}
	
	
	public int getContentNum() {
		return contentNum;
	}
	public void setContentNum(int contentNum) {
		this.contentNum = contentNum;
	}
	public int getFBC_seq() {
		return FBC_seq;
	}
	public void setFBC_seq(int fBC_seq) {
		FBC_seq = fBC_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getFbComment() {
		return fbComment;
	}
	public void setFbComment(String fbComment) {
		this.fbComment = fbComment;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getCommentPW() {
		return commentPW;
	}
	public void setCommentPW(String commentPW) {
		this.commentPW = commentPW;
	}
}
