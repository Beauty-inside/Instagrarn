package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ProfileDAO;
import vo.FollowVO;
import vo.ProfileVO;
import vo.UserVO;

@Service("profileService")
public class ProfileService {
	@Autowired
	ProfileDAO profile_dao;

	public int upload(ProfileVO vo) {
		int res = profile_dao.insert(vo);
		return res;
	}

	public List<ProfileVO> select(int user_idx) { 
		List<ProfileVO> list = profile_dao.select(user_idx);
		return list;
	}
	
	public List<ProfileVO> select_post(int user_idx, int page) {
		List<ProfileVO> list = profile_dao.select_post(user_idx, page);
		return list;
	}
	public List<UserVO> select_recommend(int user_idx) {
		List<UserVO> list = profile_dao.select_recommend(user_idx);
		return list;
	}
	
	public List<Integer> select_like(int user_idx) {
		List<Integer> list = profile_dao.select_like(user_idx);
		return list;
	}
	
	public List<List<String>> loadalert(int user_idx) {
		List<List<String>> res = profile_dao.loadalert(user_idx);
		return res;
	}
	
	public List<List<String>> select_reply(int board_idx) {
		List<List<String>> res = profile_dao.select_reply(board_idx);
		return res;
	}
	
	public int add_reply(int board_idx, int user_idx, String reply) {
		int res2 = profile_dao.add_reply_DB(board_idx, user_idx, reply);
		return res2;
	}
	
	public int add_alert(int from_user_idx, int to_user_idx, String alert_type) {
		int res2 = profile_dao.add_alert_DB(from_user_idx, to_user_idx, alert_type);
		return res2;
	}
	
	public int clicked_like(int board_idx, int user_idx) {
		int res = profile_dao.clicked_like(board_idx);
		int res2 = profile_dao.clicked_like_DB(board_idx, user_idx);
		//여기에 알람DB에 추가
		return res;
	}
	
	public int unclicked_like(int board_idx, int user_idx) {
		int res = profile_dao.unclicked_like(board_idx);
		int res2 = profile_dao.clicked_unlike_DB(board_idx, user_idx);
		return res;
	}

	public int followerselect(int user_info_idx) {
		int res = profile_dao.follower(user_info_idx);
		return res;
	}

	public int followselect(int user_info_idx) {
		int res = profile_dao.follow(user_info_idx);
		return res;
	}
	

}
