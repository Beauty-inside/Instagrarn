package vo;

import org.springframework.web.multipart.MultipartFile;

public class ProfileVO {
	MultipartFile file;
	private int board_idx, user_idx;
	private String img, content, area;
	
	public ProfileVO() {
		
	}
	
	public ProfileVO(int board_idx, int user_idx, String img, String content, String area) {
		this.board_idx = board_idx;
		this.user_idx = user_idx;
		this.img = img;
		this.content = content;
		this.area = area;
	}
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}
	
}
