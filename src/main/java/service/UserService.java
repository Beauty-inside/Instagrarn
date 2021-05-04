package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import vo.UserVO;

@Service("userService")
public class UserService {
	@Autowired
	UserDAO user_dao;

	public int signup(UserVO vo) {
		int res = user_dao.insert(vo);
		return res;
	}
	public int signup_check_EorP(String phone) {
		int res = user_dao.select_one_check(phone);
		return res;
	}
	public int signup_check_id(String id) {
		int res = user_dao.select_one_check_id(id);
		return res;
	}

	public UserVO signinGoogle(UserVO vo) {
		UserVO login_vo = user_dao.select_one_google(vo);
		return login_vo;
	}
	public UserVO signin(UserVO vo) {
		UserVO login_vo = user_dao.select_one(vo);
		return login_vo;
	}

	public UserVO select_id(int user_idx) {
		UserVO uservo = user_dao.select(user_idx);
		return uservo;
	}
	
	public int follow(int user_idx, int follow_idx) {
		user_dao.insert_follow(user_idx, follow_idx);
		return 0;
	}
}
