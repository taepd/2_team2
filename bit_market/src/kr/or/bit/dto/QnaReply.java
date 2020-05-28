package kr.or.bit.dto;

public class QnaReply {
	private String title;
	private String id;
	private String content;
	private int qaindex;
	private String qartime;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getQaindex() {
		return qaindex;
	}
	public void setQaindex(int qaindex) {
		this.qaindex = qaindex;
	}
	public String getQartime() {
		return qartime;
	}
	public void setQartime(String qartime) {
		this.qartime = qartime;
	}
	@Override
	public String toString() {
		return "QnaReply [title=" + title + ", id=" + id + ", content=" + content + ", qaindex=" + qaindex
				+ ", qartime=" + qartime + "]";
	}
		
}
