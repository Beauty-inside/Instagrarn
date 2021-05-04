package vo;

public class FollowVO {
	private int idx, count, follower_idx, following_idx;
	
	public FollowVO() {	
	}
	
	public FollowVO(int idx, int follower_idx, int following_idx) {
		this.idx = idx;
		this.follower_idx = follower_idx;
		this.following_idx = following_idx;
	}
	
	public FollowVO(int count) {	
		this.count = count;
	}
	

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getFollower_idx() {
		return follower_idx;
	}

	public void setFollower_idx(int follower_idx) {
		this.follower_idx = follower_idx;
	}

	public int getFollowing_idx() {
		return following_idx;
	}

	public void setFollowing_idx(int following_idx) {
		this.following_idx = following_idx;
	}
	
	
}
