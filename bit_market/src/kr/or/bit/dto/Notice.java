package kr.or.bit.dto;





public class Notice {
	private int ncindex;
	private String title;
	private String nccontent;
	private String rtime;
	private String ncstate;
	private String adminid;
	public int getNcindex() {
		return ncindex;
	}
	public void setNcindex(int ncindex) {
		this.ncindex = ncindex;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNccontent() {
		return nccontent;
	}
	public void setNccontent(String nccontent) {
		this.nccontent = nccontent;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public String getNcstate() {
		return ncstate;
	}
	public void setNcstate(String ncstate) {
		this.ncstate = ncstate;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	@Override
	public String toString() {
		return "Notice [ncindex=" + ncindex + ", title=" + title + ", nccontent=" + nccontent + ", rtime=" + rtime
				+ ", ncstate=" + ncstate + ", adminid=" + adminid + "]";
	}
	
	
}
