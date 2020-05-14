package kr.or.bit.dto;

/*
이름     널?       유형           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER       
DNAME           VARCHAR2(14) 
LOC             VARCHAR2(13) 	

데이터 row 1건을 담을 수 있는 클래스 (DTO)
 */

public class Dept {
	private int deptno;
	private String dname;
	private String loc;
	
	public Dept() {}
	
	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	@Override
	public String toString() {
		return "Dept [deptno=" + deptno + ", dname=" + dname + ", loc=" + loc + "]";
	}
	

	
	
}