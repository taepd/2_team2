package kr.or.bit.dto;

public class Favorite {
	private int favindex;
	private String id;
	private int bdindex;
	public int getFavindex() {
		return favindex;
	}
	public void setFavindex(int favindex) {
		this.favindex = favindex;
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
		return "Favorite [favindex=" + favindex + ", id=" + id + ", bdindex=" + bdindex + "]";
	}
	
	
}
