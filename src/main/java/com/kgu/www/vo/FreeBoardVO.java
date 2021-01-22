package com.kgu.www.vo;

public class FreeBoardVO {
	private int FBN_seq;
	private String type;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private int hit;
	private int commentCnt;
	
	
	public int getFBN_seq() {
		return FBN_seq;
	}
	public void setFBN_seq(int fBN_seq) {
		FBN_seq = fBN_seq;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
}
