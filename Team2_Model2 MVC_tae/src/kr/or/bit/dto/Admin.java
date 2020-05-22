package kr.or.bit.dto;

public class Admin {
	private String userid;
	private String pwd;
	
	public Admin() {}

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

	@Override
	public String toString() {
		return "AdminList [userid=" + userid + ", pwd=" + pwd + "]";
	}
	
	
}
