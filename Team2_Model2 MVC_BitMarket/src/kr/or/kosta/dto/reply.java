package kr.or.kosta.dto;

import java.sql.Date;

public class reply {
	private int no;       //자동증가 sequence 객체사용 :reply_no
	private String writer;
	private String userid;
	private String pwd;
	private String content;
	private String writedate;
	private int idx_fk; //참조제약 (FK) > jspboard 테이블(idx)
	
	public reply(){}
	public reply(int no , String writer , String userid , String pwd ,
			    String content , String writedate , int idx_fk){
		this.no = no;
		this.writer = writer;
		this.userid = userid;
		this.pwd = pwd;
		this.content = content;
		this.writedate = writedate;
		this.idx_fk = idx_fk;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getIdx_fk() {
		return idx_fk;
	}
	public void setIdx_fk(int idx_fk) {
		this.idx_fk = idx_fk;
	}
	
}
