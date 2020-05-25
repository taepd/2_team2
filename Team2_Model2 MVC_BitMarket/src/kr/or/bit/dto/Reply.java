package kr.or.bit.dto;

import java.util.Date;

public class Reply {
	private int rpindex;
	private String content;
	private String scstate;
	private String delstate;
	private String trstate;
	private Date rtime;
	private int refer;
	private int depth;
	private int step;
	private String id;
	private int bdindex;
	public int getRpindex() {
		return rpindex;
	}
	public void setRpindex(int rpindex) {
		this.rpindex = rpindex;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getScstate() {
		return scstate;
	}
	public void setScstate(String scstate) {
		this.scstate = scstate;
	}
	public String getDelstate() {
		return delstate;
	}
	public void setDelstate(String delstate) {
		this.delstate = delstate;
	}
	public String getTrstate() {
		return trstate;
	}
	public void setTrstate(String trstate) {
		this.trstate = trstate;
	}
	public Date getRtime() {
		return rtime;
	}
	public void setRtime(Date rtime) {
		this.rtime = rtime;
	}
	public int getRefer() {
		return refer;
	}
	public void setRefer(int refer) {
		this.refer = refer;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBdindex() {
		return bdindex;
	}
	public void setBdindex(int bdindex) {
		this.bdindex = bdindex;
	}
	@Override
	public String toString() {
		return "Reply [rpindex=" + rpindex + ", content=" + content + ", scstate=" + scstate + ", delstate=" + delstate
				+ ", trstate=" + trstate + ", rtime=" + rtime + ", refer=" + refer + ", depth=" + depth + ", step="
				+ step + ", id=" + id + ", bdindex=" + bdindex + "]";
	}
	
	
}
