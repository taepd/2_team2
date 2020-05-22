package kr.or.bit.dto;

import java.util.Date;

public class Reply {
	private int no;
	private String writer;
	private String content;
	private String writedate;
	private int idx_fk;
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
	@Override
	public String toString() {
		return "Reply [no=" + no + ", writer=" + writer + ", content=" + content + ", writedate=" + writedate + ", idx="
				+ idx_fk + "]";
	}
	
	
	
}
