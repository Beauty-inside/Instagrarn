package vo;

public class UserVO {
	private int idx;
	private String phone;
	private String email;
	private String fullname;
	private String id;
	private String pwd;
	
	public UserVO() {
		
	}
	
	public UserVO(int idx, String fullname, String id) {
		this.idx = idx;
		this.fullname = fullname;
		this.id = id;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
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
}
