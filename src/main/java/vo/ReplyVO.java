package vo;

public class ReplyVO {
	private String id;
	private int board_idx;
	private String reply;
	
	public ReplyVO() {
		
	}
	
	public ReplyVO(String id, int board_idx, String reply) {
		this.id = id;
		this.board_idx = board_idx;
		this.reply = reply;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

}
