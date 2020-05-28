package kr.or.bit.dto;

public class Category {
	private String ctcode;
	private String ctname;
	public String getCtcode() {
		return ctcode;
	}
	public void setCtcode(String ctcode) {
		this.ctcode = ctcode;
	}
	public String getCtname() {
		return ctname;
	}
	public void setCtname(String ctname) {
		this.ctname = ctname;
	}
	@Override
	public String toString() {
		return "Category [ctcode=" + ctcode + ", ctname=" + ctname + "]";
	}
	
	
}
