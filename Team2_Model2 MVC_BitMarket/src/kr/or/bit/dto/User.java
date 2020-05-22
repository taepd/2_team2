package kr.or.bit.dto;

/*
이름       널?       유형           
-------- -------- ------------ 
id    NOT NULL VARCHAR2(20) 
PWD             VARCHAR2(20) 
LOC               VARCHAR2(300)  
NICK              VARCHAR2(20)      
PROFILE         VARCHAR2(100) 
 */
public class User {
	private String id;
	private String pwd;
	private String nick;
	private String loc;
	private String profile;
	
	public User() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", pwd=" + pwd + ", loc=" + loc + ", nick=" + nick + ", profile=" + profile + "]";
	}
	
}