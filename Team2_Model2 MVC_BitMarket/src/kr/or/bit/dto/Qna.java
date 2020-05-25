package kr.or.bit.dto;

import java.sql.Date;

public class Qna {
	private int qaindex;
	private String title;
	private Date qatime;
	private int count;
	private String scstate;
	private String content;
	private String filename;
	private String id;
	public int getQaindex() {
		return qaindex;
	}
	public void setQaindex(int qaindex) {
		this.qaindex = qaindex;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getQatime() {
		return qatime;
	}
	public void setQatime(Date qatime) {
		this.qatime = qatime;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getScstate() {
		return scstate;
	}
	public void setScstate(String scstate) {
		this.scstate = scstate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Qna [qaindex=" + qaindex + ", title=" + title + ", qatime=" + qatime + ", count=" + count + ", scstate="
				+ scstate + ", content=" + content + ", filename=" + filename + ", id=" + id + "]";
	}
	
	
}
