package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ProfileDAO;
import vo.ProfileVO;

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



}
