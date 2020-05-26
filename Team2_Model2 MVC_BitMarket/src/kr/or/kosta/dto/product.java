package kr.or.kosta.dto;

public class product {
	private String name;
	private int age;
	private String addr;
	private String image ="images/main_0.jpg";
	
	
	public product(String name, int age, String addr) {
		
		this.name = name;
		this.age = age;
		this.addr = addr;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}
