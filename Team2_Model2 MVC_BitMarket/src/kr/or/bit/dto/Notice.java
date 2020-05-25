package kr.or.bit.dto;

import java.util.Date;

public class Notice {
	private int index;
	private String title;
	private String content;
	private Date rtime;
	private String ncstate;
	private String id;
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
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
	public Date getRtime() {
		return rtime;
	}
	public void setRtime(Date rtime) {
		this.rtime = rtime;
	}
	public String getNcstate() {
		return ncstate;
	}
	public void setNcstate(String ncstate) {
		this.ncstate = ncstate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Notice [index=" + index + ", title=" + title + ", content=" + content + ", rtime=" + rtime
				+ ", ncstate=" + ncstate + ", id=" + id + "]";
	}
	
	
	
}
