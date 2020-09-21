package com.bis.instagrarn;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import service.ProfileService;
import service.UserService;
import vo.ProfileVO;
import vo.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired //Spring으로 부터 application정보를 자동으로 받는다
	ServletContext application;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProfileService profileService;
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model) {
		int user_idx = 1;
		List<ProfileVO> list = profileService.select_post(user_idx, 0);
		model.addAttribute("loadlist", list);

		return Common.Board.VIEW_PATH + "main.jsp";
	}
	
	@RequestMapping(value = "/loadpost", method = RequestMethod.GET)
	@ResponseBody
	public List<ProfileVO> loadpost(Model model, @RequestParam(value="page", defaultValue="1")int page) {
		int user_idx = 1;
		List<ProfileVO> list = profileService.select_post(user_idx, page);
		
		return list;
	}
	
	@RequestMapping(value = "/clickLike", method = RequestMethod.GET)
	@ResponseBody
	public int clickLike(Model model, int board_idx) {
		int res = profileService.clicked_like(board_idx);
		return res;
	}
	
	@RequestMapping(value = "/clickUnLike", method = RequestMethod.GET)
	@ResponseBody
	public int clickUnLike(Model model, int board_idx) {
		int res = profileService.unclicked_like(board_idx);
		return res;
	}
	
	@RequestMapping(value = {"/", "/loginpage"})
	public String loginpage() {
		return Common.User.VIEW_PATH + "login.jsp";
	}
	
	@RequestMapping(value = "/login")
	public String login(UserVO vo) {
		UserVO login_vo = userService.signin(vo);
		if( login_vo != null ) {
			int idx = login_vo.getIdx();
			String fullname = login_vo.getFullname();
			String id = login_vo.getId();
			System.out.println(fullname+"님 로그인 성공");
		} else {
			System.out.println("로그인 실패");
		}
		
		return "redirect:main";
	}
	
	@RequestMapping(value =  "/signuppage")
	public String signuppage() {
		return Common.User.VIEW_PATH + "signup.jsp";
	}
	
	@RequestMapping(value = "/signup")
	public String signup(UserVO vo) {
		System.out.println(vo.getFullname());
		int res = userService.signup(vo);
		return Common.Board.VIEW_PATH + "main.jsp";
	}
	
}
