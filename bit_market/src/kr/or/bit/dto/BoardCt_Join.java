package kr.or.bit.dto;

public class BoardCt_Join {
	private int bdindex;
	private String title;
	private int price;
	private String rtime;
	private String trstate;
	private String delstate;
	private int count;
	private String id;
	private String ctcode;
	private String img;
	private String ctname;
	private String content;
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public String getTrstate() {
		return trstate;
	}
	public void setTrstate(String trstate) {
		this.trstate = trstate;
	}
	public String getDelstate() {
		return delstate;
	}
	public void setDelstate(String delstate) {
		this.delstate = delstate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	public String getCtcode() {
		return ctcode;
	}
	public void setCtcode(String ctcode) {
		this.ctcode = ctcode;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getCtname() {
		return ctname;
	}
	public void setCtname(String ctname) {
		this.ctname = ctname;
	}
	@Override
	public String toString() {
		return "BoardCt_Join [bdindex=" + bdindex + ", title=" + title + ", price=" + price + ", rtime=" + rtime
				+ ", trstate=" + trstate + ", delstate=" + delstate + ", count=" + count + ", id=" + id + ", ctcode="
				+ ctcode + ", img=" + img + ", ctname=" + ctname + ", content=" + content + "]";
	}
	
	
	

	
	
	
}
